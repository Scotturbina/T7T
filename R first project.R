
# pending the link between IBM forms and R


#Removing signs of punctuation from headers, this will help us to filter

names(F_Form1_115)<- gsub("[:,' .]" ,"", names(F_Form1_115))

#Creating a view without blacks ID's

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



# Adding a new column with variables of  In Progres PCRs
# Adding variables
PCR_STATE_Inprogress<- "In Progress"
PCR_STATEDate_Inprogress<-""
# Subsetting data in order to obtain the set that we need
InProgress_PCRS<- subset(Form_Wihouts_BIDs, PCRState== PCR_STATE_Inprogress & TTIMApproveDate !=PCR_STATEDate_Inprogress)
## View the data just to make sure 
View(InProgress_PCRS)








