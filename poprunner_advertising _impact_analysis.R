                               PopRunner caselet                         
################################################################################

# This script is based on the PopRunner data - PopRunner is an online retailer
# In this script, we will use SQL to do descriptive statistics

options(warn=-1)
library(sqldf)

################################################################################

setwd("C:/Users/mukes/OneDrive/Desktop/MGT 588")

consumer<-read.csv("consumer.csv",header=TRUE)
pop_up<-read.csv("pop_up.csv",header=TRUE)
purchase<-read.csv("purchase.csv",header=TRUE)
email<-read.csv("email.csv",header=TRUE)

# Let us first start with exploring various tables

################################################################################


# Query 1) Display first 5 rows of consumer table

sqldf("
      SELECT * FROM consumer
      LIMIT 5
      ")

################################################################################

# Query 2) Display first 5 rows of pop_up table

sqldf("
      SELECT * FROM pop_up
      LIMIT 5
      ")

################################################################################

# Query 3) Display first 5 rows of purchase table

sqldf("
      SELECT * FROM purchase
      LIMIT 5
      ")

################################################################################

# Query 4) Display first 5 rows of email table

sqldf("
      SELECT * FROM email
      LIMIT 5
      ")

################################################################################

# Now, let's look at the descriptive statistics one table at a time: consumer table

# Query 5: Display how many consumers are female and male (column alias: gender_count), 
#          also show what is the average age (column alias: average_age) of consumers by gender


sqldf("
      SELECT gender, 
             COUNT(*) AS gender_count, 
             AVG(age) AS average_age 
      FROM consumer 
      GROUP BY gender
      ")

#There are 6903 female consumers with an average age of 30.61 years and 2129 male consumers with an average age of 32.45 years.

################################################################################

# Query 6: How many consumers are there in each loyalty status group (column alias: loyalty_count), 
# what is the average age (column alias: average_age) of consumers in each group


sqldf("
       SELECT loyalty_status, 
             COUNT(*) AS loyalty_count, 
             AVG(age) AS average_age 
       FROM consumer 
       GROUP BY loyalty_status
      ")

#There are 1529 consumers with loyalty status 0, 1740 with loyalty status 1, 2612 with loyalty status 2, 1385 with loyalty status 3, and 1766 with loyalty status 4. The average age increases with higher loyalty status, ranging from 29.37 years for status 0 to 33.51 years for status 4.

################################################################################

# Next, let's look at the pop_up table

# Query 7: How many consumers (column alias: consumer_count) who received a
# pop_up message (column alias: pop_up)
# continue adding discount code to their card (column alias: discount_code) 
# opposed to consumers who do not receive a pop_up message

sqldf("
       SELECT pop_up, 
             saved_discount AS discount_code, 
             COUNT(*) AS consumer_count 
       FROM pop_up 
       GROUP BY pop_up, saved_discount
      ")

#Among the consumers who received a pop-up message, 1487 added a discount code to their card, while 3029 did not. Meanwhile, 4516 consumers did not receive a pop-up message.


################################################################################

# This is purchase table

# Query 8: On an average, how much did consumers spend on their 
# total sales (column alias: total_sales) during their online purchase


sqldf("
      SELECT AVG(sales_amount_total) AS total_sales 
      FROM purchase
      ")

#On average, consumers spent approximately $135.21 on their total sales during online purchases.

################################################################################

# Finally, let's look at the email table

# Query 9: How many consumers (column alias: consumer_count) of the total opened the email blast


sqldf("
      SELECT opened_email, COUNT(*) AS consumer_count
      FROM email
      GROUP BY opened_email
      ")

#Out of the total consumers, 8316 did not open the email blast, while 716 consumers opened it.

######################################################################################################

# Now we will combine/ merge tables to find answers

# Query 10: Was the pop-up advertisement successful? Mention yes/ no. 
# In other words, did consumers who received a pop_up message buy more

sqldf("
      SELECT pop_up, 
      SUM(sales_amount_total) AS sum_sales, 
      AVG(sales_amount_total) AS avg_sales 
      FROM purchase 
      INNER JOIN pop_up ON purchase.consumer_id = pop_up.consumer_id 
      GROUP BY pop_up
      ")

#The pop-up advertisement was not successful, as consumers who did not receive the pop-up spent a total of $626,324.50 with an average of $138.69 per purchase, compared to those who received the pop-up, who spent $594,929.80 with an average of $131.74 per purchase.

######################################################################################################

# Query 11) Did the consumer who spend the least during online shopping opened the pop_up message? Use nested queries.

# Write two separate queries 

# Query 11.1) Find the consumer_id who spent the least from the purchase table


sqldf("
      SELECT consumer_id FROM purchase
      ORDER BY sales_amount_total 
      LIMIT 1
      ")

# Query 11.2) Use the consumer_id from the previous SELECT query to find if the consumer received a pop_up message from the pop_up table

sqldf("
      SELECT pop_up
      FROM pop_up
      WHERE consumer_id = 5887286353
      ")

# Query 11.3) Using ? for inner query, create a template to write nested query

sqldf("
      SELECT consumer_id,pop_up
      FROM pop_up
      WHERE consumer_id =(?)
      ")

# Query 11.4) Replace ? with the inner query


sqldf("
      SELECT consumer_id,pop_up
      FROM pop_up
      WHERE consumer_id =(SELECT consumer_id FROM purchase
      ORDER BY sales_amount_total 
      LIMIT 1)
      ")

#The consumer with consumer_id 5887286353, who spent the least during online shopping, did not receive a pop-up message.

######################################################################################################

# Query 12: Was the email blast successful? Mention yes/ no. 
# In other words, did consumers who opened the email blast buy more


sqldf("
      SELECT opened_email,
      SUM(sales_amount_total) AS sum_sales, 
      AVG(sales_amount_total) AS avg_sales 
      FROM purchase 
      INNER JOIN email ON purchase.consumer_id = email.consumer_id 
      GROUP BY opened_email
      ")

#Yes, the email blast was successful. Consumers who opened the email blast (opened_email = 1) spent more on average, with a total sales of 172,432 and an average of 240.83, compared to 1,048,822 in total sales and an average of 126.12 for those who did not open the email (opened_email = 0).

######################################################################################################

# Query 13) Did the consumer who spend the most during online shopping opened the email message? Use nested queries.

# Write two separate queries 

# Query 13.1) Find the consumer_id who spent the most from the purchase table


sqldf("
      SELECT consumer_id FROM purchase
      ORDER BY sales_amount_total DESC
      LIMIT 1
      ")

# Query 13.2) Use the consumer_id from the previous SELECT query to find if the consumer opened the email from the email table

sqldf("
      SELECT opened_email
      FROM email
      WHERE consumer_id = 5955534353
      ")

# Query 13.3) Using ? for inner query, create a template to write nested query

sqldf("
      SELECT consumer_id,opened_email
      FROM email
      WHERE consumer_id =(?)
      ")

# Query 13.4) Replace ? with the inner query


sqldf("
      SELECT opened_email, consumer_id
      FROM email
      WHERE consumer_id IN 
      (SELECT consumer_id 
       FROM purchase 
       ORDER BY sales_amount_total DESC 
       LIMIT 1)
      ")

#The consumer with consumer_id 5955534353, who spent the most during online shopping, opened the email message, as indicated by the opened_email value of 1.
