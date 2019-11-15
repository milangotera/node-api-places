'use strict';

var router = require('express').Router();
var ZonesController = require('../controllers/zones');

router.get('/', function(req, res) {
    ZonesController.list(req, res);
});

router.get('/:id/places', function(req, res) {
    ZonesController.listPlaces(req, res);
});

module.exports = router;