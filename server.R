library(shiny)
library(caret)

myModel<-function(){
  mycars<-mtcars[,c("mpg","wt","am","hp")]
  test<-lm(mpg~factor(am)+hp+wt+wt*factor(am),data=mycars)
}



shinyServer(
  function(input,output){
    
    output$wt <- renderText({input$wt})
    output$hp <- renderText({input$hp})
    output$am <- renderText({input$am})
    
    observe({
      input$submitButton
      
      if(input$submitButton == 0){
        isolate({
          output$result <- renderText({"No prediction"})
          model<<-myModel()
        })
      }
      else {
        isolate({
          newData <- data.frame(am=ifelse(input$am=="Automatic",0,1), wt=input$wt, hp=input$hp)
          output$result <- renderText({predict(model,newData)})
        })
      }
    })    
    
  }
  )