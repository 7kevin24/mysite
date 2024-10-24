## Mathematical Statistics

>### Point Estimation
>

:material-cube: Let $X_1, X_2, \cdots, X_n$ be a random sample from a distribution with p.d.f $f(x;\theta)$, where $\theta$ is an unknown parameter. A statistic $T=T(X_1, X_2, \cdots, X_n)$ is called an `estimator` of $\theta$. The value $t=T(x_1, x_2, \cdots, x_n)$ is called an `estimate` of $\theta$.

The definition above indicates that 

- An estimator is a function of the random sample, no other unknown parameter is involved. 
- An estimate is a value of the estimator when the random sample is observed.

Below are two methods get an estimator:

- Method of moments
- Maximum Likelyhood Estimation

>### Method of Moments
>

When sample size $n$ is large enough, the moment of the sample is approximately equal to the moment of the distribution. So we can use the moment of the sample to estimate the moment of the distribution. Namely:

$$
\begin{aligned}
A_k \xrightarrow{P} \mu_k, \quad n \to \infty\\
B_k \xrightarrow{P} \nu_k, \quad n \to \infty\\
\end{aligned}
$$

??? recall
    $$
    \begin{aligned}
    \mu_k = E[X^k] \\
    \nu_k = E[(X-\mu)^k]
    \end{aligned} 
    $$

where $A_k$ is the $k$th origin moment of the sample and $B_k$ is the central moment of the sample. $\mu_k$ is the $k$th origin moment of the distribution and $\nu_k$ is the $k$th central moment of the distribution.

???+ example
    Let population $X$ follow a uniform distribution on the interval $[a,b]$. $X_{i}$ are samples from $X$. try to estimate $a$ and $b$.

    solution:

    $$
    \mu_{1}=\frac{a+b}{2} \quad \nu_{2}=\frac{(b-a)^{2}}{12}=S^{2} where S is the sample variance
    $$

    Therefore, 

    $$
    \begin{aligned}
    a=\mu_{1}-\sqrt{3\nu_{2}}\\
    b=\mu_{1}+\sqrt{3\nu_{2}}\\
    \end{aligned}
    $$

    use $A_{1}$ and $B_{2}$ to estimate $\mu_{1}$ and $\nu_{2}$, we have:

    $$
    \begin{aligned}
    \hat{a}&=\overline{X}-\sqrt{\frac{3}{n-1} \sum_{i=1}^{n}\left(X_{i}-\overline{X}\right)^{2}}\\
    \hat{b}&=\overline{X}+\sqrt{\frac{3}{n-1} \sum_{i=1}^{n}\left(X_{i}-\overline{X}\right)^{2}}\\
    \end{aligned}
    $$

Moment estimation is a very simple method. And the estimator we get is **consistent**, **unbiased** and **efficient**. It works even when the distribution of the population is unknown. 


>### :star: Maximum Likelihood Estimation :star:
>

>Likelihood function: <br>
>

:material-cube: Let population $X$ follow a discrete distribution with p.m.f $f(x;\theta)$ Let $X_1, X_2, \cdots, X_n$ be a random sample from $X$. Then the propobility of the  event ${X=x}$ is:

$$
P_\theta(X=x)=P_\theta(X_1=x_1,X_2=x_2,\cdots,X_n=x_n)=\prod_{i=1}^{n}f(x_i;\theta)
$$

It is a function of $\theta$ and $x_1, x_2, \cdots, x_n$. We call it the `likelihood function` of $\theta$ and denote it by $L(\theta;\mathbf{x})$ or simply $L(\theta)$.

:material-cube: Let population $X$ follow a continuous distribution with p.d.f $f(x;\theta)$ Let $X_1, X_2, \cdots, X_n$ be a random sample from $X$. Then the propobility of the  event ${X=x}$ is:

$$
P(X=x)=\prod_{i=1}^{n}f(x_i;\theta)
$$

compare to the discrete case, the likelihood function can not be written as a probability of the event ${X=x}$.

:material-cube:Maximum likelihood estimator: <br>
Find a $\hat{\theta}$ that makes:

$$
L(\hat{\theta})=\max_{\theta \in \Theta}L(\theta) 
$$

There are mainly two ways to do so:

- Take the derivative of $L(\theta)$ or $ln L(\theta)$ and let it equal to 0. Then we get $\hat{\theta}$.
- When $L(\theta)$ is monotonic, all we have to do is to find the value range of $\theta$ usually determined by the relationship between $\theta$ and support of $X$. 

??? example
    Let population $X$ has the given p.d.f:

    $$
    f(x;\theta)=\begin{cases} \frac{2x}{\theta^{2}}, & 0<x<\theta \\ 0, & \text{otherwise} \end{cases}
    $$

    Let $X_1, X_2, \cdots, X_n$ be a random sample from $X$ and $\theta >0$. Find the maximum likelihood estimator of $\theta$ and the moment estimator of $\theta$.

    solution:

    $$
    L(\theta)=\prod_{i=1}^{n}f(x_i;\theta)=\prod_{i=1}^{n}\frac{2x_i}{\theta^{2}}=\frac{2^{n}}{\theta^{2n}}\prod_{i=1}^{n}x_i
    $$

    It's a monotocically decreasing function of $\theta$. And we have:

    $$
    x_{(1)}<= x_{(2)}<= \cdots, x_{(n)}\le \theta
    $$

    So we have:

    $$
    \hat{\theta}=x_{(n)}
    $$

    where $x_{(n)}$ is the maximum value of $x_1, x_2, \cdots, x_n$.

    We now try to get the moment estimator of $\theta$. We have:

    $$
    \mu_{1}=\frac{2}{\theta^{2}}\int_{0}^{\theta}x^{2}dx=\frac{2}{\theta^{2}}\frac{\theta^{3}}{3}=\frac{2}{3}\theta
    $$

    So we have:

    $$
    \hat{\theta}=\frac{3}{2}\overline{X}
    $$

    where $\overline{X}$ is the sample mean.

:star:An important property of maximum likelihood estimation: the invariance property. <br>
:material-cube: Let $\hat{\theta}$ be the maximum likelihood estimator of $\theta$. Let $\theta^*=g(\theta)$ be a continuous function of $\theta$. Then we have:

$$
\hat{\theta}^*=g(\hat{\theta})
$$

That is to say, once we get the maximum likelihood estimator of $\theta$, we can get the maximum likelihood estimator of any function of $\theta$.

>### Methods of Evaluating Estimators
>

unbiasedness: <br>
:material-cube: Let $\hat{\theta}$ be an estimator of $\theta$. If $E(\hat{\theta})=\theta$, then we say that $\hat{\theta}$ is an `unbiased estimator` of $\theta$.

???+ example
    Try to prove that the variance of the sample $S^{2}$ is an unbiased estimator of the variance of the population $\sigma^{2}$.

    solution:

    $$
    \begin{aligned}
    E\left(S^{2}\right)&=E\left(\frac{1}{n-1} \sum_{i=1}^{n}\left(X_{i}-\overline{X}\right)^{2}\right)\\
    &=\frac{1}{n-1} E\left(\sum_{i=1}^{n} X_{i}^{2}-n \overline{X}^{2}\right)\\
    &=\frac{1}{n-1} (n E\left(X_{i}^{2}\right)-n E\left(\overline{X}^{2}\right))\\
    \end{aligned}
    $$

    Since $E\left(X_{i}^{2}\right)=\sigma^{2}+\mu_{1}^{2}$ and $E\left(\overline{X}^{2}\right)=\frac{\sigma^{2}}{n}+\mu_{1}^{2}$, we have:

    $$
    \begin{aligned}
    E\left(S^{2}\right)&=\frac{1}{n-1} (n (\sigma^{2}+\mu_{1}^{2})-n (\frac{\sigma^{2}}{n}+\mu_{1}^{2}))\\
    &=\frac{1}{n-1} (n-1) \sigma^{2}\\
    &=\sigma^{2}\\
    \end{aligned}
    $$

efficiency: <br>
:material-cube: Let $\hat{\theta}_1$ and $\hat{\theta}_2$ be two unbiased estimators of $\theta$. If $Var(\hat{\theta}_1)\le Var(\hat{\theta}_2)$, then we say that $\hat{\theta}_1$ is more efficient than $\hat{\theta}_2$.

mean square error: <br>
:material-cube: Let $\hat{\theta}$ be an estimator of $\theta$. The `mean square error` of $\hat{\theta}$ is defined by:

$$
MSE(\hat{\theta})=E\left[(\hat{\theta}-\theta)^{2}\right]
$$

If $MSE(\hat{\theta_{1}}) \le  MSE(\hat{\theta_{2}})$ then we say that $\hat{\theta_{1}}$ is better than $\hat{\theta_{2}}$ under the mean square error criterion.

???+ example
    Let $X_1, X_2, \cdots, X_n$ be a random sample from a normal distribution $N(\mu,\sigma^{2})$. Compare $S^{2}$ and $B_{2}$ under the mean square error criterion where $S^{2}$ is the sample variance and $B_{2}$ is the second central moment of the sample.

    solution:
    Since $S^{2}$ is unbiased, we have:

    $$
    \begin{aligned}
    MSE\left(S^{2}\right)&=E\left[\left(S^{2}-\sigma^{2}\right)^{2}\right]\\
    &=E\left[\left(S^{2}-E\left(S^{2}\right)\right)^{2}\right]\\
    &=Var\left(S^{2}\right)
    \end{aligned}
    $$

    And we know that:

    $$
    \frac{(n-1)S^{2}}{\sigma^{2}} \sim \chi^{2}(n-1)
    $$

    So we have:

    $$
    \operatorname{Var}(S^{2})=\frac{2 \sigma^{4}}{n-1}
    $$

    For $B_{2}$, we have:

    $$
    \begin{aligned}
    MSE\left(B_{2}\right)&=E\left[\left(B_{2}-\sigma^{2}\right)^{2}\right]\\
    &=E(B_2^{2})-2\sigma^{2}E(B_2)+\sigma^{4}\\
    \end{aligned}
    $$
  
    Since $B_{2} = \frac{n-1}{n}S^{2}$, we have:

    $$
    \begin{aligned}
    MSE\left(B_{2}\right)&=E(B_2^{2})-2\sigma^{2}E(B_2)+\sigma^{4}\\
    &=\frac{(n-1)^{2}}{n^{2}}E((S^{2})^{2}) - \frac{2\sigma^{2}(n-1)}{n}E(S^{2}) +\sigma^{4}\\
    &=\frac{(n-1)^{2}}{n^{2}}[\operatorname{Var}(S^{2})+E^{2}(S^{2})]-\frac{2\sigma^{2}(n-1)}{n}E(S^{2})+\sigma^{4}\\
    &=\frac{(n-1)^{2}}{n^{2}}[\frac{2 \sigma^{4}}{n-1}+\sigma^4]-\frac{2\sigma^{4}(n-1)}{n}+\sigma^4\\
    &=\frac{2n-1}{n^{2}}\sigma^4
    \end{aligned}
    $$

    To any $n\ge 2$, $\frac{2}{n-1}>\frac{2n-1}{n^{2}}$. Thta is to say, $B_{2}$ is better than $S^{2}$ under the mean square error criterion.

consistency: <br>
The three methods above are all based on the assumption that the sample size $n$ is determined. We may think, the larger the sample size, the better the estimator. So we need a new method to evaluate the estimator. That is the consistency.

:material-cube: Let $\hat{\theta}$ be an estimator of $\theta$. If to any $\epsilon>0$, we have:

$$
\lim _{n \rightarrow \infty} P\left(|\hat{\theta}-\theta|<\epsilon\right)=1
$$

then we say that $\hat{\theta}$ is a `consistent estimator` of $\theta$.

Namely:

$$
\theta_{n} \xrightarrow{P} \theta, \quad n \to \infty
$$

??? example
    Let $X_1, X_2, \cdots, X_n$ be a random sample from a uniform distribution on the interval $[0,\theta]$. we have the given estimators of $\theta$:

    - Moment estimator: $\hat{\theta}_{1}=2 \overline{X}$
    - MLE :$\hat{\theta}_{2}=X_{(n)}$
    - An unbiased estimator $\hat{\theta}_{3}=\frac{n+1}{n} X_{(n)}$

    prove that: the three estimators are all consistent estimators of $\theta$.

    solution:

    According to the law of large numbers, we have:

    $$
    \overline{X} \xrightarrow{P} \frac{\theta}{2}, \quad n \to \infty
    $$

    Namely:

    $$
    \hat{\theta}_{1}=2 \overline{X} \xrightarrow{P} \theta, \quad n \to \infty
    $$

    We now prove that $\hat{\theta}_{3}=\frac{n+1}{n}X_{(n)}$ is a consistent estimator of $\theta$. 
    We consider using chebyshev's inequality, so we need to get $A_{1}$ and $B_{2}$ We have:

    $$
    F_{X_{(n)}}(x)=P\left(X_{(n)} \leq x\right)=P\left(X_{1} \leq x, X_{2} \leq x, \cdots, X_{n} \leq x\right)=\prod_{i=1}^{n} P\left(X_{i} \leq x\right)=\prod_{i=1}^{n} F_{X}(x)=\left(\frac{x}{\theta}\right)^{n}
    $$

    Namely:

    $$
    f_{X_{(n)}}(x)=\begin{cases} n\frac{x^{n-1}}{\theta^n}, & 0<x<\theta \\ 0, &  \text{otherwise}\end{cases}
    $$

    So we have:

    $$
    \begin{aligned}
    A_{1}&=E(X_{(n)})=\int_{0}^{\theta} x f_{X_{(n)}}(x) d x=\int_{0}^{\theta} x n\frac{x^{n-1}}{\theta^n} d x=\frac{n}{n+1} \theta\\
    B_{2}&=E\left(X_{(n)}^{2}\right)-A_{1}^{2}=\int_{0}^{\theta} x^{2} f_{X_{(n)}}(x) d x-\left(\frac{n}{n+1} \theta\right)^{2}=\frac{n}{(n+1)^{2}(n+2)}\theta^{2}\\
    \end{aligned}
    $$

    notice that, $A_{1}$ and $B_{2}$ are $\hat{\theta_{2}}'s$ moment, so we need to get $A_{1}$ and $B_{2}$ of $\hat{\theta_{3}}$. We have:

    $$
    \begin{aligned}
    A_{1}'&=\frac{n}{n+1}\theta \frac{n+1}{n} = \theta\\
    B_{2}'&=\frac{n}{(n+1)^{2}(n+2)}\theta^{2}\frac{(n+1)^{2}}{n^{2}}=\frac{\theta^{2}}{(n+2)n}\\
    \end{aligned}
    $$

    According to chebyshev's inequality, we have:

    $$
    \begin{aligned}
    P\left(|\hat{\theta}_{3}-A_{2}'|\ge \epsilon\right)&\le \frac{B_{2}'}{\epsilon^{2}} \quad namely:\\
    P\left(|\hat{\theta}_{3}-\theta|\ge \epsilon\right)&\le \frac{\theta^{2}}{(n+2)n \epsilon^{2}} \rightarrow 0\\
    \end{aligned}
    $$

    According to squeeze theorem, 

    $$
    \lim_{n \to \infty}P\left(|\hat{\theta}_{3}-\theta|\ge \epsilon\right)=0
    $$

    or

    $$
    \lim_{n \to \infty}P\left(|\hat{\theta}_{3}-\theta|\le \epsilon\right)=1
    $$

    Finally, we prove that $\hat{\theta_{2}}$ is also consistent,
    
    If we treat $\theta-\hat{\theta_{2}}$ as a random variable, we have:

    $$
    P\{|\theta-\hat{\theta_{2}}|<\epsilon\}\ge 1-\frac{E(|\theta-\hat{\theta_{2}}|)}{\epsilon}=1-\frac{E(\theta-\hat{\theta_{2}})}{\epsilon}=1-\frac{\theta}{(n+1)\epsilon}\rightarrow 1
    $$

>### Confidence Intervals
>

:material-cube: Let $X_1, X_2, \cdots, X_n$ be a random sample from a distribution with p.d.f $f(x;\theta)$, where $\theta$ is an unknown parameter. Let $L(X_1, X_2, \cdots, X_n)$ and $U(X_1, X_2, \cdots, X_n)$ be two statistics such that:

$$
P\left(L(X_1, X_2, \cdots, X_n)<\theta<U(X_1, X_2, \cdots, X_n)\right)=1-\alpha
$$

where $\alpha$ is a given number such that $0<\alpha<1$. Then the interval $(L,U)$ is called a `confidence interval` for $\theta$ with confidence coefficient $1-\alpha$. The probability $1-\alpha$ is called the `confidence level`.

>### Pivotal Quantity
>













