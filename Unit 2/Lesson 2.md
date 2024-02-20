## Lesson 2: Building Your Flask API - Routes & HTTP Methods

**I. RESTful API Design & Flask Routes**

In this lesson, we dive deeper into building your Flask API, focusing on defining routes and using different HTTP methods effectively. Remember, we strive for well-structured APIs that align with the principles of REST (Representational State Transfer).

**RESTful Principles:**

* **Stateless:** Each request to your API should be complete in itself, without relying on information from previous requests. This ensures scalability and fault tolerance.
* **Resources:** Data within your API is represented as resources, accessed through unique URLs. For example, individual users might be accessed at `/users/1` and `/users/2`.
* **Standardized Methods:** Specific HTTP methods are used for different operations:
    * `GET`: Retrieve data from a resource (e.g., get all users from `/users`).
    * `POST`: Create a new resource (e.g., create a new user by sending data to `/users`).
    * `PUT`: Update an existing resource (e.g., update user details at `/users/1`).
    * `DELETE`: Delete a resource (e.g., delete user `/users/1`).

**Flask Routes with `@app.route`:**

Flask uses the `@app.route` decorator to define mappings between URLs and Python functions in your application. This tells Flask how to handle incoming requests based on the requested URL. By specifying the HTTP methods within the decorator, you can control which methods are allowed for each route:

```python
@app.route("/users", methods=["GET"])
def get_users():
  # Fetch user data from your database
  # ...
  return jsonify(users)

@app.route("/users/<int:user_id>", methods=["GET"])
def get_user(user_id):
  # Find user by ID in your database
  # ...
  return jsonify(user)

@app.route("/users", methods=["POST"])
def create_user():
  # Access data from the request body (e.g., JSON)
  # ...
  # Create new user in your database
  # ...
  return jsonify(new_user), 201  # Status code for created resource
```

**II. Understanding HTTP Methods**

Now let's explore the most common HTTP methods used in APIs and their purposes:

* **GET:** Used to retrieve data from a resource. Typically, the data is returned in the response body as JSON or another format.
* **POST:** Used to create a new resource. The data for the new resource is usually sent in the request body (e.g., JSON payload). Upon successful creation, a status code of 201 (Created) is returned.
* **PUT:** Used to update an existing resource. The updated data is sent in the request body, and the entire resource is replaced. A status code of 200 (OK) is returned for successful updates.
* **DELETE:** Used to permanently remove a resource. The resource identifier (e.g., user ID) is typically included in the URL. A status code of 204 (No Content) indicates successful deletion.

**Additional HTTP methods (optional):**

* **PATCH:** Used for partial updates of a resource.
* **OPTIONS:** Used to retrieve information about the supported HTTP methods for a specific resource.

**III. Handling Request Data in Your API**

Your API needs to handle different types of data sent from clients:

* **Query Parameters:** Key-value pairs appended to the URL after a question mark (e.g., `/users?limit=10`). Access their values using `request.args.get("key")`.
* **Form Data:** Data submitted from HTML forms. Values are available through `request.form.get("field_name")`.
* **JSON Payloads:** Data sent in JSON format in the request body. Use `request.get_json()` to parse and access the data as a Python dictionary.

Remember to validate and handle invalid data appropriately to ensure the security and robustness of your API.

**IV. Returning Responses with Status Codes and Data Formats**

The response sent back by your API should include informative status codes and data formats:

* **Status Codes:** These three-digit codes indicate the outcome of the request:
    * **200 OK:** Successful request and response.
    * **400 Bad Request:** Invalid data sent in the request.
    * **404 Not Found:** The requested resource cannot be found.
    * **500 Internal Server Error:** An unexpected error occurred on the server.
* **Data Formats:** Choose the format based on the API's purpose and expected client:
    * **JSON:** The most common format for APIs due to its flexibility and ease of parsing by various clients. Use `jsonify` to convert Python data structures to JSON format for the response.
    * **Text:** Suitable for simple responses like plain text messages or error messages.
    * **XML:** Less common in modern APIs but still used in specific situations.
    * **Custom formats:** For specialized use cases, define your own data format and implement parsing/serialization logic.

**V. Practical Examples & Exercises**

Now it's time to get your hands dirty with some practical examples:

* **Build a Simple User Management API:**
    * Implement a GET route to retrieve all users (`/users`).
    * Create a POST route to create new users (`/users`).
    * Implement a PUT route to update existing user details (`/users/<user_id>`).
    * Add a DELETE route to remove users (`/users/<user_id>`).
    * Handle different data formats (e.g., JSON for POST requests).
    * Implement error handling for invalid data or missing resources.
* **Explore Flask Extensions:**
    * Consider using extensions like Flask-RESTful to simplify API development. It provides pre-built decorators and classes for common API functionalities, saving you development time.

**Here are some additional resources for further learning:**

* Flask Documentation: [https://flask.palletsprojects.com/en/2.2.x/](https://flask.palletsprojects.com/en/2.2.x/)
* Flask-RESTful Documentation: [https://flask-restful.readthedocs.io/en/latest/](https://flask-restful.readthedocs.io/en/latest/)
* HTTP Methods Explained: [https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)