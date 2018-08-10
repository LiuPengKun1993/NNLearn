### iOS 奇技淫巧总结

- 将 view 的所有子视图移除

```
    // 用 makeObjectsPerformSelector
    [view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
```


- 数组的二分法查找, 时间复杂度是 O(log n)
```
    NSArray *arr = @[@"21", @"12", @"13", @"14", @"25", @"26", @"27", @"28", @"29"];
    NSInteger index = [arr indexOfObject:@"14"
    inSortedRange:NSMakeRange(0, [arr count])
    options:NSBinarySearchingFirstEqual
    usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
        return NSOrderedDescending;
        }else if ([obj1 integerValue] < [obj2 integerValue]) {
        return NSOrderedAscending;
        }
        return NSOrderedSame;
    }];
    NSLog(@"index = %ld", index);
```


- 使用 NSAttributedString 设置不同大小字体时, 使两种字体都垂直居中, 其中 a 是大号字体, b 是小号字体

```
    [mark addAttribute:NSBaselineOffsetAttributeName value:@(0.36 * (a - b)) range:NSMakeRange(0, name.length)];

```

- 老项目没有进行字体适配，导致有些文本在 iPhone5 机型上无法显示完整，这里写了一个 UIFont 的分类，用 runtime 对 UIFont 的 `systemFontOfSize:` 方法进行了替换，几行代码基本上搞定了老项目存在的问题；

```
#import "UIFont+NNSize.h"
#import <objc/runtime.h>

@implementation UIFont (NNSize)

+ (void)load {
Method newMethod = class_getClassMethod([self class], @selector(nnCustomSystemFontOfSize:));
Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
method_exchangeImplementations(newMethod, method);
}

+ (UIFont *)nnCustomSystemFontOfSize:(CGFloat)fontSize {
UIFont *newFont = nil;
if ([[UIScreen mainScreen] bounds].size.height < 667.0) {
newFont = [UIFont nnCustomSystemFontOfSize:fontSize * 0.9];
} else {
newFont = [UIFont nnCustomSystemFontOfSize:fontSize];
}
return newFont;
}

@end
```

- 隐藏导航栏下边的灰色线条，直接在自定义的 UINavigationController 类里调用下边的方法

```
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
return (UIImageView *)view;
}
for (UIView *subview in view.subviews) {
UIImageView *imageView = [self findHairlineImageViewUnder:subview];
if (imageView) {
return imageView;
}
}
return nil;
}
```

比如：`[self findHairlineImageViewUnder:self.navigationBar].hidden = YES;`


- 动态修改状态栏的颜色

```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.offset = scrollView.contentOffset.y;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.offset <= -200) {
        return UIStatusBarStyleDefault;
    }
    return UIStatusBarStyleLightContent;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}

```

- 监听界面滚动，淡入淡出更改电池条颜色

```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.collectionView.contentOffset.y <= -200) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}

```
