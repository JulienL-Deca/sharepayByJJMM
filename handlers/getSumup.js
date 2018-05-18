const PG = require("pg");

//list all expenses from one event
const expenses = function(client, paramsId) {
    return client.query(
      "SELECT expenses.description, expenses.id AS expenseID, expenses.amount, participants.nickname, expenses.date, events.name, events.id FROM events LEFT JOIN expenses ON (expenses.event_id = events.id) LEFT JOIN participants ON (participants.id = expenses.paid_by)WHERE events.id = $1::uuid",
      [paramsId])
      .catch((error) => {
        console.warn(error)
        client.end();
      })
      .then((rawsOnly) => rawsOnly.rows)
    };

//list all participants from an event
const participants = function(client, userId) {
    return client.query(
      "SELECT participants.nickname, participants.id FROM participants INNER JOIN userlogin ON (userlogin.id = participants.user_id) WHERE userlogin.id = $1::uuid",
      [userId])
      .catch((error) => {
        console.warn(error)
        client.end();
      })
      .then((rawsOnly) => rawsOnly.rows)
    };

const allExpensesWithPaidbyAndReceveiver = function(client, expenseId) {
  // console.log(" >allExpensesWithPaidbyAndReceveiver begin: " , expenseId);
  return client.query(
    "SELECT expenses.date, expenses.amount, expenses.description, participants.nickname, p.nickname AS paid_by_name FROM expenses INNER JOIN expense_participants ON (expense_participants.expense_id = expenses.id) INNER JOIN participants ON (participants.id = expense_participants.participant_id) INNER JOIN participants p ON (p.id = expenses.paid_by) WHERE expenses.id = $1::uuid;",
    [expenseId])
    .catch((error) => {
      console.warn(` >inside allExpensesWithPaidbyAndReceveiver`);
      console.warn(error);
      client.end();
    })
    .then((rawsOnly) => rawsOnly.rows)
  };

function getSumup(request, result) {
const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();
  Promise.all([expenses(client, request.params.id), participants(client, request.user.id)])
  .then((response) => {
    Promise.all(response[0].map(oneExpense => {
      // console.log(oneExpense);
      return allExpensesWithPaidbyAndReceveiver(client, oneExpense.expenseid)
    }))
    .then((detailOneExpense) => console.log(JSON.stringify(detailOneExpense)))
    .then(() => client.end())
    .then(() =>result.render("sumup", {expenses: response[0], participants: response[1], user: request.user.first_name}));
  })
}



  module.exports = getSumup;
