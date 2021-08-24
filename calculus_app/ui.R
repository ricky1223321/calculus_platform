library(shiny)
library(shinydashboard)
source("sub_ui.R")
dashboardPage(skin="blue",
              dashboardHeader(
                  title="微積分主題式教學"
              ),
              dashboardSidebar(
                  sidebarMenu(
                      menuItem("Function & Plot", tabName="page1")
                  )
              ),
              dashboardBody(
                  tabItems(
                      tabItem(tabName = "page1", p1_ui)
                  )
              )
)
