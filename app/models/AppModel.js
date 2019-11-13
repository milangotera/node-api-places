'use strict';

var Mysql = require('../config/database');

const AppModel = {
    
    insert: function(table, data, callback) {
        let cols = [];
        let values = [];
        for (const prop in data) {
            cols.push(prop);
            values.push(`'${data[prop]}'`);
        }
        let sql = `INSERT INTO user (${cols}) VALUES (${values})`;
        Mysql.query(sql, data, function( error, result){
            callback(error, result);
        });
    },

    select: function(table, where, callback){
        let sql_where       = ``;
        let sql_where_total = 0;
        if(where){
            sql_where += ` WHERE`;
            for (const prop in where) {
                if(sql_where_total > 0){
                    sql_where += ` AND`;
                }
                sql_where += ` ${prop}='${where[prop]}'`;
                sql_where_total++;
            }
            sql_where += ` `;
        }
        let sql = `SELECT * FROM ${table} ${sql_where}`;
        Mysql.query(sql, function( error, result){
            callback(error, result);
        });
    },

};

module.exports = AppModel;