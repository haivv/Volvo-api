var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

const swaggerJsDoc = require('swagger-jsdoc');
const swaggerUI = require('swagger-ui-express');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

//swagger
app.use(express.urlencoded({ extended: true }));
const swaggerOptions = {
    swaggerDefinition:{
        info:{
            title: 'Volvo - API',
            version: '1.0.0'
        }
    },
    apis: ['app.js'],
}
const swaggerDocs = swaggerJsDoc(swaggerOptions);
app.use('/api-docs', swaggerUI.serve, swaggerUI.setup(swaggerDocs));

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

/**
 * @swagger
 * /check-login:
 *  post:
 *      description: "Check login credentials" 
 *      parameters:
 *      - name: username
 *        description: 유저
 *        in: formData
 *        required: true
 *        type: string
 *      - name: password
 *        description: 비밀번호
 *        in: formData
 *        type: string
 *      responses:
 *        '200':
 *          description: "Login successful"
 *          schema:
 *           type: object
 *           properties:
 *            token:
 *             type: string
 *        '400':
 *          description: "Invalid credentials"
 *          schema:
 *           type: object
 *           properties:
 *            token:
 *             type: string
 */
/**
 * @swagger
 * /add-notice:
 *  post:
 *      description: "Add notice" 
 *      parameters:
 *      - name: title
 *        description: Title
 *        in: formData
 *        required: true
 *        type: string
 *      - name: category
 *        description: Category
 *        in: formData
 *        enum:
 *          - op1
 *          - op2
 *          - op3
 *          - op4
 *      - name: writer
 *        description: Poster
 *        in: formData
 *        type: string
 *      - name: content
 *        description: content
 *        in: formData
 *        type: string
 *      - name: fileUpload
 *        description: fileUpload 경로
 *        in: formData
 *        type: string
 *      responses:
 *        '200':
 *          description: "Add ok"
 *          schema:
 *           type: object
 *           properties:
 *            token:
 *             type: string
 *        '400':
 *          description: "Add err"
 *          schema:
 *           type: object
 *           properties:
 *            token:
 *             type: string
 */

 
module.exports = app;
