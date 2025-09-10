const pg = require('pg'); // Import the PostgreSQL client to interact with the database

// Create a connection pool to the PostgreSQL database
const pool = new pg.Pool({
  host: 'localhost', // Database server address
  port: 5432, // Default PostgreSQL port
  database: 'socialnetwork',
  user: 'postgres',
  password: '1234567',
});

pool.query(`
    UPDATE posts 
    SET loc = POINT(lng, lat) 
    WHERE loc IS NULL;
    `)
    .then(() => {
        console.log('Update complete');
        pool.end();
    })
    .catch((err) => {
        console.error(err.message);
        pool.end();
    });