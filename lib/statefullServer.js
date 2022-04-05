const express = require('express');
const cookieParser = require('cookie-parser');
const sessions = require('express-session');
const url = require('url');
const { use } = require('express/lib/application');
const HOST = process.env.HOST || '127.0.0.1';
const PORT = process.env.PORT || 4000;
const app = express()
const time = 1000 * 60 * 60;

app.use(sessions({
    secret: "thisismyscretkey",
    saveUninitialized: false,
    cookie: {maxAge: time},
    resave: false
}));

app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(cookieParser());

class User{
    constructor(name, _url, isprime = false){
        this.name = name;
        this.score = 0;
        this.isprime = isprime;
        this.url = _url
    }

    addScore(val){
        this.score += parseInt(val);
        return this.score;
    }
}
const users = new Map();
var primeUser;
const rooms = new Map();

app.all('/joinExistingGame', (req, res) => {
    res.writeHead(200,{
        'Access-Control-Allow-Origin': "*",
        'Access-Control-Allow-Headers': "Content-Type",
        //'Referrer-Policy': "no-referrer-when-downgrade"
    });
    /*
    if(rooms.get(req.body.roomCode)!=undefined && users.get(req.body.Name) === undefined){
        
        var user = new User(req.body.Name, url.parse(req.url).path);
        users.set(user.name, user);
        console.log(`User connected: ${user.name}`);
    }
    else if(users.get(req.body.Name) !== undefined){
        res.send("Room Not Found");
        //res.flash("Invalid Game Code");
    }

    if(url.parse(req.url).path === primeUser.url && req.body.action === 'start'){

    }
    */
   console.log(req.body.Name);
    res.end('okay');
})

app.listen(PORT,HOST, () => {
    console.log(`server listening at http://${HOST}:${PORT}`);
});