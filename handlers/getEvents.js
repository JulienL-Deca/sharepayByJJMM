const PG = require("pg");

const userInfos = function(client, paramsId){
  return client.query(
    "SELECT id, name, status FROM events WHERE owner_id=$1::uuid",
    [paramsId])
    .catch((error) => {
      console.warn(error)
      client.end();
    })
    .then((rawsOnly) => rawsOnly.rows)
  };

const usersParticipants = function(client, paramsId){
    return client.query(
      "SELECT * FROM participants WHERE user_id = $1::uuid",
      [paramsId])
      .catch((error) => {
        console.warn(error)
        client.end();
      })
      .then((rawsOnly) => rawsOnly.rows)
    };

function getEvents(request, result) {
const client = new PG.Client(process.env.DATABASE_URL);
  client.connect();
  Promise.all([userInfos(client, request.user.id), usersParticipants(client, request.user.id)])
  .then((response) => {
    client.end();
    // console.log(response);
    result.render("events", {events: response[0], participants: response[1], user: request.user.first_name, userId: request.user.id})
  })
}



  module.exports = getEvents;
