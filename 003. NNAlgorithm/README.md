## 算法练习

### 1-n 阶乘之和
> 1-n阶乘之和怎么算？

- 1的阶乘是1
- 2的阶乘是1*2
- 3的阶乘是1*2*3
- 4的阶乘是1*2*3*4
- .........

现在我们要求这些阶乘的和。思路：

- 3阶乘的和其实上就是2阶乘的和+3的阶乘
- 4阶乘的和其实上就是3阶乘的和+4的阶乘
- .......

```
/** 1-n 阶乘之和 */
- (NSInteger)factorialWithNumber:(NSInteger)number {
    // 总和
    NSInteger sum = 0;
    // 阶乘值, 初始化为1
    NSInteger factorial = 1;
    for (NSInteger i = 1; i <= number; i++) {
        factorial = factorial * i;
        sum = (int) (sum + factorial);
    }
    return sum;
}
```

### 跳台阶问题
> 一只青蛙一次可以跳上 1 级台阶，也可以跳上 2 级。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

我们假设到第 n 阶总共有 f(n) 种跳法，而且想跳到第 n 阶只有两种可能，要么从第 n-1 阶跳一阶到达，要么从第 n-2 阶跳两阶到达，所以递推式为f(n) = f(n-1) + f(n-2)。特殊情况为，n=0 的时候跳法为 0；n=1时，跳法为1；n=2时，跳法为2;


```
/** 跳台阶问题 */
- (NSInteger)jumpFloor:(NSInteger)number {
    if(number < 1)
        return 0;
    if(number == 1)
        return 1;
    if(number == 2)
        return 2;
    return [self jumpFloor:(number-1)] + [self jumpFloor:(number-2)];
}
```

### 变态跳台阶问题

> 一只青蛙一次可以跳上 1 级台阶，也可以跳上 2 级……它也可以跳上 n 级。求该青蛙跳上一个n级的台阶总共有多少种跳法。


- 先看 n = 0 时，跳法 f(0) = 0；
- n = 1，只能是从第 0 个台阶跳过来，跳法 f(1) = 1;
- n = 2，可能是第 0 个台阶跳了 2 阶或者从第 1 个台阶跳了 1 阶，跳法f(2) = 2 * f(1) = 2;
- n = 3，可能是第 0 个台阶跳了 3 阶、第 1 个台阶跳了 2 阶、第 2 个台阶跳了 1 阶、各跳 1 阶，跳法 f(3) = 2 * f(2) = 4;
- ...
- n = n-1，跳法 f(n-1) = 2f(n-2);
- n = n，跳法 2f(n-1);
- 由上面两个等式得：f(n) = 2f(n-1)

```
/** 变态跳台阶问题 */
- (NSInteger)jumpFloorII:(NSInteger)number {
    if(number < 1)
        return 0;
    if(number == 1)
        return 1;
    return 2*[self jumpFloorII:(number-1)];
}
```

