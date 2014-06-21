
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  output$text1 <- renderText({ 
    paste("The K requirement to ensure soil K remains at or above the MLSN
          guideline of 35 ppm, if you apply", input$nitrogen, "grams of N
          to", input$select, "in a soil with", input$soil, "ppm of K is")
  })


})
