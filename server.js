const express = require('express');
const path = require('path');

const app = express();
const port = process.env.PORT || 3000;

// Set the public directory for static files (HTML, CSS)
app.use(express.static(path.join(__dirname, 'public')));

// Route to serve the index.html for all requests
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'public/page1.html'));
});

app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
