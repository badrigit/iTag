library(shiny)

shinyServer(function(input, output) {
  parameters <- reactive({
      if(input$submit == 0)
        return("Fill all the details")
      
      isolate(
        if(input$url != ""){
          url <- input$url
          
          if((input$campaign == "other") && (input$otherCampaign == "")){
            return("Missing Campaign Name")
          } else if((input$campaign == "other") && (input$otherCampaign != "")){
            if(input$cname != ""){
              tag <- paste(input$pr, input$otherCampaign, input$product, 
                           input$channel, input$po, input$format,
                           tolower(input$cname), input$bbb, sep = "_")
              code <- paste(url, "?cid=cd_", tag, sep = "")
            } else if(input$cname == ""){
              return("Missing Creative Name")
            }
          } else {
            if(input$cname != ""){
              tag <- paste(input$pr, input$campaign, input$product, input$channel, 
                           input$po, input$format, tolower(input$cname), input$bbb, sep = "_")
              code <- paste(url, "?cid=cd_", tag, sep = "")
            } else if(input$cname == ""){
              return("Missing Creative Name")
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
