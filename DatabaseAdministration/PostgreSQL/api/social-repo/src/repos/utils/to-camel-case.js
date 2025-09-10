module.exports = (rows) => {
    return rows.map(row => {
      const replaced = {};

      for (let key in row) {
        const camelCase = key.replace(/([-_][a-z])/gi, ($1) => $1.toUpperCase().replace('_', ''));
        replaced[camelCase] = row[key];
      }

      return replaced;
    });

    // Return the array of user records from the database
    return parsedRows;

}