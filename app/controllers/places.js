'use strict';

var AppModel = require('../models/AppModel');

const PlacesController = {
    
    list: function(req, res) {
        AppModel.select('view_places_list', null, function(error, result) {
            if(error){
                return res.status(500).send({
                    status: 500,
                    message: 'Error interno del servidor',
                });
            }
            if(result){
                return res.status(200).send({
                    status: 200,
                    data: result,
                });
            }
        });
    },

    show: function(req, res) {
        let place_id = req.params.id;
        AppModel.select('view_places_list', { place_id : place_id }, function(error, result) {
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

    listComments: function(req, res) {
        let place_id = req.params.id;
        AppModel.select('view_comments_list', { place_id : place_id }, function(error, result) {
            if(error){
                return res.status(500).send({
                    status: 500,
                    message: 'Error interno del servidor',
                });
            }
            if(result.length){
                return res.status(200).send({
                    status: 200,
                    data: result,
                });
            }
            return res.status(404).send({
                status: 404,
                message: "No existen los datos que buscas",
            });
        });
    },

    createComments: function(req, res) {

        const place_id = req.params.id;
        const user_id = req.token.user_id;

        AppModel.select('place', { place_id : place_id }, function(error, result) {
            
            if(error){
                return res.status(500).send({
                    status: 500,
                    message: 'Error interno del servidor',
                });
            }

            else if(result.length){

                let errors = 0;
                let errorData = {};

                if(!req.body.comment_content){
                    errorData.comment_content = "El campo comentario es requerido";
                    errors++;
                }
                if(!req.body.comment_vote){
                    errorData.comment_visited = "El campo voto es requerido";
                    errors++;
                }
                if(!place_id){
                    errorData.place_id = "El campo plaza es requerido";
                    errors++;
                }
                if(!user_id){
                    errorData.user_id = "El campo user es requerido";
                    errors++;
                }

                if(errors){
                    return res.status(403).send({
                        status:403,
                        errors: errorData,
                        message: 'Error en envío de datos',
                    });
                }

                const commentData = {
                    comment_content: req.body.comment_content,
                    comment_vote: req.body.comment_vote,
                    comment_display: 1,
                    place_id: place_id,
                    user_id: user_id,
                };
                AppModel.insert('comment', commentData, function(error, result) {
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
            
            else{
                return res.status(404).send({
                    status: 404,
                    message: "No existen los datos que buscas",
                });
            }
        });
    },

};

module.exports = PlacesController;