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
            if((input$creative == "yes") && (input$cname != "")){
              tag <- paste(input$pr, input$channel, input$po, input$format, input$product,
                           input$otherCampaign, input$cname, input$bbb, sep = "_")
              code <- paste(url, "?cid=", tag, sep = "")
            } else if((input$creative == "yes") && (input$otherCampaign == "")){
              return("Missing Creative Name")
            } else {
              tag <- paste(input$pr, input$channel, input$po, input$format, input$product,
                           input$otherCampaign, sep = "_")
              code <- paste(url, "?cid=", tag, sep = "")
            }
          } else {
            if((input$creative == "yes") && (input$cname != "")){
              tag <- paste(input$pr, input$channel, input$po, input$format, input$product,
                           input$otherCampaign, input$cname, input$bbb, sep = "_")
              code <- paste(url, "?cid=", tag, sep = "")
            } else if((input$creative == "yes") && (input$otherCampaign == "")){
              return("Missing Creative Name")
            } else {
              tag <- paste(input$pr, input$channel, input$po, input$format, input$product,
                           input$otherCampaign, sep = "_")
              code <- paste(url, "?cid=", tag, sep = "")
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
