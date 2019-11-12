'use strict';

const mysql = require('mysql');

const config = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'app_places',
};

const Mysql = mysql.createPool(config);

module.exports = Mysql;