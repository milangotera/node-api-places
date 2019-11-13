'use strict';

var router = require('express').Router();
var auth = require('./auth');
var places = require('./places');

router.get('/', function (req, res) {
    res.status(200).send('Estás conectado a nuestra API');
});

router.use('/auth', auth);
router.use('/places', places);

module.exports = router;