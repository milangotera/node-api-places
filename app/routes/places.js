'use strict';

var router = require('express').Router();
var PlacesController = require('../controllers/places');

router.get('/', function(req, res) {
    PlacesController.list(req, res);
});

router.get('/:id', function(req, res) {
    PlacesController.show(req, res);
});

router.get('/:id/comments', function(req, res) {
    PlacesController.comments(req, res);
});

module.exports = router;