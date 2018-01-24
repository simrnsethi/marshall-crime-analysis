# Server file for shiny

library(dplyr)
library(tidyverse)
shinyServer(function(input,output) {
  # output$typeSelectOutput <- renderUI({
  #   selectInput("typeInput","City to compare:",
  #               sort(unique(data$department_name)),
  #               multiple = FALSE,
  #               selected = c("Albuquerque, N.M."))
  # })
  
  data_reactive <- reactive({
    data_React <- data %>% filter(year >= input$year[1],
                                         year <= input$year[2])
    if(nrow(data_React)==0){
      return(NULL)
    }
    data_React
    })
  
  city_reactive <- reactive({
    data_React <- data %>% filter(year >= input$year[1],
                                  year <= input$year[2]) %>% filter(department_name %in% input$city)
    if(nrow(data_React)==0){
      return(NULL)
    }
    data_React
  })
  
  output$thePlot <- renderPlot({
    # plot <- ggplot(gapminder_reactive()) +
    #   aes(x = gdpPercap,y = lifeExp,colour = continent,frame = year,cumulative=TRUE) +
    #   geom_path() +
    #   scale_x_log10(labels = scales::dollar_format()) +
    #   ggtitle(input$plotTitle) +
    #   xlab("GDP-per capita") +
    #   ylab("Life expectancy") +
    #   facet_wrap(~country)
    # jj = data_reactive()$homs_per_100k
    plot <- ggplot(data_reactive()) + 
      xlab("year") + 
      ylab(paste0(input$parameter)) +
      scale_color_manual(name = "",values = c("red"),labels = c(paste0(input$city)))
      
      
    
    if(input$parameter == "homs_per_100k"){plot = plot + aes(x = year,y = homs_per_100k) +
      geom_line(aes(group = department_name),alpha = 0.1) +
      geom_line(data = data_reactive() %>% filter(department_name == input$city),
                mapping = aes(year,homs_per_100k,color = "red")) + 
      ggtitle("Homicides per 100k Vs Year trend graph")}
    else if(input$parameter == "rape_per_100k"){plot = plot + aes(x = year,y = rape_per_100k) +
      geom_line(aes(group = department_name),alpha = 0.1) +
      geom_line(data = data_reactive() %>% filter(department_name == input$city),
                mapping = aes(year,rape_per_100k,color = "red")) +
      ggtitle("Rape per 100k Vs Year trend graph")}
    else if(input$parameter == "violent_per_100k"){plot = plot + aes(x = year,y = violent_per_100k) +
      geom_line(aes(group = department_name),alpha = 0.1) +
      geom_line(data = data_reactive() %>% filter(department_name == input$city),
                mapping = aes(year,violent_per_100k,color = "red")) +
      ggtitle("Violent crimes per 100k Vs Year trend graph")}
    else if(input$parameter == "rob_per_100k"){plot = plot + aes(x = year,y = rob_per_100k) +
      geom_line(aes(group = department_name),alpha = 0.1) +
      geom_line(data = data_reactive() %>% filter(department_name == input$city),
                mapping = aes(year,rob_per_100k,color = "red")) +
      ggtitle("Robberies per 100k Vs Year trend graph")}
    else {plot = plot + aes(x = year,y = agg_ass_per_100k) +
      geom_line(aes(group = department_name),alpha = 0.1) +
      geom_line(data = data_reactive() %>% filter(department_name == input$city),
                mapping = aes(year,agg_ass_per_100k,color = "red")) +
      ggtitle("Assaults per 100k Vs Year trend graph")}

    plot
  })
  
  output$results <- DT::renderDataTable({
    city_reactive()
  })
  
  output$download <- downloadHandler(
    filename = function() {
      "data.csv"
    },
    content = function(con) {
      write.csv(city_reactive(), con)
    }
  )
  
  
})
