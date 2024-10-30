## Linear Regression
notions:

- $w \implies weight ,w \in \mathbb{R}^d$ 权重
- $\hat{y}\implies \space predicted \space value$ 预测值
- $X \implies feature\space set，X \in \mathbb{R}^{n\times d}$ &nbsp;含有n个样本以d个特征的特征集合
- $x\implies 单个样本的特征\space ,x \in \mathbb{R}^d$
- $y \implies label$ 标签，即真实值

于是我们可以简洁地表示预测结果和模型：

$$
\begin{aligned}
\hat{y} = \mathbf{w}^\top \mathbf{x} + b. \\
\\
{\hat{\mathbf{y}}} = \mathbf{X} \mathbf{w} + b
\end{aligned}
$$

### Loss Function 损失函数

*损失函数*（loss function）能够量化目标的*实际*值与*预测*值之间的差距。
通常我们会选择非负数作为损失，且数值越小表示损失越小，完美预测时的损失为0。
回归问题中最常用的损失函数是平方误差函数。

??? note "为什么可以用平方误差函数作为损失函数"
    我们假设了观测中包含噪声，其中噪声服从正态分布。
    噪声正态分布如下式:

    $$y = \mathbf{w}^\top \mathbf{x} + b + \epsilon,$$

    其中，$\epsilon \sim \mathcal{N}(0, \sigma^2)$。

    因此，我们现在可以写出通过给定的$\mathbf{x}$观测到特定$y$的*似然*（likelihood）：

    $$P(y \mid \mathbf{x}) = \frac{1}{\sqrt{2 \pi \sigma^2}} \exp\left(-\frac{1}{2 \sigma^2} (y - \mathbf{w}^\top \mathbf{x} - b)^2\right).$$

    现在，根据极大似然估计法，参数$\mathbf{w}$和$b$的最优值是使整个数据集的*似然*最大的值：

    $$P(\mathbf y \mid \mathbf X) = \prod_{i=1}^{n} p(y^{(i)}|\mathbf{x}^{(i)}).$$

    根据极大似然估计法选择的估计量称为*极大似然估计量*。
    虽然使许多指数函数的乘积最大化看起来很困难，
    但是我们可以在不改变目标的前提下，通过最大化似然对数来简化。
    由于历史原因，优化通常是说最小化而不是最大化。
    我们可以改为*最小化负对数似然*$-\log P(\mathbf y \mid \mathbf X)$。
    由此可以得到的数学公式是：

    $$-\log P(\mathbf y \mid \mathbf X) = \sum_{i=1}^n \frac{1}{2} \log(2 \pi \sigma^2) + \frac{1}{2 \sigma^2} \left(y^{(i)} - \mathbf{w}^\top \mathbf{x}^{(i)} - b\right)^2.$$

    现在我们只需要假设$\sigma$是某个固定常数就可以忽略第一项，
    因为第一项不依赖于$\mathbf{w}$和$b$。
    现在第二项除了常数$\frac{1}{\sigma^2}$外，其余部分和前面介绍的均方误差是一样的。
    幸运的是，上面式子的解并不依赖于$\sigma$。
    **因此，在高斯噪声的假设下，最小化均方误差等价于对线性模型的极大似然估计。**

当**样本**$i$的预测值为$\hat{y}^{(i)}$，其相应的真实标签为$y^{(i)}$时，
平方误差可以定义为以下公式：

$$l^{(i)}(\mathbf{w}, b) = \frac{1}{2} \left(\hat{y}^{(i)} - y^{(i)}\right)^2.$$


为了度量模型在整个数据集上的质量，我们需要将所有**所有样本**的损失求平均。（即对上式求均值）

$$L(\mathbf{w}, b) =\frac{1}{n}\sum_{i=1}^n l^{(i)}(\mathbf{w}, b) =\frac{1}{n} \sum_{i=1}^n \frac{1}{2}\left(\mathbf{w}^\top \mathbf{x}^{(i)} + b - y^{(i)}\right)^2.$$

也可以写成矩阵的形式：

$$L(\mathbf{w}, b) = \frac{1}{2n} \| \mathbf{X}\mathbf{w} + b - \mathbf{y} \| ^2.$$

???+ Note "Practice"
    我们的预测问题是最小化$\|\mathbf{y} - \mathbf{X}\mathbf{w}\|^2$。对于线性回归这样特殊的问题，我们可以求出*解析解（analytical solution）*，试着用矩阵求导的知识来求解：

    方便起见，我们将偏差$b$添加到矩阵$\mathbf{X}$中。$X \leftarrow \begin{bmatrix} X & 1 \\\end{bmatrix} \quad w \leftarrow \begin{bmatrix} w \\ b \end{bmatrix}$

    $$
    \ell(X,y,w) = \frac{1}{2n} \| \mathbf{X}\mathbf{w} - \mathbf{y} \| ^2
    $$
    
    由矩阵求导法则，链式法则，我们有：

    $$
    \begin{aligned}
    \nabla_w \ell(X,y,w) &= \frac{1}{n} \nabla_w \frac{1}{2} \| \mathbf{X}\mathbf{w} - \mathbf{y} \| ^2 \\
    &= \frac{1}{n} (\mathbf{X}\mathbf{w} - \mathbf{y})^\top \mathbf{X}\\
    \end{aligned}
    $$

    令上式为0，我们有：

    $$
    \begin{aligned}
    \frac{1}{n} (\mathbf{X}\mathbf{w} - \mathbf{y})^\top \mathbf{X} &= 0 \\
    \mathbf{X}^\top (\mathbf{X}\mathbf{w} - \mathbf{y}) &= 0 \\
    \mathbf{X}^\top \mathbf{X}\mathbf{w} &= \mathbf{X}^\top \mathbf{y} \\
    \mathbf{w} &= (\mathbf{X}^\top \mathbf{X})^{-1} \mathbf{X}^\top \mathbf{y} \\
    \end{aligned}
    $$






### Gradient Descent 梯度下降
这种方法几乎可以优化所有深度学习模型。它通过不断地在损失函数递减的方向上更新参数来降低误差。

梯度下降最简单的用法是计算损失函数（数据集中**所有样本**的损失均值）
关于模型参数的导数（在这里也可以称为梯度）。
但实际中的执行可能会非常慢：因为在每一次更新参数之前，我们必须遍历整个数据集。
因此，我们通常会在每次需要计算更新的时候随机抽取一小批样本，
这种变体叫做*小批量随机梯度下降*（minibatch stochastic gradient descent）。

在每次迭代中，我们首先随机抽样一个小批量$\mathcal{B}$，
它是由固定数量的训练样本组成的。
然后，我们计算小批量的平均损失关于模型参数的导数（也可以称为梯度）。
最后，我们将梯度乘以一个预先确定的正数$\eta$ ，并从当前参数的值中减掉。
??? note "超参数"
    这个预先确定的正数$\eta$叫做*学习率*（learning rate 简称lr）或*步长*（step size）。
    不能太长或太短，调整超参数的过程就是*调参*。
    其他超参数还有*批量大小*（batch size）和*迭代周期数*（number of epochs）。

我们用下面的数学公式来表示这一更新过程（$\partial$表示偏导数）：

$$(\mathbf{w},b) \leftarrow (\mathbf{w},b) - \frac{\eta}{|\mathcal{B}|} \sum_{i \in \mathcal{B}} \partial_{(\mathbf{w},b)} l^{(i)}(\mathbf{w},b).$$

??? code "动手写线性回归"
    ```py
    import torch
    import random
    ###################
    # step1 生成数据集 #
    ###################

    # 使用w=[2, -3.4], b=4.2作为真实参数，len(w)=2 implies 2 features
    def synthetic_data(w, b, num_examples): 
        """生成 y = Xw + b + 噪声。"""
        X = torch.normal(0, 1, (num_examples, len(w))) 
        y = torch.matmul(X, w) + b # y是一个行向量
        y += torch.normal(0, 0.01, y.shape) # 噪声项
        return X, y.reshape((-1, 1)) # 将y转换为列向量

    true_w = torch.tensor([2, -3.4])
    true_b = 4.2
    features, labels = synthetic_data(true_w, true_b, 1000) #feature的每一行是一个样本
    ，含有两个feature

    ###################
    # step2 读取数据集 #
    ###################

    def data_iter(batch_size, features, labels):
        '''执行data_iter(batch_size, features, labels)时，得到的是一个生成器。
        可以通过在这个生成器上调用next()函数或者使用for循环来获取数据。
        每次获取数据时，它都会返回一个包含batch_size个样本的批次，
        直到整个数据集被遍历完。'''
        num_examples = len(features)
        indices = list(range(num_examples))
        random.shuffle(indices) # 打乱索引，使样本的读取顺序是随机的
        for i in range(0, num_examples, batch_size):
            '''最后一次可能不足一个batch，故取min(i + batch_size, num_examples)
            # batch_indices是一个长度为batch_size(有一个可能略小)的tensor，而不是list这是为了能支持GPU操作'''
            batch_indices = torch.tensor(indices[i:min(i + batch_size, num_examples)])
            yield features[batch_indices], labels[batch_indices]

    batch_size = 10 #每个batch含有10个样本

    for X, y in data_iter(batch_size, features, labels):
        print(X, '\n', y)
        break

    #################
    # step3 建立模型 #
    #################

    w = torch.normal(0, 0.01, size=(2,1), requires_grad=True) # 预留梯度
    b = torch.zeros(1, requires_grad=True)

    def linreg(X, w, b): 
        """线性回归模型。"""
        return torch.matmul(X, w) + b

    def squared_loss(y_hat, y): 
        """均方损失。"""
        return (y_hat - y.reshape(y_hat.shape)) ** 2 / 2

    def sgd(params, lr, batch_size): 
        """小批量随机梯度下降。sgd stand for stochastic(random) gradient descent, 
        params is a list of parameters that need to be updated in the model, 
        specifically, params = [w, b]"""
        with torch.no_grad(): #默认情况下，PyTorch会为跟踪其梯度的每个张量启用梯度跟踪。
            for param in params:
                param -= lr * param.grad / batch_size
                param.grad.zero_()

    ##############
    # step4 训练 #
    ##############

    #设置超参数
    lr = 0.03
    num_epochs = 3
    net = linreg
    loss = squared_loss

    for epoch in range(num_epochs):
        for X, y in data_iter(batch_size, features, labels):
            l = loss(net(X, w, b), y)  # X和y的小批量损失
            # 因为l形状是(batch_size,1)，而不是一个标量。l中的所有元素被加到一起，
            # 并以此计算关于[w,b]的梯度
            l.sum().backward()
            sgd([w, b], lr, batch_size)  # 使用参数的梯度更新参数
        with torch.no_grad():
            train_l = loss(net(features, w, b), labels)
            print(f'epoch {epoch + 1}, loss {float(train_l.mean()):f}')
    ```

## Softmax回归
回归可以预测“多少”的问题，而分类则可以预测“哪一个”的问题。Softmax回归是一个单层神经网络，用于多分类问题。我们仍然使用线性代数符号。
通过向量形式表达为$\mathbf{o} = \mathbf{W} \mathbf{x} + \mathbf{b}$，
这是一种更适合数学和编写代码的形式。
对于给定数据样本的特征$\mathbf{x}$，
我们的输出是由权重与输入特征进行矩阵-向量乘法再加上偏置$\mathbf{b}$得到的。

???+ note  "一些概念"
    - one-hot code（独热编码）：向量的长度是类别的个数，向量的第$i$个元素为1，其余元素为0，第$i$个元素对应的类别即为该数字所代表的类别。比如猫狗分类问题，猫的one-hot code为[1,0]，狗的one-hot code为[0,1]。则标签值$y \in \{ [1,0], [0,1] \}$
    - 全连接层：全连接层的输入是一个向量**(比如一个样本的所有特征)**，输出也是一个向量 **（比如所有类别的预测值，注意此时还不是规范后的概率）**。全连接层的每个输出元素都与输入中的每个元素相连，且每个连接都有权重。

### softmax运算
我们希望模型的输出$\hat{y}_j$可以视为属于类$j$的概率，
然后选择具有最大输出值的类别$\operatorname*{argmax}_j y_j$作为我们的预测。
例如，如果$\hat{y}_1$、$\hat{y}_2$和$\hat{y}_3$分别为0.1、0.8和0.1，
那么我们预测的类别是2

通过$\mathbf{o} = \mathbf{W} \mathbf{x} + \mathbf{b}$，运算得到的$\mathbf{o}$不一定是概率，因为可能有负数或者大于1的数。因此我们需要对$\mathbf{o}$进行规范化，**使其每个元素都在0和1之间且所有元素之和为1。这样我们的输出就可以看作概率了。**，一个成熟的方法是通过softmax运算来获得一个有效的类别概率分布。

$$
\hat{\mathbf{y}} = \mathrm{softmax}(\mathbf{o})\quad \text{其中}\quad \hat{y}_j = \frac{\exp(o_j)}{\sum_k \exp(o_k)}
$$

它有很好的性质，当我们使用如下式子作为损失函数时，就可以最大化训练数据集上的似然。(q为类别数)它被称为*交叉熵损失*（cross-entropy loss）。

$$
l(\mathbf{y}, \hat{\mathbf{y}})= - \sum_{j}^{q} y_j \log \hat{y}_j
$$
>
可以这么理解：考虑极限情况，当$\hat{y}_j=1$时，$l(\mathbf{y}, \hat{\mathbf{y}})=0$，当$\hat{y}_j=0$时，$l(\mathbf{y}, \hat{\mathbf{y}})=\infty$。因此，我们希望$\hat{y}_j$等于真实标签$y_j$，即$\hat{y}_j=y_j$。
>

更严谨地，我们可以证明最大化训练数据集上的似然等价于最小化交叉熵损失函数，即$l(\mathbf{y}, \hat{\mathbf{y}}) = - \sum_{j}^{q} y_j \log \hat{y}_j$。（以下$y_j，o_j$均为实数，且$y_j，j=1, 2, \cdots, q$ 有且仅有一个标签值为1，其余均为0）

$$
\begin{aligned}
l(\mathbf{y}, \hat{\mathbf{y}}) &=  - \sum_{j=1}^q y_j \log \frac{\exp(o_j)}{\sum_{k=1}^q \exp(o_k)} \\
&= \sum_{j=1}^q y_j \log \sum_{k=1}^q \exp(o_k) - \sum_{j=1}^q y_j o_j\\
&= \log \sum_{k=1}^q \exp(o_k) - \sum_{j=1}^q y_j o_j.
\end{aligned}
$$

$$
\partial_{o_j} l(\mathbf{y}, \hat{\mathbf{y}}) = \frac{\exp(o_j)}{\sum_{k=1}^q \exp(o_k)} - y_j = \mathrm{softmax}(\mathbf{o})_j - y_j.
$$

观察以上式子，发现导数是softmax模型分配的概率与实际发生的情况（由独热标签向量表示）之间的差异。从这个意义上讲，这与我们在回归中看到的非常相似，其中梯度是观测值$y$和估计值$\hat{y}$之间的差异。这就是选取softmax来标准化输出的原因。

??? code "动手写softmax回归"

```py
import torch
import torchvision
from torch.utils import data
from torchvision import transforms
d2l.use_svg_display()
```







