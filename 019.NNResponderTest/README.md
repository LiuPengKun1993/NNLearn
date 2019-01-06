## view 事件传递，用 UIResponder 替代代理与block，传递事件更方便；

- 核心代码，在 UIResponder 的分类 UIResponder+responder 中：


```

- (void)responderWithKey:(NSString *)key value:(id)value {
[[self nextResponder] responderWithKey:key value:value];
}

```
