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
                
              ),
              
              fluidRow(
                column(2,
                    h2("Description"),   
                    helpText("Start from beginning of tool, selecting options from dropdowns", 
                             "if the option you need isn’t there, select 'other' and enter", 
                             "value into the textbox that appears (this will be remembered for next", 
                             "time you or others use the tool). For now, if the channel you need", 
                             "isn’t available, please contact us by selecting 'Help' in the", 
                             "left-hand menu. When you work your way through the tool, the remaining",
                             "fields will dynamically change to reflect your inputs.",
                             "Once all of the required fields are filled, click 'Submit and your", 
                             "tracked URL will appear in the green box.",
                             "Any questions – please contact us via the 'Help' in the", 
                             "left-hand menu.")
                )
              )
      ),
      
      tabItem(tabName = "help",
              tags$a(href="mailto:badrinarayanan.srinivasan@iprospect.com", 
                                       "Feedback / Feature request"))
    )
  )
)