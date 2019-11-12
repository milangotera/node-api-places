'use strict';

var router = require('express').Router();

router.get('/', function (req, res) {
    res.status(200).send('Estás conectado a nuestra API');
});

module.exports = router;