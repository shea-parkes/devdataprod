library(shiny)

fluidPage(
  titlePanel('Exploring Splined Quantile Regression')
  ,sidebarLayout(
    sidebarPanel(
      helpText(
        'This Shiny webapp allows you to explore splined regression.'
        ,'Splines expand simple regression to include non-linearities in a more responsible way than polynomial expansion.'
        ,'They do this in part by constraining the influence of each point to specific regions of the support.'
        ,'They still require a decision of how much non-linearity to allow; they often do this by specifying a degrees of freedom paramter.'
        ,'A sample splined regression is visualized to the right using midwest demographics information.'
        ,'You can alter the degrees of freedom permitted to the splined regression below.'
        )
      ,sliderInput(
        'df'
        ,'Degrees of Freedom'
        ,min = 1
        ,max = 8
        ,value = 3
        ,step = 1
        ,round = TRUE
        ,ticks = FALSE
      )
      ,helpText(
        'You can also choose whether to constrain the edges of the fit to be perfectly linear.'
        ,'A spline that is so constrained is often called "Natural" and generally produces a more pleasing fit.'
        ,'You can use the checkbox below to toggle this edge-linearity constraint.'
        ,'If you turn off the natural constraint it is no longer possible to use less than 3 degrees of freedom in the fit.'
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
