### Actor-Critic
本质上是基于策略的算法，但额外学习价值函数，从而提高策略的学习效果。

### Takeaways

- baseline function: 考虑策略的梯度：
  
    $$
    g = E\left[\sum_{t=0}^T\psi_t \nabla_\theta \log \pi_\theta(a_t|s_t)\right]
    $$

    在REINFORCE中，$\psi_t = G_t$，即MC的回报。而在Actor-Critic中，可以选取优势函数$A^{\pi_\theta}(s_t,a_t)$或者TD error $r_t+\gamma V^{\pi_\theta}(s_{t+1})-V^{\pi_\theta}(s_t)$作为baseline function,。
  
    ??? note "为什么选V(s)?"
        由于引入b(s)不会改变期望，只会影响方差，所以可以选择合适的baseline function来减小方差，而选择V(s)作为baseline function，实际上更新的就是优势函数A(s,a)，这是对动作相对于基准的评价.

    ??? note "为什么b(s)不会改变期望"
        要证明：

        \[
        b(s) \mathbb{E}_{a \sim \pi_\theta} \left[ \nabla_{\theta} \log \pi_{\theta}(a|s) \right] = 0
        \]

        步骤1：策略的归一化性质
        因为 $\pi_{\theta}(a|s)$ 是一个概率分布，所以满足以下归一化条件：

        \[
        \sum_{a} \pi_{\theta}(a|s) = 1
        \]

        对该等式两边关于参数 $\theta$ 求导：

        \[
        \nabla_{\theta} \sum_{a} \pi_{\theta}(a|s) = \nabla_{\theta} 1 = 0
        \]

        由于求和符号与梯度运算可以互换，因此上式可以写为：

        \[
        \sum_{a} \nabla_{\theta} \pi_{\theta}(a|s) = 0
        \]

        步骤2：链式法则

        利用链式法则，我们对 $\nabla_{\theta} \pi_{\theta}(a|s)$ 进行展开：

        \[
        \nabla_{\theta} \pi_{\theta}(a|s) = \pi_{\theta}(a|s) \nabla_{\theta} \log \pi_{\theta}(a|s)
        \]

        将其代入前面的等式：

        \[
        \sum_{a} \pi_{\theta}(a|s) \nabla_{\theta} \log \pi_{\theta}(a|s) = 0
        \]

        这意味着：

        \[
        \mathbb{E}_{a \sim \pi_\theta} \left[ \nabla_{\theta} \log \pi_{\theta}(a|s) \right] = \sum_{a} \pi_{\theta}(a|s) \nabla_{\theta} \log \pi_{\theta}(a|s) = 0
        \]

        步骤3：基线函数不影响期望

        我们现在考虑引入基线 $b(s)$，并证明其不会改变期望。因为 $b(s)$ 是与状态 $s$ 相关的常数，所以它可以被提到期望外：

        \[
        b(s) \mathbb{E}_{a \sim \pi_\theta} \left[ \nabla_{\theta} \log \pi_{\theta}(a|s) \right] = b(s) \cdot 0 = 0
        \]

        因此，引入基线函数 $b(s)$ 不会改变策略梯度的期望值。

        由于

        \[
        \mathbb{E}_{a \sim \pi_\theta} \left[ \nabla_{\theta} \log \pi_{\theta}(a|s) \right] = 0
        \]

        我们证明了引入基线 $b(s)$ 不会改变策略梯度的期望，只会对方差产生影响。
- critic 的更新方式：
  define loss function:
  
    $$
    L(w) = \frac{1}{2}(r+\gamma V_w(s')-V_w(s))^2
    $$

    update rule:
    Do as what we do in DQN: treat $r+\gamma V_w(s')$ as target, generate from target network, and minimize the loss function.

    $$
    \delta_w L(w) = -\nabla_w L(w) = (r+\gamma V_w(s')-V_w(s))\nabla_w V_w(s)
    $$ 

    The benefit of using target network is to stabilize the training process.

    



