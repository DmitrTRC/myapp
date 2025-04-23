# API Requirements for Patrol Assistant Application

This document outlines the API requirements for the Patrol Assistant application, covering various functionalities and data entities.

## 1. Authentication

### 1.1. Login

-   **Endpoint:** `/auth/login`
-   **Method:** `POST`
-   **Request Body (JSON):**
```
json
    {
        "username": "string",
        "password": "string"
    }
    
```
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "token": "string",
            "user_id": "integer"
        }
        
```
-   **Error (401 Unauthorized):**
```
json
        {
            "error": "string"
        }
        
```
### 1.2. Logout

-   **Endpoint:** `/auth/logout`
-   **Method:** `POST`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "message": "string"
        }
        
```
-   **Error (401 Unauthorized):**
```
json
        {
            "error": "string"
        }
        
```
## 2. Users

### 2.1. Create User

-   **Endpoint:** `/users`
-   **Method:** `POST`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "name": "string",
        "role": "string",
        "group_id": "integer",
        "contacts": "string",
        "username": "string",
        "password": "string"
    }
    
```
-   **Response (JSON):**
    -   **Success (201 Created):**
```
json
        {
            "id": "integer",
            "name": "string",
            "role": "string",
            "group_id": "integer",
            "contacts": "string"
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 2.2. Get User

-   **Endpoint:** `/users/{user_id}`
-   **Method:** `GET`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "id": "integer",
            "name": "string",
            "role": "string",
            "group_id": "integer",
            "contacts": "string"
        }
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
### 2.3. Update User

-   **Endpoint:** `/users/{user_id}`
-   **Method:** `PUT`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "name": "string",
        "role": "string",
        "group_id": "integer",
        "contacts": "string"
    }
    
```
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "id": "integer",
            "name": "string",
            "role": "string",
            "group_id": "integer",
            "contacts": "string"
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 2.4. Delete User

-   **Endpoint:** `/users/{user_id}`
-   **Method:** `DELETE`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "message": "string"
        }
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
### 2.5. Get All Users

-   **Endpoint:** `/users`
-   **Method:** `GET`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        [
          {
              "id": "integer",
              "name": "string",
              "role": "string",
              "group_id": "integer",
              "contacts": "string"
          }
        ]
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
## 3. Groups

### 3.1. Create Group

-   **Endpoint:** `/groups`
-   **Method:** `POST`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "name": "string",
        "administrative_location": "string",
        "supervisory_authority": "string"
    }
    
```
-   **Response (JSON):**
    -   **Success (201 Created):**
```
json
        {
            "id": "integer",
            "name": "string",
            "administrative_location": "string",
            "supervisory_authority": "string"
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 3.2. Get Group

-   **Endpoint:** `/groups/{group_id}`
-   **Method:** `GET`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "id": "integer",
            "name": "string",
            "administrative_location": "string",
            "supervisory_authority": "string"
        }
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
### 3.3. Update Group

-   **Endpoint:** `/groups/{group_id}`
-   **Method:** `PUT`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "name": "string",
        "administrative_location": "string",
        "supervisory_authority": "string"
    }
    
```
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "id": "integer",
            "name": "string",
            "administrative_location": "string",
            "supervisory_authority": "string"
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 3.4. Delete Group

-   **Endpoint:** `/groups/{group_id}`
-   **Method:** `DELETE`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "message": "string"
        }
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
### 3.5. Get All Groups

-   **Endpoint:** `/groups`
-   **Method:** `GET`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        [
          {
              "id": "integer",
              "name": "string",
              "administrative_location": "string",
              "supervisory_authority": "string"
          }
        ]
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
## 4. Messages

### 4.1. Send Message

-   **Endpoint:** `/messages`
-   **Method:** `POST`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "sender_id": "integer",
        "group_id": "integer",
        "content": "string",
        "priority": "string",
        "attachments": ["string"]
    }
    
```
-   **Response (JSON):**
    -   **Success (201 Created):**
```
json
        {
            "id": "integer",
            "sender_id": "integer",
            "group_id": "integer",
            "content": "string",
            "timestamp": "string",
            "priority": "string",
            "attachments": ["string"]
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 4.2. Get Messages by Group

-   **Endpoint:** `/messages/group/{group_id}`
-   **Method:** `GET`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        [
            {
                "id": "integer",
                "sender_id": "integer",
                "group_id": "integer",
                "content": "string",
                "timestamp": "string",
                "priority": "string",
                "attachments": ["string"]
            }
        ]
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
### 4.3. Update Message

-   **Endpoint:** `/messages/{message_id}`
-   **Method:** `PUT`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "content": "string",
        "priority": "string",
        "attachments": ["string"]
    }
    
```
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "id": "integer",
            "sender_id": "integer",
            "group_id": "integer",
            "content": "string",
            "timestamp": "string",
            "priority": "string",
            "attachments": ["string"]
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 4.4. Delete Message

-   **Endpoint:** `/messages/{message_id}`
-   **Method:** `DELETE`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "message": "string"
        }
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
## 5. Incidents

### 5.1. Create Incident

-   **Endpoint:** `/incidents`
-   **Method:** `POST`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "text": "string",
        "location": "string",
        "attachments": ["string"]
    }
    
```
-   **Response (JSON):**
    -   **Success (201 Created):**
```
json
        {
            "id": "integer",
            "timestamp": "string",
            "text": "string",
            "location": "string",
            "attachments": ["string"]
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 5.2. Get Incident

-   **Endpoint:** `/incidents/{incident_id}`
-   **Method:** `GET`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "id": "integer",
            "timestamp": "string",
            "text": "string",
            "location": "string",
            "attachments": ["string"]
        }
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
### 5.3. Update Incident

-   **Endpoint:** `/incidents/{incident_id}`
-   **Method:** `PUT`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "text": "string",
        "location": "string",
        "attachments": ["string"]
    }
    
```
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "id": "integer",
            "timestamp": "string",
            "text": "string",
            "location": "string",
            "attachments": ["string"]
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 5.4. Delete Incident

-   **Endpoint:** `/incidents/{incident_id}`
-   **Method:** `DELETE`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "message": "string"
        }
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
### 5.5. Get All Incidents

-   **Endpoint:** `/incidents`
-   **Method:** `GET`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        [
           {
                "id": "integer",
                "timestamp": "string",
                "text": "string",
                "location": "string",
                "attachments": ["string"]
            }
        ]
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
## 6. Notifications

### 6.1. Send Notification

-   **Endpoint:** `/notifications`
-   **Method:** `POST`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "user_ids": ["integer"],
        "group_ids": ["integer"],
        "message": "string",
        "type": "string"
    }
    
```
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "message": "string"
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
## 7. Background Information

### 7.1. Get All Background Info

-   **Endpoint:** `/background-info`
-   **Method:** `GET`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        [
            {
                "id": "integer",
                "title": "string",
                "content": "string"
            }
        ]
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
### 7.2. Get Background Info

-   **Endpoint:** `/background-info/{info_id}`
-   **Method:** `GET`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "id": "integer",
            "title": "string",
            "content": "string"
        }
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
### 7.3. Create Background Info

-   **Endpoint:** `/background-info`
-   **Method:** `POST`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
        {
            "title": "string",
            "content": "string"
        }
    
```
-   **Response (JSON):**
    -   **Success (201 Created):**
```
json
        {
            "id": "integer",
            "title": "string",
            "content": "string"
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 7.4. Update Background Info

-   **Endpoint:** `/background-info/{info_id}`
-   **Method:** `PUT`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
        {
            "title": "string",
            "content": "string"
        }
    
```
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "id": "integer",
            "title": "string",
            "content": "string"
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 7.5. Delete Background Info

-   **Endpoint:** `/background-info/{info_id}`
-   **Method:** `DELETE`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "message": "string"
        }
        
```
-   **Error (404 Not Found):**
```
json
        {
            "error": "string"
        }
        
```
## 8. Reports

### 8.1. Generate Report

-   **Endpoint:** `/reports`
-   **Method:** `POST`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "start_date": "string (YYYY-MM-DD)",
        "end_date": "string (YYYY-MM-DD)",
        "format": "string (MS Word/PDF/Markdown)"
    }
    
```
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
            "report_url": "string"
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
            "error": "string"
        }
        
```
### 8.2 Send report to Email

-   **Endpoint:** `/reports/send-email`
-   **Method:** `POST`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
    {
        "report_url": "string",
        "email": "string",
        "subject": "string",
        "body": "string"
    }
    
```
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
           "message": "string"
        }
        
```
-   **Error (400 Bad Request):**
```
json
        {
           "error": "string"
        }
        
```
## 9. Data synchronization

### 9.1. Data synchronization

-   **Endpoint:** `/sync`
-   **Method:** `POST`
-   **Headers:**
    -   `Authorization: Bearer <token>`
-   **Request Body (JSON):**
```
json
        {
            "users": [{"id": "integer", "name": "string", "role": "string", "group_id": "integer", "contacts": "string"}],
            "groups": [{"id": "integer", "name": "string", "administrative_location": "string", "supervisory_authority": "string"}],
            "messages": [{"id": "integer", "sender_id": "integer", "group_id": "integer", "content": "string", "timestamp": "string", "priority": "string", "attachments": ["string"]}],
            "incidents": [{"id": "integer", "timestamp": "string", "text": "string", "location": "string", "attachments": ["string"]}],
            "backgroundInfo":[{"id": "integer", "title": "string", "content": "string"}]
        }
    
```
-   **Response (JSON):**
    -   **Success (200 OK):**
```
json
        {
           "message": "string"
        }
        
```
-   **Error (400 Bad Request):**