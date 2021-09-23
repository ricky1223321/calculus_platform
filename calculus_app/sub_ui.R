p1_ui = fluidPage(
  tabBox(
    title="textBook",
    width = 12,
    height = 1200,
    tabPanel(title="Ch3.1",uiOutput("tb1")),
    tabPanel(title="Ch3.2",uiOutput("tb2")),
    tabPanel(title="Ch3.3",uiOutput("tb3")),
    tabPanel(title="Ch3.6",uiOutput("tb4"))
  )
)

p2_ui = fluidPage(
  uiOutput("code"),
  uiOutput("html")
)

p3_ui = fluidPage(
  fluidRow(
    box(
      title = "Function & Plot",
      textInput("expression","expresssion input (only for x)"),
      numericInput("from1","from",-10),
      numericInput("to1","to",10),
      actionButton("set1","set")
    ),
    box(
      plotOutput("FunctionPlot")
    )
  ),
  fluidRow(
    box(
      title = "First Derivative",
      textOutput("difFun1a"),
      numericInput("from2","from",-10),
      numericInput("to2","to",10),
      actionButton("set2","set")
    ),
    box(
      textOutput("difFun1"),
      plotOutput("difplot1")
    )
  ),
   fluidRow(
     box(
       title = "Second Derivative",
       textOutput("difFun2a"),
       numericInput("from3","from",-10),
       numericInput("to3","to",10),
       actionButton("set3","set")
     ),
     box(
       textOutput("difFun2"),
       plotOutput("difplot2")
     )
   )
)

p4_ui = fluidPage(
  fluidRow(
    box(
      width = 12,
      textOutput("example1_question"),
    )
  ),
  fluidRow(
    box(
      width = 12,
      br(),
      textOutput("QFun"),
      br(),
      plotOutput("Qplot")
    )
  ),
  fluidRow(
    column(
      width = 6,
      box(
        width = 500,
        textOutput("velocity"),
        actionButton("Vset","Solution")
      )
    ),
    column(
      width = 6,
      box(
        width = 500,
        textOutput("acceleration"),
        actionButton("Aset","Solution")
      )
    )
  ),
  fluidRow(
    column(
      width = 6,
      box(
        width = 500,
        textOutput("velocityFun"),
        plotOutput("Vplot")
      )
    ),
    column(
      width = 6,
      box(
        width = 500,
        textOutput("accelerationFun"),
        plotOutput("Aplot")
      )
    )
  )
)

p5_ui=fluidPage(
  fluidRow(
    box(
      width = 6,
      title = "1",
      status = "primary",
      solidHeader = TRUE,
      tags$h3(textOutput("moontitle")),
      br(),
      tags$h4(textOutput("moontxt1")),
      br(),
      tags$h4(uiOutput("moon")),
      br()
    ),
    box(
      width = 6,
      title = "2",
      status = "success",
      solidHeader = TRUE,
      tags$h4(textOutput("moontxt2")),
      br(),
      uiOutput("moonFun")
    )
  ),
  fluidRow(
    box(
      width = 6,
      title = "3",
      status = "warning",
      solidHeader = TRUE,
      textInput("mInput","Function Input",value = "tan(x)"),
      tags$h4(textOutput("MFun")),
      plotOutput("Mplot")
    ),
    box(
      width = 6,
      title = "4",
      status = "danger",
      solidHeader = TRUE,
      tags$h4(textOutput("conclusion1")),
      br(),
      uiOutput("conFUn"),
      tags$h4(textOutput("conclusion2")),
      br()
    )
  )
)

