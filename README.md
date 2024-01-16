# Household-Service-Provider

A similar web application(api based) like sheba.xyz

## Project descripton

User can book for household related service.

A group project developed by four team members.

Four types of users: 1. Admin, 2. Manager 3. Staff(M A Mohit Khan) & 4. Customer.
Switch to the kemono_koda branch to check Staff's service code.

## Prerequisites

Make sure you have the following software installed on your machine:

- [XAMPP](https://www.apachefriends.org/index.html) or [LAMP](https://bitnami.com/stack/lamp)
- [Composer](https://getcomposer.org/)
- [MySQL](https://dev.mysql.com/downloads/mysql/) or [phpMyAdmin](https://www.phpmyadmin.net/)
- [Postman](https://www.postman.com/)

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/laravel-api-project.git
    ```

2. Move the project to the appropriate directory:

   For XAMPP (on Windows, typically in the `htdocs` folder):

    ```bash
    move laravel-api-project C:\xampp\htdocs\
    ```

   For LAMP (on Linux, typically in the `/var/www/html` folder):

    ```bash
    mv laravel-api-project /var/www/html/
    ```

3. Install Composer dependencies:

    ```bash
    cd laravel-api-project
    composer install
    ```

4. Copy the `.env.example` file to `.env` and configure the database settings:

    ```bash
    cp .env.example .env
    ```

    Update the `.env` file with your MySQL or phpMyAdmin database connection details.

5. Generate the application key:

    ```bash
    php artisan key:generate
    ```

6. Run the database migrations and seeders:

    ```bash
    php artisan migrate --seed
    ```

## MySQL Database Setup

1. Open phpMyAdmin:

    ```url
    http://localhost/phpmyadmin/
    ```

2. Create a new database:

    - Click on the "Databases" tab.
    - Enter a database name (e.g., `laravel_api_db`) and click "Create."

3. Update the project configuration:

    - Open the project's `.env` file.
    - Update the `DB_DATABASE`, `DB_USERNAME`, and `DB_PASSWORD` fields with your MySQL database details.

## Usage

1. Start your XAMPP or LAMP server.


Certainly! Below are additional steps in your README.md to guide users on testing the Laravel API project using Postman.

markdown
Copy code
# Laravel API Project

This is a sample Laravel API project.

## Prerequisites

Make sure you have the following software installed on your machine:

- [XAMPP](https://www.apachefriends.org/index.html) or [LAMP](https://bitnami.com/stack/lamp)
- [Composer](https://getcomposer.org/)
- [MySQL](https://dev.mysql.com/downloads/mysql/) or [phpMyAdmin](https://www.phpmyadmin.net/)
- [Postman](https://www.postman.com/)

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/laravel-api-project.git
    ```

2. Move the project to the appropriate directory:

   For XAMPP (on Windows, typically in the `htdocs` folder):

    ```bash
    move laravel-api-project C:\xampp\htdocs\
    ```

   For LAMP (on Linux, typically in the `/var/www/html` folder):

    ```bash
    mv laravel-api-project /var/www/html/
    ```

3. Install Composer dependencies:

    ```bash
    cd laravel-api-project
    composer install
    ```

4. Copy the `.env.example` file to `.env` and configure the database settings:

    ```bash
    cp .env.example .env
    ```

    Update the `.env` file with your MySQL or phpMyAdmin database connection details.

5. Generate the application key:

    ```bash
    php artisan key:generate
    ```

6. Run the database migrations and seeders:

    ```bash
    php artisan migrate --seed
    ```

## MySQL Database Setup

1. Open phpMyAdmin:

    ```url
    http://localhost/phpmyadmin/
    ```

2. Create a new database:

    - Click on the "Databases" tab.
    - Enter a database name (e.g., `laravel_api_db`) and click "Create."

3. Update the project configuration:

    - Open the project's `.env` file.
    - Update the `DB_DATABASE`, `DB_USERNAME`, and `DB_PASSWORD` fields with your MySQL database details.

## Usage

1. Start your XAMPP or LAMP server.

2. Open your web browser and navigate to the following URL:

    For XAMPP:

    ```url
    http://localhost/Household-Service-Provider/public/
    ```

    For LAMP:

    ```url
    http://localhost/Household-Service-Provider/public/
    ```


3. You should see the Laravel API project running.

## Testing with Postman

1. Open Postman and import the provided collection file:

    [Laravel API Collection](./postman/Laravel_API_Collection.json)

2. Set up the necessary environment variables:

    - Open the "Manage Environments" window.
    - Add a new environment with variables like `base_url` and `token` if needed.
    - Set the `base_url` variable to your API endpoint (e.g., `http://localhost/Household-Service-Provider/public/api`).

3. Run the requests in the imported collection to test different API endpoints.

## Configuration

- Ensure that your server (XAMPP or LAMP) is running and configured correctly.
- Check the project configuration files, especially `.env`, for any specific settings.
