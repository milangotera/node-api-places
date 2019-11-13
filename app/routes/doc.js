'use strict';

var router = require('express').Router();
var swaggerUi = require('swagger-ui-express');
var swaggerDocument = require('./swagger.json');

router.use('/', swaggerUi.serve);
router.get('/', swaggerUi.setup(swaggerDocument));

module.exports = router;