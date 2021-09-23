library(shiny)
library(shinydashboard)
source("sub_ui.R")
dashboardPage(skin="blue",
              dashboardHeader(
                  title="微積分主題式教學"
              ),
              dashboardSidebar(
                  sidebarMenu(
                    menuItem("主題 : 導數",tabName = "chapter1",
                             menuItem("講義",tabName = "page1"),
                             menuItem("R程式", tabName="page2"),
                             menuItem("互動式R-Shiny數位教材",tabName = "page3"),
                             menuItem("習題練習", tabName="page4"),
                             menuItem("科普應用", tabName="page5"))
                  )
              ),
              dashboardBody(
                  tabItems(
                    tabItem(tabName = "page1", p1_ui),
                    tabItem(tabName = "page2", p2_ui),
                    tabItem(tabName = "page3", p3_ui),
                    tabItem(tabName = "page4", p4_ui),
                    tabItem(tabName = "page5", p5_ui)
                  )
              )
)
