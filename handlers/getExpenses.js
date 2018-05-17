const PG = require("pg");

function getExpenses(request, result) {
  const client = new PG.Client(process.env.DATABASE_URL);
  console.log(request);
  client.connect();

  client.query(
    "SELECT expenses.description, expenses.amount, participants.nickname, expenses.date, events.name FROM events LEFT JOIN expenses ON (expenses.event_id = events.id) LEFT JOIN participants ON (participants.id = expenses.paid_by) LEFT JOIN userlogin ON (participants.user_id = userlogin.id) WHERE events.id=$1::uuid AND userlogin.id=$2::uuid",
    [request.params.id, request.user.id])
    .catch((error) => {
      console.warn(error)
      client.end();
    })
    .then((rawsOnly) => rawsOnly.rows)
    .then((response) => {
      result.render("expenses", {expenses: response})
      console.log(JSON.stringify(response));
      client.end();
    })

  }

  module.exports = getExpenses;
