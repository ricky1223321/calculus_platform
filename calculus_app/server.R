library(shiny)
require(mosaic)
source("mgf.R")

shinyServer(function(input, output){
    observeEvent(input$set1,{
        
        output$FunctionPlot = renderPlot({
            mgf(input$expression, from=input$from1, to=input$to1)
        })
        output$difFun = renderPrint({
            dif(input$expression)
        })
        output$f2 = renderText({
            paste("Function :", input$expression)
        })
        output$f3 = renderText({
            paste("Function :", input$expression)
        })
        observeEvent(input$set2,{
            output$integration = renderText({
                integration(input$expression, input$from2, input$to2)
            })
        })
    })
})

