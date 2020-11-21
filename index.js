const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello Docker and Node!');
});

app.listen(9000, () => {
  console.log('Listening on port 9000');
});
