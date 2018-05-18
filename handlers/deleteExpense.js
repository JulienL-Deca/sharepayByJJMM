const PG = require("pg");

function deleteExpense(request, result){

const client = new PG.Client({connectionString: process.env.DATABASE_URL});
client.connect();
}








module.exports= deleteExpense
