# Delphi Bookstore CRUD App

A desktop CRUD application for a bookstore built with Delphi, RAD Studio and MySQL.

## Installation

### 1. Clone the repository.

### 2. If you are using a x64 MySQL installation there is an incompatability with RAD Studio to resolve it put the libmySQL.dll file inside the lib folder to where your Embarcadero bin folder is located at (e.g. C:\Program Files (x86)\Embarcadero\Studio\23.0\bin).

### 3. Inside MySQL run the command: 
    ```sql
    ALTER USER 'your_username'@'your_host' IDENTIFIED WITH mysql_native_password BY 'yourpassword';
    FLUSH PRIVILEGES;

    ```
### Then you can run the application.