library(shinydashboard)

source("Global.R")

dashboardPage(skin = "black",
  dashboardHeader(title = "iTag"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("BG - Content Distribution", tabName = "adobe", icon = icon("dashboard")),
      menuItem("Help", tabName = "help", icon = icon("question-circle"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "adobe",
              fluidRow(
                box(width = 2, height = 4, solidHeader = TRUE, 
                    collapsible = TRUE, status = "success", 
                    selectInput(inputId = "pr", "Planned or Responsive", plre),
                    selectInput(inputId = "channel", "Channel",channelInput),
                    uiOutput(outputId = "channelFormat")
                ),
                
                box(width = 2, height = 4, solidHeader = TRUE, 
                    collapsible = TRUE, status = "success",
                    selectInput(inputId = "product", "Product", products),
                    selectInput(inputId = "campaign", "Campaign Name", campaigns),
                    
                    conditionalPanel("input.campaign == 'other'", 
                                     textInput(inputId = "otherCampaign", "Other")),
                    
                    textInput(inputId = "cname", "Creative / Ad Name"),
                    
                    textInput(inputId = "url", label = "URL"),
                    
                    actionButton(inputId = "submit", label = "Submit")
                ),
                
                valueBox(subtitle = strong("URL + Tracking Code (copy & paste)"), 
                         color = "green", width = "2", 
                         verbatimTextOutput("trackingCode"))
              )
      ),
      
      tabItem(tabName = "help",
              tags$a(href="mailto:badrinarayanan.srinivasan@iprospect.com", 
                                       "Feedback / Feature request"))
    )
  )
)