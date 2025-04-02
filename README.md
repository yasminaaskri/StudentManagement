# Student Management System

## Overview
This project is a **Student Management System** built using **Spring Boot (Jersey for REST API)** and **JSP with JSTL** for the frontend. The system allows users to manage student records, including:
- Listing all students
- Adding new students
- Editing student details
- Deleting students
- Searching for students by name or surname

## Technologies Used
- **Backend:** Spring Boot, Jersey (JAX-RS)
- **Frontend:** JSP, JSTL, Bootstrap
- **Database:** H2 (or any JPA-supported database)
- **Build Tool:** Maven

## Features
### 1. **Student CRUD Operations**
- **Create:** Add a new student.
- **Read:** View a list of all students.
- **Update:** Modify student details.
- **Delete:** Remove a student from the system.

### 2. **Search Functionality**
- Users can search for students by name or surname using an AJAX-powered search bar.

### 3. **REST API Endpoints**
- `GET /api/students` - Retrieve all students.
- `GET /api/students/{id}` - Retrieve a student by ID.
- `POST /api/students` - Add a new student.
- `PUT /api/students/{id}` - Update student details.
- `DELETE /api/students/{id}` - Remove a student.
- `GET /api/students/search/{term}` - Search students by name or surname.

## Project Structure
```
student-management/
├── src/
│   ├── main/
│   │   ├── java/com/esgitech/restclient/
│   │   │   ├── controller/
│   │   │   │   ├── ViewController.java
│   │   │   │   ├── StudentRest.java
│   │   │   ├── entity/
│   │   │   │   ├── Student.java
│   │   │   ├── repository/
│   │   │   │   ├── StudentRep.java
│   │   │   ├── JerseyConfig.java
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   ├── webapp/WEB-INF/views/
│   │   │   ├── index.jsp
│   │   │   ├── create.jsp
│   │   │   ├── edit.jsp
├── pom.xml
├── README.md
```

## Installation & Running the Project
### 1. **Clone the Repository**
```bash
git clone https://github.com/your-repo/student-management.git
cd student-management
```

### 2. **Configure the Database (H2 Default)**
The project is pre-configured with H2 in-memory database. If you want to use another database, update `application.properties`:
```properties
spring.datasource.url=jdbc:h2:mem:testdb
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
```

### 3. **Run the Application**
```bash
mvn spring-boot:run
```
The server will start on `http://localhost:8087`

### 4. **Access the Application**
- **Student List:** `http://localhost:8087/view/`
- **Add Student:** `http://localhost:8087/view/create`
- **Edit Student:** `http://localhost:8087/view/edit?id={id}`

## API Testing with Postman
Use Postman or any REST client to test API endpoints. Example for updating a student:
```json
PUT http://localhost:8087/api/students/2
{
    "nom": "Ben Salah",
    "prenom": "Mohamed"
}
```
## Screenshots

### Home Page

![Capture d'écran 2025-04-02 162037](https://github.com/user-attachments/assets/12d63507-e681-4e08-9045-a9914dd89bc2)

### Add Student
![Capture d'écran 2025-04-02 162053](https://github.com/user-attachments/assets/1b77ab15-57aa-4e81-bfde-af102bfcde80)
![Capture d'écran 2025-04-02 162111](https://github.com/user-attachments/assets/801cade6-becb-4e25-96dc-9fceca1a5640)

### Edit Student
![Capture d'écran 2025-04-02 162134](https://github.com/user-attachments/assets/7d91a816-3c7c-4fbf-94c0-dbca686e7003)
![Capture d'écran 2025-04-02 162147](https://github.com/user-attachments/assets/9a0b901d-88c3-4276-875f-af4960804031)


## Future Enhancements
- User authentication & role-based access
- Pagination for large student lists
- Exporting student data (CSV, PDF)
- Unit and integration tests

## License
This project is open-source and available under the **MIT License**.

---
