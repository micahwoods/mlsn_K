
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
      sliderInput("soil",
                  "Soil test K (ppm):",
                  min = 0,
                  max = 200,
                  value = 37
                  ),
    
    br(),
    br(),
    sliderInput("nitrogen",
                "Annual N application (grams per square meter):",
                min = 0,
                max = 60,
                value = 20
                ),
    br(),
    br(),
   "These calculations are based on the minimum levels for 
    sustainable nutrition", a("(MLSN guidelines).", 
          href = "https://www.paceturf.org/index.php/journal/minimum_level_for_sustainable_nutrition"), 
  "For details about the MLSN Project, please download the ", a("MLSN Cheat Sheet.", 
    href = "http://files.asianturfgrass.com/mlsn_cheat_sheet.pdf")
    ),
 
    # For the main panel, show first the text description,
    # then a plot that renders according to the changing inputs
    mainPanel(
      textOutput("text1"),
      br(),
      "This is the amount required to keep the soil K
      at or above the MLSN guideline. A negative value
      means the soil has enough K to supply the grass with all the
      K it will use, while still remaining above the guideline.",
      plotOutput("plot1"),
      br(), 
      "This plot shows how the K fertilizer requirement will change with soil
      test K for a selected grass species and N rate.",
      br(), br(),
      a(href = "https://www.paceturf.org", 
        img(src = "pace.png", width = 300, height = 41)),
      a(href = "https://www.asianturfgrass.com", 
        img(src = "atc.png", height = 85, width = 85))
    )
)
))

