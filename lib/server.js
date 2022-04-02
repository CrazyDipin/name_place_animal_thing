var http = require('http');
const HOST = process.env.HOST || '127.0.0.1';
const PORT = process.env.PORT || 4000;

server = http.createServer(function (req, res){
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('okay');
    console.log(req);
}) 

server.listen(PORT,HOST, () => {
    console.log(`server listening at http://${HOST}:${PORT}`);
})