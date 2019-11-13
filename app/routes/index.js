'use strict';

var router = require('express').Router();
var auth = require('./auth');

router.use('/auth', auth);

router.get('/', function (req, res) {
    res.status(200).send('Estás conectado a nuestra API');
});

module.exports = router;