const alert = require('alert');
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const Sequelize = require('sequelize');
const { sequelize } = require('../model');
// const sequelize = require("../config/db");
var db = require('../model');
const Course = db.course;
// const Course  = require('../model/course');


module.exports = function (app) {
    // app.get('/todo', function(req, res){
    //     //get data from mongodb and pass it to view
    //     Todo.find({}, function(err, data){
    //         if (err) throw err;
    //         res.render('todo', {todos: data}); 
    //     });
    // });
    app.get('/', (req, res) => {

        Course.findAll().then(Course => {
            res.render('index.ejs', { Course });
        });

    });
    app.get('/addcourse', (req, res) => {
        res.render('addcourse.ejs');
    });
    app.post('/addcourse', urlencodedParser, function (req, res) {

        return db.sequelize.sync().then(() => {
            Course.create({
                course_name: req.body.course_name,
                course_duration: req.body.course_duration,
                course_fees: req.body.course_fees,

            }).then(result => {
                console.log(result);
                alert("Data Inserted Successfuly");
                res.redirect('/');
            }).catch((err) => {
                console.log(err);
            });

        });

        // var addCourse = async (req,res) => {
        //     let data = await Course.create({course_name: req.body.course_name, course_duration: req.body.course_duration, course_fees: req.body.course_fees});
        //     console.log(data.dataValues);
        // } 
        // res.redirect('/');
        // res.send({data: result});
    });
    // });

    app.get('/updatecourse/:id', (req, res) => {
        const courseid = req.params.id;
        Course.findOne({ where: { id: courseid } }).then(Course => {
            res.render('updatecourse.ejs', { Course });
        });
        // res.render('updatecourse.ejs');
    });
    app.post('/updatecourse/:id', urlencodedParser, (req, res) => {
        const courseid = req.params.id;
        Course.update(
            {
                course_name: req.body.updatedcoursename,
                course_duration: req.body.updatedcourseduration,
                course_fees: req.body.updatedcoursefees,
            }, {
            where: { id: courseid }
        })
            .then(result => {
                console.log(result);
                alert("Data Updated Successfuly");
                res.redirect('/');
            }).catch((err) => {
                console.log(err);
            });
    });
    
    app.get('/deletecourse/:id', function(req, res) {
      const courseid  = req.params.id;
      Course.destroy(
        {
            where: { id: courseid}
        }
      ).then(result => {
          console.log(result);
          alert("Data Deleted Successfully");
          res.redirect('/');  
      }).catch((err) => {
          console.log(err);
      });
      
    });
};