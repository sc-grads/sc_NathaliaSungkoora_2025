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

  // A method to find a user by their ID )
  static async findById(id) {

    const { rows } = await pool.query(`
        SELECT * FROM users WHERE id = $1;`, [id]
    );
    return toCamelCase(rows)[0];
  } 

  // A method to add a new user to the database 
    static async insert(username, bio) {
      const {
        rows,
      } = await pool.query(
        'INSERT INTO users (username, bio) VALUES ($1, $2) RETURNING *;',
        [username, bio]
      );
  
      return toCamelCase(rows)[0];
    }

  // A method to update an existing user in the database 
    static async update(id, username, bio) {
      const {
        rows,
      } = await pool.query(
        'UPDATE users SET username = $1, bio = $2 WHERE id = $3 RETURNING *;',
        [username, bio, id]
      );
  
      return toCamelCase(rows)[0];
    }

  // A method to delete a user from the database
    static async delete(id) {
      const {
        rows,
      } = await pool.query('DELETE FROM users WHERE id = $1 RETURNING *;', [id]);
  
      return toCamelCase(rows)[0];
    }
  
// A method to count the total number of users in the database
    static async count() {
        const { rows } = await pool.query('SELECT COUNT(*) FROM users;');
    
        return parseInt(rows[0].count);
      }
    }
      
 

// Export the UserRepo class so it can be used in other parts of the application
module.exports = UserRepo;