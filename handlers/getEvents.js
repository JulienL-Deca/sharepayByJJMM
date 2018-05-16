const PG = require("pg");



function getEvents(request, result) {
  const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();

  client.query(
    "SELECT id, name, status FROM events WHERE owner_id=$1::uuid",
    ['6fdf8002-7709-4211-9357-a05eb79312a2'])
    .catch((error) => {
      console.warn(error)
      client.end();
    })
    .then((rawsOnly) => rawsOnly.rows)
    .then((response) => {
      result.render("events", {events: response})
      console.log(JSON.stringify(response[0]));
      client.end();
    })
  }

  module.exports = getEvents;
