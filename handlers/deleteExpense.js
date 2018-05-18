const PG = require("pg");

function deleteExpense(request, result){
    const client = new PG.Client(process.env.DATABASE_URL);
    console.log(request.body);
    client.connect();
    // console.log(request.body);
    client.query(
      "DELETE FROM expenses WHERE expenses.id=$1::uuid",
      [request.body.expenseToDelete])
      .then((response) => {
        // console.log(response.rows);
        client.end()
        result.redirect("./")
      })
  }



module.exports= deleteExpense;
