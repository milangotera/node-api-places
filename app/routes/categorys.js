'use strict';

const router = require('express').Router();
const CategorysController = require('../controllers/categorys');
const authMiddleware = require('../middlewares/auth');

router.get('/', function(req, res) {
    CategorysController.list(req, res);
});

router.post('/', authMiddleware.getToken, authMiddleware.getTokenAdmin, function(req, res) {
    CategorysController.create(req, res);
});

router.get('/:id/places', function(req, res) {
    CategorysController.listPlaces(req, res);
});

module.exports = router;