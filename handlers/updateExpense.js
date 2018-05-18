const PG = require("pg");

function updateExpense(request, result) {
  const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();
  // console.log(request.body);
  client.query(
    "UPDATE expenses SET date=$1::date, amount=$2::int4, description=$3::varchar, paid_by=$4::uuid WHERE id=$5::uuid",
    [request.body.date, Math.round(request.body.amount*100), request.body.description, request.body.payer, request.body.expenseToUpdate])
    .then((response) => {
      console.log(response.rows);
      client.end()
      result.redirect("./")
    })
}

  module.exports = updateExpense;
