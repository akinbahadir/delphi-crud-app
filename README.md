# Delphi Bookstore CRUD App

A desktop CRUD application for a bookstore built with Delphi, RAD Studio and MySQL.

## Installation

### 1. Clone the repository

### 2. Database Configuration

This application connects to a MySQL database using FireDAC components in RAD Studio.

Before running the app, make sure to create the database 

```sql
CREATE DATABASE mybooks;
USE mybooks;
```
Then import the `mybooks_books.sql` file inside the `database` folder using MySQL Workbench or shell. Afterwards update the connection settings in the project:

- Open the project in RAD Studio
- Select the `TFDConnection` component on the main form
- Set the parameters such as `Database`, `User_Name`, `Password`, `Server` and `Port` to match your MySQL server configuration

### 3. Fix for MySQL Incompatibility 
- If you are using a 64-bit MySQL installation there is an incompatibility issue with RAD Studio, to resolve it put the libmySQL.dll (x86) file inside the `lib` folder to where your Embarcadero bin folder is located at (e.g. C:\Program Files (x86)\Embarcadero\Studio\23.0\bin).

- Inside MySQL Workbench run the command: 
    ```sql
    ALTER USER 'your_username'@'your_host' IDENTIFIED WITH mysql_native_password BY 'yourpassword';
    FLUSH PRIVILEGES;

    ```
### Then run the application.