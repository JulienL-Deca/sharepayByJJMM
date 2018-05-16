const PG = require("pg");
const connectionString = process.env.DATABASE_URL;

function findUserByEmail(emailToSelect){
  const client = new PG.Client({connectionString: connectionString,});
  client.connect();
  return client.query(
    "SELECT id, first_name, last_name, email FROM userlogin WHERE email = $1::varchar;", [emailToSelect])
    .then(function(resultDB){
      client.end();
      return resultDB.rows[0];
    });
}

function validateUser(emailToSelect, givenPassword){
  const client = new PG.Client({connectionString: connectionString,});
  client.connect();
  return client.query("SELECT password FROM userlogin WHERE email = $1::varchar",[emailToSelect])
  .then(function(resultPassword){
    if (resultPassword.rows[0].password === givenPassword) {
      return client.query(
        "SELECT id, CONCAT(first_name,' ', last_name) AS full_name, email FROM userlogin WHERE email = $1::varchar;", [emailToSelect])
        .then(function(resultDB){
          client.end();
          return resultDB.rows[0];
        });
    }
  });
}

module.exports = {
  findUserByEmail: findUserByEmail,
  validateUser: validateUser
}
