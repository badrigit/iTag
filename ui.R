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
          conditionalPanel("input.channel == 'ppc'", 
                           selectInput(inputId = "po", "Paid / Organic",paidOnly),
                           selectInput(inputId = "format", "Channel Format", ppcFormatType)),
          
          conditionalPanel("input.channel == 'outbrain'", 
                           selectInput(inputId = "po", "Paid / Organic",paidOnly),
                           selectInput(inputId = "format", "Channel Format", outbrainFormatType)),
          
          conditionalPanel("input.channel == 'taboola'", 
                           selectInput(inputId = "po", "Paid / Organic",paidOnly),
                           selectInput(inputId = "format", "Channel Format",taboolaFormatType)),
          
          conditionalPanel("input.channel == 'trueview'", 
                           selectInput(inputId = "po", "Paid / Organic",paidOnly),
                           selectInput(inputId = "format", "Channel Format",trueviewFormatType)),
          
          conditionalPanel("input.channel == 'display'", 
                           selectInput(inputId = "po", "Paid / Organic",paidOnly),
                           selectInput(inputId = "format", "Channel Format",displayFormatType)),
          
          conditionalPanel("input.channel == 'facebook'", 
                           selectInput(inputId = "po", "Paid / Organic",paidOrganic),
                           selectInput(inputId = "format", "Channel Format",facebookFormatType)),
          
          conditionalPanel("input.channel == 'youtube'", 
                           selectInput(inputId = "po", "Paid / Organic",paidOrganic),
                           selectInput(inputId = "format", "Channel Format", youtubeFormatType)),
          
          conditionalPanel("input.channel == 'twitter'", 
                           selectInput(inputId = "po", "Paid / Organic",paidOrganic),
                           selectInput(inputId = "format", "Channel Format", twitterFormatType)),
          
          conditionalPanel("input.channel == 'linkedin'", 
                           selectInput(inputId = "po", "Paid / Organic",paidOrganic),
                           selectInput(inputId = "format", "Channel Format", linkedinFormatType))
      ),
      
      box(width = 2, height = 4,
          selectInput(inputId = "product", "Product", products),
          selectInput(inputId = "campaign", "Campaign Name", campaigns),
          
          conditionalPanel("input.campaign == 'other'", 
                           textInput(inputId = "otherCampaign", "Other")),
          
          textInput(inputId = "url", label = "URL"),
          
          textInput(inputId = "cname", "Creative / Ad Name"),
          
          conditionalPanel("input.channel == 'ppc'", 
                           selectInput(inputId = "bbb", "Build / Borrow / Buy",
                                        c("Build" = "ui"))),
          
          conditionalPanel("input.channel != 'ppc'", 
                           selectInput(inputId = "bbb", "Build / Borrow / Buy",
                                        c("Build" = "ui", "Borrow" = "or","Buy" = "uy"))),
          
          actionButton(inputId = "submit", label = "Submit")
      ),
      
      box(title = "Tracking code", 
          verbatimTextOutput("trackingCode"))
    )
  )
)