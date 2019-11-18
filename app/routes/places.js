'use strict';

var router = require('express').Router();
var PlacesController = require('../controllers/places');
var authMiddleware = require('../middlewares/auth');
const multipart = require('connect-multiparty');
const multipartMiddleware = multipart();

router.get('/', function(req, res) {
    PlacesController.list(req, res);
});

router.post('/', authMiddleware.getToken, authMiddleware.getTokenPremium, multipartMiddleware, function(req, res) {
    PlacesController.create(req, res);
});

router.get('/:id', function(req, res) {
    PlacesController.show(req, res);
});

router.get('/:id/comments', function(req, res) {
    PlacesController.listComments(req, res);
});

router.post('/:id/comments', authMiddleware.getToken, function(req, res) {
    PlacesController.createComments(req, res);
});

module.exports = router;