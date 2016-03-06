 Breakfast_Cereal_data_analysis_R
The data file I am analyzing contains nutritional information and grocery shelf location for 77 breakfast cereals.
Current research states that adults should consume no more than 30% of their calories in the form of fat, they need about 50 grams (women) or 63 grams (men) of protein daily, and should provide for the remainder of their caloric intake with complex carbohydrates. One gram of fat contains 9 calories and carbohydrates and proteins contain 4 calories per gram. A "good" diet should also contain 20-35 grams of dietary fiber.

The data include cereal name, cereal manufacturer, type (hot or cold), number of calories per serving, grams of protein, grams of fat, milligrams of sodium, grams of fiber, grams of carbohydrates, grams of sugars, milligrams of potassium, typical percentage of the FDA's RDA of vitamins, the weight of one serving, the number of cups in one serving, and the shelf location (1, 2 or 3 for bottom, middle or top).
The variable "rating" was calculated by Consumer Reports for various cereals. I am going to analyze Cereals with the highest and lowest value of various nutrients, find  which factor has the most impact on ratings and build a model based on these factors

 # Analysis 1:Cereals with Highest and lowest level of various Nutrients


We can make a summary table based on the above observation:
Cereal          	Least content	         Highest content
Fat	       All-Bran_with_Extra_Fiber	      100%_Natural_Bran   
Calories  	All-Bran_with_Extra_Fiber	      Mueslix_Crispy
Protein	      Cap'n'Crunch  	               Cheerios  
Carbo	     Quaker_Oatmeal	                  Rice_Chex
Vitamin	     100%_Natural_Bran     	 Just_Right_Crunchy__Nugget
Fiber	       Cap'n'Crunch	       All-Bran_with_Extra_Fiber
Potassium	    Almond_Delight	       All-Bran_with_Extra_Fiber
Sugars      	Quaker_Oatmeal	             Golden_Crisp
Rating  	      Cap'n'Crunch      	All-Bran_with_Extra_Fiber   

Conclusion: It is interesting to see here that the highest rating if for the Cereal with the least content of Fat and Calories not with the highest amount of protein and vitamin. 

#Analysis : Finding cereals considered Good based on  factors

Calories vs Protein vs Sugar

We see not a lot of cereals fall are in the area with high protein, low calories and low sugar content. The only cereal (row 4) is “All-Bran_with_extra_fiber”.

#Sugar vs Sodium

From this Graph of Sugar vs Sodium content , the left  down corner represents the cereals with low sodium and Sugar content and can be considered Good. These are Quaker Oatmeal, Puffed Rice,Great_Grains_Pecan, Maypo,Cream of wheat, All-bran_with_extra-Fiber.

The right top portion of this graph represents the cereals with high Sugar and sodium content and should be avoided specially by people with high blood pressure, kideney disease and diabetic patients

Analysis of the factors affecting the Rating

Further to this, we can use simple regression analysis to see which factor is most important in deciding the ratings.

#Calories vs Rating

The scatter plot shows that there is statistically good relationship between the calories and rating although it is not strictly linear. As the Calories content increases the rating decreases. Thus it supports our previous observation that the highest rating is for the cereal with the least calorie content. However, by identifying the points we find that the two cereals puffed Rice and puffed wheat although having least calorie content doesn’t have very good rating. It would be interesting to find the reason whether this because of the low content of protein or vitamins in these cereal or less advertisements and popularity.


By identifying the row number for these cereals from the scatter plot we extract other attributes of these three cereals and compare to see although having the same calorie content what factors make the “ All-Bran_with_extra_Fiber“ have the much higher rating compared to “Puffed_Wheat” and “Puffed_Rice”.

We find that although the three cereals have the same level of Fat, Calories and Sugar content, “All-Bran_with_extra_Fiber” also have high content of vitamin potassium and Protein compared to the other two cereals and thus have better rating. The brand name night also be playing some role in the rating though.
Another point to note is that All-Bran_with_extra_Fiber have very high level of Sodium too which might not be suitable for a lot of people specially with the risk of heart diseases or kidney diseases.

The scatter plot between the fat content and rating also shows that on an average the lower level of Fat content cereals have better ratings. Few of the highest rating Cereals have 0 gm fat

However there is a lot of variation in ratings for the cereals with the same level of Fat contents. As for example, for all the cereals with 0 gm fat content the rating varies from 24- 93.7.
We also see for the above plot that the “100%_Natural_Bran” having a fat level of 5 has slightly better rating than the “Honey_Comb” with the fat content 0 gm. Since the variation in the rating is different for different level of fat, we can’t say that there is a linear relation between these two variables. It can be concluded here that this doesn’t have as much impact on rating as the Calorie content have

#Protein vs Rating

The plot shows that on average the rating increases as the protein level increase till a certain level, however there are a few cereals with very high level of Protein content but their ratings are not in the top quantile. These are Quaker oatmeal, Special K, Cheerios. We now compare these cereals with the top rated cereal.

These three cereals with very high level of protein in general also have high calorific value and low fiber content and thus have less rating compared top All-Bran_with _Extra_fiber
Moreover from the plot we also see that there are quite a few cereals with very low protein content but having a moderate rating. Eg: Puffed_rice, Shredded Wheat.
If we ignore the cereals with highest level of protein, we can see that variation in ratings for a particular level of protein is same for almost all levels and thus protein content can be considered a good factor in deciding the Rating.


# Sugars vs Rating:


We see a decreasing trend in rating as the Sugar content increases. We see very few outlier as compared to other graph. The variation in rating for different sugar level is almost same. Sugar level is thus an important factor in deciding the rating of the cereals.

Looking at the plot we don’t see a very clear trend in the rating based on the sodium content.
Although lower sodium in diet is needed for people with high blood pressure, diabetes or chronic kidney disease as high-sodium diet forces the heart to work harder and can damage blood vessels and organs but is being considered by a lot of people in choosing and rating the cereals as per this survey data set.

Based on the above observations we find that the three factors that Calories, Protein and Sugar contents affect the ratings most. We can try fitting a simple linear regression model based on these factor. Here adjusted R square value of the model tells what percentage of variation in rating that is described on the factors on which the model is build. The adj. R2 value of 1 tells that the model is perfect .

We can write a formula based on this summary of the model to get the rating of a cerial with C (kcal), P (gms) Protein and S(gms) Sugar as.
Rating= 76.7 -  0.35 * C +  4.6* P - 1.1543 * S
Here the adjusted R2 value of 0.7763 tells that value of Calories, protein and sugar content are good in predicting the rating of a given cereal. However we have ignored a lot of Factors here as the Brand name and other nutrition value of Cereals.


#Analyzing the place of the kid’s cereals in the grocery store

One other interesting analysis can be done on the Sugar level of the cereal with the shelf in the grocery store they are on:


The plot shows that cereals on shelf 2 have the highest sugar content. The line within each box is the median of sugar within each shelf level. The median of sugar for shelf 2 is 12, which is the same as the 75th-percentile, the top edge of the box.
This is an expected result as for Marketing reason, the kid’s cereal with high Sugar content are mostly kept on the middle shelf so that they are easily in their view. 








