'use strict';

var router = require('express').Router();
var auth = require('./auth');
var places = require('./places');
var doc = require('./doc');

router.use('/', doc);
router.use('/auth', auth);
router.use('/places', places);

module.exports = router;