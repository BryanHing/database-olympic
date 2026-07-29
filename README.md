# Olympic Games Database

A MySQL database project for storing and querying Olympic games, events,
countries, participants, teams, participation records, and medals.

## Contents

- `implementation.sql` creates the database, tables, and sample records.
- `functionality.sql` adds stored procedures, views, and indexes.
- `question.sql` contains analytical queries.
- `mysql_connect.py` provides a command-line interface for viewing and
  modifying records.
- `.drawio` files contain the data model and entity-relationship diagrams.
- The PDF files contain the project report and user guide.

## Setup

1. Install MySQL Server, Python, and the Python dependency:

   ```powershell
   python -m pip install -r requirements.txt
   ```

2. Run `implementation.sql`, followed by `functionality.sql`, using MySQL
   Workbench or the MySQL command-line client.

3. Set your local MySQL credentials in PowerShell:

   ```powershell
   $env:MYSQL_HOST = "localhost"
   $env:MYSQL_DATABASE = "OlympicGames_22488400"
   $env:MYSQL_USER = "your_mysql_user"
   $env:MYSQL_PASSWORD = "your_mysql_password"
   ```

4. Start the command-line application:

   ```powershell
   python mysql_connect.py
   ```

Database credentials are read from environment variables and must not be
committed to the repository.
