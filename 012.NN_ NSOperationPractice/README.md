
## iOS开发之多线程 NSOperation 练习，几种常用场景

- 创建线程的三种方式(分为三种: NSInvocationOperation; NSBlockOperation; 自定义 NSOperation 子类)

- NSOperationQueue 创建(分为两种: `addOperation:` 方式; `addOperationWithBlock:` 方式)

- NSOperation 中的操作依赖

- 线程间的通信


#### 其它常用方法：

```
    // 取消单个操作
    [operation1 cancel];
    // 会阻塞当前线程，等到某个operation执行完毕
    [operation2 waitUntilFinished];

    // 取消queue中所有的操作
    [queue cancelAllOperations];
    // 设置队列的最大并发操作数量
    queue.maxConcurrentOperationCount = 1;
    // 暂停 queue YES代表暂停队列,NO代表恢复队列
    [queue setSuspended:YES];
    // 阻塞当前线程，等待queue的所有操作执行完毕
    [queue waitUntilAllOperationsAreFinished];
```

#### demo 中写有详细注释，欢迎讨论
