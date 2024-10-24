# Service-booking-Web-Application 📚
This is a web application developed for the course Servicios y Sistemas Web (Web Services and Systems) of 3rd year. The goal of the project is to provide a booking system, possibly for managing reservations or appointments, depending on the specific context of the assignment.

## Features ✨
- User authentication and role-based access control.
- CRUD operations for bookings.
- Real-time data synchronization.

## Requirements 📋
- ☕ Java (JDK 8 or higher)
- 📦 Apache Maven
- 🐬 MySQL (or another SQL database)
- 🛠️ IDE with Maven support (e.g., Visual Studio Code, IntelliJ IDEA)

## Installation 🚀 
1. Clone the repository:
```Bash
git clone https://github.com/DecoXFE/Service-booking-Web-Application.git
cd Service-booking-Web-Application
```
2. Setup the database:
```Bash
mysql -u your_username -p your_database < quickbook.sql
```
3. Build the project:
```Bash
mvn clean install
```
4. Run the project:<br>
After building, deploy the project using your preferred server (Tomcat, Jetty, etc.) or run it directly from your IDE.

## Usage
Once the application is running, you can access it via your web browser at http://localhost:8080/Service-booking-Web-Application (or the configured port). The system allows users to manage bookings and reservations in a user-friendly interface.

## Authors ✍️
Diego Valladolid, Kevin Sánchez, Adrian Sanz y Joana Andrea
