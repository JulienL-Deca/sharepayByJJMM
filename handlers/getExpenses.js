const PG = require("pg");

function getExpenses(request, result) {
  const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();

  client.query(
    "SELECT description, amount, participants.nickname, date FROM expenses INNER JOIN participants ON (participants.id = expenses.paid_by) WHERE expenses.event_id=$1::uuid",
    ['354e3ffb-da5b-41e8-a1cc-5d14ab91c4fd'])
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
  }

  module.exports = getExpenses;
