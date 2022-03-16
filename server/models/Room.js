const mongoose = require('mongoose');
const { playerSchema } = require('./Player');
const roomSchema = new mongoose.Schema({
    word: {
        required: true,
        type: String
    },
    Username: {
        required: true,
        type: String,
        unique: true,
        trim: true,
    },
    size: {
        required: true,
        type: String,
        default: "2"
    },
    rounds: {
        required: true,
        type: String,
        default: "4",
    },
    currentRound: {
        required: true,
        type: Number,
        default: 1,
    },
    players: [playerSchema],
    isJoin: {
        type: Boolean,
        default: true,
    },
    turn: playerSchema,
    turnIndex: {
        type: Number,
        default: 0

    }
})

const gameModel = mongoose.model('Room', roomSchema);
module.exports = gameModel;