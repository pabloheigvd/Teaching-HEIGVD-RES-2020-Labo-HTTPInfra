let Chance = require('chance');

let chance = new Chance();

const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send(genPerson());
});

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`));

function genPerson() {
  const nbPerson = chance.integer({ min: 5, max: 10 });

  let persons = [];

  for (let index = 0; index < nbPerson; index++) {
    let gender = chance.gender()

    persons.push({
      id: chance.ssn(),
      fname: chance.first({gender: gender}),
      lname: chance.last(),
      birthday: chance.birthday(),
      gender: gender,
    })
  }

  return persons;
}