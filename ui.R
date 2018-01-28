# UI file for shiny

shinyUI(dashboardPage( skin = "black",
  
  #Application title
  dashboardHeader(title = "Marshall crime data analysis",titleWidth = 400),
  
  dashboardSidebar(
      
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
    ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "main",
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
      ),
      tabItem(tabName = "info",
              includeMarkdown("info.md"),
              hr()
              )
          )
        )
    )
)