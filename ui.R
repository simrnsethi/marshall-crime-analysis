# UI file for shiny

shinyUI(dashboardPage( skin = "black",
  
  #Application title
  dashboardHeader(title = "Marshall crime data analysis",titleWidth = 400),
  
  dashboardSidebar(
    
      # h4("Welcome, to the exploration of the Marshall dataset."), 
      # "We will be exploring the crime rates in different cities across the US in this project.",
      # hr(),
      
      sidebarMenu(
        menuItem("Main",tabName = "main",icon = icon("dashboard")),
        menuItem("Info",tabName = "info",icon = icon("info-circle"))
      ),
      sliderInput("year",
                  label = "Year Range",
                  min =  1975,
                  max = 2015,
                  step = 1,
                  value = c(1975,2015),
                  sep = ""),
      uiOutput("typeSelectOutput"),
      radioButtons("parameter",
                   label = "Select Crime:",
                   choices = paraToChoose,
                   selected = "homs_per_100k")
      # selectInput("city",
      #             label = "City to compare:",
      #             choices = unique(data$department_name),
      #             selected = "Albuquerque, N.M.")
      # textInput("plotTitle",
      #           label = "Title of the plot:",
      #           value = "Comparison chart:")
    ),
  dashboardBody(
      plotOutput("thePlot"),
      br(),
      br(),
      br(),
      br(),
      downloadButton("download", "Download results"),
      br(),
      #tableOutput("results")
      DT::dataTableOutput("results"),
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
      )
    )
  )
)