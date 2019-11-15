'use strict';

const AppModel = require('../models/AppModel');
const authMiddleware = require('../middlewares/auth');

const AuthController = {
    
    signup: function(req, res) {
        
        let errors = 0;
        let errorData = {};

        if(!req.body.user_firstname){
            errorData.user_firstname = "El campo nombre es requerido";
            errors++;
        }
        if(!req.body.user_lastname){
            errorData.user_lastname = "El campo apellido es requerido";
            errors++;
        }
        if(!req.body.user_email){
            errorData.user_email = "El campo email es requerido";
            errors++;
        }
        if(!req.body.user_password){
            errorData.user_password = "El campo password es requerido";
            errors++;
        }

        if(errors){
            return res.status(403).send({
                status:403,
                errors: errorData,
                message: 'Error en envío de datos',
            });
        }

        AppModel.select('user', { user_email: req.body.user_email }, function(error, result) {
            if(error){
                return res.status(500).send({
                    status: 500,
                    message: 'Error interno del servidor',
                });
            }
            if(result.length){
                return res.status(403).send({
                    status: 403,
                    errors: { user_email: 'El campo email ya está en uso' },
                    message: 'Error en envío de datos',
                });
            }else{
                const userData = {
                    user_firstname: req.body.user_firstname,
                    user_lastname: req.body.user_lastname,
                    user_email: req.body.user_email,
                    user_password: req.body.user_password,
                    user_premium: 0,
                    user_status: 0,
                };
                AppModel.insert('user', userData, function(error, result) {
                    if(error){
                        return res.status(500).send({
                            status: 500,
                            message: 'Error interno del servidor',
                        });
                    }
                    if(result){
                        return res.status(201).send({
                            status: 201,
                            message: 'Se ha registrado exitosamente',
                        });
                    }
                });
            }
        });
    },

    login: function(req, res) {
        
        let errors = 0;
        let errorData = {};

        if(!req.body.user_email){
            errorData.user_email = "El campo email es requerido";
            errors++;
        }
        if(!req.body.user_password){
            errorData.user_password = "El campo password es requerido";
            errors++;
        }

        if(errors){
            return res.status(403).send({
                status:403,
                errors: errorData,
                message: 'Error en envío de datos',
            });
        }

        const loginData = {
            user_email: req.body.user_email,
            user_password: req.body.user_password
        };

        AppModel.select('user', loginData, function(error, result) {
            if(error){
                return res.status(500).send({
                    status: 500,
                    message: 'Error interno del servidor',
                });
            }
            if(result.length){
                const userData = {
                    user_firstname: result[0].user_firstname,
                    user_lastname: result[0].user_lastname,
                    user_email: result[0].user_email,
                    user_premium: result[0].user_premium,
                    user_status: result[0].user_status,
                };
                return res.status(200).send({
                    status: 200,
                    token: authMiddleware.setToken(result[0]),
                    message: 'Se ha logueado exitosamente',
                });
            }else{
                return res.status(403).send({
                    status: 403,
                    message: 'Credenciales incorrectas',
                });
            }
        });
    },

    profile: function(req, res) {
        const user_id = req.token.user_id;
        AppModel.select('view_users_profile_list', { user_id : user_id }, function(error, result) {
            if(error){
                return res.status(500).send({
                    status: 500,
                    message: 'Error interno del servidor',
                });
            }
            if(result.length){
                return res.status(200).send({
                    status: 200,
                    data: result[0],
                });
            }
            return res.status(404).send({
                status: 404,
                message: "No existen los datos que buscas",
            });
        });
    },

};

module.exports = AuthController;