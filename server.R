
# This is the server file that renders the output


library(shiny)

shinyServer(function(input, output) {
  
  output$text1 <- renderText({ 
    
    kratio <- switch(input$select, 
                     "bentgrass" = 2,
                     "annual bluegrass" = 2,
                     "bent/poa mix" = 2,
                     "fine fescue" = 2,
                     "Kentucky bluegrass" = 2,
                     "perennial ryegrass" = 2,
                     "bermudagrass" = 1.5,
                     "zoysia" = 2,
                     "seashore paspalum" = 1)
    
    # fert requirement = Required - amount present
    # fert = guideline + plant harvest - soil test
    # plant harvest is annual N / kratio
    # convert all to g/m2 by the 6.7 factor
    fertilizer <- (35 / 6.7) + (input$nitrogen / kratio) - (input$soil / 6.7)
    
    paste("If you apply", input$nitrogen, "grams of N per square meter
          to", input$select, "in a soil with", input$soil, "ppm of K, the annual
          K fertilizer requirement is",
          round(fertilizer, 0), "grams of K per square meter.")
  })


})
