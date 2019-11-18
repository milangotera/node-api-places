'use strict';

const router = require('express').Router();
const CategorysController = require('../controllers/categorys');
const authMiddleware = require('../middlewares/auth');
const multipart = require('connect-multiparty');
const multipartMiddleware = multipart();

router.get('/', function(req, res) {
    CategorysController.list(req, res);
});

router.post('/', authMiddleware.getToken, authMiddleware.getTokenAdmin, multipartMiddleware, function(req, res) {
    CategorysController.create(req, res);
});

router.get('/:id/places', function(req, res) {
    CategorysController.listPlaces(req, res);
});

module.exports = router;