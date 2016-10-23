# ContinentalCodeTest
The assignment:

```Given the following filename:  conti_cat_plane_swift.txt

Rules: 
Filename should be entered in a text field.


The first word (conti) is a distinct identifier that should be the value of the key NAME.


All of the following items are appended on with underscores separating them and each item contains a key value pair. The key is the first character and the value is the remaining characters. There can be N number of items after the value for "NAME".


Parse this filename and return a dictionary of values, removing any file extensions but also keeping in mind that this filename could end up with incorrect characters or incorrect amounts of characters.


Save the output of parsing the filename in a file with the same name in the /Documents directory.  Also, print the output to the screen.


Example input: 
conti_cat_plane_swift.txt


Example output: 
Filename conti_cat_plane_swift.txt saved with contents:


{ 
"NAME" : "conti", 
"c" : "at", 
"p" : "lane", 
"s": "wift" 
};


At path: <URL path to conti_cat_plane_swift.txt > 


Bonus Points: for unit testing, UI/UX functionality, and responsiveness, code readability, comments, and dealing with edge cases that you see. 

```
As Xcode 8 only came out a couple months prior to me doing this sample code, I decided to do this entirely in Swift 3 to see how it would go.

It was a bit more time consuming for me than how it would have been with Swift 1 - 2 and Objective-C, but I suspect as I get more fluent with the latest version of Swift I'll get faster.  This was my opportunity to do some public work with Closures (i.e. update the UI after parsing the text field) and a bit of unit testing.  

