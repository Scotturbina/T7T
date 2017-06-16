# Adding the required libraries

require(xlsx)
require(data.table)


# pending the link between IBM forms and R


#Converting into a Data Frame

F_Form1_115<-data.frame(F_Form1_115)

#Removing signs of punctuation from headers, this will help us to filter

names(F_Form1_115)<- gsub("[:,' .]" ,"", names(F_Form1_115))

#Creating a view without blancks ID's

Form_Wihouts_BIDs <- subset(F_Form1_115, ID !="")

#Testing the view ( Just to make sure that blanks does not exist in the view)
View(Form_Wihouts_BIDs) 


#Selecting IMT US and Canada

Form_Wihouts_BIDs<- subset(Form_Wihouts_BIDs, Form_Wihouts_BIDs$IMT == "US" | Form_Wihouts_BIDs$IMT == "Canada")


# Changing the sector name for Canada when IMT is Canada

for(i in 1:nrow(Form_Wihouts_BIDs)){
  if(Form_Wihouts_BIDs$IMT[i] == "Canada"){
   Form_Wihouts_BIDs$Sector[i] = "Canada"
  }
}



# Adding a new data with variables of  In Progres PCRs
# Adding variables
PCR_STATE_Inprogress<- "In Progress"
PCR_STATEDate_Inprogress<-""
# Subsetting data in order to obtain the set that we need
InProgress_PCRS<- subset(Form_Wihouts_BIDs, PCRState== PCR_STATE_Inprogress & TTIMApproveDate !=PCR_STATEDate_Inprogress)
## Adding a new column to see status

InProgress_PCRS$PCRs_Status<- "In Progress"
View(InProgress_PCRS)

# Subsetting data in order to obtain the set that we need

Approved_PCRs <- subset(Form_Wihouts_BIDs, PCRState == "Approved" | PCRState == "PE approved, but waiting on Billing" | 
                          PCRState =="Approved and funds received" | PCRState=="Approved but waiting on billing")

#Adding the new Column to see Status

Approved_PCRs$PCRs_Status<- "Approved"

### Reviewing

Final_PCRS<- rbind(InProgress_PCRS, Approved_PCRs)




## Gives the first part of pending data set



Form_Wihouts_BIDs$TTIMApproveDate<-as.character(Form_Wihouts_BIDs$TTIMApproveDate)

FistPendingDSet<-subset(Form_Wihouts_BIDs, PCRState== PCR_STATE_Inprogress & is.na(TTIMApproveDate) == TRUE)


##################### todavia no ver hahha
Other_pending1 <- subset(Form_Wihouts_BIDs, TTIMApproveDate != "") ## Aqui necesito ayuda
class(Form_Wihouts_BIDs$TTIMApproveDate)
View(Other_pending1)
# |
                          #PCRState != "Approved" | PCRState != "PE approved, but waiting on Billing" |
                          #PCRState !="Approved and funds received" | PCRState !="Approved but waiting on billing")

PCRState == PCR_STATE_Inprogress & 

NewTTform<-rbind(InProgress_PCRS,Approved_PCRs)


View(NewTTform)

### Codigo que me paso johnny

df <- read.csv("mydata.csv")
df$TTIMApproveDate3 <- as.character(df$TTIMApproveDate)
View(subset(df, is.na(TTIMApproveDate) == TRUE)) ## Aqui necesito ayuda


library(xlsx)

write.csv(Form_Wihouts_BIDs,"c:/mydata.csv")

