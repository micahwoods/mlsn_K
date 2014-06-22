
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
                  value = 35
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
          href = "http://www.paceturf.org/journal/minimum_level_for_sustainable_nutrition"), 
  "You can participate in the development and refinement of new, more 
   sustainable soil nutrient guidelines for turfgrass, 
    by submitting samples from good-performing
   turfgrass at your location to the MLSN Project", a("Global Soil Survey.", 
    href = "http://www.paceturf.org/journal/global_soil_survey")
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
      a(href = "http://www.paceturf.org", 
        img(src = "pace.png", height = 130, width = 130)),
      a(href = "http://www.paceturf.org/journal/global_soil_survey", 
        img(src = "gss.png", height = 115, width = 115)),
      a(href = "http://www.asianturfgrass.com", 
        img(src = "atc.png", height = 85, width = 85))
    )
)
))

