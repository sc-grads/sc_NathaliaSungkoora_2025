const express = require('express'); // Import Express to create a web server
const pg = require('pg'); // Import the PostgreSQL client to interact with the database

// Create a connection pool to the PostgreSQL database
const pool = new pg.Pool({
  host: 'localhost', // Database server address
  port: 5432, // Default PostgreSQL port
  database: 'socialnetwork',
  user: 'postgres',
  password: '1234567',
});

// Initialize the Express application
const app = express();
// Enable Express to parse form data sent in POST requests
app.use(express.urlencoded({ extended: true }));



// Handle GET requests to '/posts' to display all posts
app.get('/posts', async (req, res) => {
  // Query the database to get all rows from the 'posts' table
  const { rows } = await pool.query(`
    SELECT * FROM posts;
  `);



    // Send an HTML response with a table of posts and a form to create new posts
  res.send(`
    <table>
      <thead>
        <tr>
          <th>id</th> <!-- Column header for post ID -->
          <th>lng</th> <!-- Column header for longitude -->
          <th>lat</th> <!-- Column header for latitude -->
        </tr>
      </thead>
      <tbody>
        ${rows
          .map((row) => {
            // Map each row to an HTML table row
            return `
            <tr>
              <td>${row.id}</td> <!-- Display post ID -->
              <td>${row.loc.x}</td> <!-- Display longitude -->
              <td>${row.loc.y}</td> <!-- Display latitude -->
            </tr>
          `;
          })
          .join('')} <!-- Join all rows into a single string -->
      </tbody>
    </table>
    <form method="POST"> <!-- Form to create a new post -->
      <h3>Create Post</h3>
      <div>
        <label>Lng</label> <!-- Label for longitude input -->
        <input name="lng" /> <!-- Input field for longitude -->
      </div>
      <div>
        <label>Lat</label> <!-- Label for latitude input -->
        <input name="lat" /> <!-- Input field for latitude -->
      </div>
      <button type="submit">Create</button> <!-- Submit button for the form -->
    </form>
  `);
});



// Handle POST requests to '/posts' to create a new post
app.post('/posts', async (req, res) => {
  // Extract latitude and longitude from the form data
  const { lng, lat } = req.body;

  // Insert the new post into the 'posts' table using parameterized query
  await pool.query(
    'INSERT INTO posts (loc) VALUES ($1);',
     [`(${lng}, ${lat})`]
    
    );

  // Redirect the user back to the '/posts' page to see the updated list
  res.redirect('/posts');
});

// Start the server and listen on port 3005
app.listen(3005, () => {
  console.log('Listening on port 3005'); // Log a message when the server starts
});