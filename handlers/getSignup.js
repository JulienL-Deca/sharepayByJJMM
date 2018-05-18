const PG = require("pg");

function signup(request, result){
  const client = new PG.Client({connectionString: process.env.DATABASE_URL});
  client.connect();

  return client.query("SELECT email FROM userlogin WHERE email = $1::varchar", [request.body.email])
  .then(function(useremail){
    if (useremail.rowCount===0) {
      return client.query("insert into userlogin (last_name, first_name, email, password) values ($1::varchar, $2::varchar, $3::varchar, $4::varchar) returning(email)",
      [request.body.last_name, request.body.first_name, request.body.email, request.body.password])
      .then(function(response){
        client.end();
        return response.rows;
      })
      .then(function(resultDB){
        // client.end();
        return resultDB[0];
      })
      .then(function(user){
        request.logIn(user, function(error) {
          if (error) {
            console.log(error);
            return result.redirect("/");
          } else {
            return result.redirect("/userevents");
          }
        })
      })
      .catch(error => {
        client.end();
        console.log(error);
      });
    } else {
      client.end();
      throw "account already existed"
    }
  });
}

module.exports = {
  signup: signup,
}
