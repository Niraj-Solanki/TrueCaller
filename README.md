# TrueCaller
## Project Specifications <br>
The app should define and run 3 requests SIMULTANEOUSLY, each request is defined
below:
1. Truecaller10thCharacterRequest: <br>
 Grab https://truecaller.blog/2018/03/15/how-to-become-an-ios-developer/ <br>
 content from the web <br>
 Find the 10th character and display it on the screen <br> 
 
2. TruecallerEvery10thCharacterRequest:<br>
Grab https://truecaller.blog/2018/03/15/how-to-become-an-ios-developer/ <br>
content from the web <br>
Find every 10th character (i.e. 10th, 20th, 30th, etc.) and display the array on the
screen <br>

3. TruecallerWordCounterRequest:<br>
Grab https://truecaller.blog/2018/03/15/how-to-become-an-ios-developer/ <br>
content from the web <br>
Split the text into words using whitespace characters (i.e. space, tab, line break, etc.),
count the occurrence of every word (case insensitive) and display the output on the
screen <br>
Disregard any HTML/JavaScript. Consider the content as plain text and treat anything
separated by whitespace characters as a single word.
<br>
1. A single Button to run the three requests SIMULTANEOUSLY <br>
2. A single TextView for each request to be updated as soon as the processing of the
corresponding request finishes


## Project Solution

1. Truecaller10thCharacterRequest: 
For this point, returned the 10th Character of the html response received which with given url returns html response as <!DOCTYPE  so 10th character output is a space character“ ”

2. TruecallerEvery10thCharacterRequest:
For this point, returned a array of string of the html response received. <br>
Created Model for this which iterate html response in loop +10 and fetched every 10th character and added to Array of String.

3. TruecallerWordCounterRequest:
For this point, returned the hashmap with index as words and its count in response as value of the html response.       
Created Model for this which break html response into lines and then every Lines into Words.


## App Architecture & Specs
Architecture :-  MVVM <br> 
Language :- Swift 5.3 <br>

Used MVVM Pattern to notify UI when data is received and processed.<br>
DataStructure Models Extended With BaseModel<br>
Network Manager for API calls which return BaseModel<br>
Color Asset<br>
Advantages of using it :- Extensibility (Open-Closed Principle) , Unit-Testability, Reuse
