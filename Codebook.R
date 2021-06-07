## Found this interesting article that helps create a Code book from our dataset. This is really helpful 
## https://sandsynligvis.dk/2018/03/03/generating-codebooks-in-r/

install.packages("dataMaid")
library(dataMaid)
# Creating code book for first Tidy data set
makeCodebook(combined_set1)

##Creating code book for second Tidy data set
makeCodebook(combined_set2)

## The output of the above creates an HTML, which I then converted to a PDF file and saved in the project