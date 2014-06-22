
# This makes a Shiny app to calculate K requirement
# based on MLSN guidelines for turfgrass.

library(shiny)

# this outlines and creates the user interface and input options

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
                                 selected = "bentgrass"          
      ),
    br(),
    br(),
    br(),
      sliderInput("soil",
                  "Soil test K (ppm):",
                  min = 0,
                  max = 200,
                  value = 35
                  ),
    
    br(),
    br(),
    br(),
    sliderInput("nitrogen",
                "Annual N application (grams per square meter):",
                min = 0,
                max = 60,
                value = 20
                )
    ),
 
    # For the main panel, show first the text description,
    # then a plot that renders according to the changing inputs
    mainPanel(
      textOutput("text1"),
      plotOutput("plot1")
    )

)
))

