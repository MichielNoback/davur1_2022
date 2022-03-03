library(shiny)
ui <- fluidPage(
  titlePanel("Faithful waiting time"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId =  "bins", 
                   label = "Number of bins:", 
                   value = 10, 
                   min = 1, max = 100)
    ),
    mainPanel(
      plotOutput(outputId = "hist")
    )
  )
)
server <- function(input, output, session) {
  output$hist <- renderPlot({
      #req(input$bins)
      hist(faithful$waiting, 
           breaks = input$bins,
           main = "Faithful waiting times",
           xlab = "Waiting (s)")
  })
}
shinyApp(ui, server)