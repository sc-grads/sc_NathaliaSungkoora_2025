const pg = require('pg'); // Import the PostgreSQL library to connect to a database

// Create a Pool class to manage database connections
class Pool {
    _pool = null; // A variable to store the database connection (starts as empty)

    // A function to set up the database connection with given options
    connect(options) {
        this._pool = new pg.Pool(options); // Create a new connection pool using the options
        return this._pool.query('SELECT 1+1;'); // Test the connection by running a simple query
    }

  close() {
    return this._pool.end();
  }

  // REALLY BIG SECURITY ISSUE HERE!
  query(sql) {
    return this._pool.query(sql);
  }
}



// Share the Pool class so other files can use it
module.exports = new Pool();