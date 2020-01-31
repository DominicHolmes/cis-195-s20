# App 1: Swift

Discuss this app & get help on [Piazza](tiny.cc/cis195-piazza).
Please leave feedback by creating a GitHub issue or by posting on Piazza.

**Expected Duration:** 2 hours


**Deadline:** Thursday, January 30th at **4:20pm**

- - - -

## Objectives 🥅
* Learn about the structure of iOS
* Get aquainted with Swift.
* Get familiar with the Apple docs.

- - - -

## The iOS SDK 🤖
This is a video from the announcement of XCode, interface builder, and the iOS SDK. Although it's old and much has changed, they do a great job of explaining how exactly the iPhone is structured, and what XCode/IB is meant for. 

Watch from 19:44 to 31:34 (1.25x speed recommended): [The iOS SDK](https://youtu.be/MfQtnQHLNcs?t=1182)

Takeaway: development of iOS apps stems directly from the way the phone is built, and the design choices made over a decade ago. Although most of the software shown is outdated, the core design has remained the same to this day. XCode and Interface Builder are powerful tools that accelerate iOS app development.

#### Do the following:
- Create a file `answers.txt`.
- Add your name and pennkey.
- Write 2 paragraphs (3-4 sentences each):
    + One paragraph on the structure of iOS
    + One paragraph on the role of Xcode

- - - -

## A Guided Tour of Swift 🚴

#### Words of Advice
The more effort you put into learning Swift now, the easier the rest of the semester will be! Pay close attention to Swift's emphasis on Type Safety, Optionals, and Structs. You should try to absorb everything in "Swift: A Guided Tour". 

However when skimming the documentation in Exercises 0-7, don't worry if you don't understand everything! Skimming documentation like this is a learned skill; it may be difficult at first, but you'll get faster as the semester goes on. Reading documentation is an essential skill for any engineer.

#### Do the following:
- Download [Swift: A Guided Tour](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.playground.zip)
- Open the file in XCode -- this is a "playground book"
- Open `answers.txt`.
- Read through the entire book (8 pages). Make sure you understand all of them. For each page, add a new paragraph to `answers.txt` summarizing what you learned on that page. Each paragraph should have 3-4 sentences. Please clearly mark what page you are summarizing.

As you read, be sure to hit the "play" button to see results. Don't be afraid to play around and change the code, that's what it's there for!

**Pay special attention** to the sections on Optionals and Functions/Closures. Those are often sticking points when learning Swift, and they'll be used constantly.

## Finger Exercises 🏋️‍♀️🏋️‍♂️

#### Do the following:
- Open Xcode & create a new playground. Name it `app1_lastname_firstname.playground`.
- Remove the boilerplate code.
- Complete the following exercises.

### Exercise 0
- Write a multi-line comment (with `/* ... */`) that includes your name, pennkey, the app number (1), and what you're looking forward to most in CIS 195.

### Exercise 1: Types, Constants, Variables, Optionals
Skim through: [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309) and then [Basic Operators](https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#//apple_ref/doc/uid/TP40014097-CH6-ID60).

- Add a single line comment: `// Exercise 1`
- Initialize a constant `foo` to 42, with an appropriate data type (such as Int or Double).
- Cast `foo` to a `String` and store it in a variable `fooStr` of type `String?` (Optional String).
- Print "My number is <value_of_fooStr>" using string interpolation and **force unwrapping** fooStr.
- Repeat the Print step using **optional binding** instead of **forced unwrapping**.
- Repeat the Print step again using **nil coalescing** instead of **forced unwrapping**.

### Exercise 2: Structured Data Types
Skim through: [Strings and Characters](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-ID285) and then [Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105).

- Add a single line comment: `// Exercise 2`
- Store the characters of the sentence "cis195 is fun" in a Character Array. You'll modify this array (should you use a constant or a variable?).
- Convert the character array to a new string and store it in a variable.
- Append a `!` character to the new string.
- Print the string, which should now equal "cis195 is fun!".
- Create a dictionary called `peopleDict` with a name to age mapping for your 3 favorite people. Print the dictionary with `dump()`.
- Create a tuple called `myInfo` with your name and graduation year. Print the tuple with `print()`.

### Exercise 3: Control Flow
Skim through: [Control Flow](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID120)

- Add a single line comment: `// Exercise 3`
- For each person in `peopleDict`, print "My friend <person_name> is under 21" or "My friend <person_name> is not under 21", depending on their age. Use an if statement and a for-each loop.
- Print the numbers 1 through 10 with a for loop and the closed range operator.
- Loop through the characters in the String "cis195". Print each character.

### Exercise 4: Functions
Skim through: [Functions](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158)

- Add a single line comment: `// Exercise 4`
- Write a function `sumAndDiff` that takes in 2 Ints and returns the sum and difference as a tuple. The function should have *no argument labels* (in other words, it could be called like `sumAndDiff(3,4)`).
- Create a `typealias` for `String` called `Course`
- Create a `typealias` for `Int` called `PennId`
- Write a function named `enroll` that uses both an **argument label** and a **parameter name**. The function should do the following:
    + Take in a `Course` with argument label "in" and parameter name "course"
    + Take in an `PennId` with argument label "using" and parameter name "pennId"
    + Return nothing
    + Calling the function should result in the string "Enrolled <penn_id> in <the_course>" being printed
- Define a String constant `newCourse` and Int constant `myPennId`. Call the function with them.

### Exercise 5: Enumerations
Skim through: [Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html#//apple_ref/doc/uid/TP40014097-CH12-ID145)

- Add a single line comment: `// Exercise 5`
- Create an enumeration `School` in which the cases are the 4 schools at penn ("wharton", "nursing", etc).
- Define an variable `mySchool` that is of type `School`. Set it to your own school.
- Create a **switch statement** over `mySchool`. Print "I'm in engineering" for `.engineering` and "..." for all other cases.
- Define an enumeration of type String, called `Major`. Add at least 5 cases for different majors, with at least one case being undeclared. Encode each major in lowercase (ex: cis, dmd, meam).
- Create an array of all `Major` cases (hint: you can use `CaseIterable` for this...).
- Loop through the array and print each case's `rawValue` as all uppercase (ex: CIS, DMD).

### Exercise 6: Classes, Structs, and Initialization
Skim through: [Classes and Structures](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82) and [Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID203) (up to and including ‘Default Initializers’)

- Add a single line comment: `// Exercises 6 and 7`
- Create a **struct** named `Rectangle` with properties for length and width.
- Create an instance of `Rectangle` by specifying values for length and width. This instance should be stored in a variable called `myRect`
- Create a class named `Student`. The class should have a `name` variable of type String, a `school` variable of type Optional School, and a `major` variable of type `Major`, set to a default case of `undeclared`.
- Create an initializer for the ‘Student’ class with three arguments (‘name’, ‘school’, and ‘major’). 
- Create a second initializer for the ‘Student’ class with one argument (‘name’).
- Create an instance of ‘Student’ using the first initializer. This object should be referenced by a variable called `me`.
- Create an instance of ‘Student’ using the second initializer. This object should be referenced by a variable called `babyQuaker`.
- Change the `major` of `babyQuaker` to a random `Major` (hint: use .randomElement()...)

Important: Note that you do not get an initializer ‘for free’ with the class ‘Student’ like you do with the struct ‘Rectangle.’ This is because all structures have an automatically-generated memberwise initializer, which you can use to initialize the member properties of new structure instances. Classes only implicitly create an initializer if all variables have a default value or are optional. So optional properties and non-optional properties with a default value do not need to be set in an initializer, as you can observe with the second initializer.

### Exercise 7: Properties
In Swift, classes and structures can have **properties**, and a property in Swift can also have unique **observers** that monitor changes in the property’s value. We’re going to learn about how properties and their observers interact with each other in this section.

Read: [Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#//apple_ref/doc/uid/TP40014097-CH14-ID262)

- Within the struct ‘Rectangle’, define a new property `area` with a getter that returns the product of `length` and `width`.
- In the same struct, define a property `description` of type `String?`. Implement a didSet observer that prints the unwrapped value of `description` if the property is non-nil.
- Set the `description`  of `myRect` to be `"This is my rectangle."` It should print that statement. 
- Print the `area` of `myRect`.

---

## Done 🎉
Congratulations on finishing this app! Hopefully, it helped you gain an introductory understanding of the Swift language. You also got a chance to play around with the Playground, which is commonly used by developers to test code snippets. You are definitely not expected to remember everything you just read. However by now, you should have the foundations in place to explore iOS development without a “language barrier”.

Keep in mind that when you start developing iOS apps, the [Swift documentation](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html) will become your best friend. So it would be a good idea to spend some time getting accustomed to it early on.



**DON’T FORGET:** Zip together `answers.txt` with `app1_lastname_firstname.playground`, rename it to `app1_lastname_firstname.zip` and submit on Canvas.


