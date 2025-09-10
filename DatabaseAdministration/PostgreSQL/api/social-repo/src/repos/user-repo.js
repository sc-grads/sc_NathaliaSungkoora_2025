// Import the database connection pool to interact with the PostgreSQL database
const pool = require('../pool');
const toCamelCase = require('./utils/to-camel-case');

// Define a class called UserRepo to handle database operations for the "users" table
class UserRepo {
  // A static method to get all users from the database
  // "static" means you can call this method without creating an instance of UserRepo
  static async find() {
    // Query the database to select all rows from the "users" table
    // pool.query sends the SQL query and returns the result
    const { rows } = await pool.query('SELECT * FROM users;');

    // Return the array of user records from the database
    return toCamelCase(rows);
  }

  // A method to find a user by their ID (not implemented yet)
  static async findById(id) {
    //WARNING: REALLY BIG SECURITY ISSUE HERE!
    const { rows } = await pool.query(`
        SELECT * FROM users WHERE id = ${id};
    `);
    return toCamelCase(rows)[0];
  } 

  // A method to add a new user to the database (not implemented yet)
  static async insert() {}

  // A method to update an existing user in the database (not implemented yet)
  static async update() {}

  // A method to delete a user from the database (not implemented yet)
  static async delete() {}
}

// Export the UserRepo class so it can be used in other parts of the application
module.exports = UserRepo;