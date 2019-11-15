'use strict';

const router = require('express').Router();
const AuthController = require('../controllers/auth');
const authMiddleware = require('../middlewares/auth');
var multipart = require('connect-multiparty');
var multipartMiddleware = multipart();

router.post('/signup', function(req, res) {
    AuthController.signup(req, res);
});

router.post('/login', function(req, res) {
    AuthController.login(req, res);
});

router.get('/profile', authMiddleware.getToken, function(req, res) {
    AuthController.profile(req, res);
});

router.put('/profile', authMiddleware.getToken, function(req, res) {
    AuthController.update(req, res);
});

router.post('/profile', authMiddleware.getToken, multipartMiddleware, function(req, res) {
    AuthController.upload(req, res);
});

module.exports = router;