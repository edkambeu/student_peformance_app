#Importing shiny libraries
library(shiny)
library(shinydashboard)
library(readxl)
library(ggplot2)
library(dplyr)
#Importing data
Bus_stats_2018 <- read_excel("Bus_stats_2018.xls",skip = 10)
#Creating the shiny server
shinyServer(function(input,output){
  output$value1 <- renderValueBox({
   valueBox(min(Bus_stats_2018$TEST), subtitle = "Lowest mark", color = "red") 
  })
 output$value2 <- renderValueBox({
  valueBox(round(mean(Bus_stats_2018$TEST), 0), subtitle = "Average mark", color ="green") 
 })
 output$value3 <- renderValueBox({
  valueBox(max(Bus_stats_2018$TEST), subtitle = "Highest mark", color = "yellow") 
 })
 output$Histogram1 <- renderPlot({
   ggplot(data = Bus_stats_2018, aes(x = TEST)) +
     geom_histogram(fill= "red")+
     xlab("Test Marks")+
     ylab("Number of students")
 })
 output$Boxplot1 <- renderPlot({
   ggplot(data = Bus_stats_2018, aes(y = TEST)) +
     geom_boxplot()+
     ylab("Test Marks")
 })
 output$value4 <- renderValueBox({
   valueBox(round(min(Bus_stats_2018$ASSIGN_AVER), 0), subtitle = "Lowest mark", color = "red")
 })
 output$value5 <- renderValueBox({
  valueBox(round(mean(Bus_stats_2018$ASSIGN_AVER), 0), subtitle = "Average mark", color = "green") 
 })
 output$value6 <- renderValueBox({
 valueBox(round(max(Bus_stats_2018$ASSIGN_AVER), 0), subtitle = "Highest mark", color = "yellow")  
 })
 output$Histogram2 <- renderPlot({
   ggplot(data = Bus_stats_2018, aes(x = ASSIGN_AVER))+
     geom_histogram(fill ="red")+
     xlab("Assignment marks")+
     ylab("Number of students")
 })
 output$Boxplot2 <- renderPlot({
   ggplot(data = Bus_stats_2018, aes(y = ASSIGN_AVER))+
     geom_boxplot()+
     ylab("Assignment marks")
 })
 output$value7 <- renderValueBox({
    valueBox(min(Bus_stats_2018$MID_SEM), subtitle = "Lowest mark", color = "red") 
 })
 output$value8 <- renderValueBox({
  valueBox(round(mean(Bus_stats_2018$MID_SEM), 0), subtitle = "Average mark", color = "green") 
 })
 output$value9 <- renderValueBox({
  valueBox(max(Bus_stats_2018$MID_SEM), subtitle = "Highest mark", color = "yellow") 
 })
 output$Histogram3 <- renderPlot({
   ggplot(data = Bus_stats_2018, aes(x = MID_SEM))+
     geom_histogram(fill ="red")+
     xlab("Mid Semester marks")+
     ylab("Number of students")
 })
 output$Boxplot3 <- renderPlot({
   ggplot(data = Bus_stats_2018, aes(y = MID_SEM))+
     geom_boxplot()+
     ylab("Mid Semester marks")
 })
 output$table1 <- renderTable({
  Bus_stats_2018 %>% 
     select(Name, TEST)%>%
     filter(TEST<50) %>%
     arrange(TEST)
 })
 output$table2 <- renderTable({
   Bus_stats_2018 %>% 
     select(Name, MID_SEM)%>%
     filter(MID_SEM<50)%>%
     arrange(MID_SEM)%>%
     rename("MID SEMESTER" = MID_SEM)
 })
 output$table3 <- renderTable({
   Bus_stats_2018 %>% 
     select(Name, TEST)%>%
     filter(TEST>=80)%>%
     arrange(-TEST)
 })
 output$table4 <- renderTable({
   Bus_stats_2018 %>% 
     select(Name, MID_SEM)%>%
     filter(MID_SEM>=80) %>%
     arrange(-MID_SEM)%>%
     rename("MID SEMESTER"= MID_SEM)
 })
 output$table5 <- renderTable({
   Bus_stats_2018 %>% 
     select(Name, ASSIGN_AVER)%>%
     filter(ASSIGN_AVER<50)%>%
     arrange(ASSIGN_AVER)%>%
     rename(ASSIGNMENT = ASSIGN_AVER)
 })
 output$table6 <- renderTable({
   Bus_stats_2018 %>% 
     select(Name, ASSIGN_AVER)%>%
     filter(ASSIGN_AVER>=80)%>%
     arrange(-ASSIGN_AVER)%>%
     rename(ASSIGNMENT = ASSIGN_AVER)
 })
 output$table7 <- renderTable({
   Bus_stats_2018 %>%
     select(Name, TEST, ASSIGN_AVER, MID_SEM) %>%
     rename(ASSIGNMENT = ASSIGN_AVER, "MID SEMESTER" = MID_SEM)
 })
 output$table8 <- renderTable({
   Bus_stats_2018 %>% 
     select(Name, TEST,MID_SEM)%>%
     filter(TEST<50&MID_SEM<50) %>%
     rename("MID SEMESTER" = MID_SEM)
 })
 output$table9 <- renderTable({
   Bus_stats_2018 %>%
     select(Name, TEST, MID_SEM)%>%
     filter(MID_SEM > TEST)%>%
     mutate(DIFF = MID_SEM-TEST)%>%
     arrange(-DIFF)%>%
     rename("MID SEMESTER" = MID_SEM)
 })
 output$table10 <- renderTable({
   Bus_stats_2018 %>%
     select(Name, TEST, MID_SEM)%>%
     filter(MID_SEM <= TEST)%>%
     mutate(DIFF = MID_SEM-TEST)%>%
     arrange(DIFF)%>%
     rename("MID SEMESTER" = MID_SEM)
 })
})
