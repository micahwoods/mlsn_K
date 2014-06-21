
# This makes a Shiny app to calculate K requirement
# based on MLSN guidelines for turfgrass.

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("K requirement using the MLSN Guidelines"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
      selectInput("select", label = h5("Select grass species"), 
                  choices = c("bentgrass",
                                 "annual bluegrass",
                                 "bent/poa mix",
                                 "fine fescue",
                                 "Kentucky bluegrass",
                                 "perennial ryegrass",
                                 "bermudagrass",
                                 "zoysia",
                                 "seashore paspalum"),
                                 selected = "zoysia"          
      ),
    br(),
    br(),
      sliderInput("soil",
                  "Soil test K (ppm):",
                  min = 0,
                  max = 400,
                  value = 35
                  ),
    
    br(),
    br(),
    sliderInput("nitrogen",
                "Annual N application (grams per square meter):",
                min = 0,
                max = 75,
                value = 16
                )
    ),
 
    # Show a plot of the generated distribution
    mainPanel(
      textOutput("text1")
    )

)
))

