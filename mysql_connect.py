import os

import mysql.connector
from mysql.connector import Error

def create_connection():
    """ Establish a connection to the MySQL database. """
    user = os.getenv("MYSQL_USER")
    password = os.getenv("MYSQL_PASSWORD")
    if not user or not password:
        raise RuntimeError(
            "Set MYSQL_USER and MYSQL_PASSWORD before running this program."
        )

    try:
        conn = mysql.connector.connect(
            host=os.getenv("MYSQL_HOST", "localhost"),
            database=os.getenv("MYSQL_DATABASE", "OlympicGames_22488400"),
            user=user,
            password=password,
        )
        if conn.is_connected():
            print('Successfully connected to the MySQL database.')
            return conn
    except Error as e:
        print(f"Connection error: {e}")
    return None

def list_tables(conn):
    """ Retrieve and display all tables in the database. """
    cursor = conn.cursor()
    cursor.execute("SHOW TABLES;")
    tables = cursor.fetchall()
    print("\nTables in the database:")
    for table in tables:
        print(f"- {table[0]}")
    cursor.close()

def display_records(conn, table):
    """ Display all records from a specified table. """
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {table};")
    records = cursor.fetchall()
    
    # Print column names
    column_names = [i[0] for i in cursor.description]
    print("\n" + " | ".join(column_names))
    print("-" * (len(" | ".join(column_names))))
    
    # Print records
    for record in records:
        print(" | ".join(str(value) for value in record))
    cursor.close()

def add_record(conn, table):
    """ Insert a new record into a specified table. """
    cursor = conn.cursor()
    cursor.execute(f"DESCRIBE {table};")
    columns = [col[0] for col in cursor.fetchall()]
    
    values = []
    for column in columns:
        value = input(f"Enter value for {column}: ")
        values.append(value)
    
    query = f"INSERT INTO {table} ({', '.join(columns)}) VALUES ({', '.join(['%s'] * len(columns))});"
    cursor.execute(query, tuple(values))
    conn.commit()
    print("Record added successfully.")
    cursor.close()

def modify_record(conn, table):
    """ Update an existing record in a specified table. """
    cursor = conn.cursor()
    cursor.execute(f"SHOW KEYS FROM {table} WHERE Key_name = 'PRIMARY';")
    primary_key = cursor.fetchone()[4]
    
    pk_value = input(f"Enter {primary_key} of the record to update: ")
    
    cursor.execute(f"DESCRIBE {table};")
    columns = [col[0] for col in cursor.fetchall() if col[0] != primary_key]
    
    print("Columns available for update:")
    for idx, column in enumerate(columns, start=1):
        print(f"{idx}. {column}")
    
    column_choice = int(input("Select the column number to update: ")) - 1
    column_to_update = columns[column_choice]
    new_value = input(f"Enter new value for {column_to_update}: ")
    
    query = f"UPDATE {table} SET {column_to_update} = %s WHERE {primary_key} = %s;"
    cursor.execute(query, (new_value, pk_value))
    conn.commit()
    print("Record updated successfully.")
    cursor.close()

def remove_record(conn, table):
    """ Delete a record from a specified table. """
    cursor = conn.cursor()
    cursor.execute(f"SHOW KEYS FROM {table} WHERE Key_name = 'PRIMARY';")
    primary_key = cursor.fetchone()[4]
    
    pk_value = input(f"Enter {primary_key} of the record to delete: ")
    
    query = f"DELETE FROM {table} WHERE {primary_key} = %s;"
    cursor.execute(query, (pk_value,))
    conn.commit()
    
    if cursor.rowcount > 0:
        print("Record deleted successfully.")
    else:
        print("No record found with that identifier.")
    cursor.close()

def main_menu(conn):
    """ Main menu for user interaction. """
    while True:
        print("\nMain Menu:")
        print("1. List all tables")
        print("2. View records from a table")
        print("3. Insert a new record")
        print("4. Update an existing record")
        print("5. Delete a record")
        print("0. Exit")
        
        choice = input("Choose an option: ")
        
        if choice == '1':
            list_tables(conn)
        elif choice == '2':
            table_name = input("Enter the table name to view records: ")
            display_records(conn, table_name)
        elif choice == '3':
            table_name = input("Enter the table name to insert a record: ")
            add_record(conn, table_name)
        elif choice == '4':
            table_name = input("Enter the table name to update a record: ")
            modify_record(conn, table_name)
        elif choice == '5':
            table_name = input("Enter the table name to delete a record: ")
            remove_record(conn, table_name)
        elif choice == '0':
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    conn = create_connection()
    if conn is not None:
        main_menu(conn)
        conn.close()
        print("MySQL connection is closed")
    else:
        print("Failed to connect to the database.")
