
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("K requirement using the MLSN Guidelines"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
      selectInput("select", label = h5("Select grass species"), 
                  choices = list("bentgrass",
                                 "annual bluegrass",
                                 "bent/poa mix",
                                 "fine fescue",
                                 "Kentucky bluegrass",
                                 "perennial ryegrass",
                                 "bermudagrass",
                                 "zoysia",
                                 "seashore paspalum"
                                 )
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
      plotOutput("distPlot")
    )

)
))
