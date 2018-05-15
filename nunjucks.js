const express = require('express');
const nunjucks = require("nunjucks");
const app = express()

const port = process.env.PORT || 3000;

//nunjucks config

nunjucks.configure("views", {
  autoescape: true,
  express: app
});

app.set("views", __dirname + "/views");
app.set("view engine", "njk");


//rooting

app.get("/", function (request, result) {
  result.render("home");
});




//server test

app.listen(port, function () {
  console.log("Server listening on port:" + port);
});
