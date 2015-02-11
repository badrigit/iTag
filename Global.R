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
                  "Linkedin" = "linkedin")

paidOnly <- c("Paid" = "p")
paidOrganic <- c("Paid" = "p", "Organic" = "o")

ppcFormatType <- c(read.table("www/ppcFormatType.csv", header = F, stringsAsFactors = F))
outbrainFormatType <- c(read.table("www/outbrainFormatType.csv", header = F, stringsAsFactors = F))
taboolaFormatType <- c(read.table("www/taboolaFormatType.csv", header = F, stringsAsFactors = F))
trueviewFormatType <- c(read.table("www/trueviewFormatType.csv", header = F, stringsAsFactors = F))
displayFormatType <- c(read.table("www/displayFormatType.csv", header = F, stringsAsFactors = F))
facebookFormatType <- c(read.table("www/facebookFormatType.csv", header = F, stringsAsFactors = F))
youtubeFormatType <- c(read.table("www/youtubeFormatType.csv", header = F, stringsAsFactors = F))
twitterFormatType <- c(read.table("www/twitterFormatType.csv", header = F, stringsAsFactors = F))
linkedinFormatType <- c(read.table("www/linkedinFormatType.csv", header = F, stringsAsFactors = F))

products <- c("All" = "all",
              "CHC" = "chc",
              "CHI" = "chi",
              "Energy" = "energy",
              "Landlords" = "landlords")

campaigns <- c(read.table("www/campaigns.csv", header = F, stringsAsFactors = F))

# Function to remove symbols (except hyphen) and replace space with hyphen

formatTextInput <- function(x){
  x <- gsub("\\s+"," ",x)
  x <- gsub(" ", "-", x)
  x <- gsub("[^\\w\\-]|\\d","",x,perl = TRUE)
  x <- tolower(x)
  return(x)
}

