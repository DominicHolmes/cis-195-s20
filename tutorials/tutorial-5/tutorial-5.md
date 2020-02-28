# Tutorial 5: Networking and Multithreading

Discuss this tutorial & get help on [Piazza](https://piazza.com/upenn/fall2019/cis195201/home).
Please leave feedback by creating a GitHub issue or by posting on Piazza.

**Expected Duration:** 1.5 hours

**Deadline:** Thursday, March 5th at **4:20pm**

- - - -

## Objectives

* Learn about the different queues available with Grand Central Dispatch
* Learn to schedule, cancel, and deal with networking requests
* Learn how to decode JSON data received from networking requests

---

## Getting Started

Instead of using an `answers.txt` file, we will use Canvas for text submissions. Open the Canvas assignment for Tutorial 5.


## Multithreading

> Have you ever used an app where you tried to do something, and there was a long pause while the UI was unresponsive? This is usually a sign that the app needs multithreading!

One of the best decisions made by the designers of iOS was to adopt a "UI-first" approach to system design. This means that the number one priority is to maintain a fluid, responsive interface.

In practice, iOS achieves this by ensuring that **all UI events are run on the "main thread"**. The design of most modern CPU chips allows multiple "threads" of code execution to be running in parallel, and multiple threads can be active at once. The main thread is the fastest of these, due to it having the most resources devoted to it.

Actions run on the main thread are **time sensitive** - they must be executed as soon as possible. For example, a user scrolling down a table view should experience fluid and responsive scrolling. Actions such as responding to that scroll and loading new cells are critical for a smooth user experience; even a momentary delay will give the impression that your app is *slow and buggy*.

Everything we've done so far has been on the main thread - that's about to change! Asychronous events such as networking requests must always be run on a background thread. Expensive operations like downloading content must also happen on non-main threads; the main thread must always be available to respond to user input.

(~15 min) Read [this short article](https://hackernoon.com/swift-multi-threading-using-gcd-for-beginners-2581b7aa21cb). Pay special attention to the kinds of queues discussed.

Answer the following questions on Canvas:
1. Why do we perform UI updates on the main thread?
2. If networking requests provide the content of our app, why don't we run them on the main thread?
3. Imagine we have an image editing app. After a user taps a button, we apply a certain kind of image filter that takes *5 seconds* of processing to complete. What **two actions** should we perform to accomplish this, and on what threads should those actions take place?


## Networking

By now you must be familiar with how to interact with data that is available locally (in Model.swift, for example). But how do we interact with data over coming from far away, across the internet? 

For example, how does Instagram transmit photos you take on your device to their servers? How could we use the [National Parks API](https://www.nps.gov/subjects/digital/nps-data-api.htm) to build a hiking app? We achieve all of this with network requests using `URLSession` to request and receive information.

When we receive this information, how do we understand it? Something like a simple `String` wouldn't work, because our data might include complex formats such as arrays, dictionaries, and objects. To fix this, we'll use a standardized format called JSON to send and receive information from remote sources. Carefully read *just the first section* of this page: [What is JSON?](https://learnappmaking.com/swift-json-swiftyjson/#what-is-json).

Answer the following questions on Canvas:
1. What does JSON stand for?
2. What is the JSON object syntax?
3. Can Objects contain Arrays in JSON? Can Arrays contain Objects? Explain.

URLSession will be explained in the next lecture. If you're curious, you can read [this  tutorial](https://learnappmaking.com/urlsession-swift-networking-how-to/) to get a head start.


## Codable

(~15 min) Read and **bookmark** [this guide](https://benscheirman.com/2017/06/swift-json/) to JSON parsing in Swift 4. Read up to and including "Root Level Arrays".

This explains how to use the Codable protocol to easily decode structured data. You'll usually use this to decode JSON, but this is also useful for encoding/decoding data of other formats (such as XML).

Answer the following questions on Canvas:
1. What is the type signature of `Codable`? (hint: make a codable struct in XCode or check the docs. Answer is of the form ___ & ___)
2. Which class do we use to decode JSON?
3. Which class do we use to encode JSON?

---

## Submission
* Submit the Canvas assignment by the due date.


