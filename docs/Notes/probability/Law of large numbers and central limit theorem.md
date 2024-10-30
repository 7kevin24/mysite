>### Law of Large number
>

:material-cube: Let $\{X_i,i\ge 1\}$ be a sequence of random variables, if a sequence of constant $\{c_n, n\ge 1\}$ exists such that to any $\epsilon>0$, we have:

$$
\lim_{n \to \infty}P\left(\left\vert \frac{1}{n}\sum_{i=1}^{n}X_i-c_{n}\right\vert \geq \epsilon\right)=0
$$

or equivalently,

$$
\lim_{n \to \infty}P\left(\left\vert \frac{1}{n}\sum_{i=1}^{n}X_i-c_{n}\right\vert < \epsilon\right)=1
$$

then we say that $\{X_i,i\ge 1\}$ satisfies the `law of large number`.

essentially, if $c_n=c$, then we can write the law of large number as:

$$
\frac{1}{n}\sum_{i=1}^{n}X_i \xrightarrow{P} c, \quad n \to \infty
$$

>Bernoulli's law of large number
>

:material-cards-diamond-outline: Let $n_{A}$ be the number of times that event $A$ occurs in $n$ independent trials of an experiment. Let $p=P(A)$, then to any $\epsilon>0$, we have:

$$
\lim_{n \to \infty}P\left(\left\vert \frac{n_{A}}{n}-p\right\vert \geq \epsilon\right)=0
$$

>:star: Khintchine's law of large number :star:
>

:material-cards-diamond-outline: Let $X_1, X_2, \cdots$ be a sequence of independent random variables with $E(X_i)=\mu$. Then to any $\epsilon>0$, we have:

$$
\lim_{n \to \infty}P\left(\left\vert \frac{1}{n}\sum_{i=1}^{n}X_i-\mu\right\vert \geq \epsilon\right)=0
$$

namely:

$$
\frac{1}{n}\sum_{i=1}^{n}X_i \xrightarrow{P} \mu, \quad n \to \infty
$$

:fontawesome-solid-angle-right: :star: An important corollary of Khintchine's law of large number :star: 

Let $X_1, X_2, \cdots$ be a sequence of independent random variables that follow the same distribution. $h(x)$ is a continuous function and $E(|h(X)|)<+\infty$ , then to any $\epsilon>0$, we have:

$$
\lim_{n \to \infty}P\left(\left\vert \frac{1}{n}\sum_{i=1}^{n}h(X_i)-E(h(X_i))\right\vert \geq \epsilon\right)=0 
$$

Namely, we substitute $\mu$ with $E(h(X_i))$. 

???+ example
    Let $X_1, X_2, \cdots$ be a sequence of independent random variables that follow the same distribution. and $\operatorname{Var}(X_{i})=\sigma^{2}$, 
    
    let:

    $$
    S_{n}^{2}=\frac{1}{n-1}\sum_{i=1}^{n}\left(X_{i}-\overline{X}\right)^{2}
    $$

    then we have:

    $$
    S_n^{2}\xrightarrow{P}\sigma^{2}, \quad n \to \infty
    $$

    solution:

    $$
    S_{n}^{2}=\frac{1}{n-1}(\sum_{i=1}^{n}X_{i}^{2}-n\overline{X}^{2})
    $$

    use the corollary above, we have:

    $$
    \begin{aligned}
    \overline{X}^{2}\xrightarrow{P}\mu_{1}^{2},\quad n \to \infty\\
    \\
    \frac{1}{n}\sum_{i=1}^nX_i\xrightarrow{P}E(X_{i}^{2})=\mu_{2}\quad n \to  \infty\\
    \end{aligned}
    $$

    And we have:

    $$
    \operatorname{Var}(X_{i})=E(X_{i}^{2})-[E(X_{i})]^{2}=\mu_{2}-\mu_{1}^{2}
    $$

    therefore:

    $$
    \begin{aligned}
    S_{n}^{2}&=\frac{1}{n-1}(\sum_{i=1}^{n}X_{i}^{2}-n\overline{X}^{2})=\frac{n}{n-1}(\mu_{2}-\mu_{1}^{2})\\
    &\xrightarrow{P}\sigma^{2}, \quad n \to \infty\\
    \end{aligned}
    $$

>### Central Limit Theorem
>

:material-cube: Let $X_1, X_2, \cdots$ be a sequence of independent random variables with $E(X_i)=\mu$ and $Var(X_i)=\sigma^2$. Then for any real number $x$, we have:

$$
\lim_{n \to \infty}P\left(\frac{\sum_{i=1}^{n}X_i-n\mu}{\sigma\sqrt{n}}\leq x\right)=\Phi(x)
$$

where $\Phi(x)$ is the distribution function of the standard normal distribution.

The theorem indicates that the normalized variable of $\sum_{i=1}^{n}X_i$ which is $\frac{\sum_{i=1}^{n}X_i-n\mu}{\sigma\sqrt{n}}$ **approximately follows a standard normal distribution when $n$ is large enough.**

???+ example

    Let $X_1, X_2, \cdots$ be a sequence of independent random variables that follow Bernoulli distribution with parameter n,p.Namely $X_n \sim B(n,p)$. Then we have:

    $$
    \sum_{i=1}^{n}X_n \overset{近似地}{\sim } N(np,np(1-p)), \quad n \to \infty
    $$  
