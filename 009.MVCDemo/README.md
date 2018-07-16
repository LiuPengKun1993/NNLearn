###  MVC 设计模式练习

> 各家各法, 各马各扎, 一份代码, 不同玩法.

巧神有一篇文章, 介绍了如何给 ViewController 瘦身的问题, [被误解的 MVC 和被神化的 MVVM.](http://blog.devtang.com/2015/11/02/mvc-and-mvvm/)

#### 如何对 ViewController 瘦身？

- 将网络请求抽象到单独的类中

- 将界面的拼装抽象到专门的类中

- 构造 ViewModel

- 专门构造存储类

我这里写了一份给 ViewController 瘦身的 MVC 模式的简单代码.

#### demo 分为四大部分:

##### NNViewController

- 负责显示 View(数据展示在视图上), 负责交互事件;
- 数据⽅面, 只引用 "NNDataModel" 这⼀个类, 所有数据都从 "NNDataModel" 中拿取, "NNDataModel" 负责所有的数据处理包括字典模型转换等;
- 视图⽅面, View 内部的实现在其⾃定义视图中完成, 控制器中直接 addSubview, 并将拿到的数据传给 View;

##### NNDataModel

- 负责所有的数据处理. 数据相关的 (包括⽹络请求, 数据处理以及⼀些数据⽅方⾯的属性), 全部放在 NNDataModel 里, 基本上以 NS 开头的属性, 都放在 NNDataModel 中, 外界(控制器器)只管调用, 不⽤管其实现.

##### NNModel

- Model 层的代码, 基本上只在 NNDataModel 中引⽤, 或在 View 中赋值使⽤用;

##### NNView
- 自定义子视图负责视图的内部实现(如果是 UITableView, 则设置其代理);


(PS: 其实还想用另一种方式, 不在自定义子视图里面设置代理, 直接在 NNView 这个类里面, 用 dataModel 调用请求网络的方法, 然后通过 block 将请求结果传过来然后刷新界面......方法很多......)


欢迎提建议或意见🙂
