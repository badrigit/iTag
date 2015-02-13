library(shinydashboard)

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
                
                box(width = 2, height = 4,img(src="logo.png")),
                
                box(width = 2, height = 4,
                    selectInput(inputId = "pr", "Planned or Responsive", plre),
                    selectInput(inputId = "channel", "Channel",channelInput),
                    uiOutput(outputId = "channelFormat")
                ),
                
                box(width = 2, height = 4,
                    
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