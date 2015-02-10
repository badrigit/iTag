library(shinydashboard)

source("Global.R")

dashboardPage(
  dashboardHeader(title = "iTag"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Adobe", tabName = "adobe", icon = icon("dashboard")),
      menuItem("Help", tabName = "help", icon = icon("question-circle"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "adobe",
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
      ),
      
      tabItem(tabName = "help",
              tags$a(href="mailto:badrinarayanan.srinivasan@iprospect.com", 
                                       "Feedback / Feature request"))
    )
  )
)