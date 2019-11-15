'use strict';

const router = require('express').Router();
const AuthController = require('../controllers/auth');
const authMiddleware = require('../middlewares/auth');

router.post('/signup', function(req, res) {
    AuthController.signup(req, res);
});

router.post('/login', function(req, res) {
    AuthController.login(req, res);
});

router.get('/profile', authMiddleware.getToken, function(req, res) {
    AuthController.profile(req, res);
});

router.post('/profile', authMiddleware.getToken, function(req, res) {
    AuthController.update(req, res);
});

module.exports = router;