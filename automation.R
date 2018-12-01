#To combine three sheets of an XLSForm sheet into one XLSForm XLSX file, confert the XLSForm XLSX file into an XML file, upload the XML file to ODK Aggregate and post the three sheets 
##of the XLS Form as well as the XLS Form XLSX file and the XML file to GitHub (XLS Form XLSX fiel is posted into a sub-folder).

#Run the follwoing only once.
#install.packages("rstudioapi")
#install.packages("xlsx")
#install.packages("rJava")
#Ensure to have 64-bit Java installed (install manually as needed).
#install.packages("reticulate")

library("rstudioapi")
library("rJava")
library("xlsx")
library("reticulate")
os <- import("os")
#py_available() #Check if python is available. If FALSE insatll python
py_install("pyxform") #To install the XLS Form conversion package (https://docs.opendatakit.org/xlsform/)

#Setting the working directory to location of this file.
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

#Loading the three sheets
survey<-read.csv("WHOVA2016_v1_5_1_survey.csv")
choices<-read.csv("WHOVA2016_v1_5_1_choices.csv")
settings<-read.csv("WHOVA2016_v1_5_1_settings.csv")

#Writting three sheets into one XLSX file
write.xlsx(survey, file="SmartVA_PNG_V1b.xlsx", sheetName="survey", row.names=FALSE, append=TRUE)
write.xlsx(choices, file="SmartVA_PNG_V1b.xlsx", sheetName="choices", row.names=FALSE, append=TRUE)
write.xlsx(settings, file="SmartVA_PNG_V1b.xlsx", sheetName="settings", row.names=FALSE, append=TRUE)

#Converting the XLS Form XLSX file into the XML file using pyxform (https://docs.opendatakit.org/xlsform/).
#$ xls2xform path_to_XLSForm output_path
#maybe:
##py_run_string("xls2xform path_to_XLSForm output_path")

#Upload the Sheets, XML file, and XLS Form XLSX file to GitHub.
#http://r-pkgs.had.co.nz/git.html #Not sure if this allows commiting to GitHub with or R commands or with RStudio

#Uplaoding the XML file to ODK Aggregate uisng ODK Briefcase.
#https://rdrr.io/github/validmeasures/odkr/man/push_data.html