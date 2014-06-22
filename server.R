# This is the server file that renders the output

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  # this will generate an updated text fertilizer recommendation
  
  output$text1 <- renderText({ 
    
    # kratio is my estimate of typical leaf N:K ratio, which puts 
    # an upper bound on the amount of K the grass can use, based
    # on the assumption that the grass won't use more N than is 
    # applied as fertilizer
    
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
    # note, added 1 g to fert requirement to be sure not to
    # underestimate due to rounding effects
    # plant harvest is annual N / kratio
    # convert all to g/m2 by the 6.7 factor based on 10 cm
    # deep rootzone with bulk density of 1.5
    
    fertilizer <- (35 / 6.7) + (input$nitrogen / kratio) - (input$soil / 6.7) + 1
    
    paste("If you apply", input$nitrogen, "grams of N per square meter
          to", input$select, "in a soil with", input$soil, "ppm of K, the annual
          K fertilizer requirement is",
          round(fertilizer, 0), "grams of K per square meter.")
          
  })
  
  output$plot1 <- renderPlot({
    
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
    
    
    
    fert <- (35 / 6.7) + (input$nitrogen / kratio) - (0:200 / 6.7) + 1
    plotdata <- as.data.frame(cbind(0:200, fert, input$soil, input$nitrogen / kratio))
    colnames(plotdata) <- c("soilk", "fert", "test", "nitrogen")
    
    ggplot(data = plotdata, aes(x = soilk, y = fert)) +
      geom_line() + 
      geom_abline(intercept = 0, slope = 0, colour = "blue") +
      geom_point(aes(x = test, y = ((35 / 6.7) + (nitrogen) - (test / 6.7) + 1)),
                 size = 5, color = "Dark Green") +
      labs(x = "Soil Test K", 
           y = expression(paste('K fertilizer requirement ' (g/m^{2})))) +
      theme_minimal(base_size = 18)
    
  })


})
