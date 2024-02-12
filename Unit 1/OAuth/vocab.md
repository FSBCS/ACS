## OAuth 2.0 Vocabulary

Understanding the key terms and concepts in OAuth 2.0 is essential for working with this authorization framework. This glossary defines core elements and groups them into categories for better understanding.

Note: this list is not exhaustive and focuses on the most common terms and concepts in OAuth 2.0.

### Roles

* **Resource Owner:** The individual or entity granting access to their data (e.g., social media user, company with customer data).
* **Resource Server:** The server hosting the protected resources and validating access tokens.
* **Authorization Server:** The central authority issuing access tokens and verifying client requests (e.g., social media login service, company's authentication server).
* **Client:** The application requesting access to resources on behalf of the user (e.g., social media app, mobile app integrating with an API).
* **User Agent:** The software used by the resource owner to interact with the client (e.g., web browser, mobile app).

### Grant Types

* **Authorization Code Flow:** The most common and secure flow, involving user authorization and an authorization code exchanged for an access token. Suitable for web, mobile, and desktop applications.
* **Device Flow:** Enables authorization on devices without web browsers (e.g., smart TVs, IoT devices).
* **Client Credentials Grant:** Used for machine-to-machine authorization without user involvement, suitable for trusted internal applications.
* **Password Grant (Not recommended):** Employs username and password for authorization, but considered less secure due to credential exposure.
* **Implicit Grant (Outdated):** Returns the access token directly in the browser, raising security concerns. Use Authorization Code Flow instead.

**Additional Notes:**

* Refresh tokens can be obtained alongside access tokens to renew expired tokens without user re-authorization.
* The appropriate grant type depends on your application's security needs and data sensitivity.

### Tokens & Codes

* **Access Token:** A short-lived string authorizing access to specific resources, transmitted securely (e.g., via HTTPS).
* **Refresh Token:** A longer-lived token used to obtain new access tokens without requiring user re-authorization, stored securely due to its sensitive nature.
* **Authorization Code (Authorization Code Flow):** A temporary code exchanged for an access token.
* **ID Token (OpenID Connect):** A token containing user identity information, often in JWT format.
* **Device Code (Device Flow):** A code used to obtain access and refresh tokens in the device flow.
* **User Code (Device Flow):** A short-lived code displayed on the device for user input during device flow.

### Key Concepts

* **Front Channel vs. Back Channel:** Communication channels accessible to the user agent (front channel), usually passed through the browser address bar, or for secure communication over https (back channel).
* **Client ID & Secret:** Credentials identifying the client application to the authorization server.
* **Redirect URI:** The URL where the user is directed after authorization, often receiving an authorization code or access token.
* **Consent Screen:** A user interface for the resource owner to grant or deny access to their data.
* **Endpoints:** Authorization endpoint for user interaction, token endpoint for access token retrieval, and resource endpoint for accessing protected resources.
* **Scopes:** Permissions defining the extent of access granted to the client application (e.g., read-only, read-write).
* **Authorization Request & Access Token Request:** Messages containing necessary information for authorization and access token grant.
* **OpenID Connect (OIDC):** An extension for standardized user identity access through tokens.
* **JWT (JSON Web Token):** A compact, self-contained token format often used for access and identity tokens.

### Security Concerns
* **State Parameter:** A random value to prevent CSRF attacks by linking authorization requests and callbacks.
* **Nonce (OpenID Connect):** A unique value used to prevent replay attacks in OIDC.
* **PKCE (Proof Key for Code Exchange):** A security extension for public clients, preventing authorization code interception.