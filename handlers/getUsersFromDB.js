const PG = require("pg");
const connectionString = process.env.DATABASE_URL;

function findUserByEmail(emailToSelect){
  console.log(`inside findUserByEmail function, param = ${emailToSelect}`);
  const client = new PG.Client({connectionString: connectionString,});
  client.connect();
  return client.query(
    "SELECT id, CONCAT(first_name,' ', last_name) AS full_name, email, password FROM userlogin WHERE email = $1::varchar;", [emailToSelect])
    .then(function(resultDB){
      console.log(`je suis dans mon then | ${JSON.stringify(resultDB.rows[0])}`);
      return resultDB.rows[0];
    });
  // client.end();
}

module.exports = {
  findUserByEmail: findUserByEmail
}
