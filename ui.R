library(shiny)
shinyUI(fluidPage(
  titlePanel(title=h2("Longley's Economic Regression Data",align="center")),
  
  sidebarLayout(
      sidebarPanel(
          helpText(h3("Choosing input of economic variables")),
      selectInput("var", label="1.Select the variable from the list:",
                         choices= c("GNP.deflator"=1,
                           "Unemployed"=2,
                           "Population"=3,
                           "Employed"=4,
                           "Armed.Forces"=5,
                           "GNP"=6 ),
                  selected=1),
      #radioButtons("color", "2.Select the color of the plot", 
                  # choices=c("red", "blue", "yellow"), selected="red"),
      radioButtons("type", "2.Select the type of the plot", 
                   choices=c("dot", "line", "bar"), selected="dot"),
      selectInput("Variable", "3.Summarize a variable of your choice:",
                  choices=c("GNP.deflator",
                             "Unemployed",
                             "Population",
                              "Employed",
                              "Armed.Forces",
                             "GNP" ),
                            selected="GNP.deflator"),
      submitButton("Submit")
      ),
      mainPanel(
          plotOutput("myplot"),
          h4("Summary of the economic variable of your choice:"),
          verbatimTextOutput("Summary")
  )
    ))
)