# Server file for shiny


shinyServer(function(input,output) {
  # select cities to compare
  output$typeSelectOutput <- renderUI({
    selectInput("typeInput","Select City/(s):",
                sort(unique(data$city)),
                multiple = TRUE,
                selected = c("Albuquerque","Aurora","Baltimore"))
  })
  
  # creates a reactive data table
  data_reactive <- reactive({
    data_React <- data %>% filter(year >= input$year[1],
                                         year <= input$year[2])
    if(nrow(data_React)==0){
      return(NULL)
    }
    data_React
    })
  
  # creates a reactive city data wise data table
  city_reactive <- reactive({
    data_React <- data %>% filter(year >= input$year[1],
                                  year <= input$year[2]) %>% filter(city %in% input$typeInput)
    if(nrow(data_React)==0){
      return(NULL)
    }
    data_React 
  })
  
  # function to compute the city wise line plot
  output$thePlot <- renderPlot({
    plot <- ggplot(data_reactive()) + 
      xlab("year") + 
      ylab(paste0(input$parameter))
      
      
    
    if(input$parameter == "homs_per_100k"){plot = plot + aes(x = year,y = homs_per_100k) +
      geom_line(aes(group = city),alpha = 0.05) +
      geom_line(data = data_reactive() %>% filter(city %in% input$typeInput),
                mapping = aes(year,homs_per_100k,color = city)) + 
      ggtitle("Homicides per 100k Vs Year trend graph") + ylab("Homicides per 100k") + xlab("Year")}
    else if(input$parameter == "rape_per_100k"){plot = plot + aes(x = year,y = rape_per_100k) +
      geom_line(aes(group = city),alpha = 0.05) +
      geom_line(data = data_reactive() %>% filter(city %in% input$typeInput),
                mapping = aes(year,rape_per_100k,color = city)) +
      ggtitle("Rape per 100k Vs Year trend graph") + ylab("Rape per 100k") + xlab("Year")}
    else if(input$parameter == "violent_per_100k"){plot = plot + aes(x = year,y = violent_per_100k) +
      geom_line(aes(group = city),alpha = 0.05) +
      geom_line(data = data_reactive() %>% filter(city %in% input$typeInput),
                mapping = aes(year,violent_per_100k,color = city)) +
      ggtitle("Violent crimes per 100k Vs Year trend graph") + ylab("Violent crimes per 100k") + xlab("Year")}
    else if(input$parameter == "rob_per_100k"){plot = plot + aes(x = year,y = rob_per_100k) +
      geom_line(aes(group = city),alpha = 0.05) +
      geom_line(data = data_reactive() %>% filter(city %in% input$typeInput),
                mapping = aes(year,rob_per_100k,color = city)) +
      ggtitle("Robberies per 100k Vs Year trend graph")  + ylab("Robberies per 100k") + xlab("Year")}
    else {plot = plot + aes(x = year,y = agg_ass_per_100k) +
      geom_line(aes(group = city),alpha = 0.05) +
      geom_line(data = data_reactive() %>% filter(city %in% input$typeInput),
                mapping = aes(year,agg_ass_per_100k,color = city)) +
      ggtitle("Assaults per 100k Vs Year trend graph") + ylab("Assaults per 100k") + xlab("Year")}

    plot
  })
  
  # renders the resulting data table 
  output$results <- DT::renderDataTable(
    city_reactive(),
    options = list(scrollX = TRUE)
  )
  
  # a download option for downloading CSV
  output$download <- downloadHandler(
    filename = function() {
      "data.csv"
    },
    content = function(con) {
      write.csv(city_reactive(), con)
    }
  )
  
  # PLots the map of US
  output$plotusa <- renderPlotly({
    plot_data = data %>% filter(year == input$year[2]) %>% group_by(state) %>% 
      summarise(population = sum(total_pop,na.rm = T),rape = sum(rape_sum,na.rm = T),
                assaults = sum(agg_ass_sum,na.rm = T),robberies = sum(rob_sum,na.rm = T),
                homicides = sum(homs_sum,na.rm = T),violent_crimes = sum(violent_crime,na.rm = T))
    
    plot_data$click  = with(plot_data,paste(state,'<br>',
                                            "Population:",population,'<br>',
                                            "Rapes:",rape,'<br>',
                                            "Assaults",assaults,'<br>',
                                            "Robberies",robberies,'<br>',
                                            "Homicides",homicides,'<br>',
                                            "Violent Crimes",violent_crimes))
    
    g <- list(
      scope = 'usa',
      projection = list(type = 'albers usa'),
      lakecolor = toRGB('white')
    )
    plot_ly(z = plot_data$violent_crimes, 
            text = plot_data$click, 
            locations = plot_data$state,
            type = 'choropleth', 
            color = plot_data$violent_crimes,
            locationmode = 'USA-states') %>%
      layout(geo = g,title = paste0("Map of crimes in US in year: ",input$year[2]))
  })
  
  # text that will be rendered at the bottom of the plot.
  output$click <- renderPrint({
    d <- event_data("click")
    if (is.null(d)) "Click on a state to view event data" else d
  })
  
  
})
