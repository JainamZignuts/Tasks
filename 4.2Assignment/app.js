const express = require('express');
var curdController = require('./controllers/curdController');
const app = express();

// const sequelize = require("./config/db");
// const Course = require("./model/course");
require('./model/index');

app.set('view engine', 'ejs');

// app.use(express.static('./public'));

//fire controllers
curdController(app);

//listen to port
app.listen(3000);
console.log('You are listening to port 3000')

// sequelize.sync().then((result) => {
//      console.log(result); 
//   }).catch((err) => {
//       console.log(err);
//   });