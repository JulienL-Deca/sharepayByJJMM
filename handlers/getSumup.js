const PG = require("pg");
const { createTransaction, payback } = require("./payback");

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

function removeDuplicateUsingFilter(arr){
    let unique_array = arr.filter(function(elem, index, self) {
        return index == self.indexOf(elem);
    });
    return unique_array
}

function getSumup(request, result) {
  const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();
  Promise.all([expenses(client, request.params.id), participants(client, request.user.id)])
  .then((response) => {
    Promise.all(response[0].map(oneExpense => {
      // console.log(" >detail oneExpense " + oneExpense); //[object Object]
      return allExpensesWithPaidbyAndReceveiver(client, oneExpense.expenseid)
    }))
    .then((listAllExpensesFor1Event) => {
      let allListOfExpenses = [];
      listAllExpensesFor1Event.forEach(function(element) {
        let listOfTransactions = [];
        listOfTransactions.push(element[0].description);
        listOfTransactions.push(element[0].amount);
        listOfTransactions.push(element[0].paid_by_name);
        let participantsArrayNickname =[];
        element.forEach(function(element2){
          participantsArrayNickname.push(element2.nickname);
        });
        listOfTransactions.push(participantsArrayNickname);
        // console.log(" >dans getSumup: ");
        // console.log(listOfTransactions);
        client.end()
        allListOfExpenses.push(listOfTransactions);
      });
      return allListOfExpenses;
    })
    .then((myListOfTransactions) => {
      // console.log(" >list of transactions: ");
      // myListOfTransactions.forEach((oneTransaction) => {
      //   for (let i = 0; i < oneTransaction.length; i++) {
      //     console.log(oneTransaction[i]);
      //   }
      // })
      // console.log(myListOfTransactions[0][0]); // squash
      // console.log(myListOfTransactions[0][1]); // 10040
      // console.log(myListOfTransactions[0][2]); // Matt
      // console.log(myListOfTransactions[0][3]); // [ 'Matt', '...']
      /*
      const cinema = createTransaction('alice', 440, ['alice', 'bob', 'charlie', 'damian']);
      const transactions = [cinema, ..., ... ];
      console.log(payback(transactions, ['alice', 'bob', 'charlie', 'damian']));
      [ { from: 'damian', to: 'alice', value: 80 },
        { from: 'damian', to: 'charlie', value: 30 }]
      */
      let listOfTransactions = []; //faire un .map pour remplir
      let listOfParticipants = []; //ajouter tous les participants de chaque transactions puis virer les doublons avant de l'envoyer à payback
      myListOfTransactions.forEach((oneTransaction) => {
        let oneTransactionName = oneTransaction[0];
        oneTransactionName = createTransaction(oneTransaction[2], oneTransaction[1]/100, oneTransaction[3]);
        // console.log(oneTransactionName);
        listOfTransactions.push(oneTransactionName);
        listOfParticipants.push(oneTransaction[3]);
      });
      // console.log(listOfTransactions);
      // console.log(listOfParticipants);
      const listOfParticipantsClean = removeDuplicateUsingFilter([].concat.apply([],listOfParticipants));// nettoyage de listOfParticipants pur enlever doublon
      // console.log(listOfParticipantsClean);
      const paybackList = payback(listOfTransactions, listOfParticipantsClean);
      // console.log(paybackList);
      return [myListOfTransactions, paybackList];
    })
    .then((infoToRender) => {
      console.log(infoToRender[0]);
      console.log("--");
      console.log(infoToRender[1]);
      result.render("sumup", {expenses: response[0], participants: response[1], user: request.user.first_name, transactionsToPrint: infoToRender[0], paybackObject: infoToRender[1]});
    })
  });
}

module.exports = getSumup;
