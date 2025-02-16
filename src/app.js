const express = require('express');
const app = express();
const port = 3000;

app.listen(port, '0.0.0.0', () => {
    console.log(`✅ Server is running on http://localhost:${port}`);
});

app.get('/', (req, res) => {
    res.send('Hello, DevOps World!');
});
