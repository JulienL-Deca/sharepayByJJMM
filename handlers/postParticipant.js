const PG = require("pg");

function postEvent(request, result) {
  const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();
  console.log(request.body);
  client.query(
    "INSERT INTO participants (nickname, user_id) VALUES ($1::varchar, $2::uuid) RETURNING (id)",
    [request.body.nickname, request.body.user_id])
    .then((response) => {
      //console.log(response.rows);
      client.end()
      result.redirect("./")
    })
}

module.exports = postEvent;
