library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel("Estimated Stopping Distance For Cars In The 1920s"),
        sidebarPanel(
            h4('Directions:'),
            p('Select The Speed Of The Automobile,
               From 5 To 25 Miles Per Hour (mph), 
               And The Application Will Calculate 
               & Return The Estimated Stopping
               Distance In Feet (ft).'),
            numericInput('speed', 'Speed (mph)', 5, 
                         min = 5, max = 25, step = 1)
        ),
        mainPanel(
            h3('Model Run Results:'),
            h4('Speed (mph):'),
            verbatimTextOutput("inputValue"),
            h4('Stopping Distance (ft):'),
            verbatimTextOutput("distance"),
            h4('Prediction Equation:'),
            verbatimTextOutput("equation"),
            h4('Correlation Coefficient:'),
            verbatimTextOutput("ccoeff"),
            h4('Percent Of Variation Explained By The Model:'),
            verbatimTextOutput("rsquare")
            )
    )
)