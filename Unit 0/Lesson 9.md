# Asynchronous JavaScript

## Table of Contents

- [Asynchronous JavaScript](#asynchronous-javascript)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Ajax](#ajax)
    - [How Ajax Works](#how-ajax-works)
    - [Using the XMLHttpRequest Object](#using-the-xmlhttprequest-object)
    - [Advantages of Ajax:](#advantages-of-ajax)
    - [Limitations:](#limitations)
  - [Promises](#promises)
    - [Promise Constructor](#promise-constructor)
    - [Chaining .then()s](#chaining-thens)
    - [Error Handling with .catch()](#error-handling-with-catch)
  - [Fetch API \& Promises](#fetch-api--promises)
- [Activity: NASA API](#activity-nasa-api)
  - [Conclusion](#conclusion)
  - [Homework Assignment: NASA Image of the Day](#homework-assignment-nasa-image-of-the-day)
    - [Instructions:](#instructions)
    - [Example JSON Response:](#example-json-response)
    - [Submission:](#submission)

---

## Introduction

JavaScript is often used in environments (like browsers) where blocking on I/O would be problematic. Thus, it uses asynchronous mechanisms to avoid this.

---

## Ajax

Ajax stands for **Asynchronous JavaScript and XML**. It allows for the ability to send and retrieve data from a server asynchronously without having to reload the entire page. This means web applications can update their UI based on new data without causing a full page refresh, creating a more seamless and efficient user experience.

### How Ajax Works

1. **Initiate Request**: A client-side event, such as a button click or a form submission, triggers an Ajax request using JavaScript.
2. **Create XMLHttpRequest Object**: The browser creates an instance of the `XMLHttpRequest` object, which exposes methods and properties to make an asynchronous request.
3. **Send Request**: The `XMLHttpRequest` object sends an HTTP request to the server.
4. **Server Process**: The server processes the request, interacts with the database if needed, and sends back a response.
5. **Handle Response**: Once the response is received, the `XMLHttpRequest` object processes the data and updates the web page accordingly, all without a full page reload.

### Using the XMLHttpRequest Object

The `XMLHttpRequest` object is the core of the Ajax mechanism.

```javascript
// Create a new instance of XMLHttpRequest
let xhr = new XMLHttpRequest();

// Configure the request
xhr.open('GET', 'https://api.example.com/data', true); // method, URL, async

// Set up the onload handler
xhr.onload = function() {
    if (xhr.status >= 200 && xhr.status < 400) {
        let data = JSON.parse(xhr.responseText);
        console.log(data);
    } else {
        console.error('Server returned an error');
    }
};

// Set up the onerror handler
xhr.onerror = function() {
    console.error('Request failed');
};

// Send the request
xhr.send();
```

**Note**: While Ajax originally stood for Asynchronous JavaScript and XML, JSON has largely replaced XML as the default format for transferring data. However, the name "Ajax" remains in use.

### Advantages of Ajax:

1. **Efficiency**: Only necessary data is fetched, not the entire page.
2. **Real-time Feedback**: Immediate feedback to the user without waiting for a page reload.
3. **Smoother User Experience**: Only parts of a web page are updated.

### Limitations:

1. **Browser History**: Traditional Ajax does not automatically update the browser's history, which can make navigation and bookmarking tricky.
2. **Search Engine Optimization (SEO)**: As content is loaded dynamically, it might not be indexed by search engines in the traditional way.

---

## Promises

Promises offer a more powerful way to handle asynchronous operations compared to traditional callback patterns.

### Promise Constructor

A `Promise` represents a proxy for a value not necessarily known at its creation time. It allows you to associate handlers to an asynchronous action's eventual success value or failure reason.

```javascript
const myPromise = new Promise((resolve, reject) => {
    // Some asynchronous operation
});
```

- **Executor Function**: This function runs immediately when a promise is instantiated. 
  - `resolve(value)`: A function to be called when the asynchronous operation completes successfully. It resolves the promise and returns the value.
  - `reject(reason)`: A function to be called when the asynchronous operation encounters an error. It rejects the promise and returns the reason for the rejection.

The JavaScript engine provides the `resolve` and `reject` functions. When the asynchronous operation inside the promise is successful, you call `resolve(value)`. If there's an error, you call `reject(reason)`.

### Chaining .then()s

Promises can be chained. Once a promise resolves, the resulting value can be used in the next `.then()`.

```javascript
fetch('https://api.example.com/data')
    .then(response => response.json())
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error('Error:', error);
    });
```

### Error Handling with .catch()

`.catch()` is a method on a promise that lets you handle the promise if it's rejected.

---

## Fetch API & Promises

`fetch()` returns a promise. It's modern and makes handling network requests easier.

**Reading Example with `fetch`**:

```javascript
fetch('https://api.example.com/data')
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error('There was a problem with the fetch operation:', error.message);
    });
```

# Activity: NASA API
[Get API Key](https://api.nasa.gov/)

## Conclusion

Asynchronous programming in JavaScript, whether through Ajax, Promises, or other methods, allows for non-blocking operations. This is crucial for improving user experience in web applications.

---

Certainly! Here's the homework assignment for retrieving and displaying the NASA image of the day:

---

## Homework Assignment: NASA Image of the Day

**Objective**: Use the `fetch()` API to retrieve the NASA Astronomy Picture of the Day and display it on a webpage along with its accompanying information.

### Instructions:

1. **API Key**:
   - Visit the [NASA API portal](https://api.nasa.gov/) to obtain your personal API key. Register for an account and request an API key for the `Astronomy Picture of the Day` service.
   
2. **Setting up the fetch request**:
   - With your API key, you will make a `GET` request to the following endpoint: `https://api.nasa.gov/planetary/apod?api_key=YOUR_API_KEY`
   - Replace `YOUR_API_KEY` with the actual key you obtained from NASA.

3. **Using the Response**:
   - The response from the NASA API is in JSON format. Use the `.json()` method on the fetch response to convert this data into a JavaScript object.
   - Extract the following fields from the JSON response:
     - `title`: The title of the image.
     - `url`: The URL of the image itself.
     - `explanation`: A description of the image.
     - `date`: The date the image was posted.

4. **Displaying the Image and Information**:
   - Create an HTML page with sections to display the image, its title, its description, and the date.
   - Use JavaScript to populate these sections with the appropriate data retrieved from the API.

### Example JSON Response:

```json
{
  "copyright": "Josep Drudis",
  "date": "2023-09-28",
  "explanation": "Ridges of glowing interstellar gas ... a massive young star.",
  "hdurl": "https://apod.nasa.gov/apod/image/2309/M8-Mos-SL10-DCPrgb-st-154-cC-cr.jpg",
  "media_type": "image",
  "service_version": "v1",
  "title": "The Deep Lagoon",
  "url": "https://apod.nasa.gov/apod/image/2309/M8-Mos-SL10-DCPrgb-st-154-cC-cr1024.jpg"
}
```

**Hint**: Remember to handle possible errors in your fetch request using `.catch()` or try/catch with async/await. You can use the `alert()` function to create a popup alert box with the error message.

Sure thing. Here's the expanded submission section:

---

### Submission:

**Requirements**:

- Your solution should be divided into two separate files:
  1. **HTML File**: This will contain the structure of your webpage.
  2. **JavaScript File**: This will contain the logic for fetching data from the NASA API and updating the DOM.

- **Linking the JavaScript File**:
   - Your JavaScript file should be linked in the HTML file. If your JavaScript file is named `script.js` and is in the same directory as your HTML file, you can link it as follows:

   ```html
   <script src="script.js" defer></script>
   ```

   Place this script tag right before the closing `</body>` tag in your HTML document. The `defer` attribute ensures that the script is executed after the HTML is parsed.

**How to Submit**:

1. Ensure that your HTML file has sections for displaying the image, its title, its description, and the date.
2. Ensure that your JavaScript file contains the logic to fetch the NASA image of the day, handle possible errors, and populate the HTML with the fetched data.
3. Submit both your HTML and JavaScript files for evaluation.

**Hint**: Make sure the path in the `src` attribute of the script tag correctly points to your JavaScript file. If you placed the JavaScript file in a folder, you'd need to include the folder name in the path, like so: `<script src="folderName/script.js" defer></script>`.

