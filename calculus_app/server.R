library(shiny)
require(mosaic)
source("mgf.R")

shinyServer(function(input, output, session){
    #p1
    output$tb1 <- renderUI({
        tags$iframe(width = "100%", height = "1000", src='3.1 Graphing using the first derivative.pdf')
    })
    output$tb2 <- renderUI({
        tags$iframe(width = "100%", height = "1000", src='3.2 Graphing using the first and second derivatives.pdf')
    })
    output$tb3 <- renderUI({
        tags$iframe(width = "100%", height = "1000", src='3.3 Optimization.pdf')
    })
    output$tb4 <- renderUI({
        tags$iframe(width = "100%", height = "1000", src='3.6 Implicit differentiation and related rates.pdf')
    })
    #p2
    output$code <- renderUI({
        tags$iframe(width = "100%", height = "600", src='程式介紹.pdf')
    })
    output$html = renderUI({
        tags$iframe(width="100%", height="600", src='0815.html',seamless=TRUE)
    })
    #p3
    observeEvent(input$set1,{
        output$FunctionPlot = renderPlot({
            mgf(input$expression, from=input$from1, to=input$to1)
        })
        observeEvent(input$set2,{
            output$difFun1 = renderPrint({
                dif(input$expression)
            })
            output$difFun1a = renderPrint({
                dif(input$expression)
            })
            output$difplot1 = renderPlot({
                mgf(deparse(dif(input$expression)), from=input$from2, to=input$to2)
             })
             observeEvent(input$set3,{
                 output$difFun2 = renderPrint({
                     ddif(input$expression)
                 })
                 output$difFun2a = renderPrint({
                     ddif(input$expression)
                 })
                 output$difplot2 = renderPlot({
                     mgf(deparse(ddif(input$expression)), from=input$from3, to=input$to3)
                  })
             })
        })
    })
    #p4
    #改成215 APPLIED EXAMPLE 4
    output$example1_question = renderText({"(1) The distance s(in feet) covered by a maglev moving along a straight track t seconds after starting from rest is given by the function s=4*x^2(0<=x<=10). What is the maglev's acceleration at any time x?"})
    output$velocity = renderText({"(a) The velocity of the maglev x seconds from rest is given by"})
    output$acceleration = renderText({"(b) The acceleration of the maglev x seconds from rest is given by the rate of change of the velocity of x"})
    output$QFun = renderText({"s = 4*x^2 (0<=x<=10)"})
    output$Qplot = renderPlot({
        mgf("4*x^3", from=0, to=10)
    })
    observeEvent(input$Vset,{
        output$velocityFun = renderText({
            "12*x^2"
        })
        output$Vplot = renderPlot({
            mgf("12*x^2", from=0, to=10)
        })
    })

    observeEvent(input$Aset,{
        output$accelerationFun = renderText({
            "24*x"
        })
        output$Aplot = renderPlot({
            mgf("24*x", from=0, to=10)
        })
    })


    #p5
    output$moontitle = renderText({
        "為什麼月亮的位置總是不動呢?"
    })
    output$moontxt1 = renderText({
        "每到中秋節時，總能看見一顆大大的月亮掛在天空上，但奇怪的是，無論走到哪裡，月亮總是在同樣的位置一動也不動，到底是為什麼呢?"
    })
    output$moon <- renderUI({
        tags$iframe(width = "400", height = "260", src='月亮.png')
    })
    output$moontxt2 = renderText({
        "V*delta t 為月亮移動的距離，d為觀察者和月亮的距離，theta為我的視野中月亮的角度"
    })
    output$moonFun = renderUI({
        tags$iframe(width = "570", height = "550", src='function.png')
    })
    output$MFun = renderPrint({
        dif(input$mInput)
    })
    output$Mplot = renderPlot({
        mgf(input$mInput, from=0, to=10)
    })
    output$conclusion1 = renderText({
        "由此可知tan(theata)的一階導數為1/cos(x)^2，經由整理後可得以下式子:"
    })
    output$conFUn = renderUI({
        tags$iframe(width = "400", height = "350", src='conclusion.png')
    })
    output$conclusion2 = renderText({
        "當觀察者和月亮的距離越遠，在觀察者的視野中月亮的角速度就會越來越小，而月亮和地球的距離足夠大到讓叫速度趨近於0，及無論觀察者走到哪，月亮好像都在同一個位置移動也不動"
    })
})

