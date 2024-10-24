## Calculus
### Gradient 梯度
我们可以连结一个多元函数对其所有变量的偏导数，以得到该函数的*梯度*（gradient）向量。具体而言，设函数$f:\mathbb{R}^n\rightarrow\mathbb{R}$的输入是
一个$n$维向量$\mathbf{x}=[x_1,x_2,\ldots,x_n]^\top$，并且输出是一个**标量。**
函数$f(\mathbf{x})$相对于$\mathbf{x}$的梯度是一个包含$n$个偏导数的向量:

$$
\nabla_{\mathbf{x}} f(\mathbf{x}) = \bigg[\frac{\partial f(\mathbf{x})}{\partial x_1}, \frac{\partial f(\mathbf{x})}{\partial x_2}, \ldots, \frac{\partial f(\mathbf{x})}{\partial x_n}\bigg],
$$

??? example
    证明对于所有$\mathbf{A} \in \mathbb{R}^{m \times n}$，都有$\nabla_{\mathbf{x}} \mathbf{A} \mathbf{x} = \mathbf{A}$

    令：

    $$
    A=
    \begin{bmatrix}
    a_{11} & a_{12} & \cdots & a_{1n} \\
    a_{21} & a_{22} & \cdots & a_{2n} \\
    \vdots & \vdots & \ddots & \vdots \\
    a_{m1} & a_{n2} & \cdots & a_{mn}
    \end{bmatrix}_{m \times n}
    $$

    令：

    $$
    b_i=\begin{bmatrix} a_{i_{1i}}, a_{2i}, \cdots, a_{mi} \end{bmatrix}^T
    $$

    于是：

    $$
    f(x)=\sum_{i=1}^n b_i x_i
    $$

    按照定义：
    
    $$
    \nabla_{\mathbf{x}}f(x)=\begin{bmatrix} b_1, b_2, \cdots, b_n \end{bmatrix}^T=A
    $$

    证毕。

还有如下常见的性质：($x \in \mathbb{R}^{n\times 1}$，之后均简写为$\mathbb{R}^n$)

- 对于所有$\mathbf{A} \in \mathbb{R}^{n \times m}$，都有$\nabla_{\mathbf{x}} \mathbf{x}^\top \mathbf{A}  = \mathbf{A}^\top$
- 对于所有$\mathbf{A} \in \mathbb{R}^{n \times n}$，都有$\nabla_{\mathbf{x}} \mathbf{x}^\top \mathbf{A} \mathbf{x}  = (\mathbf{A} + \mathbf{A}^\top)\mathbf{x}$
- $\nabla_{\mathbf{x}} \|\mathbf{x} \|^2 = \nabla_{\mathbf{x}} \mathbf{x}^\top \mathbf{x} = 2\mathbf{x}^\top$

## Autograd Pytorch自动求导
**假设我们想对函数$y=2\mathbf{x}^{\top}\mathbf{x}$关于列向量$\mathbf{x}$求导**。
>首先，我们创建变量`x`并为其分配一个初始值。
```py
import torch

x = torch.arange(4.0)
x
```
>tensor([0., 1., 2., 3.])

**在我们计算$y$关于$\mathbf{x}$的梯度之前，需要一个地方来存储梯度。**
重要的是，我们不会在每次对一个参数求导时都分配新的内存。
因为我们经常会成千上万次地更新相同的参数，每次都分配新的内存可能很快就会将内存耗尽。
注意，一个标量函数关于向量$\mathbf{x}$的梯度是向量，并且与$\mathbf{x}$具有相同的形状。


```py
x.requires_grad_(True)  # 等价于x=torch.arange(4.0,requires_grad=True)
x.grad  # 默认值是None
```

**现在让我们计算$y$。**
```py
y = 2 * torch.dot(x, x)
y
```
>tensor(28., grad_fn=<MulBackward0\>)

`x`是一个长度为4的向量，计算`x`和`x`的点积，得到了我们赋值给`y`的标量输出。
接下来，**通过调用反向传播函数来自动计算`y`关于`x`每个分量的梯度**，并打印这些梯度。

```py
y.backward()
x.grad
```
>tensor([ 0.,  4.,  8., 12.])

显然就是4倍的`x`，计算正确。

---
### 非标量关于向量的梯度
。当`y`不是标量时，向量`y`关于向量`x`的导数的最自然解释是一个矩阵。对于高阶和高维的`y`和`x`，求导的结果可以是一个高阶张量。

然而，虽然这些更奇特的对象确实出现在高级机器学习中（包括[**深度学习中**]），
但当调用向量的反向计算时，我们通常会试图计算一批训练样本中每个组成部分的损失函数的导数。
这里**我们的目的不是计算微分矩阵，而是单独计算批量中每个样本的偏导数之和。**

对非标量调用`.backward()`需要传入一个`gradient`参数。因为当`y`不是标量时，不能直接计算`y`关于`x`的梯度，因为梯度是标量对向量的导数。在这种情况下，我们实际上计算的是向量`y`和`gradient`参数的**点积**关于`x`的梯度，**它指定了y的每个分量对x的梯度的权重。**
```py
x.grad.zero_()# 梯度清零，否则会累加
y = x * x # 注意*是按元素相乘
y.sum().backward()# 等价于y.backward(torch.ones(len(x)))
x.grad
```
>tensor([0., 2., 4., 6.])

求导应为2x，计算正确。

### 分离计算
有时，我们希望**将某些计算移动到记录的计算图之外**。
例如，假设`y`是作为`x`的函数计算的，而`z`则是作为`y`和`x`的函数计算的。
现在，想象一下，我们想计算`z`关于`x`的梯度，但由于某种原因，我们希望将`y`视为一个常数，并且只考虑到`x`在`y`被计算后发挥的作用。

这里可以分离`y`来返回一个新变量`u`，该变量与`y`具有相同的值，
但丢弃计算图中如何计算`y`的任何信息。
换句话说，梯度不会向后流经`u`到`x`。
因此，下面的反向传播函数计算`z=u*x`关于`x`的偏导数，同时将`u`作为常数处理，
而不是`z=x*x*x`关于`x`的偏导数。
```py
x.grad.zero_()
y = x * x
u = y.detach()
z = u * x  #z是一个向量

z.sum().backward()
x.grad
```
>tensor([0., 1., 4., 9.])
求导为u，计算正确。其中，$u=\begin{bmatrix} 0 & 1 & 4 & 9 \\\end{bmatrix}$








