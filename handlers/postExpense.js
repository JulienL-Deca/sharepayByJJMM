const PG = require("pg");

function postExpense(request, result) {
  const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();
  // console.log(request.body);
  client.query(
    "INSERT INTO expenses (date, amount, description, paid_by, event_id) VALUES ($1::date, $2::int4, $3::varchar, $4::uuid, $5::uuid) RETURNING (id)",
    [request.body.date, Math.round(request.body.amount*100), request.body.description, request.body.payer, request.body.event_id])
    .then((response) => {
      //console.log(response.rows);
      client.end()
      result.redirect("./")
    })
}

  module.exports = postExpense;
