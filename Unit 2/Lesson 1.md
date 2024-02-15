## Lesson 1: Introduction to Flask & Web Development

**I. Understanding Web Development & APIs**

* **Web Development:**
    * Building the "behind-the-scenes" logic of websites and applications.
    * Back-end (Flask): Handles data, processes requests, and generates responses.
    * Front-end (HTML, CSS, JavaScript): Creates the user interface and interactive elements.
* **APIs (Application Programming Interfaces):**
    * Sets of rules and tools for interacting with software components.
    * Enables programs to communicate and exchange data with each other.
    * Used in virtually all modern web applications and mobile apps.
    * RESTful APIs follow standardized design principles for consistency and ease of use.

**II. Why Choose Flask?**

* **Lightweight & Flexible:** Designed for simplicity and ease of use.
* **Pythonic:** Leverages the strengths and syntax of the Python programming language.
* **Community-Driven:** Large and active community with extensive resources and support.
* **Versatile:** Used for various applications, from simple APIs to complex web services.

**III. Setting Up Your Environment**

* **Virtual Environments:**
    * Isolate project dependencies and prevent conflicts with other Python installations.
    * Recommended practice for professional development.
* **Installation Steps:**
    1. Install Python ([https://www.python.org/](https://www.python.org/)).
    2. Install `virtualenv` using pip: `pip install virtualenv`
    3. Create a virtual environment for your project: `virtualenv my_flask_env`
    4. Activate the virtual environment: `source my_flask_env/bin/activate` (Windows: `my_flask_env\Scripts\activate`)
    5. Install Flask inside the virtual environment: `pip install Flask`

**IV. Your First Flask Application: Hello, World!**

* **Flask Structure:**
    * `app`: The core object representing your Flask application.
    * `@app.route`: Decorator defining routing rules between URLs and functions.
    * Functions: Handle specific requests and generate responses.
* **Code Example:**

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
  return "Hello, World!"

if __name__ == "__main__":
  app.run(debug=True)
```

* **Explanation:**
    * `app = Flask(__name__)` creates a Flask application instance.
    * `@app.route("/")` defines a route for the root URL (`/`).
    * `hello_world()` function returns the response ("Hello, World!").
    * `if __name__ == "__main__":` ensures the code runs only when the script is executed directly.
    * `app.run(debug=True)` starts the development server and automatically reloads the application on code changes.

**V. Exploring Routes & HTTP Methods**

* **HTTP Methods:**
    * GET: Used to retrieve data from a server (e.g., accessing a web page).
    * POST: Used to send data to a server (e.g., submitting a form).
    * PUT: Used to update existing data on a server.
    * DELETE: Used to remove data from a server.

* **Flask Routes:**
    * `@app.route("/about")` defines a route for the URL "/about".
    * Can also specify HTTP methods: `@app.route("/greet", methods=["POST"])`.

* **Code Examples:**

```python
@app.route("/about")
def about():
  return "This is the about page."

@app.route("/greet", methods=["POST"])
def greet():
  name = request.form["name"]  # Access data from submitted form
  return f"Hello, {name}!"
```