### 练习观察者模式中的 `NSNotificationCenter` 与 `KVO`, 对比两者之间的区别与联系;

#### NSNotificationCenter

- 观察者 Observer，通过 NSNotificationCenter 的`addObserver:selector:name:object` 接口来注册对某一类型通知感兴趣。在注册时候一定要注意，NSNotificationCenter 不会对观察者进行引用计数 +1 的操作，我们在程序中释放观察者的时候，一定要去报从 Center 中将其注销了。
- 通知中心 NSNotificationCenter，通知的枢纽。
- 被观察的对象，通过 `postNotificationName:object:userInfo:` 发送某一类型通知，广播改变。
- 通知对象 NSNotification，当有通知来的时候，Center 会调用观察者注册的接口来广播通知，同时传递存储着更改内容的 NSNotification 对象。


#### KVO

> KVO 的全称是 `Key-Value Observer`，即键值观察。是一种没有中心枢纽的观察者模式的实现方式。一个主题对象管理所有依赖于它的观察者对象，并且在自身状态发生改变的时候主动通知观察者对象。

- 注册观察者 `[object addObserver:self forKeyPath:property options:NSKeyValueObservingOptionNew context:]。`
- 更改主题对象属性的值，即触发发送更改的通知。
- 在制定的回调函数中，处理收到的更改通知。
- 注销观察者 `[object removeObserver:self forKeyPath:property]。`



