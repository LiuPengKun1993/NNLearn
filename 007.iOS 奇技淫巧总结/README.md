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

- 判断控件是不是指定视图的子视图

```
BOOL isView = [textView isDescendantOfView:self.view];
```

- 修改 UITextField 中 Placeholder 的文字颜色

```
[textField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
```

- 防止 UIScrollView 手势覆盖侧滑手势

```
[scrollView.panGestureRecognizer requireGestureRecognizerToFail:self.navigationController.interactivePopGestureRecognizer];
```

- Masonry 一次性设置多个水平或垂直排列的控件


```
NSMutableArray *masonryLabelArray = [NSMutableArray array];
[masonryNumberLabelArray addObject:learningLabel];
[masonryNumberLabelArray addObject:rankLabel];
[masonryNumberLabelArray addObject:timeLabel];

[masonryLabelArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:10 tailSpacing:10];

[masonryNumberLabelArray mas_makeConstraints:^(MASConstraintMaker *make) {
make.top.mas_equalTo(100);
make.height.mas_equalTo(30);
}];
```

- 点击 tabBarItem 时，有动画缩放效果(还可以在代理方法里面加通知，这样当双击当前 tabBarItem 时，可以让当前界面刷新，市场上很多 APP 都有这样的功能)；
```
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSInteger integet = [self.tabBar.items indexOfObject:viewController.tabBarItem];
    [self addAnimationWithIndex:integet];
    return YES;
}

- (void)addAnimationWithIndex:(NSInteger)index {
    NSMutableArray *tabbarbuttonArray = [NSMutableArray array];
        for (UIView *tabBarButton in self.tabBar.subviews) {
            if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
            }
        }
    [NNAnimation addAnimationWithCALayer:[tabbarbuttonArray[index] layer] interval:0.1 repeatCount:2 fromValue:0.95 toValue:1.05];
}

/** 缩放动画 */
+ (void)addAnimationWithCALayer:(CALayer *)layer interval:(CFTimeInterval)interval repeatCount:(NSInteger)repeatCount fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue {
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:fromValue];
    scaleAnimation.toValue = [NSNumber numberWithFloat:toValue];
    scaleAnimation.duration = interval;
    scaleAnimation.repeatCount = repeatCount;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer addAnimation:scaleAnimation forKey:nil];
}

```


- 优雅的隐藏及显示导航栏

设置代理 `UINavigationControllerDelegate`,

`
self.navigationController.delegate = self;
`

遵守代理

```
/** 将要显示控制器 */
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
// 判断要显示的控制器是否是自己
BOOL isShowHomePage = [viewController isKindOfClass:[self class]];

[self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}
```

- 获取列表中当前屏幕显示的最中间的cell

```
/** 减速停止的时候开始执行 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewEndScroll:scrollView];
}

/** 停止拖拽的时候开始执行 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self scrollViewEndScroll:scrollView];
    }
}

- (void)scrollViewEndScroll:(UIScrollView *)scrollView {
    UITableViewCell *centerCell = [self getCenterCell];
    if (centerCell) {
        NSIndexPath *indexPath = [self indexPathForCell:centerCell];
        [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
}

/** 获取最中间的cell */
- (UITableViewCell *)getCenterCell {
    CGFloat minDelta = CGFLOAT_MAX;
    // 屏幕中央位置
    CGFloat screenCenterY = SCREEN_HEIGHT * 0.5;
    NSArray *cellArray = [self visibleCells];
    UITableViewCell *centerCell = nil;
    for (UITableViewCell *cell in cellArray) {
        // 获取当前 cell 的居中点坐标
        CGPoint cellCenterPoint = CGPointMake(cell.frame.origin.x, cell.frame.size.height * 0.5 + cell.frame.origin.y);
        // 转换当前的 cell 的坐标
        CGPoint coorPoint = [cell.superview convertPoint:cellCenterPoint toView:nil];
        CGFloat deltaTemp = fabs(coorPoint.y - screenCenterY);
        if (deltaTemp < minDelta) {
            centerCell = cell;
            minDelta = deltaTemp;
        }
    }
    return centerCell;
}
```

- 数组去重

1. 利用 NSSet 的特性，NSSet 是无序、没有重复元素的数组，如果需要排序，可以考虑用 NSSortDescriptor
```
    NSArray *oldArray = @[@"12", @"12", @"32", @"1", @"23", @"43", @"21"];
    NSSet *set = [NSSet setWithArray:oldArray];
    NSArray *newArray = [set allObjects];
    NSLog(@"%@", newArray);
```

2. 通过KVC，利用私有API，去重只需一行代码
```
    NSArray *oldArray = @[@"12", @"12", @"32", @"1", @"23", @"43", @"21"];
    NSArray *newArray = [oldArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"%@", newArray);
```

3. 利用字典 key-value 的特性（key不能重复），将数组中的元素存入字典
```
    NSArray *oldArray = @[@"12", @"12", @"32", @"1", @"23", @"43", @"21"];
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
    for (NSString *tempString in oldArray) {
        [tempDict setObject:tempString forKey:tempString];
    }
    NSArray *newArray = [tempDict allValues];
    NSLog(@"%@", newArray);
```
