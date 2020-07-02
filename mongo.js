module.exports = {

  insertData: function (dbo, data, resp) {

    dbo.collection("customers").insertOne(data, function(err, res) {
      // Retorna ID do registro inserido a camada HTML
      console.log("ID: " + res.insertedId.toString());
      resp.write(res.insertedId.toString());
      resp.end(); 
    });  

  }
};
