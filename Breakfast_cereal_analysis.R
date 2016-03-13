getwd()
##Change the working directory
setwd("C:/Users/Manu/Desktop/Rutgers-MBS/Big_DATA_Curation/Project")   
cData<- read.table("Healthy_breakfast.txt", header=T, skip=20)
cData
colnames(
cData)
dim(cData)
summary(cData)
plot(cData) 
attach(cData)
## Find cereals which has highest and lowest content of calories, protein, fat, sugar, carbohydrate, vitamins, and potassium through the below codes
which.max(fat)
cData[2,1]
which.min(fat)
 cData[4,1]
 which.max(calories)
 cData[47,1]
Mueslix_Crispy_
 which.min(calories)
 cData[4,1]
 which.min(protein)
cData[11,1]
 which.max(protein)
cData[12,1]
cData[which.max(vitamins),1]
cData[which.min(vitamins),1]
cData[ which.max(sugars) ,1]
cData[ which.min(sugars),1]
cData[ which.min(carbo),1]
cData[ which.max(carbo),1]
 cData[ which.min(potass),1]
 cData[ which.max(potass),1]
 cData[which.min(fiber),1]
 cData[which.max(fiber),1]
 cData[which.max(rating),1]
Data[which.min(rating),1]

## Calories vs Protein vs Sugar
## plot a 3d Scatted plot on the Calories, Protein and sugars levels to see which all cereals fall in the category with low calories, high protein, and low sugar content


library (scatterplot3d)
with(cData, {
  s3 <-scatterplot3d(calories,sugars,protein, pch=19, color=3,highlight.3d=TRUE)
  s3.coords <- s3$xyz.convert(calories,sugars,protein)
  text (s3.coords$x, s3.coords$y, 
        labels=row.names(cData),
        cex=0.5, pos=4)
})


#Calories vs Rating

plot(calories,rating, xlab= "Calories content", ylab="Consumer Ratings", pch=19, cex=0.5)
identify(calories,rating,name)
identify(calories,rating)
cData[55,]
cData[56,]

plot(fat,rating, xlab= "Fat content", ylab="Consumer Ratings", pch=19, cex=0.5)
identify(fat,rating,name)

##Protein vs Rating
plot(protein,rating, xlab= "Protien content (gm)", ylab="Consumer Ratings", pch=19, cex=0.5)
identify(protein,rating,name)

summary(lm(rating~sugars+calories+protein))

## Analyzing the place of the kid's cereals in the grocery store

boxplot(sugars~shelf, xlab="Shelf Position",ylab="Sugar Content(gms)", main="Boxplot")
legend("topright", legend=c("1 - Bottom Shelf", "2 - Middle Shelf", "3 - Top Shelf"))




