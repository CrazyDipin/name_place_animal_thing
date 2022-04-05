//https://www.json.org/json-en.html
var http = require('http');
const HOST = process.env.HOST || '127.0.0.1';
const PORT = process.env.PORT || 4000;
class Player{
    constructor(name, id){
        this.name = name;
        this.id = id;
        this.score = 0;
    }

    addScore(val){
        this.score += val;
        return this.score;
    }
}
var players = [];


server = http.createServer(function (req, res){
    res.writeHead(200,{
        'Access-Control-Allow-Origin': "*",
        'Access-Control-Allow-Headers': "Content-Type",
        'Referrer-Policy': "no-referrer-when-downgrade"});
    res.end('okay');
    
    //console.log(req);
    json = JSON.parse(req);
    console.log(json);
    req.on('data', chunk => {
        //players.push()
        //if(players.length)
        console.log(chunk['Name']);
    });
    
}) 

server.listen(PORT,HOST, () => {
    console.log(`server listening at http://${HOST}:${PORT}`);
})