### CALayer 练习

- CALayer 相对比较轻量级;
- 弊端是 CALayer 不能添加交互事件;


#### 主要练习了以下功能:

- 用 CALayer 代替 UIView
```
- (void)creatView {
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(100, 100, 50, 50);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:layer];
}
```

- 用 CALayer 代替 UIImageView

```
- (void)creatImage {
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(100, 200, 50, 50);
    UIImage *image = [UIImage imageNamed:@"header"];
    layer.contents = CFBridgingRelease(image.CGImage);
    [self.view.layer addSublayer:layer];
}
```

- 给 CALayer 设置代理并绘制

```
- (void)creatCustomView {
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(100, 300, 50, 50);
    // 设置代理
    layer.delegate = self;
    layer.backgroundColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer];
    [layer display];
}
```

- CALayer 设置图片显示区域

```
- (void)creatCustomImage {
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(100, 400, 50, 50);
    UIImage *image = [UIImage imageNamed:@"header"];
    layer.contents = CFBridgingRelease(image.CGImage);
    // contentsRect: 显示图片的部分区域, 默认值(0, 0, 1, 1)
    layer.contentsRect = CGRectMake(0.2, 0.2, 0.7, 0.7);
    [self.view.layer addSublayer:layer];
}
```

- 代理 - CALayerDelegate

```
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 5.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}
```


