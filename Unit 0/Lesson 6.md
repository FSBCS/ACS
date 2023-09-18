### Lesson 6: Introduction to JavaScript Syntax and Control Structures

---

#### **Overview**
In today's lesson, we're diving into the world of JavaScript, a leading language for web development and beyond. We'll start with its syntax basics and then navigate our way through the key control structures that form the foundation of any JS application.

---

#### **1. Variables and Data Types**
Reference: [JavaScript Data Types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures)

- **Variables:** Variables are used to store data values. In JavaScript, the `let` keyword is used to declare a variable.
  
  ```javascript
  let x = 5;     // Number
  let y = "hello";  // String
  ```

- **Constants:** Use the `const` keyword to declare a variable whose value should not be reassigned.
  
  ```javascript
  const PI = 3.14;
  ```

- **Data Types:** JavaScript has dynamic typing, meaning the type is determined at runtime. However, the commonly used types are:
  - `Number`
  - `String`
  - `Boolean`
  - `Object` (and array, date, null)
  - `Undefined`

  ```javascript
  let age = 25;                 // Number
  let name = "Alice";           // String
  let isStudent = true;         // Boolean
  let subjects = ["Math", "History"]; // Array (a type of Object)
  let person = {firstName: "John", lastName: "Doe"}; // Object
  ```

---

#### **2. Conditional Statements**
Reference: [JavaScript If Statements](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else)

- **If Statement:** The simplest form of control structure.
  
  ```javascript
  if (age > 18) {
      console.log("You are an adult.");
  }
  ```

- **If-Else Statement:** Add an alternative block of code for when the condition is false.
  
  ```javascript
  if (isStudent) {
      console.log("Hello, student!");
  } else {
      console.log("Hello, visitor!");
  }
  ```

- **Else If Statement:** Handle multiple conditions.
  
  ```javascript
  if (grade > 90) {
      console.log("A grade");
  } else if (grade > 80) {
      console.log("B grade");
  } else {
      console.log("C grade or below");
  }
  ```

- **Ternary Operator:** A shorthand way to perform a conditional statement.
  
  ```javascript
  let userType = isStudent ? "student" : "visitor";
  ```

---

#### **3. Loops**
Reference: [JavaScript Loops](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration)

- **For Loop:** Ideal for cases when you know beforehand how many times you want to execute a statement or a block of statements.
  
  ```javascript
  for (let i = 0; i < 5; i++) {
      console.log(i);
  }
  ```

- **While Loop:** Use when you want to repeat a set of statements an unknown number of times until a condition becomes false.
  
  ```javascript
  let count = 0;
  while (count < 5) {
      console.log(count);
      count++;
  }
  ```

- **Do-While Loop:** Similar to a while loop, but the loop body is executed at least once before the condition is tested because the condition is tested after the loop body.
  
  ```javascript
  let count = 0;
  do {
      console.log(count);
      count++;
  } while (count < 5);
  ```

- **For-In and For-Of Loops:** Iterate over the properties of an object (for-in) or the values of an iterable object, like an array or string (for-of).
  
  ```javascript
  let person = {fname: "John", lname: "Doe", age: 25};
  for (let prop in person) {
      console.log(prop + ": " + person[prop]);
  }

  let colors = ["red", "green", "blue"];
  for (let color of colors) {
      console.log(color);
  }
  ```

---

### Running JavaScript Code

---

JavaScript was initially created to run in web browsers, enhancing web pages with dynamic functionalities. However, over the years, its ecosystem has expanded, and now you can run JavaScript not just in browsers but also in server environments, desktop applications, mobile apps, and more. In this section, we'll focus on two primary execution environments: the browser and the terminal (using Node.js).

#### **1. Running JavaScript in the Browser:**

- **Browser Console:** Every modern web browser comes equipped with developer tools, including a JavaScript console. 
  - **Steps:**
    1. Open your preferred web browser (e.g., Chrome, Firefox, Edge).
    2. Right-click on the page and select "Inspect" or "Inspect Element."
    3. Navigate to the "Console" tab.
    4. Type in your JavaScript code and press `Enter` to execute.
  
  ```javascript
  console.log("Hello from the browser!");
  ```

- **Script Tags:** You can also embed JavaScript directly into HTML documents using the `<script>` tag.
  
  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Running JavaScript</title>
  </head>
  <body>
      <script>
          console.log("Hello from the HTML document!");
      </script>
  </body>
  </html>
  ```

#### **2. Running JavaScript in the Terminal (using Node.js):**

[Node.js](https://nodejs.org/) is a runtime that allows you to execute JavaScript code outside the browser, primarily used for server-side programming.

- **Setup:**
  1. Download and install Node.js from [nodejs.org](https://nodejs.org/).
  2. Once installed, open your terminal or command prompt.

- **Directly in the Terminal:**
  - You can run individual JavaScript commands in Node.js REPL (Read-Evaluate-Print Loop) by typing `node` and pressing `Enter`. Type your JS code and press `Enter` again to execute.
  
  ```javascript
  > console.log("Hello from Node.js!");
  ```

- **Executing a JavaScript File:**
  1. Create a JavaScript file, e.g., `script.js`.
  2. Write your JS code in this file:
  
  ```javascript
  console.log("Running a JavaScript file using Node.js");
  ```

  3. Save the file.
  4. Navigate to the directory containing your file using the terminal.
  5. Execute the file using the command:
  
  ```
  node script.js
  ```

  This will run the file and you'll see the output in the terminal.

---

### Programming Assignment: Basic JavaScript Calculator

**Objective:** Build a simple calculator using the JavaScript fundamentals covered in today's lesson.

---

#### **Requirements:**

1. **Input:**
   - Use the `prompt()` method to gather two numerical inputs from the user. 

2. **Operations:**
   - Ask the user what operation they would like to perform (`Add`, `Subtract`, `Multiply`, `Divide`).
   - Based on their choice, perform the appropriate calculation.

3. **Output:**
   Display the result in the console using `console.log()`.

4. **Control Structures:**
   - Use conditional statements to determine which operation to perform based on user input.
   - Implement error handling: if the user provides non-numerical input or chooses an invalid operation, alert them to the error and display an appropriate message in the console.

---