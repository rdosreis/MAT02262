## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', out.height='40%'----

knitr::include_graphics(here::here('imagens', 'piramide_etaria_pop.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='70%', out.height='70%', fig.cap='Exemplo de uma pirâmide etária com os dados do Censo de Angola, 2014.'----

knitr::include_graphics(here::here('imagens', 'piramide_angola.png'))



## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='60%', out.height='50%', fig.cap='População por sexo e idade (distribuição relativa): Exemplo de uma pirâmide etária com os dados do Censo de Macau, 2011.'----

knitr::include_graphics(here::here('imagens', 'piramide_macau.png'))



## ----eval=TRUE, echo=TRUE, message=FALSE, warning=FALSE-------
library(tidyverse)
library(sidrar)

# para RS
# https://apisidra.ibge.gov.br/values/t/6706/n3/50/v/606/p/all/c2/allxt/c58/all
piramide_RS <- get_sidra(x = 6706, 
                         variable = 606,
                         period = "last", # em 22abr2024 = 2022
                         geo = "State",
                         geo.filter = list("State" = 43)) %>%  # RS = 50
  filter(Sexo != "Total") %>% # retirei os que são do Total
  mutate(`Grupo de idade` = ifelse(`Grupo de idade` == "5 a 9 anos",
                                 "05 a 9 anos",
                                 `Grupo de idade`),
         Valor = ifelse(Sexo == "Mulheres",-Valor, Valor))



## ----eval=FALSE, echo=TRUE, message=FALSE, warning=FALSE, fig.align='center', out.width="90%"----
## 
## p <- ggplot(data = piramide_RS,
##             aes(y = Valor * 1000,
##                 x = `Grupo de idade`,
##                 fill = Sexo, color = I("white"))) +
##   geom_bar(stat = "identity", alpha = 0.4, width = 1) +
##   scale_fill_manual(values = c("Mulheres" = "red",
##                                "Homens" = "blue")) +
##   coord_flip() +
##   theme_bw() +
##   ggtitle("Pirâmide etária da população no RS, 2022") +
##   labs(y = "Número de pessoas",
##        caption = "Fonte: SIDRA/IBGE",
##        size = 8) +
##   scale_y_continuous(labels = abs) +
##   theme(legend.position = "bottom")
## p
## 


## ----eval=TRUE, echo=FALSE, message=FALSE, warning=FALSE, fig.align='center', out.width="90%"----

p <- ggplot(data = piramide_RS, 
            aes(y = Valor * 1000,
                x = `Grupo de idade`,
                fill = Sexo, color = I("white"))) +
  geom_bar(stat = "identity", alpha = 0.4, width = 1) +
  scale_fill_manual(values = c("Mulheres" = "red", 
                               "Homens" = "blue")) +
  coord_flip() +
  theme_bw() +
  ggtitle("Pirâmide etária da população no RS, 2022") +
  labs(y = "Número de pessoas",
       caption = "Fonte: SIDRA/IBGE", 
       size = 8) +
  scale_y_continuous(labels = abs) +
  theme(legend.position = "bottom")
p  



## ----eval=TRUE, echo=TRUE, message=FALSE, warning=FALSE-------

piramide_RS_todos <- get_sidra(x = 6706,
                               variable = 606,
                               period = "all", # em 22abr2024 = 2022
                               geo = "State",
                               geo.filter = list("State" = 43)) %>%  # RS = 50
  filter(Sexo != "Total") %>% # retirei os que são do Total
  mutate(`Grupo de idade` = ifelse(`Grupo de idade` == "5 a 9 anos",
                                   "05 a 9 anos",
                                   `Grupo de idade`),
         Valor = ifelse(Sexo == "Mulheres",-Valor, Valor))



## ----eval=FALSE, echo=TRUE, message=FALSE, warning=FALSE, fig.align='center', out.width="90%"----
## 
## p <- ggplot(data = piramide_RS_todos,
##             aes(y = Valor * 1000,
##                 x = `Grupo de idade`,
##                 fill = Sexo, color = I("white"))) +
##   geom_bar(stat = "identity", alpha = 0.4, width = 1) +
##   scale_fill_manual(values = c("Mulheres" = "red",
##                                "Homens" = "blue")) +
##   coord_flip() +
##   theme_bw() +
##   ggtitle("Pirâmide etária da população no RS, 2022") +
##   labs(y = "Número de pessoas",
##        caption = "Fonte: SIDRA/IBGE",
##        size = 8) +
##   scale_y_continuous(labels = abs) +
##   theme(legend.position = "bottom") +
##   facet_wrap(~Ano)
## p
## 


## ----eval=TRUE, echo=FALSE, message=FALSE, warning=FALSE, fig.align='center', out.width="90%"----

p <- ggplot(data = piramide_RS_todos, 
            aes(y = Valor * 1000,
                x = `Grupo de idade`,
                fill = Sexo, color = I("white"))) +
  geom_bar(stat = "identity", alpha = 0.4, width = 1) +
  scale_fill_manual(values = c("Mulheres" = "red", 
                               "Homens" = "blue")) +
  coord_flip() +
  theme_bw() +
  ggtitle("Pirâmide etária da população no RS, 2022") +
  labs(y = "Número de pessoas",
       caption = "Fonte: SIDRA/IBGE", 
       size = 8) +
  scale_y_continuous(labels = abs) +
  theme(legend.position = "bottom") +
  facet_wrap(~Ano)
p


