### runtime 练习
练习 `runtime` 常用的几种方法;

主要练习了以下几个功能:

- 更改属性值;

```
- (void)buttonClick:(UIButton *)sender {
    unsigned int count = 0;
    // 动态获取类中的所有属性(包括私有)
    Ivar *ivar = class_copyIvarList(_person.class, &count);
    // 遍历属性找到对应字段
    for (int i = 0; i < count; i ++) {
        Ivar tempIvar = ivar[i];
        const char *varChar = ivar_getName(tempIvar);
        NSString *varString = [NSString stringWithUTF8String:varChar];
        if ([varString isEqualToString:@"_name"]) {
            // 修改对应的字段值
            object_setIvar(_person, tempIvar, @"更改属性值成功");
            break;
        }
    }
    self.testLabelText = _person.name.length ? _person.name : @"更改属性值失败";
}
```

- 给分类添加属性;

```
- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, @"name");
}

```

- 动态添加方法;

```
- (void)buttonClick:(UIButton *)sender {
    /*
    动态添加 coding 方法
    (IMP)codingOC 意思是 codingOC 的地址指针;
    "v@:" 意思是，v 代表无返回值 void，如果是 i 则代表 int；@代表 id sel; : 代表 SEL _cmd;
    “v@:@@” 意思是，两个参数的没有返回值。
    */
    class_addMethod([_person class], @selector(coding), (IMP)codingOC, "v@:");
    // 调用 coding 方法响应事件
    if ([_person respondsToSelector:@selector(coding)]) {
        [_person performSelector:@selector(coding)];
        self.testLabelText = @"添加方法成功";
    } else {
        self.testLabelText = @"添加方法失败";
    }
}
```

- 交换两个方法的实现;

```
    Method oriMethod = class_getInstanceMethod(_person.class, @selector(coding));
    Method curMethod = class_getInstanceMethod(_person.class, @selector(eating));
    method_exchangeImplementations(oriMethod, curMethod);
```

- 拦截并替换方法;

```
    _person = [NNPerson new];
    _library = [NNLibrary new];
    self.testLabelText = [_library libraryMethod];
    Method oriMethod = class_getInstanceMethod(_person.class, @selector(changeMethod));
    Method curMethod = class_getInstanceMethod(_library.class, @selector(libraryMethod));
    method_exchangeImplementations(oriMethod, curMethod);
```

- 给系统的方法添加额外的功能;

```
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oriMethod = class_getInstanceMethod(self.class, @selector(sendAction:to:forEvent:));
        Method cusMethod = class_getInstanceMethod(self.class, @selector(customSendAction:to:forEvent:));
        // 判断自定义的方法是否实现, 避免崩溃
        BOOL addSuccess = class_addMethod(self.class, @selector(sendAction:to:forEvent:), method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
        if (addSuccess) {
            // 没有实现, 将源方法的实现替换到交换方法的实现
            class_replaceMethod(self.class, @selector(customSendAction:to:forEvent:), method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        } else {
            // 已经实现, 直接交换方法
            method_exchangeImplementations(oriMethod, cusMethod);
        }
    });
}
```
- 归档解档

```
- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    // 获取类中所有属性
    Ivar *ivars = class_copyIvarList(self.class, &count);
    // 遍历属性
    for (int i = 0; i < count; i ++) {
        // 取出 i 位置对应的属性
        Ivar ivar = ivars[i];
        // 查看属性
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        // 利用 KVC 进行取值，根据属性名称获取对应的值
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count = 0;
        // 获取类中所有属性
        Ivar *ivars = class_copyIvarList(self.class, &count);
        // 遍历属性
        for (int i = 0; i < count; i ++) {
            // 取出 i 位置对应的属性
            Ivar ivar = ivars[i];
            // 查看属性
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            // 进行解档取值
            id value = [aDecoder decodeObjectForKey:key];
            // 利用 KVC 对属性赋值
            [self setValue:value forKey:key];
        }
    }
    return self;
}
```

- 字典转模型

```
/** 字典转模型 **/
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    id objc = [[self alloc] init];
    unsigned int count = 0;
    // 获取成员属性数组
    Ivar *ivarList = class_copyIvarList(self, &count);
    // 遍历所有的成员属性名
    for (int i = 0; i < count; i ++) {
        // 获取成员属性
        Ivar ivar = ivarList[i];
        // 获取成员属性名
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key = [ivarName substringFromIndex:1];
        // 从字典中取出对应 value 给模型属性赋值
        id value = dict[key];
        // 获取成员属性类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        // 判断 value 是不是字典
        if ([value isKindOfClass:[NSDictionary class]]) {
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            Class modalClass = NSClassFromString(ivarType);
            // 字典转模型
            if (modalClass) {
                // 字典转模型
                value = [modalClass modelWithDict:value];
            }
        }
        if ([value isKindOfClass:[NSArray class]]) {
            // 判断对应类有没有实现字典数组转模型数组的协议
            if ([self respondsToSelector:@selector(arrayContainModelClass)]) {
            // 转换成id类型，就能调用任何对象的方法
            id idSelf = self;
            // 获取数组中字典对应的模型
            NSString *type = [idSelf arrayContainModelClass][key];
            // 生成模型
            Class classModel = NSClassFromString(type);
            NSMutableArray *arrM = [NSMutableArray array];
            // 遍历字典数组，生成模型数组
            for (NSDictionary *dict in value) {
                // 字典转模型
                id model =  [classModel modelWithDict:dict];
                [arrM addObject:model];
            }
            // 把模型数组赋值给value
            value = arrM;
            }
        }
        // KVC 字典转模型
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    return objc;
}
```
