'use strict';

var router = require('express').Router();
var AuthController = require('../controllers/auth');

router.post('/signup', function(req, res) {
    AuthController.signup(req, res);
});

router.post('/login', function(req, res) {
    AuthController.login(req, res);
});

module.exports = router;