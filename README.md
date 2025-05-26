## QUESTION: 3 Explain the Primary Key and Foreign Key concepts in PostgreSQL.

### Answer:

প্রাইমারি কি ও ফরেইন কি হল রিলেসনাল ডাটাবেস এর গুরুত্বপূর্ণ দুইটি অংশ ।

### প্রাইমারি কী:
<br>
১. প্রাইমারি কী হল একটি টেবিল এর একটি কলাম যা টেবিল এর সারি গুলকে পৃথক ভাবে সনাক্ত করতে সাহায্য করে ।<br>
২. প্রাইমারি কী নাল ভ্যালু হতে পারে না ।<br>
৩. একটি টেবিল শুধু একটি প্রাইমারি কী থাকতে পারে ।


### ফরেইন কি:
<br>
১. ফরেইন কি হল একটি টেবিল এর কলাম যা অন্য একটি টেবিল এর প্রাইমারি কী হিসেবে যুক্ত থাকে ।<br>
২. একটি টেবিল একাধিক ফরেইন কি থাকতে পারে ।<br>
৩. ফরেইন কি দুইটি টেবিল এর মদ্ধে সম্পর্ক সৃষ্টি করে ।<br>
৪. ফরেইন কি নাল ভ্যালু হতে পারে ।

<br>

## উদাহরণঃ

নিচের উদাহরন এ Users টেবিল এর user_id একটি প্রাইমারি কী যা Subjects টেবিল এ তা ফরেইন কি হিসেবে
যুক্ত হয়েছে। আবার Subjects টেবিল এ subject_id একটি প্রাইমারি কি।


### USERS TABLE
 user_id(PK) | User_name | user_age
 --- | --- | --- 
 1 | Fahim | 30
 2 | Shawon | 31
 3 | Imran | 29
 
 ### SUBJECTS TABLE
 Subject_id(PK) | Subject_name | user_id(FK)
 --- | --- | --- 
 1 | English | 2
 2 | Math | 3
 3 | Accounting | 1

<br>

 ## QUESTION: 4 What is the difference between the VARCHAR and CHAR data types?

 ### Answer:

VARCHAR ও CHAR হল দুইটি ডাটা টাইপ যা টেবিল তৈরি করার সময় সংযুক্ত করতে হয়। VARCHAR ও CHAR দুটিই
স্ট্রিং ডাটা টাইপ হলেও তাদের মধ্যে কিছু পারথক্ক রয়েছে। পার্থক্য গুলো হলঃ

NO | CHAR | VARCHAR
 :---: | :--- | :--- 
 ১ | সীমিত আকারের ডাটা এর জন্য ব্যাবহার উপযোগী | বিভিন্ন আকারের ডাটা এর জন্য ব্যাবহার উপযোগী
 ২ | নির্ধারিত করে দাওয়া লেংথ এর পুরটি ব্যাবহার করে | যতটুকু প্রয়োজন ততটুকু ব্যাবহার করে
 ৩ | কর্মক্ষমতা বেশি | নমনীয়তা বেশি


<br>

 ## QUESTION: 5 Explain the purpose of the WHERE clause in a SELECT statement.

 ### Answer:

 WHERE ক্লস কোন টেবিল এর রো গুলকে ফিল্টার করার জন্য ব্যাবহার করা হয়। SELECT ব্যাবহার করে কোন টেবিল রো 
 গুলকে এক্সেস করার সময় যখন কিছু নির্দিষ্ট রো এর প্রয়োজন হয় তখন কন্ডিশন এপ্লাই করার জন্য WHERE ক্লস ব্যাবহার করা হয়। 

## উদাহরনঃ

 ### PRODUCTS TABLE
 Product_id | Product_name | Product_Price
 --- | --- | --- 
 1 | Coffee | 100
 2 | Tea | 50
 3 | Milk | 30


**SQL Syntax:**<br>
 SELECT * FROM PRODUCTS<br>
 WHERE Product_Price > 40


 **OUTPUT:**
 Product_id | Product_name | Product_Price
 --- | --- | --- 
 1 | Coffee | 100
 2 | Tea | 50


 <br>

 ## QUESTION: 7 How can you modify data using UPDATE statements?

 ### Answer:

UPDATE ব্যাবহার করে এক্সিস্টিং কোন টেবিল এর ডাটা আপডেট করা হয়ে থাকে। নিচে এর ব্যাবহার দেখান হলঃ

### DEVICES TABLE(Before Update)
 Device_id | Device_name | Device_Price
 --- | --- | --- 
 1 | Mobile | 20000
 2 | Laptop | 80000
 3 | Desktop | 60000
 

**SQL Syntax:**
<br>
UPDATE DEVICES<br>
SET Device_Price = 30000<br>
WHERE Device_name = 'Mobile'

UPDATE ব্যাবহার এর ফলে এখন DEVICES TABLE টি এরকম হবেঃ

### DEVICES TABLE(After Update)
 Device_id | Device_name | Device_Price
 --- | --- | --- 
 1 | Mobile | 30000
 2 | Laptop | 80000
 3 | Desktop | 60000



<br>

 ## QUESTION: 8 What is the significance of the JOIN operation, and how does it work in PostgreSQL?

 ### Answer:

 JOIN অপারেশান PostgreSQL এর খুবই গুরুত্বপূর্ণ একটি টপিক। ডাটাবেস এর টেবিল এর রো গুলর মধ্যে সম্পর্ক স্থাপন এর মাধ্যমে বিভিন্ন ধরনের অপারেশান করা হয় JOIN ব্যাবহার করার মাধ্যমে। বিভিন্ন ধরনের JOIN হয়ে থাকে। যেমনঃ 
 - INNER JOIN
 - LEFT JOIN
 - RIGHT JOIN
 - FULL JOIN 
 - CROSS JOIN

## উদাহারনঃ

 JOIN ব্যাবহার করে এক টেবিল থেকে অন্য টেবিল এর ডাটা রিট্রাইভ অথবা মোডিফাই করা যায়। যেমনঃ

 ### USERS TABLE
 User_id | User_name
 --- | ---
 1 | Fahim 
 2 | Shawon
 3 | Nibir


 ### ORDERS TABLE
 Order_id | Product_id | User_id
 --- | --- | --- 
 1 | 2 | 2
 2 | 1 | 1
 3 | 3 | 2


 **SQL Syntax:**
<br>
SELECT User_name FROM ORDERS
INNER JOIN USER ON USER.User_id = ORDER.User_id


এভাবে JOIN ব্যাবহার এর মাধ্যমে এক টেবিল এর থেকে অন্যান্য টেবিল এর রিলেটেড ডাটা গুলো রিট্রাইভ অথবা মোডিফাই করা যায়।