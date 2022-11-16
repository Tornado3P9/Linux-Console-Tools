//================================================================//

var PORT = 3000;

const express = require('express');

const app = new express();
app.use(express.static('static'))

app.listen(PORT, () => {
    console.log('listening on port ', PORT);
});

// ================================================================//

app.get('/', (req, res)=>{
    res.render('index.html');
});
