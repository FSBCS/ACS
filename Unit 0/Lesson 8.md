# JavaScript and the DOM

## Table of Contents

1. [HTML Crash Course](#html-crash-course)
2. [CSS "Crash Course" Overview](#css-crash-course-overview)
3. [Understanding the DOM](#understanding-the-dom)
4. [Basic DOM Selection](#basic-dom-selection)
5. [Modifying the DOM](#modifying-the-dom)
6. [Event Handling](#event-handling)

---

## Introduction to HTML

HTML (HyperText Markup Language) is the foundation of most web content. It provides the structure for the content displayed in the web browser.

### Basic Tags
- `<html>`: Wraps an entire document.
- `<head>`: Contains meta information and links to external resources.
- `<body>`: Contains the content of the web page.
- `<h1>`, `<h2>`,... `<h6>`: Heading tags.
- `<p>`: Paragraph tag.
- `<a>`: Anchor/link tag.
- `<img>`: Image tag.

### Attributes
- **href**: Specifies the URL of a linked resource.
- **src**: Specifies the source of embedded content, like an image.
- **alt**: Describes the content of an image (useful for accessibility).
- **class**: Specifies one or more class names for an element.

### Structure of an HTML Document
```html
<!DOCTYPE html>
<html>
<head>
    <title>Title of the document</title>
</head>

<body>
    The content of the document......
</body>
</html>
```

---

## CSS Crash Course

CSS (Cascading Style Sheets) determines how the content of a web page looks.

### Selectors, Properties, and Values
- **Selectors**: Determines which elements on the web page are selected to apply styles. E.g., `p`, `.classname`, `#idname`
- **Properties**: The style attribute you want to change. E.g., `color`, `font-size`, `margin`
- **Values**: The value you want to apply for the given property. E.g., `red`, `16px`, `2rem`

### Example Stylesheet
```css
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

h1 {
    color: blue;
}

p {
    font-size: 16px;
    color: #333;
}

.special-text {
    font-weight: bold;
    color: red;
}
```

---

## The DOM Explained

The DOM (Document Object Model) is a programming interface for HTML and XML documents. It represents the structure of a document as a tree of objects. Each object corresponds to a part of the document, such as an element or an attribute.

---

## Basic DOM Selection

To modify the content and the appearance of the web page, we first need to select the HTML elements using JavaScript. 

- **By ID**: `document.getElementById('id')`
- **By Class**: `document.getElementsByClassName('classname')`
- **By Tag Name**: `document.getElementsByTagName('tagname')`

---

## Modifying the DOM

## Modifying the DOM

Working with the DOM provides the flexibility to dynamically change the content, structure, and style of a webpage.

### InnerHTML vs TextContent

**innerHTML**:

- Allows you to get or replace the content (including HTML tags) of an element.
  
  ```javascript
  let content = element.innerHTML;  // Get content
  element.innerHTML = '<span>New content with HTML tags</span>';  // Set content
  ```

  ⚠️ **Warning**: Since innerHTML interprets string content as raw HTML, it can make your site vulnerable to cross-site scripting (XSS) attacks if not used carefully. Always sanitize the content you're adding to ensure it doesn't contain malicious code.

**textContent**:

- Only considers the text of an element (no HTML).
  
  ```javascript
  let text = element.textContent;  // Get text
  element.textContent = 'New plain text content';  // Set content
  ```

### Re-arranging Elements

To move or rearrange DOM elements:

**insertBefore()**:

This method moves an existing child element to a new position relative to another child within the same parent.

```javascript
const parent = document.getElementById('parent');
const child1 = document.getElementById('child1');
const child3 = document.getElementById('child3');

// This will move child3 before child1 within the same parent
parent.insertBefore(child3, child1);
```

**before()**:

Moves an existing child element to a position before another child.

```javascript
const child1 = document.getElementById('child1');
const child3 = document.getElementById('child3');

// Move child3 before child1
child1.before(child3);
```

**after()**:

Moves an existing child element to a position after another child.

```javascript
const child1 = document.getElementById('child1');
const child3 = document.getElementById('child3');

// Move child3 after child1
child1.after(child3);
```

### Changing Styles

#### Method: `element.style.property`

**Before**:
```html
<p id="styledText">I want to change color.</p>
```

**After**:
```javascript
let styledParagraph = document.getElementById('styledText');
styledParagraph.style.color = 'red';
```
```css
#styledText {
    color: red;
}
```

### Using `innerHTML`

#### Method: `element.innerHTML`

**Before**:
```html
<div id="contentDiv"></div>
```

**After**:
```javascript
let contentDiv = document.getElementById('contentDiv');
contentDiv.innerHTML = "<p>This is a <strong>new</strong> paragraph with embedded HTML.</p>";
```
```html
<div id="contentDiv">
    <p>This is a <strong>new</strong> paragraph with embedded HTML.</p>
</div>
```

---

## Event Handlers

JavaScript allows us to attach event listeners to HTML elements which can respond to various user interactions.

### Syntax:
```javascript
element.addEventListener('event', functionToBeExecuted);
```

### Example:
Imagine we have a button that we want to respond when clicked:
```html
<button id="myButton">Click me!</button>
```

Using JavaScript, we can add an event listener to this button:
```javascript
let btn = document.getElementById('myButton');
btn.addEventListener('click', function() {
    alert('Button was clicked!');
});
```

---

## Assignment: To-Do List Manager

Build a to-do list web application using HTML, CSS, and JavaScript that has the following features:

- An input field to add new to-do items
- A button to submit new to-do items
- Display a list of to-do items
- Each to-do item has a checkbox that can be clicked to mark it as complete
- Completed to-do items should be displayed with a line through the text
- A button next to each to-do item to remove it
- Apply some basic styling like fonts, colors, etc.

Make sure to structure the HTML, CSS, and JavaScript properly. JavaScript should handle adding, completing, and removing to-do items dynamically.

## Requirements

- HTML page with input, button, and unordered list elements
- CSS styles for completed to-do items
- JavaScript functions to add, remove, and toggle to-dos
- Store to-dos in a JavaScript array
- Render to-dos dynamically in the DOM
- Mark completed to-dos visually with CSS

## Bonus

- Add due dates for to-do items
- Allow sorting/filtering of to-dos