const express = require('express')

const mysql = require('mysql')
const session = require('cookie-session');

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "password",
    database: "databaseOf350"
});
    
con.connect(function(err) {
    if (err) {
      return console.error('error: ' + err.message);
    }
  
    console.log('Connected to the MySQL server.');
});
//   con.connect(function(err) {
//     if (err) throw err;
//     con.query("SELECT * FROM teacher", function (err, result, fields) {
//       if (err) throw err;
//       console.log(result);
//     });
//   });

const app = express()  
// Parse URL-encoded bodies (as sent by HTML forms)
app.use(express.urlencoded());

// Parse JSON bodies (as sent by API clients)
app.use(express.json());
app.use(express.static(__dirname + '/public'));
app.set('view engine', 'ejs')
app.set('views', 'page')
app.use(session({ 
    name: 'session', 
    keys: ['key1','key2']
}));
app.get('/', (req, res) => {
    res.render('index',{test:'index'})
})

app.get('/newlogin', (req, res) => {
    if((typeof req.session.auth == 'undefined') || !req.session.auth){
        res.render('newlogin',{testTitle:'login',register:false});
    } else {
        switch(req.session.type){
            case "student":
                res.render('Index-Student')
                break;
                    
            case "teacher":
                res.render('teacherHomePage')
                break;
                
            case "staff":
                res.render('staffHomePage')
                break;
            
            case "admin":
                res.render('adminHomePage')
                break;

            //used for testing, need to change database user table UserType value
            default:
                res.render('studentHomepage')
                break;
        } 
    }
});

app.post('/newlogin', (req, res) => {
    const inputEmail = req.body.login_email;
    const inputPassword = req.body.password;
    //console.log("test2: " + inputValue)

    console.log("Prepare SQL")
    con.query("SELECT * FROM users where Email_Address = '"+inputEmail+"' and Password = '"+inputPassword+"';", function (err, result, fields) {
        if (err){
            console.log("2：" + err)
            res.render("404");
            return;
        }
        console.log("login check: " + result[0]);
        if (result.length>0){
            
            req.session.auth = true;
            // for(a in result[0]){
            //     console.log(a);
            // }
            req.session.id = result[0]["userID"];
            req.session.type = result[0]["userType"];
            req.session.name = result[0]["firstName"] + " " + result[0]["lastName"]
            switch(result[0]["userType"]){
                case "student":
                    res.render('Index-Student')
                    break;
                        
                case "teacher":
                    res.render('teacherHomePage')
                    break;
                    
                case "staff":
                    res.render('staffHomePage')
                    break;
                
                case "admin":
                    res.render('adminHomePage')
                    break;

                //used for testing, need to change database user table UserType value
                default:
                    res.render('studentHomepage')
                    break;
            } 
        }else{
            res.render('newlogin',{testTitle:'login', register:false});
        }
    });
});

app.post('/register', (req, res) => {
    const inputEmail = req.body.registerEmail;
    const inputUserID = req.body.registerUserID;
    const inputPassword = req.body.registerPassword;
    const inputFirstName = req.body.registerFirstName;
    const inputLastName = req.body.registerLastName;
    //console.log("test2: " + inputValue)

    
    con.query("UPDATE users SET Email_Address = '"+inputEmail+"' , Password = '"+inputPassword+"' , firstName = '"+inputFirstName+"' , lastName = '"+inputLastName+"' where userID = '"+inputUserID+"';", function (err, result, fields) {
        if (err){
            console.log("2：" + err)
            res.render("404");
            return;
        }
        console.log(result);
        
        res.render('newlogin',{testTitle:'login',register:true});
                                
        
    });
});

app.get('/Bar-Student/Booking', (req, res) => {
    res.render('Booking');
});
app.get('/Bar-Student/courses', (req, res) => {
    var sql = "SELECT c.date as date, c.StartTime as start_time, c.EndTime as end_time, c.room as room, c.courseName as cName  FROM Course c, StudentCourse sc, Student s WHERE s.UserID = '" + req.session.id + 
    "' and sc.studentID = s.studID and sc.CourseID = c.courseID ORDER BY sc.CourseID"
    console.log(sql)
    con.query(sql, (err, result, fields) => {
        if (err){
            console.log("2：" + err)
            res.render("404");
            return;
        }
        console.log(result);
        for(a in result)
            console.log(result[a]);
        
        res.render('Courses',{testTitle:'login',result:result});
    })
    
});
app.get('/Bar-Student/Dashboard', (req, res) => {
    res.render('Dashboard', {name: req.session.name});
});
app.get('/Bar-Student/Result', (req, res) => {
    con.query("SELECT CGPAResult FROM student where UserID = '"+ req.session.id +"';", function (err, result, fields) {
        if (err){
            console.log("2：" + err)
            res.render("404");
            return;
        }
        console.log("cGPA check: " + result[0]["CGPAResult"]);
        res.render('Result', {cGPA : result[0]["CGPAResult"] });
    });
});
app.get('/Bar-Student/Schedule', (req, res) => {
    res.render('Schedule');
});
app.get('/Bar-Student', (req, res) => {
    res.render('Bar-Student');
});


app.get('/AboutHKMU1', (req, res) => {
    res.render('AboutHKMU1',{test:"index"});
});
app.get('/AboutHKMU2', (req, res) => {
    res.render('AboutHKMU2');
});

app.get('/homepage', (req, res) => {
    res.render('homepage')
})

app.get('/logout', (req, res) => {
    req.session.auth = false;
    res.redirect('/homepage')
})

app.get('/Index-Student', (req, res) => {
    res.render('Index-Student')

})
app.use((req, res) => {
    res.status(404).render('404')
})

app.listen(3000)