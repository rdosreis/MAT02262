## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='80%'----

knitr::include_graphics(here::here('imagens', 'mortalidade_rs_02.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='80%'----

knitr::include_graphics(here::here('imagens', 'mortalidade_rs_01.png'))



## ----echo=FALSE, eval=TRUE, message=FALSE, warning=FALSE, fig.align='center', out.width='90%'----

TBM_RS <- c(
6.540582837,
6.545468494,
6.641319697,
6.607756317,
6.671693126,
6.715335931,
6.891416998,
6.999286608,
7.021750179,
7.332619804,
7.328984601,
7.584481655,
7.495873161,
7.816884774,
7.932452601,
8.62228533,
8.801681228,
10.33177169,
10.54503164,
17.49404468,
18.29127942
)

df <- data.frame(Ano = 2000:2020, TBM_RS)

library(ggplot2)

p <- ggplot(data = df, mapping = aes(x = Ano, y = TBM_RS)) +
  geom_line(color = I("red"), size = 2) +
  geom_point() +
  scale_x_continuous(breaks = seq(2000, 2020, by = 2)) +
  scale_y_continuous(breaks = seq(6, 18, by = 2)) +
  labs(y = "Taxa Bruta de Mortalidade (por mil habitantes)", title = "Estado do Rio Grande do Sul - 2000-2020", caption = "Fonte: IBGE e SIM.") +
  theme_bw()
p



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='65%', out.height="80%"----

knitr::include_graphics(here::here('imagens', 'mortalidade02.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='65%', out.height="80%"----

knitr::include_graphics(here::here('imagens', 'mortalidade03.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='90%', out.height='85%'----

knitr::include_graphics(here::here('imagens', 'mortalidade04.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='50%', out.height='50%'----

knitr::include_graphics(here::here('imagens', 'Statistically-Insignificant-final02.jpg'))


