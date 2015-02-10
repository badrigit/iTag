library(shinydashboard)

source("Global.R")

dashboardPage(
  dashboardHeader(title = "iTag"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(width = 2, height = 4,
          selectInput(inputId = "pr", "Planned or Responsive", plre),
          selectInput(inputId = "channel", "Channel",channelInput),
          uiOutput(outputId = "channelFormat")
      ),
      
      box(width = 2, height = 4,
          selectInput(inputId = "product", "Product", products),
          selectInput(inputId = "campaign", "Campaign Name", campaigns),
          
          conditionalPanel("input.campaign == 'other'", 
                           textInput(inputId = "otherCampaign", "Other")),
          
          textInput(inputId = "url", label = "URL"),
          
          textInput(inputId = "cname", "Creative / Ad Name"),
          
          actionButton(inputId = "submit", label = "Submit")
      ),
      
      box(title = "Tracking code", 
          verbatimTextOutput("trackingCode"))
    )
  )
)