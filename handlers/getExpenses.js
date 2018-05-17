const PG = require("pg");

const expenses = function(client, paramsId) {
    return client.query(
      "SELECT expenses.description, expenses.amount, participants.nickname, expenses.date, events.name, events.id FROM events LEFT JOIN expenses ON (expenses.event_id = events.id) LEFT JOIN participants ON (participants.id = expenses.paid_by)WHERE events.id=$1::uuid",
      [paramsId])
      .catch((error) => {
        console.warn(error)
        client.end();
      })
      .then((rawsOnly) => rawsOnly.rows)
    };

const participants = function(client, userId) {
    return client.query(
      "SELECT participants.nickname, participants.id FROM participants INNER JOIN userlogin ON (userlogin.id = participants.user_id) WHERE userlogin.id=$1::uuid",
      [userId])
      .catch((error) => {
        console.warn(error)
        client.end();
      })
      .then((rawsOnly) => rawsOnly.rows)
    };


function getExpenses(request, result) {
const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();
  Promise.all([expenses(client, request.params.id), participants(client, request.user.id)])
  .then((response) => {
    client.end();
    // console.log(response);
    result.render("expenses", {expenses: response[0], participants: response[1]})

  })
}



  module.exports = getExpenses;
