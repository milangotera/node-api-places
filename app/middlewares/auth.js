'use strict';

const jwt=require('jsonwebtoken');
const AppModel = require('../models/AppModel');

const authMiddleware = {
    getToken: function(req, res, next) {
        if(!req.headers.authorization) {
            return res.status(401).send({
                status: 401,
                message: "No se proporciona token",
            });
        }
        const token = req.headers.authorization.split(" ")[1];
        jwt.verify(token, 'password', function(error, data) {
            if(error) {
                return res.status(401).send({
                    status: 401,
                    message: 'Toket inválido'
                });
            }else{
                AppModel.select('user', { user_token: token }, function(error, result) {
                    if(error){
                        return res.status(500).send({
                            status: 500,
                            message: 'Error interno del servidor',
                        });
                    }
                    if(result.length){
                        req.token = data;
                        next();
                    }else{
                        return res.status(403).send({
                            status: 401,
                            message: 'Toket ha expirado'
                        });
                    }
                });   
            }
        });
    },
    getTokenAdmin: function(req, res, next) {
        if(req.token.user_role != 1) {
            return res.status(401).send({
                status: 401,
                message: "Sin permiso para consultar",
            });
        }
        next();
    },
    setToken: function(user) {
        const data = {
            user_id: user.user_id,
            user_firstname: user.user_firstname,
            user_lastname: user.user_lastname,
            user_email: user.user_email,
            user_avatar: user.user_avatar,
            user_role: user.user_role,
            user_premium: user.user_premium,
            user_status: user.user_status,
        };
        const token = jwt.sign(data, 'password', {
            expiresIn: 60 * 60 * 24 // expires in 24 hours
        });
        AppModel.update('user', { user_token: token }, { user_id: user.user_id }, function(error, result) {
            if(error){
                return res.status(500).send({
                    status: 500,
                    message: 'Error interno del servidor',
                });
            }
        });
        return token;
    }
};

module.exports = authMiddleware;