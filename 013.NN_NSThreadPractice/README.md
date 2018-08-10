
## iOS开发之多线程 NSThread 练习，几种常用场景

- 创建线程的三种方式(分为三种: 动态方法; 静态方法; 隐式创建线程)

- 线程间的通信


#### 其它常用方法：

```
// 获得主线程
+ (NSThread *)mainThread;

// 判断是否为主线程
- (BOOL)isMainThread;
+ (BOOL)isMainThread;

// 获得当前线程
NSThread *current = [NSThread currentThread];

// 线程的名字
- (void)setName:(NSString *)name;
- (NSString *)name;

// 线程进入就绪状态 -> 运行状态
- (void)start;

// 睡眠，相当于暂停
+ (void)sleepUntilDate:(NSDate *)date;
+ (void)sleepForTimeInterval:(NSTimeInterval)ti;

// 线程销毁
+ (void)exit;
```

#### demo 中写有详细注释，欢迎讨论
