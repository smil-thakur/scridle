const express = require("express");
var http = require("http");
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const mongoose = require("mongoose");
const Room = require('./models/Room')
var io = require("socket.io")(server);
const getWord = require('./api/getWorde')

//middleware

app.use(express.json());


//connect to our monodb

const DB = "mongodb+srv://Smil:scridleop@cluster0.x1w9w.mongodb.net/myFirstDatabase?retryWrites=true&w=majority"

mongoose.connect(DB).then(() => {
    console.log('connection succesful!');
}).catch((e) => {
    console.log(e);
})

io.on('connections', (socket) => {
    console.log('connected');
    socket.on('create-game', async ({ Username, code, size, rounds }) => {
        try {
            const existingRoom = await Room.findOne({ code });
            if (existingRoom) {
                socket.emit('notCorrectGame', 'room with that name already exists');
                return;
            }
            let room = new Room();
            const word = getWord();
            room.word = word;
            room.Username = Username;
            room.size = size;
            room.code = code;
            room.rounds = rounds;

            let player = {
                socketID: socket.id,
                Username,
                isPartyLeader: true,

            }
            room.players.puch(player);
            room = await room.save();
        } catch (err) {

        }
    })
})

server.listen(port, "0.0.0.0", () => {
    console.log('server started and running on port ' + port);
})