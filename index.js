var express = require('express');
app = express();

  // Adiciona headers que permitirao a postagem via WebEngine
  app.use(function(req, res, next) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods','GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
  });

  // IMPORTANTE: Eh necessario declarar 
  // metodos distintos pra GET e POST
  app.get('/', function(req, res){
    dataEntry(req, res);
  });

  app.post ('/', function(req, res){
    dataEntry(req, res);
  });  

  // Funcao responsavel pela inclusão das informacoes
  function dataEntry(req, res){    
    // Parseia/Exibe parametros
    var url = require('url');
    var url_parts = url.parse(req.url, true);
    var data = url_parts.query;
    console.table({data});

    // Envia informacao ao MongoDB
    var mongoClient = require('mongodb').MongoClient;
    var url = "mongodb://localhost:27017/";
    mongoClient.connect(url, function(err, db) {
      if (err) throw err;
      var dbo = db.db("mainDB"); // Cria/Abre database
      collect = dbo.collection("customers"); // Cria/Abre collection(tabela)

      // Executa funcao no arquivo mongo.js pra persistir os dados
      var mongo = require("./mongo")   // require funciona como INCLUDE no Node
      mongo.insertData(dbo, data, res); // Insere registro
      db.close();
    });
  }

  var server = app.listen(3000);
  console.log('http://localhost:%s', server.address().port);
