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



//public ressource
app.use(express.static("public"));

//errors management
app.use(function (req, res, next) {
  res.status(404).render("template_error", {catchedError: "404 NOT FOUND"});
});

app.use(function (err, req, res, next) {
  console.error(err.stack);
  res.status(500).send('ERROR 500 : Something broken!')
});

//server test

app.listen(port, function () {
  console.log("Server listening on port:" + port);
});
