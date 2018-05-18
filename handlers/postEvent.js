const PG = require("pg");

function postEvent(request, result) {
  const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();
  console.log(request.body);
  client.query(
    "INSERT INTO events (name, owner_id, status) VALUES ($1::varchar, $2::uuid, $3::bool) RETURNING (id)",
    [request.body.description, request.body.user_id, true])
    .then((response) => {
      //console.log(response.rows);
      client.end()
      result.redirect("./")
    })
}

  module.exports = postEvent;
