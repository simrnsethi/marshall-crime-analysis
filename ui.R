# UI file for shiny

shinyUI(fluidPage(
  
  #Application title
  titlePanel(title = "Marshall crime data analysis", windowTitle = "UCR data parameters"),
  
  sidebarLayout(
    sidebarPanel(
      h4("Welcome, to the exploration of the Marshall dataset."), 
      "We will be exploring the crime rates in different cities across the US in this project.",
      hr(),
      sliderInput("year",
                  label = "Year Range",
                  min =  1975,
                  max = 2015,
                  step = 1,
                  value = c(1975,2015),
                  sep = ""),
      # uiOutput("typeSelectOutput"),
      radioButtons("parameter",
                   label = "which parameter to plot",
                   choices = paraToChoose,
                   selected = "homs_per_100k"),
      selectInput("city",
                  label = "City to compare:",
                  choices = unique(data$department_name),
                  selected = "Albuquerque, N.M.")
      # textInput("plotTitle",
      #           label = "Title of the plot:",
      #           value = "Comparison chart:")
    ),
    mainPanel(
      downloadButton("download", "Download results"),
      plotOutput("thePlot"),
      br(),
      br(),
      br(),
      br(),
      #tableOutput("results")
      DT::dataTableOutput("results")
    )
  )
))