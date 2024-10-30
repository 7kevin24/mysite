>### The Law of Total Probability and Bayes' Theorem
>

:material-cards-diamond-outline: The law of total probability:

Let $B_1, B_2, \cdots, B_n$ be a partition of S such that $P(B_i) >0$ for all  $i$. Then for any events $A$ in sample space $S$,

$$
\displaystyle P(A)=\sum P(A\cap B_{n})
$$ 

or alternatively,

$$
\displaystyle P(A)=\sum P(A\mid B_{n})P(B_{n})
$$

:material-cards-diamond-outline: Bayes' theorem:<br>
**(Judging from the result, we try to find the probability of a cause)**<br>If $B_1, B_2, \cdots, B_n$ is a partition of $S$. Then for any event $A$ of the same sample space, if $P(A)\neq 0$ then we have:

$$
{\displaystyle P(B_{i}\mid A)={\frac {P(A\mid B_{i})P(B_{i})}{\sum _{j=1}^n P(A\mid B_{j})P(B_{j})}}} \quad i=1,2,3,\ldots
$$

??? example
    pass

>### Random Variable
>

:material-cube: Let $S$ be the sample space for an experiment. A real-valued, single-valued function that is defined on $S$ is called a `random variable`(abbreviated r.v.).<br>
`Random Variables` are usually denoted by capital letters $X, Y, Z, \cdots$ and their values are denoted by the corresponding small letters $x, y, z, \cdots$.
??? example
    Think about rolling a dice. Let sample space $S=\{1,2,3,4,5,6\}$. We define a random variable <br>$X$ = { the number of points on the upper face of the dice }.<br> 
    Then $X$ is a function from $S$ to $\mathbb{R}$, i.e., $X: S \rightarrow \mathbb{R}$.<br>

>### Distribution Function and Probability Density Function
>

Distribution function: <br>
:material-cube: Let $X$ be a random variable defined on a sample space $S$. The function $F(x)$ defined by 

$$
F(x)=P(X\leq x)
$$

 is called the `distribution function` of $X$.<br>
PS: for any real number $x_1, x_{2}(x_{1}<x_{2})$, we have 

$$
P(x_{1}<X\leq x_{2})=F(x_{2})-F(x_{1})
$$

**Intuitively, the distribution function $F(x)$ gives the probability that the value of random variable $X$ falls on $(-\infty,x)$ <br>**

Probability density function: <br>
:material-cube: Let $X$ be a Continuous random variableswith sample space $S$ and distribution function $F(x)$. The function $p(x)$ defined by a none negative function $p(x)$ such that

$$
F(x)=\int_{-\infty}^{x}p(t)dt
$$

is called the `probability density function` of $X$(abbreviated p.d.f).<br>

:material-bank-outline: It has the following properties:

1. $f(x)\ge 0$
2. $\int_{-\infty}^{\infty}f(x)dx=1$
3. For any real number $x_1, x_{2}(x_{1}<x_{2})$, we have
   $P(x_{1}<X\leq x_{2})=\int_{x_{1}}^{x_{2}}f(x)dx$
**Intuitively, the area enclosed by the curve of the function with the x-axis and the two vertical lines $x_1$ and $x_2$ is the probability that the value of random variable $X$ falls on $(x_1,x_2)$**<br>
For examples please check [commom distributions](common_distributions.md)

>### Joint distribution function and Marginal distribution function
>

Joint distribution function: <br>
:material-cube: Let $X$ and $Y$ be two random variables defined on a sample space $S$ and we treat $(X,Y)$ as the coordinate of a random point. The function $F(x,y)$ defined by

$$
F(x,y)=P(X\leq x, Y\leq y)
$$

is called the `joint distribution function` of $X$ and $Y$.<br>

**Intuitively, the joint distribution function $F(x,y)$ gives the probability that the value of random variable $X$ falls on $\{X<x,Y<y\}$**

Marginal distribution function: <br>
:material-cube: Let a bivariate random variable $(X,Y)$ have joint distribution function $F(x,y)$, the marginal distribution function of $X,Y$ are defined by

$$
\begin{aligned}
F_{X}(x)=P(X\leq x)=P(X\leq x,Y<\infty)=F(x,\infty)\\
F_{Y}(y)=P(Y\leq y)=P(X< \infty,Y\le y)=F(\infty,y)\\
\end{aligned}
$$

If $X,Y$ are continous random variables, then we have: <br>

$$
\begin{aligned}
F_{X}(x)=P(X\leq x)=P(X\leq x,Y<\infty)=\int_{-\infty}^{x}\left[ \int_{-\infty}^{\infty}f(x,y)dy\right]dx\\
F_{Y}(y)=P(Y\leq y)=P(X< \infty,Y\le y)=\int_{-\infty}^{\infty}\left[\int_{-\infty}^{y}f(x,y)dx\right]dy\\
\end{aligned}
$$

**From equation above and the definition of p.d.f, we get the marginal p.d.f of $X,Y$:**

$$
\begin{aligned}
f_{X}(x)=\int_{-\infty}^{\infty}f(x,y)dy\\
f_{Y}(y)=\int_{-\infty}^{\infty}f(x,y)dx\\
\end{aligned}
$$



**Conditional distribution function:** <br>
:material-cube: Let $(X,Y)$ be a bivariate continuous random variable, given any real number $x$ ,if $P\{x<X<x+\delta\}>0 \quad(\delta>0)$, for any real number $y$, the function $F_{Y\mid X}(y\mid x)$ defined by

$$
F_{Y\mid X}(y\mid x)=\lim_{\delta \to 0^{+}}P(Y\leq y\mid x<X<x+\delta)
$$

is called the `conditional distribution function` of $Y$ **given $X=x$.<br>**

???+ warning "Attention"
    **Usually, we use $P\{Y>y|X=x\}$ to denote $F_{Y\mid X}(y\mid x)$.** The probability here can't be calculated by the formula $P\{Y>y|X=x\}=\frac{P\{Y>y,X=x\}}{P\{X=x\}}$ because $P\{X=x\}=0$. The proper way to do so is to get the conditional distribution function $F_{Y\mid X}(y\mid x)$ first and we substitute $x$ with its value to get the probability.

??? example
    pass

>### Expectation
>

Expectation of a **discrete random** variable: <br>
:material-cube: Let $X$ be a discrete random variable with sample space $S$ and probability function $P(X=x_i)=p_i, i=1,2,\cdots$. The expectation of $X$ is defined by

$$
E(X)=\sum_{i=1}^{\infty}x_ip_i
$$

??? Note "Exception" 
    If the series $\sum_{i=1}^{\infty}x_ip_i$ is absolutely convergent, then $E(X)$ exists. Otherwise, **$E(X)$ may not exist.**
Expectation of a **continuous random** variable: <br>
Let $X$ be a continuous random variable with sample space $S$ and probability density function $f(x)$. The expectation of $X$ is defined by

$$
E(X)=\int_{-\infty}^{\infty}xf(x)dx
$$

??? Note "Exception" 
    If the integral $\int_{-\infty}^{\infty}\left\vert  x\right\vert f(x)dx$ is **finite**, then $E(X)$ exists. Otherwise, **$E(X)$ may not exist.**

:material-bank-outline: Some **properties** of expectation $E(X)$: <br>
- If we have n Variables $X_1,X_2,\cdots,X_n$ which are indepentent with each other, then we have
 
$$
E(\prod_{n=1}^{\infty} X_i)=\prod_{n=1}^{\infty}E(X_i)
$$

- If $X$ is a random variable and $a,b$ are two constants, then we have

$$
E(aX+b)=aE(X)+b
$$

- If $X$ and $Y$ are two random variables, then we have

$$
E(X+Y)=E(X)+E(Y)
$$

>### Variance
>

Variance of a **discrete random** variable: <br>

$$
\operatorname{Var}(X)=E\left[(X-E(X))^{2}\right]=\sum_{i=1}^{\infty}(x_i-E(X))^2p_i
$$

Varaince of a **continuous random** variable: <br>

$$
\operatorname{Var}(X)=E\left[(X-E(X))^{2}\right]=\int_{-\infty}^{\infty}(x-E(X))^2f(x)dx
$$

:material-bank-outline: Some **properties** of variance $\operatorname{Var}(X)$: <br>

- 

$$
\operatorname{Var}(cX)=c^{2}\operatorname{Var}(X)
$$

- 
 
$$
\operatorname{Var}(X)=E(X^2)-[E(X)]^2
$$

- The equal sign holds if and only if $X=c$.<br>

$$
\operatorname{Var}(X)\le E\left[ (x-c)^2 \right]$$

>### Covariance
>

:material-cube: Covariance of two random variables $X$ and $Y$ is defined by

$$
\operatorname{Cov}(X,Y)=E\left[(X-E(X))(Y-E(Y))\right]
$$

or equivalently(used for calcuation purpose),

$$
\operatorname{Cov}(X,Y)=E(XY)-E(X)E(Y)
$$

??? recall
    $\operatorname{Var}(X+Y)=\operatorname{Var}(X)+\operatorname{Var}(Y)-2E\left[(X-E(X))(Y-E(Y))\right]$

??? complement
    $$
    \operatorname{Cov}(x,y)=\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}\left( x-E(X)\right)\left( y-E(Y)\right)f(x,y)dxdy 
    $$

    We often use the definition above for proof purpose like some properties below.



:material-bank-outline: Some **properties** and **theorem** of covariance $\operatorname{Cov}(X,Y)$: <br>

- Covariance is Symmetric:

$$
\operatorname{Cov}(X,Y)=\operatorname{Cov}(Y,X)
$$

- For any positive integer $n(n\ge 2)$, let $X_1, X_2, \cdots, X_n$ be $n$ random variables whose variance exist, then $X_1, +X_2, \cdots, +X_n$  also has variance and we have:

$$
\operatorname{Var}\left(\sum_{i=1}^{n} X_i\right)=\sum_{i=1}^{n} \operatorname{Var}\left(X_i\right)+2 \sum_{i<j} \operatorname{Cov}\left(X_i, X_j\right)
$$

- Biliearity of Covariance:

$$
\operatorname{Cov}(aX+b,cY+d)=ac\operatorname{Cov}(X,Y)
$$

??? Generalization
    More generally, we have:

    $$
    \operatorname{Cov}\left(\sum_{i=1}^{n} a_i X_i, \sum_{j=1}^{m} b_j Y_j\right)=\sum_{i=1}^{n} \sum_{j=1}^{m} a_{i} b_{j} \operatorname{Cov}\left(X_{i}, Y_{j}\right)
    $$

    for example: we have $X_{1},X_{2},Y_{1},Y_{2}$ and $a_{1},a_{2}.b_{1},b_{2}$ corresponding to them. Then we have:

    $$
    \operatorname{Cov}\left(a_{1} X_{1}+a_{2} X_{2}, b_{1} Y_{1}+b_{2} Y_{2}\right)=a_{1} b_{1} \operatorname{Cov}\left(X_{1}, Y_{1}\right)+a_{1} b_{2} \operatorname{Cov}\left(X_{1}, Y_{2}\right)+a_{2} b_{1} \operatorname{Cov}\left(X_{2}, Y_{1}\right)+a_{2} b_{2} \operatorname{Cov}\left(X_{2}, Y_{2}\right)
    $$

- Addition rule :

$$
\operatorname{Cov}(X+Y,Z)=\operatorname{Cov}(X,Z)+\operatorname{Cov}(Y,Z)
$$

>### Correlation Coefficient
>

:material-cube: Correlation Coefficient $\rho_{XY}$ is defined by

$$
\rho_{XY}=\frac{\operatorname{Cov}(X,Y)}{\sqrt{\operatorname{Var}(X)\operatorname{Var}(Y)}}
$$

???+ practice
    Let $X^*=\frac{X-E(X)}{\sqrt {\operatorname{Var}(X)}}$, $Y^*=\frac{Y-E(Y)}{\sqrt {\operatorname{Var}(Y)}}$
    
    use the properties above to prove:

    $$
    \rho_{XY}=\operatorname{Cov}(X^*,Y^*)
    $$

    prove:

    $$
    \begin{aligned}
    \operatorname{Cov}(X^*,Y^*)
    &=\operatorname{Cov}\left(\frac{X-E(X)}{\sqrt {\operatorname{Var}(X)}},\frac{Y-E(Y)}{\sqrt {\operatorname{Var}(Y)}}\right)\\
    &=\frac{1}{\sqrt {\operatorname{Var}(X)\operatorname{Var}(Y)}}\operatorname{Cov}(X-E(X),Y-E(Y))\\
    &=\frac{1}{\sqrt {\operatorname{Var}(X)\operatorname{Var}(Y)}}\operatorname{Cov}(X,Y)\\
    \end{aligned}
    $$

>### Uncorrelated
>

:material-cube: Two random variables $X$ and $Y$ are said to be `uncorrelated` if $\rho_{XY}=0$.<br>

It is equivalent to say :

- $\operatorname{Cov}(X,Y)=0$
- $E(XY)=E(X)E(Y)$
- $Var(X+Y)=Var(X)+Var(Y)$

???+ warning "Attention"
    **Uncorrelated does not imply independence.** In fact, if $X$ and $Y$ are independent, then they are uncorrelated. But the converse is not true. Namely:

    $$
    \operatorname{Cov}(X,Y)=0 \nRightarrow X \text { and } Y \text { are independent }
    $$

    $$
    X \text { and } Y \text { are independent } \Rightarrow \operatorname{Cov}(X,Y)=0
    $$

??? example
    Let bianry random variable $X$ and $Y$ follow a **uniform** distribution within the region

    $$
    D={(X,Y):x^{2}+y^{2}\le r^{2}(r>0)}
    $$

    Try to 
    
    1. calculate $\operatorname{Cov}(X,Y)$ 
    2. determine whether $X$ and $Y$ are independent, 
    3. and whether they are uncorrelated.

    solution:

    The joint p.d.f of $X$ and $Y$ is:

    $$
    f(x,y)=
    \begin{cases} 
    \frac{1}{\pi r^{2}} \quad & x^{2}+y^{2} \leq r^{2} \\ 
    0&  \text{otherwise}\end{cases}\
    $$   

    So we have:

    $$
    \begin{aligned}
    E(X)&=\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}xf(x,y)dxdy=0\\
    E(Y)&=\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}yf(x,y)dxdy=0\\
    E(XY)&=\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}xyf(x,y)dxdy\\
    &=\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}xy\frac{1}{\pi r^{2}}dxdy\\ 
    &=0\\
    \end{aligned}
    $$

    So we have:

    $$
    \operatorname{Cov}(X,Y)=E(XY)-E(X)E(Y)=0
    $$

    So $X$ and $Y$ are uncorrelated. But they are not independent. 

    Then we try to calculate the marginal p.d.f of $X$ and $Y$:

    $$
    \begin{aligned}
    f_{X}(x)&=\int_{-\infty}^{\infty}f(x,y)dy
    =\int_{-\sqrt{r^{2}-x^{2}}}^{\sqrt{r^{2}-x^{2}}}\frac{1}{\pi r^{2}}dy
    =\frac{2}{\pi r^{2}}\sqrt{r^{2}-x^{2}}\\
    \\
    f_{Y}(y)&=\int_{-\infty}^{\infty}f(x,y)dx=\frac{2}{\pi r^{2}}\sqrt{r^{2}-y^{2}}\\
    \end{aligned}
    $$

    So we have:

    $$
    f_{X}(x)f_{Y}(y)=\frac{4}{\pi^{2}r^{4}}(r^{2}-x^{2})(r^{2}-y^{2})\neq f(x,y)
    $$

    So $X$ and $Y$ are not **independent** even though they are **uncorrelated**.

 
Essentially, the correlation coefficient $\rho_{XY}$ measures the **linear** relationship between $X$ and $Y$. If $\rho_{XY}=0$, then $X$ and $Y$ are not **linearly related**. But they may be related in a **nonlinear way.**


>### Convergence in probability
>

:material-cube: Let $X_1, X_2, \cdots$ be a sequence of random variables defined on a sample space $S$. Let $X$ be a random variable defined on the same sample space $S$. We say that $X_n$ converges to $X$ in probability if for any $\epsilon>0$, we have

$$
\lim_{n \to \infty}P\left(\left\vert X_{n}-X\right\vert \geq \epsilon\right)=0
$$

We write $X_n \xrightarrow{P} X$ ,$n \to \infty$.

??? example
    Here is a simple example to illustrate the concept of convergence in probability. Let $X_1, X_2, \cdots$ be a sequence of random variables which follow a **uniform** distribution on the interval $[0,1]$. Let $X$ be a random variable which follows a **uniform** distribution on the interval $[0,1]$. Then we have:

>Markov's inequality
>

:material-cards-diamond-outline: Let $X$ be a random variable with $E[X^k]$ exists. Then for any positive number $\epsilon$(don't have to be a small number, can be any like 100 or 150), we have:

$$
P\left(\left\vert X\right\vert \geq \epsilon\right) \leq \frac{E\left[\left\vert X\right\vert ^{k}\right]}{\epsilon^{k}}
$$

or

$$
P\left(\left\vert X\right\vert \leq \epsilon\right) \geq 1- \frac{E\left[\left\vert X\right\vert ^{k}\right]}{\epsilon^{k}}
$$

To memorize the inequality, we can associate it with the cute emoji composed of the inequality signs and $\epsilon$ 

$$
\geq \epsilon \leq
$$

??? example
    The number of traffic accidents in a city in a year is a random variable $X$ with $E[X]=1000$. Use Markov's inequality to estimate the probability that the number of traffic accidents in the city in a year is at least 1500.

    solution:

    $$  
    P\left(X \geq 1500\right) \leq \frac{E\left[X\right]}{1500}=\frac{1000}{1500}=\frac{2}{3}
    $$

> Chebyshev's inequality
>

:material-cards-diamond-outline: Let $X$ be a random variable with variance and expection exist, we mark $E(X)=\mu$ and $Var(X)=\sigma^2$. Then for any positive number $\epsilon>0$, we have:

$$
P\left(\left\vert X-\mu\right\vert \geq \epsilon\right) \leq \frac{\sigma^{2}}{\epsilon^{2}}
$$

or

$$
P\left(\left\vert X-\mu\right\vert \leq \epsilon\right) \geq 1- \frac{\sigma^{2}}{\epsilon^{2}}
$$

Look at the inequality above, we can see that the probability of $X$ falling into the interval $[\mu-\epsilon,\mu+\epsilon]$ is at least $1-\frac{\sigma^{2}}{\epsilon^{2}}$. 

**The reason why Chebyshev's inequality is important is that once we know the variance and expectation of a random variable, no matter what distribution it follows, we can use Chebyshev's inequality to estimate the probability that the random variable falls into a certain interval.**

We can also use that cute emoji to help memorize:

$$
\ge \epsilon \le
$$
