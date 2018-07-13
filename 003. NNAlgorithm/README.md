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
- (void)factorialWithNumber:(NSInteger)number {

//总和
NSInteger sum = 0;

//阶乘值，初始化为1
NSInteger factorial = 1;

for (NSInteger i = 1; i <= number; i++) {
factorial = factorial * i;
sum = (int) (sum + factorial);
}

NSLog(@"1-%ld 阶乘之和-------%ld", number, sum);
}
```
