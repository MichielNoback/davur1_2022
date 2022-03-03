library(shiny)
ui <- fluidPage(
  plotOutput(outputId = "plot", click = "plot_click"),
  tableOutput(outputId = "data")
)
server <- function(input, output, session) {
  output$plot <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })
  
  output$data <- renderTable({
      print(input$plot_click)
      nearPoints(mtcars, input$plot_click, xvar = "wt", yvar = "mpg",
                 maxpoints = 5, threshold = 20)
  })
}
shinyApp(ui, server)