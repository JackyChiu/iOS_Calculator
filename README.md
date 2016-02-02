# iOS_Calculator

A simple calculator for iOS.

A calculator made with Swift 2.0 in Xcode for iOS. Done as a project to explore mobile application development. Calculator works with multiple numbers and operations, decimal numbers, and squares. The functionality of the calculator was inspired by my current Casio fx calculator. Another motivation for creating this is that I did not enjoy the default calculator provided on iOS. The Calculator design was done in Sketch as well as in StoryBoard mostly focused towards for the iPhone 6 (4.7 inch) screen.

**ISSUE:** Currently the design of the calculator only works well on iPhone 6 (4.7 inch) screens. This is due to the way I set the constraints in storyboard. I will look into making a more responsive design later on.

----
## Features
- The calculator follows an order of precidence 
- An ANS key to recall the last answer from calculation
- Calculator recognizes when you continue calculations after a previous calculation (ex. 1+1=, Calculator will display 2, and right after if you hit x5, it will directly go to ANSx5)
- 2 seperate "screens", one to display values as you input and operations, and one to display answer
- You can also swipe up and down to change the colours of the operation buttons. 

![CalcDisplay](http://imgur.com/5SRabqE.png)

## Installation
Mac:
- Clone the repo
- Open project in Xcode 7.0 or higher
- Run

iOS:
- Connect device to Mac
- Do above steps for Mac
- Choose your device to run on in top left coner
- Run

----
(Updated Jan 5, 2015)
Operations with large number now work smoothly. Labels that display numbers now scale a bit if extra space is needed.

(Updated Jan 4, 2016)
When pressing an operator button after previous operations have been evaluated, it continues by replacing the previous operations with an ANS key. Fixed cases with large numbers that could possibly break the build. Changed squared button into an expont button.

(Updated Jan 1, 2016)
Calculator can now recognize order of precedence with operators. Clear button is now a delete button, when long pressed will clear. Swiping the calculator up and down will change the colour of it.

(Updated Dec 31, 2015)
ANS key & square operator work now. Replaced the square root button with a button for negative numbers.

(Update Dec 27, 2015)
Calculator works with multiple operations and decimal numbers.

(Update Dec 25, 2015)
Working calculator for 2 input numbers.