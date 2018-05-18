const PG = require("pg");

function deleteExpense(request, result){

const client = new PG.Client({connectionString: process.env.DATABASE_URL});
client.connect();

client.query(
  "DELETE FROM EXPENSES WHERE ",


}








module.exports= deleteExpense
