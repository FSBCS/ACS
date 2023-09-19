### Lesson 7: Introduction to JavaScript Functions

---

#### **1. Function Declarations, Parameters, and Invocations**

- **Function Declaration:** The classic way of defining a function. 

  ```javascript
  function greet(name) {
      return "Hello, " + name + "!";
  }

  console.log(greet("Alice")); // Outputs: Hello, Alice!
  ```

- **Function Invocation (Calling):** After declaring a function, you invoke it using its name followed by parentheses `()`.

  ```javascript
  greet("Bob");  // Outputs: Hello, Bob!
  ```

- **Function Parameters:** Parameters are named entities in a function definition that specify an input to the function.

  - **Default Parameters:** You can provide default values for parameters. If the caller does not provide a value for that parameter, the default will be used.

    ```javascript
    function greet(name = "Guest") {
        return "Hello, " + name + "!";
    }

    console.log(greet()); // Outputs: Hello, Guest!
    ```

  - **The `rest` Operator:** Used to represent an indefinite number of arguments as an array.

    ```javascript
    function displayColors(mode, ...colors) {
        console.log(mode, colors);
    }

    displayColors("RGB", "Red", "Green", "Blue"); // Outputs: RGB [ 'Red', 'Green', 'Blue' ]
    ```

  - **The `arguments` Object:** An array-like object that holds all of the passed arguments for a function. Note that it's not available in arrow functions.

    ```javascript
    function showArguments() {
        console.log(arguments);
    }

    showArguments("first", "second", 3, 4); // Outputs: { '0': 'first', '1': 'second', '2': 3, '3': 4 }
    ```

---

#### **2. Variable Scope in Functions**

Scope determines the accessibility or visibility of variables, functions, and objects in some particular part of your code during runtime.

- **Local (Function) Scope:** Variables declared within a function are local to that function and can't be accessed outside that function.

  ```javascript
  function showLocalVariable() {
      let localVar = "I'm local";
      console.log(localVar);
  }

  showLocalVariable(); // Outputs: I'm local
  // console.log(localVar); // This will throw an error
  ```

- **Global Scope:** Variables declared outside a function are global and can be accessed by any part of the code, including functions.

  ```javascript
  let globalVar = "I'm global";

  function showGlobalVariable() {
      console.log(globalVar);
  }

  showGlobalVariable(); // Outputs: I'm global
  ```

- **Block Scope (with `let` and `const`):** Unlike the `var` keyword, which defines a variable globally or locally to an entire function regardless of block scope, the `let` keyword defines a variable that is block-scoped.

  ```javascript
  if (true) {
      let blockScopedVar = "I'm block-scoped";
      console.log(blockScopedVar); // Outputs: I'm block-scoped
  }
  // console.log(blockScopedVar); // This will throw an error
  ```

- **Hoisting:**

  Hoisting is a behavior in JavaScript where variable and function declarations are moved to the top of their containing scope during the compilation phase, before the code is executed. This means that you can use a variable or function before it's been declared. However, only declarations are hoisted, not initializations.

  - **Variable Hoisting:**
    Using `var`, the declaration is hoisted, but the initialization remains where you've placed it. This can lead to unexpected behaviors if you're not aware of hoisting.

    ```javascript
    console.log(myVar);  // Outputs: undefined
    var myVar = 5;
    console.log(myVar);  // Outputs: 5
    ```

    In the example above, the declaration `var myVar;` is hoisted to the top. When the first `console.log` runs, `myVar` has been declared but not initialized, so it outputs `undefined`.

  - **Function Hoisting:**
    Function declarations are hoisted completely, including their body.

    ```javascript
    greet("Alice");  // Outputs: Hello, Alice!

    function greet(name) {
        console.log("Hello, " + name + "!");
    }
    ```

    As you can see, we can call the `greet` function before its declaration because of hoisting.

  - **Note on `let` and `const`:**
    While declarations using `let` and `const` are hoisted, they are not initialized to `undefined` like `var`. Accessing them before their declaration in the code will result in a `ReferenceError`.

    ```javascript
    // console.log(myLetVar);  // This will throw a ReferenceError
    let myLetVar = 10;
    ```

It's essential to be aware of hoisting in JavaScript, especially when using `var`, to avoid potential pitfalls and unexpected behaviors in your code.

---

#### **3. Arrow Functions**

A newer way to write function expressions in a more concise manner, introduced with ES6.

- **Basic Arrow Function:**

  ```javascript
  const greet = (name) => "Hello, " + name + "!";
  console.log(greet("Charlie")); // Outputs: Hello, Charlie!
  ```

- **Single Parameter & Implicit Return:**

  ```javascript
  const square = x => x * x;
  console.log(square(5)); // Outputs: 25
  ```

---

#### **4. Callback Functions**

A callback function is a function passed into another function as an argument, which is then invoked inside the outer function. It's a foundational concept in JavaScript, especially for asynchronous operations (which we'll cover later), but they're used in other places too!

- **Basic Callback:**

  ```javascript
  function doMath(operation, x, y) {
      return operation(x, y);
  }

  function add(a, b) {
      return a + b;
  }

  console.log(doMath(add, 5, 3));  // Outputs: 8
  ```

- **Array Methods with Callbacks:**
  - `.map()`, `.filter()`, and `.forEach()` are a few array methods that utilize callbacks.

  ```javascript
  const numbers = [1, 2, 3, 4, 5];
  
  numbers.forEach(num => console.log(num));  // Outputs each number

  const squared = numbers.map(num => num * num);
  console.log(squared);  // Outputs: [1, 4, 9, 16, 25]
  ```



- **Sorting with Callbacks:**
  
  - The `.sort()` array method can take a callback function to determine the order of sort. 

  **Callback Structure for `.sort()`:**
    - **Inputs:** Two arguments, typically represented as `a` and `b`.
    - **Return Value:** 
      - A negative number (e.g., `-1`): `a` should appear before `b`.
      - `0`: `a` and `b` are considered equal; no change in their order.
      - A positive number (e.g., `1`): `a` should appear after `b`.

  ```javascript
  const numbers = [10, 5, 8, 1, 7];

  numbers.sort((a, b) => a - b);  // Ascending order based on result
  ```

  In the above, `a - b` returns a negative number if `a` is less than `b`, zero if they're equal, and a positive number if `a` is greater than `b`.

- **Searching with Callbacks:**
  
  - The `.filter()` array method takes a callback to determine which elements should be included in the resulting array.

  **Callback Structure for `.filter()`:**
    - **Inputs:** Current element (mandatory), current index (optional), and the array itself (optional).
    - **Return Value:** 
      - `true`: The current element passes the test and is included in the resulting array.
      - `false`: The current element fails the test and is excluded.

  ```javascript
  const numbers = [1, 2, 3, 4, 5];

  const filteredNumbers = numbers.filter(num => num > 3);  // Returns all numbers greater than 3
  ```

  In the above, for each `num` in `numbers`, the arrow function checks if `num` is greater than `3`. If true, that number is included in the `filteredNumbers` array.

---

Understanding the structure and expected return values of these callbacks is crucial. This way, you can harness the full power of these array methods and use them effectively in various scenarios.

---

#### **Summary:**
Functions are a cornerstone of JavaScript, enabling modularity, reusability, and clarity in our code. By understanding the different ways to declare functions, the concept of scope, and the power of callbacks, you'll be better equipped to write efficient and organized JavaScript.

In our next lessons, we'll dive deeper into the world of asynchronous JavaScript and explore how functions play a role in that domain. Until then, keep practicing and refining your grasp on functions!