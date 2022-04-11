const express = require('express');
const app = express();
const http = require('http');
const server =http.createServer(app);
const logger = require('morgan');
const cors = require('cors');

/*
Rutas
*/
const users = require('./routes/userRoutes');

const port = process.env.PORT || 3000;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
  extended: true,
}));
app.use(cors());

app.disable('x-powered-by');

app.set('port', port);

users(app);

server.listen(3000,'10.30.9.142' || 'localhost', function() {
  console.log('Aplicacion de Nodejs ' + port + " Iniciar...")
});



app.use((err,req,res,next)=>{
  console.log(err);
  res.status(err.status || 500).send(err.stack);
});

module.exports = {
  app: app,
  server : server
};