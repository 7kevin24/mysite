### TRPO(trust region policy optimization)
??? note "Fisher Information"
    Fisher information measures the amount of information that an observable random variable X carries about an unknown parameter $\theta$ upon which the probability of X depends. It's defined as the expected value of the square of the score function, which is the first derivative of the log-likelihood of X with respect to $\theta$.

    For a random variable $X$ with probability density function $p(x|\theta)$, the Fisher information is defined as:

    $$
    I(\theta) = E\left[\left(\frac{\partial}{\partial \theta} \log p(x|\theta)\right)^2\right]
    $$

    and for a sample of $n$ independent distributed random variables $X_1, X_2, \ldots, X_n$, the Fisher information is:

    $$
    I(\theta) = \sum_{i=1}^n E\left[\left(\frac{\partial}{\partial \theta} \log p(x_i|\theta)\right)^2\right]
    $$

    Intuition:

    - Recall the likelihood function $L(\theta) = \prod_{i=1}^{n} p(x_i|\theta)$, and score function $S(\theta) = \frac{\partial}{\partial \theta} \log L(\theta)$. So Fisher information is the expected value of the square of the score function. 
    - Fisher information measures the amount of information that the data carries about the parameter $\theta$. The larger the Fisher information, the more information the data carries about $\theta$.


??? note "KL divergence"
    Kullback–Leibler divergence measures how one probability distribution 
    P differs from a second reference distribution 
    Q. It's calculated as:

    $$
    D_{KL}(p||q) = \sum_x p(x) \log \frac{p(x)}{q(x)}
    $$

    or for continuous distributions:

    $$
    D_{KL}(p||q) = \int_{-\infty}^\infty p(x) \log \frac{p(x)}{q(x)} dx
    $$

    Intuition:

    - If $P = Q$, then $D_{KL}(p||q) = 0$ 
    - The larger the divergence, the more different 𝑃 is from Q, meaning there's more "surprise" in using Q when the true distribution is P.

    below is a step by step derivation of the KL divergence between two Gaussian distributions:

    $$
    \begin{aligned}
    D_{KL}(N(\mu_0, \sigma_0^2) || N(\mu_1, \sigma_1^2)) &= \int_{-\infty}^{\infty} N(\mu_0, \sigma_0^2) \log \frac{N(\mu_0, \sigma_0^2)}{N(\mu_1, \sigma_1^2)} dx \\
    &= \int_{-\infty}^{\infty} N(\mu_0, \sigma_0^2) \log \frac{\frac{1}{\sqrt{2\pi\sigma_0^2}} \exp\left(-\frac{(x-\mu_0)^2}{2\sigma_0^2}\right)}{\frac{1}{\sqrt{2\pi\sigma_1^2}} \exp\left(-\frac{(x-\mu_1)^2}{2\sigma_1^2}\right)} dx \\
    &= \int_{-\infty}^{\infty} N(\mu_0, \sigma_0^2) \left(\log \frac{1}{\sqrt{2\pi\sigma_0^2}} - \frac{(x-\mu_0)^2}{2\sigma_0^2} - \log \frac{1}{\sqrt{2\pi\sigma_1^2}} + \frac{(x-\mu_1)^2}{2\sigma_1^2}\right) dx \\
    &= \log \frac{\sigma_1}{\sigma_0} + \frac{\sigma_0^2 + (\mu_0 - \mu_1)^2}{2\sigma_1^2} - \frac{1}{2}
    \end{aligned}
    $$


??? note "Hesse-Matrix"
    Hessian matrix is a square matrix of second-order partial derivatives of a scalar-valued function. It describes the local curvature of a function of many variables. 

    For a function $f: \mathbb{R}^n \rightarrow \mathbb{R}$, the Hessian matrix is defined as:

    $$
    H(f) = \begin{bmatrix}
    \frac{\partial^2 f}{\partial x_1^2} & \frac{\partial^2 f}{\partial x_1 \partial x_2} & \cdots & \frac{\partial^2 f}{\partial x_1 \partial x_n} \\
    \frac{\partial^2 f}{\partial x_2 \partial x_1} & \frac{\partial^2 f}{\partial x_2^2} & \cdots & \frac{\partial^2 f}{\partial x_2 \partial x_n} \\
    \vdots & \vdots & \ddots & \vdots \\
    \frac{\partial^2 f}{\partial x_n \partial x_1} & \frac{\partial^2 f}{\partial x_n \partial x_2} & \cdots & \frac{\partial^2 f}{\partial x_n^2}
    \end{bmatrix}
    $$

    The Hessian matrix is symmetric if the second-order partial derivatives are continuous in a neighborhood of the point.

### Intuitively 
Compared to the network in deep learning, the policy network in reinforcement learning is a function that maps states to actions. Consider how steps affect these two networks.
for the former one, let's say, supervised learning, the goal is to minimize the loss function. If we took too large a step, it could be harder to converge.
However, for the latter one, the policy network, the networks maps states to actions, and the goal is to maximize the reward. If we took too large a step, and the policy may lead to a completely diffrent state and then, trajectory, like ripple effect result in a sudden and significant decline in performance. So, TRPO was proposed to solve this problem.

### 策略目标（Policy Objective）
Let's say our current policy is $\pi_{\theta}$, and we want to find a new policy $\pi_{\theta'}$ which makes $J(\theta') \geq J(\theta)$. 

$$
\begin{aligned}
J(\theta) &=E_{s_{0}}[V^{\pi_{\theta}}(s_{0})]\\
          &=E_{\pi_\theta'}\left[\sum_{t=0}^{\infty}\gamma^{t}V^{\pi_{\theta}}(s_{t}) - \sum_{t=1}^\infty \gamma^{t}V^{\pi_{\theta}}(s_{t})\right]\\
          &= -E_{\pi_\theta'}\left[\sum_{t=0}^\infty \gamma^{t} (\gamma V^{\pi_{\theta}}(s_{t}) - V^{\pi_{\theta}}(s_{t}))\right]\\
\end{aligned}
$$

在上式1到2过程中，将下标进行了替换，从$s_{0}$到$\pi_\theta'$ 这样做

- 可以是因为：$E_{s_{0}}[V^{\pi_\theta}(s_0)]$ 表示的是在初始状态$s_{0}$下的价值函数的值，而由于初始状态的分布与策略无关/独立（通常是根据实验设定的固定值或者分布），所以可以替换为$\pi_\theta'$，即在$\pi_\theta'$下的价值函数的值。（PS: $V^{\pi_\theta}(s)$就是一个函数，与当前的策略没有关系，输入一个s，给出一个value，that‘s it）
- 便于进一步评估策略的优劣，即通过比较两个策略的期望值，来判断哪个策略更好。

继续推导

$$
\begin{aligned}
J(\theta') - J(\theta) &= E_{s_{0}}[V^{\pi_{\theta'}}(s_{0})] - E_{s_{0}}[V^{\pi_{\theta}}(s_{0})]  \\
&= E_{\pi_{\theta'}}\left[\sum_{t=0}^{\infty}\gamma^{t}r(s_t,a_t)\right]+E_{\pi_\theta'}\left[\sum_{t=0}^\infty \gamma^{t} (\gamma V^{\pi_{\theta}}(s_{t}) - V^{\pi_{\theta}}(s_{t}))\right]\\
& = E_{\pi_{\theta'}}\left[\sum_{t=0}^{\infty}\gamma^{t}\left[r(s_t,a_t)+\gamma V^{\pi_{\theta}}(s_{t})-V^{\pi_{\theta}}(s_{t})\right]\right]\\
\end{aligned}
$$

将时序差分残差（TD residual）定义为优势函数$A^{\pi_{\theta}}(s,a)$，那么上式可以进一步简化为：

$$
\begin{aligned}
J(\theta') - J(\theta) &= E_{\pi_{\theta'}}\left[\sum_{t=0}^{\infty}\gamma^{t}A^{\pi_{\theta}}(s_t,a_t)\right]\\
&= \sum_{t=0}^\infty \gamma^{t}E_{s_t \sim P_t^{\pi_{\theta'}}}E_{a_t \sim \pi_\theta'(a|s_t)}[A^{\pi_{\theta}}(s_t,a_t)]\\
&= \frac{1}{1-\gamma}E_{s \sim \nu^{\pi_{\theta'}}}E_{a \sim \pi_\theta'(a|s)}[A^{\pi_{\theta}}(s,a)]\\
\end{aligned}
$$


