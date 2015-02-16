# Inputs

plre <- c("Planned" = "p",
          "Responsive" = "r")

channelInput <- c("PPC" = "ppc",
                  "Outbrain" = "outbrain",
                  "Taboola" = "taboola",
                  "Trueview" = "trueview",
                  "Display" = "display",
                  "Facebook" = "facebook",
                  "YouTube" = "youtube",
                  "Twitter" = "twitter",
                  "Linkedin" = "linkedin",
                  "Other" = "other")

paidOnly <- c("Paid" = "p")
paidOrganic <- c("Paid" = "p", "Organic" = "o")

ppcFormatType <- reactiveValues()
outbrainFormatType <- reactiveValues()
taboolaFormatType <- reactiveValues()
trueviewFormatType <- reactiveValues()
displayFormatType <- reactiveValues()
facebookFormatType <- reactiveValues()
youtubeFormatType <- reactiveValues()
twitterFormatType <- reactiveValues()
linkedinFormatType <- reactiveValues()
campaigns <- reactiveValues()

campaigns <- c(read.table("www/campaignNames.csv", header = T, stringsAsFactors = F))
ppcFormatType <- c(read.table("www/ppcFormatType.csv", header = T, stringsAsFactors = F))
outbrainFormatType <- c(read.table("www/outbrainFormatType.csv", header = T, stringsAsFactors = F))
taboolaFormatType <- c(read.table("www/taboolaFormatType.csv", header = T, stringsAsFactors = F))
trueviewFormatType <- c(read.table("www/trueviewFormatType.csv", header = T, stringsAsFactors = F))
displayFormatType <- c(read.table("www/displayFormatType.csv", header = T, stringsAsFactors = F))
facebookFormatType <- c(read.table("www/facebookFormatType.csv", header = T, stringsAsFactors = F))
youtubeFormatType <- c(read.table("www/youtubeFormatType.csv", header = T, stringsAsFactors = F))
twitterFormatType <- c(read.table("www/twitterFormatType.csv", header = T, stringsAsFactors = F))
linkedinFormatType <- c(read.table("www/linkedinFormatType.csv", header = T, stringsAsFactors = F))

products <- c("CHC" = "chc",
              "CHI" = "chi",
              "Energy" = "energy",
              "Eco" = "eco",
              "Landlords" = "landlords",
              "Other" = "other",
              "N/A" = "NA")

# Function to remove symbols (except hyphen) and replace space with hyphen

formatTextInput <- function(x){
  x <- gsub("\\s+"," ",x)
  x <- gsub(" ", "-", x)
  x <- gsub("[^\\w\\-]","",x,perl = TRUE)
  x <- tolower(x)
  return(x)
}

