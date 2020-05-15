const express = require('express');
const app = express();
const port = 3000;

var Chance = require('chance');
var chance = new Chance();

var heads = 0;
var tails = 0;

app.get('/', function(req, res){ 
    res.send( 
    { 
        coinflip: headOrTail(),
        head_probability: headProbability(),
        total_coinflips: heads + tails
    });
});

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`));

function headOrTail(){
    var HT = chance.bool();
    if (HT){
        heads++;
        return "head";
    } else {
        tails++;
        return "tail";
    }
}

function headProbability(){ return heads / (heads + tails); }
