'use strict';

var router = require('express').Router();
var auth = require('./auth');
var places = require('./places');
var categorys = require('./categorys');
var zones = require('./zones');
var doc = require('./doc');

router.use('/', doc);
router.use('/auth', auth);
router.use('/places', places);
router.use('/categorys', categorys);
router.use('/zones', zones);

module.exports = router;