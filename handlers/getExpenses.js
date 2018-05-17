const PG = require("pg");

function getExpenses(request, result) {
  const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();

  client.query(
    "SELECT description, amount, participants.nickname, date, events.name FROM events LEFT JOIN expenses ON (expenses.event_id = events.id) LEFT JOIN participants ON (participants.id = expenses.paid_by) WHERE events.id=$1::uuid",
    [request.params.id])
    .catch((error) => {
      console.warn(error)
      client.end();
    })
    .then((rawsOnly) => rawsOnly.rows)
    .then((response) => {
      result.render("expenses", {expenses: response})
      console.log(JSON.stringify(response[0]));
      client.end();
    })
    // client.query(
    // "SELECT name FROM events WHERE events.id=$1::uuid",
    // [request.params.id])
    // .catch((error) => {
    //   console.warn(error)
    //   client.end();
    // })
    // .then((rawsOnly) => rawsOnly.rows)
    // .then((resp) => {
    //   result.render("expenses", {event: resp[0].name})
    //         console.log(JSON.stringify(resp[0]));
    //   client.end();
    // })
  }

  module.exports = getExpenses;
