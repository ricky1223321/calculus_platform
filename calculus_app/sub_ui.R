p1_ui = fluidPage(
  box(
    title = "Function & Plot",
    textInput("expression","expresssion input (only for x)"),
    numericInput("from1","from",-10),
    numericInput("to1","to",10),
    actionButton("set1","set")
  ),
  box(
    plotOutput("FunctionPlot")
  ),
  box(
    title = "Differentiation",
    textOutput("f2")
  ),
  box(
    textOutput("difFun")
  ),
  box(
    title = "Range",
    textOutput("f3"),
    numericInput("from2","from",-10),
    numericInput("to2","to",10),
    actionButton("set2","set")
  ),
  box(
    textOutput("integration")
  )
)
