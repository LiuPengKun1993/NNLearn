### 小冷易忘知识点汇总

- 将 view 的所有子视图移除

```
// 用 makeObjectsPerformSelector
[view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
```
