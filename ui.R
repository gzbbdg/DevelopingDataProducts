library(shiny)

shinyUI(fixedPage(
  title = "Calculator",
  titlePanel(div("Calculate miles/gallon for your car", style = "text-align:center")),
  
  div(style = "margin: 0 auto; width: 100%;",
  mainPanel(width = 12,
    tabsetPanel(
      tabPanel("Application", 
                 fixedRow(
                   column(6,
                          radioButtons("am", label = h3("Select transmission"),
                                       choices = list("Automatic" = "Automatic", "Manual" = "Manual"), selected = "Automatic"),
                          sliderInput("hp", label = h3("Select gross horsepower"),
                                      min = 52, max = 335, value = 10),
                          sliderInput("wt", label = h3("Select weight (lb/1000)"),
                                      min = 1.5, max = 5.4, value = 0.1),
                          actionButton('submitButton','Check')     
                     ),
                     column(6,
                            
                            fixedRow(
                             h3("Summary:"),
                             h5("Transmission:"),
                             verbatimTextOutput('am'),
                             h5("Gross horsepower:"),
                             verbatimTextOutput('hp'),
                             h5("Weight"),
                             verbatimTextOutput('wt')
                             
                             ),
                            
                            fixedRow(
                              h3("Result:"),
                              verbatimTextOutput('result')
                            )
                            
                            
                     )
                   )

               
      ),
      tabPanel("Documentation", includeHTML("documentation.html"))
    )
  )
  )
  
#   fixedRow(
#     column(5,
#            radioButtons("am", label = h3("Select transmission"),
#                         choices = list("Automatic" = "Automatic", "Manual" = "Manual"), selected = "Automatic"),
#            sliderInput("hp", label = h3("Select gross horsepower"),
#                        min = 52, max = 335, value = 10),
#            sliderInput("wt", label = h3("Select weight (lb/1000)"),
#                        min = 1.5, max = 5.4, value = 0.1),
#            actionButton('submitButton','Check')     
#       ),
#       column(5,
#              
#              fixedRow(
#               h3("Summary:"),
#               h5("Transmission:"),
#               verbatimTextOutput('am'),
#               h5("Gross horsepower:"),
#               verbatimTextOutput('hp'),
#               h5("Weight"),
#               verbatimTextOutput('wt')
#               
#               ),
#              
#              fixedRow(
#                h3("Result:"),
#                verbatimTextOutput('result')
#              ),
#              
#              
#       )
#     )
  
  ))