const PG = require("pg");



function getEvents(request, result) {
  const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();

  client.query(
    "SELECT id, name, status FROM events WHERE owner_id=$1::uuid",
    [request.user.id])
    .catch((error) => {
      console.warn(error)
      client.end();
    })
    .then((rawsOnly) => rawsOnly.rows)
    .then((response) => {
      result.render("events", {events: response, user: request.user.first_name})

      client.end();
    })
  }

  module.exports = getEvents;
