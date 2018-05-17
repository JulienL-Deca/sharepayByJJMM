const PG = require("pg");

function signup(emailToSelect){
  const client = new PG.Client({connectionString: connectionString,});
  client.connect();
  return client.query(
    "SELECT id, first_name, last_name, email FROM userlogin WHERE email = $1::varchar;", [emailToSelect])
    .then(function(resultDB){
      client.end();
      return resultDB.rows[0];
    });
}

module.exports = {
  signup: signup,
}
