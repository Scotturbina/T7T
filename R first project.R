
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










