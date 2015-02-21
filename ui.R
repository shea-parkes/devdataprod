library(shiny)

fluidPage(
  titlePanel('Exploring Splined Quantile Regression')
  ,sidebarLayout(
    sidebarPanel(
      sliderInput(
        'df'
        ,'Degrees of Freedom'
        ,min = 1
        ,max = 8
        ,value = 3
        ,step = 1
        ,round = TRUE
        ,ticks = FALSE
      )
      ,checkboxInput(
        'natural'
        ,label = 'Natural Spline'
        ,value = TRUE
      )
    )
    ,mainPanel(
      plotOutput('plot_midwest')
    )
  )
)
