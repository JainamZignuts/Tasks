// const Sequelize = require('sequelize');
// const sequelize = require("../config/db");

module.exports = (sequelize, DataTypes) => {

const Course = sequelize.define("Course", {
    
    course_name:{
        type: DataTypes.STRING,
        allowNull: false,
    },
    course_duration:{
        type: DataTypes.STRING,
        allowNull:false,
    },
    course_fees:{
        type: DataTypes.INTEGER,
        allowNull:false,
    } 
}, {   
   freezeTableName: true 
});
return Course;
}

// module.exports = Course;