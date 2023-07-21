#Importing shiny and shinydashoboard
library(shiny)
library(shinydashboard)
#Creating a shiny user interface
shinyUI(dashboardPage(
  dashboardHeader(title = "My Dashboard Header"),
  dashboardSidebar(sidebarMenu(
    menuItem("Test", tabName = "Test"),
    menuItem("Assignmnent", tabName = "Assignment"),
    menuItem("MidSemester", tabName = "MidSemester"),
    menuItem("ALL-Marks", tabName = "ALL-Marks")
  )),
  dashboardBody(
    tabItems(
      tabItem(tabName = "Test",
              fluidRow(
                valueBoxOutput("value1"),
                valueBoxOutput("value2"),
                valueBoxOutput("value3")
              ),
              fluidRow(
                box(title = "Histogram of Test Marks", solidHeader = TRUE,collapsible = TRUE,status = "primary", plotOutput("Histogram1")),
                box(title = "Box Plot of Test Marks", solidHeader = TRUE, collapsible = TRUE, status = "primary", plotOutput("Boxplot1")),
                box(title = "Students with less than 50%", solidHeader = TRUE, collapsible = TRUE, status = "primary", tableOutput("table1")),
                box(title = "Students with at least 80%", solidHeader = TRUE, collapsible = TRUE, status = "primary", tableOutput("table3"))
              )),
      tabItem(tabName = "Assignment",
              fluidRow(
                valueBoxOutput("value4"),
                valueBoxOutput("value5"),
                valueBoxOutput("value6")
              ),
              fluidRow(
                box(title = "Histogram of Assignment Marks", solidHeader = TRUE, collapsible = TRUE, status = "primary", plotOutput("Histogram2")),
                box(title = "Box Plot of Assignment Marks", solidHeader = TRUE, collapsible = TRUE, status = "primary", plotOutput("Boxplot2")),
                box(title = "Students with less than 50%", solidHeader = TRUE, collapsible = TRUE, status = "primary", tableOutput("table5")),
                box(title = "Students with at least 80%", solidHeader = TRUE, collapsible = TRUE,status = "primary", tableOutput("table6"))
              )),
      tabItem(tabName = "MidSemester",
              fluidRow(
                valueBoxOutput("value7"),
                valueBoxOutput("value8"),
                valueBoxOutput("value9")
              ),
              fluidRow(
                box(title = "Histogram of Mid Semester Marks", solidHeader = TRUE, collapsible = TRUE, status = "primary", plotOutput("Histogram3")),
                box(title = "Box Plot of Mid Semester Marks", solidHeader = TRUE, collapsible = TRUE, status = "primary", plotOutput("Boxplot3")),
                box(title = "Students with less than 50%", solidHeader = TRUE, collapsible = TRUE,status = "primary", tableOutput("table2")),
                box(title = "Students with at least 80%", solidHeader = TRUE, collapsible = TRUE, status = "primary", tableOutput("table4"))
              )),
      tabItem(tabName = "ALL-Marks",
              fluidRow(
                box(title = "Assesment marks of all students", solidHeader = TRUE, collapsible = TRUE, status = "primary", tableOutput("table7")),
                box(title = "At risk students", solidHeader = TRUE, collapsible = TRUE,status = "primary", tableOutput("table8")),
                box(title = "Students who improved", solidHeader = TRUE, collapsible = TRUE, status = "primary", tableOutput("table9")),
                box(title ="Students who did not improve", solidHeader = TRUE, collapsible = TRUE, status = "primary", tableOutput("table10"))
              ))
  )
  )
))