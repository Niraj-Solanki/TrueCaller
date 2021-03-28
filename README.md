# TrueCaller
Project Specifications
The app should define and run 3 requests SIMULTANEOUSLY, each request is defined
below:
1. Truecaller10thCharacterRequest:
1. Grab https://truecaller.blog/2018/03/15/how-to-become-an-ios-developer/
content from the web
1. Find the 10th character and display it on the screen
2. TruecallerEvery10thCharacterRequest:
1. Grab https://truecaller.blog/2018/03/15/how-to-become-an-ios-developer/
content from the web
1. Find every 10th character (i.e. 10th, 20th, 30th, etc.) and display the array on the
screen
3. TruecallerWordCounterRequest:
1. Grab https://truecaller.blog/2018/03/15/how-to-become-an-ios-developer/ content
from the web
2. Split the text into words using whitespace characters (i.e. space, tab, line break, etc.),
count the occurrence of every word (case insensitive) and display the output on the
screen
Disregard any HTML/JavaScript. Consider the content as plain text and treat anything
separated by whitespace characters as a single word.
Example:
"<p> Truecaller Hello World </p>" should produce +1 for each of these: "<p>",
"Truecaller", "Hello", "World", and "</p>".
The application should show:
1. A single Button to run the three requests SIMULTANEOUSLY
2. A single TextView for each request to be updated as soon as the processing of the
corresponding request finishes
