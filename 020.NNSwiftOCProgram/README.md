
### OC Swift 混编

#### 设置: target-->build setting -->Packaging -->Defines Module 改为 “Yes”；

- Swift 调用 OC 

> 在桥接文件 `项目名-Bridging-Header` 中引入 OC 头文件：
eg: `#import "NNViewController.h"`


- OC 调用 Swift

> 在需要调用的 OC 类里引用` #import "项目名-Swift.h"`，另外对于需要混编的 Swift 类里添加 `@objc` 声明或继承 NSObject 或 NSObject 的子类；
