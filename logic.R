library(dplyr)
library(magrittr)
library(ggplot2)
library(scales)
library(RColorBrewer)
library(splines)
library(quantreg)
data(midwest)
str(midwest)

CreateDemoPlog <- function(df.spline = 4L, natural = TRUE) {
  
  plot.base <- midwest %>% 
    mutate(percbelowpoverty = percbelowpoverty / 100) %>%
    ggplot(
      aes(
        x = popdensity
        ,y = percbelowpoverty
      )
    ) +
    geom_point(alpha = 0.4) +
    scale_x_continuous(
      'Population Density'
      ,trans = log_trans()
      ,labels = comma_format()
      ,breaks = 10^(1:6)
    ) +
    scale_y_continuous(
      '% Below Poverty Line'
      ,trans = logit_trans()
      ,labels = percent_format()
      ,breaks = c(0.05,seq(0.1,0.9,0.1))
    ) +
    theme_light() +
    ggtitle('Midwest Demographics by County')
  
  if(natural == FALSE && df.spline < 3){return(plot.base)}
  
  plot.full <- plot.base +
    stat_quantile(
      quantiles = seq(0.1, 0.9, 0.2)
      ,formula = paste0('y ~ ',ifelse(natural, 'ns', 'bs'), '(x, ', df.spline, ')')
      ,aes(color = ..quantile..)
      ,lwd = 1
    ) +
    scale_color_gradientn(
      'Quantile'
      ,colours = tail(brewer.pal(9, 'YlOrRd'), 6)
      ,labels = percent_format()
    )
  
  return(plot.full)
  
}

## CreateDemoPlog()
