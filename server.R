library(shiny)

shinyServer(function(input, output) {
  
  output$channelFormat <- renderUI({
    if(input$channel == 'ppc')
      list(
        selectInput(inputId = "po", "Paid / Organic", paidOnly),
        selectInput(inputId = "format", "Channel Format", ppcFormatType),
        uiOutput(outputId = "otherChannelFormat"),
        radioButtons(inputId = "bbb", "Build / Borrow / Buy", c("Build" = "ui"))
    ) else if(input$channel == 'outbrain'){
      list(
        selectInput(inputId = "po", "Paid / Organic",paidOnly),
        selectInput(inputId = "format", "Channel Format", outbrainFormatType),
        uiOutput(outputId = "otherChannelFormat"),
        radioButtons(inputId = "bbb", "Build / Borrow / Buy", 
                     c("Build" = "ui", "Borrow" = "or","Buy" = "uy"))
      )
    } else if(input$channel == 'taboola'){
      list(
        selectInput(inputId = "po", "Paid / Organic",paidOnly),
        selectInput(inputId = "format", "Channel Format", taboolaFormatType),
        uiOutput(outputId = "otherChannelFormat"),
        radioButtons(inputId = "bbb", "Build / Borrow / Buy", 
                     c("Build" = "ui", "Borrow" = "or","Buy" = "uy"))
      )
    } else if(input$channel == 'trueview'){
      list(
        selectInput(inputId = "po", "Paid / Organic",paidOnly),
        selectInput(inputId = "format", "Channel Format", trueviewFormatType),
        uiOutput(outputId = "otherChannelFormat"),
        radioButtons(inputId = "bbb", "Build / Borrow / Buy", 
                     c("Build" = "ui", "Borrow" = "or","Buy" = "uy"))
      )
    } else if(input$channel == 'display'){
      list(
        selectInput(inputId = "po", "Paid / Organic",paidOnly),
        selectInput(inputId = "format", "Channel Format", displayFormatType),
        uiOutput(outputId = "otherChannelFormat"),
        radioButtons(inputId = "bbb", "Build / Borrow / Buy", 
                     c("Build" = "ui", "Borrow" = "or","Buy" = "uy"))
      )
    } else if(input$channel == 'facebook'){
      list(
        selectInput(inputId = "po", "Paid / Organic",paidOrganic),
        selectInput(inputId = "format", "Channel Format", facebookFormatType),
        uiOutput(outputId = "otherChannelFormat"),
        radioButtons(inputId = "bbb", "Build / Borrow / Buy", 
                     c("Build" = "ui", "Borrow" = "or","Buy" = "uy"))
      )
    } else if(input$channel == 'youtube'){
      list(
        selectInput(inputId = "po", "Paid / Organic",paidOrganic),
        selectInput(inputId = "format", "Channel Format", youtubeFormatType),
        uiOutput(outputId = "otherChannelFormat"),
        radioButtons(inputId = "bbb", "Build / Borrow / Buy", 
                     c("Build" = "ui", "Borrow" = "or","Buy" = "uy"))
      )
    } else if(input$channel == 'twitter'){
      list(
        selectInput(inputId = "po", "Paid / Organic",paidOrganic),
        selectInput(inputId = "format", "Channel Format", twitterFormatType),
        uiOutput(outputId = "otherChannelFormat"),
        radioButtons(inputId = "bbb", "Build / Borrow / Buy", 
                     c("Build" = "ui", "Borrow" = "or","Buy" = "uy"))
      )
    } else if(input$channel == 'linkedin'){
      list(
        selectInput(inputId = "po", "Paid / Organic",paidOrganic),
        selectInput(inputId = "format", "Channel Format", linkedinFormatType),
        uiOutput(outputId = "otherChannelFormat"),
        radioButtons(inputId = "bbb", "Build / Borrow / Buy", 
                     c("Build" = "ui", "Borrow" = "or","Buy" = "uy"))
      )
    }
  })
  
  output$otherChannelFormat <- renderUI({
    if(input$format == "other"){
        textInput("otherChannel", "(Other Channel Format)")
    }
  })
  
  parameters <- reactive({
      if(input$submit == 0)
        return("Fill all the details")
      
      isolate(
        if(input$url != ""){
          url <- input$url
          
          if((input$campaign == "other") && (input$otherCampaign == "")){
            return("Missing Campaign Name")
          } else if((input$campaign == "other") && (input$otherCampaign != "")){
            oCampaign <- formatTextInput(input$otherCampaign)
            write.table(x = oCampaign, file = "www/campaigns.csv", append = T, 
                        row.names = F, col.names = F, quote = F)
            if(input$cname != ""){
              cName <- formatTextInput(input$cname)
              if(input$format == "other"){
                fileName <- paste("www/", input$channel,"FormatType.csv", sep="")
                oChannel <- formatTextInput(input$otherChannel)
                write.table(x = oChannel, file = fileName, append = T, 
                            row.names = F, col.names = F, quote = F)
                tag <- paste(input$pr, oCampaign, input$product, 
                             input$channel, input$po, oChannel,
                             cName, input$bbb, sep = "_")
                code <- paste(url, "?cid=cd_", tag, sep = "")
              } else {
                tag <- paste(input$pr, oCampaign, input$product, 
                             input$channel, input$po, input$format,
                             cName, input$bbb, sep = "_")
                code <- paste(url, "?cid=cd_", tag, sep = "")
              }
            } else if(input$cname == ""){
              return("Missing Creative Name")
            }
          } else {
            if(input$cname != ""){
              cName <- formatTextInput(input$cname)
              if(input$format == "other"){
                fileName <- paste("www/", input$channel,"FormatType.csv", sep="")
                oChannel <- formatTextInput(input$otherChannel)
                write.table(x = oChannel, file = fileName, append = T, 
                            row.names = F, col.names = F, quote = F)
                tag <- paste(input$pr, input$campaign, input$product, 
                             input$channel, input$po, oChannel,
                             cName, input$bbb, sep = "_")
                code <- paste(url, "?cid=cd_", tag, sep = "")
              } else {
                tag <- paste(input$pr, input$campaign, input$product, 
                             input$channel, input$po, input$format,
                             cName, input$bbb, sep = "_")
                code <- paste(url, "?cid=cd_", tag, sep = "")
              }
            }
          }
        } else {
          return("Need URL")
        }
      )
  })
  
  output$trackingCode <- renderText({
    if(input$submit == 0)
      return("Fill all the details")
    
    parameters()
  })
  
  output$taggedURL <- renderText({
    if(input$submit == 0)
      return("Fill all the details")
    
    fullTag <- paste(input$url, parameters(), sep="")
  })
})
