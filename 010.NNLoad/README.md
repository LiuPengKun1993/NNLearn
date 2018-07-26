
## load 方法调用顺序
```
 父类：ViewController
 父类：NNParentClassView
 子类：NNSubclassView
 子类：NNSubViewController
 子类分类：NNSubclassView
 子类分类：NNSubViewController
 父类分类：ViewController
 父类分类：NNParentClassView
```

- 这里有一篇文章，可以加深对 load 方法的了解：[你真的了解 load 方法么？](https://github.com/Draveness/analyze/blob/master/contents/objc/你真的了解%20load%20方法么？.md)
