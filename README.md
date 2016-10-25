# Continental File Name Parsing
The assignment:

>Given the following filename:  conti_cat_plane_swift.txt

>Rules: 
>Filename should be entered in a text field.

>The first word (conti) is a distinct identifier that should be the value of the key NAME.


>All of the following items are appended on with underscores separating them and each item contains a key value pair. The key is the first character and the value is the remaining characters. There can be N number of items after the value for "NAME".


>Parse this filename and return a dictionary of values, removing any file extensions but also keeping in mind that this filename could end up with incorrect characters or incorrect amounts of characters.


>Save the output of parsing the filename in a file with the same name in the /Documents directory.  Also, print the output to the screen.


>Example input: 
>conti_cat_plane_swift.txt


>Example output: 
>Filename conti_cat_plane_swift.txt saved with contents:


>{ 
>"NAME" : "conti", 
>"c" : "at", 
>"p" : "lane", 
>"s": "wift" 
>};


>At path: <URL path to conti_cat_plane_swift.txt > 


>Bonus Points: for unit testing, UI/UX functionality, and responsiveness, code readability, comments, and dealing with edge cases that you see. 


Demonstrates how to do filename parsing the Continental way!

As Xcode 8 only came out a couple months prior to me doing this sample code, I decided to do this entirely in Swift 3 to see how it would go.

There are both iOS & Mac targets in this project.  The iOS target has tests attached to it.

Doing this implementation was a bit more time consuming than how it would have been for me in Objective-C, primarily because Swift 3 syntax is somewhat different than Swift 1 & 2 and some things we take for granted in Objective-C (like passing an Integer index to substringToIndex:) don't exist in Swift.  But I definitely was happy to get the chance to have fun with closures (which update the UI after parsing the text field) and a bit of unit testing.

I hope you like the results.

