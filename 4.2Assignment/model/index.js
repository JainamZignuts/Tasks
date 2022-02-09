const {Sequelize,DataTypes} = require('sequelize');

const sequelize = new Sequelize("jainams", "jainams", "x4BUrB29krWCE4Qfaq322XpTUbWqhh78",{
    dialect: "mysql",
    host:"15.206.7.200",
    port:"3310",
});

sequelize.authenticate()
.then(()=>{
    console.log("connected");
})
.catch(err => {
    console.log(err);
});

const db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.course = require('./course')(sequelize,DataTypes);

db.sequelize.sync({force:false}).then((result) => {
    console.log(result); 
 }).catch((err) => {
     console.log(err);
 });
 module.exports = db;