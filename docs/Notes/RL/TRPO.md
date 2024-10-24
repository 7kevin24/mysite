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


  