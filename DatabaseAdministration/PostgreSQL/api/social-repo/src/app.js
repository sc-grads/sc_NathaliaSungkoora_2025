// Load Express to make a web server
const express = require('express');

// Load the users router for user-related web requests
const usersRouter = require('./routes/users');

// Create a function to set up the app
module.exports = () => {
  // Start a new Express app
  const app = express();

  // Let the app understand JSON data from requests
  app.use(express.json());

  // Add the users router for requests like /users
  app.use(usersRouter);

  // Send the app back to be used elsewhere
  return app;
};