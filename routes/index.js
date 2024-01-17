require('dotenv').config(); //load environment parameters from .env file
var express = require('express');
var router = express.Router();
var database = require('../database');
const crypto = require('crypto');
const jwt = require('jsonwebtoken');

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Express' });
});

/* check login. */
router.post('/check-login', function (req, res, next) {

  const username = req.body.username;
  const password = req.body.password;
  const new_password = crypto.createHash('md5').update(password).digest('hex');;

  const query = `SELECT * FROM account where username="${username}" and password="${new_password}" `;

  database.query(query, function (error, data) {
    if (error) {
      throw error;
    }
    else {
      var total_records = data.length;
      if (total_records > 0) {
        const payload = { username }; // 
        const secretKey = process.env.ACCESS_TOKEN_SECRET;
        accessToken = jwt.sign(payload, secretKey, { expiresIn: '30s' }); //create secret key, 30s expired
        res.redirect('/test'); //

      }
      else {
        res.redirect('/'); //
      }
    }
  });



});

router.get('/test', (req, res) => {
  const secretKey = process.env.ACCESS_TOKEN_SECRET;
  jwt.verify(accessToken, secretKey, (err, decoded) => {
    if (err) {
      //res.json({ valid: false, message: 'Invalid access token' });
      res.redirect('/'); //

    } else {
      //res.json({ valid: true, message: 'Access token is valid', decoded });
      const username = decoded.username;
      res.send(`Login successful - Username: ${username}`);
    }
  });
});

//show 
router.get('/notice', (req, res) => {
  const query = 'SELECT * FROM notice ORDER BY idNotice DESC';

  database.query(query, (err, result) => {
    if (err) throw err;
    res.json(result);
  });
});


router.post('/add-notice', (req, res) => {

  //add datetime to file name
  var date_ob = new Date();
  var day = ("0" + date_ob.getDate()).slice(-2);
  var month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
  var year = date_ob.getFullYear();
  var dateCreate = year + '_' + month + '_' + day ;

  const { title, category, writer, content, fileUpload } = req.body;

  //console.log(insertID);


  database.query(`SELECT * FROM notice ORDER BY idNotice DESC LIMIT 1 `, (error, results, fields) => {
    if (error) {
      console.error('Error executing the query:', error);
      return res.status(500).send('An error occurred');
    }

    // Extract the column values from the result set
    const lastID = results.map((row) => row['idNotice']);
    // console.log(lastID);
    var countData;
    var insertID;
    if (lastID.length === 0) {
      countData = 0;
      insertID = 1;
      // array empty 
    }
    else {
      countData = lastID.length;
      for (let i = 0; i < countData; i++) {
        insertID = lastID[i] + 1;

        console.log(insertID);
        var query = `
        INSERT INTO notice 
        (idNotice, title,category, dateCreate, writer, content,  fileUpload) 
        VALUES (?,?,?,?,?,?,?)
        `;

        database.query(query, [insertID, title, category, dateCreate, writer, content, fileUpload], function (error, data) {

          if (error) {
            res.json({ message: 'Add err' });

          }
          else {

            res.json({ message: 'Add ok' });

          }

        });
      }
    }


  });
});



module.exports = router;
