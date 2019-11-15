'use strict';

var router = require('express').Router();
var CategorysController = require('../controllers/categorys');

router.get('/', function(req, res) {
    CategorysController.list(req, res);
});

router.get('/:id/places', function(req, res) {
    CategorysController.listPlaces(req, res);
});

module.exports = router;