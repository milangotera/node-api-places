'use strict';

var router = require('express').Router();
var auth = require('./auth');
var places = require('./places');
var categorys = require('./categorys');
var doc = require('./doc');

router.use('/', doc);
router.use('/auth', auth);
router.use('/places', places);
router.use('/categorys', categorys);

module.exports = router;