'use strict';

var AppModel = require('../models/AppModel');
const HelperService = require('../helpers');
const fs = require('fs');

const PlacesController = {
    
    create: function(req, res) {

        let errors = 0;
        let errorData = {};
        let place_image = null;
        const place_photo = `${HelperService.randomString(30)}.png`;
        const target_path = `./public/place/${place_photo}`;
        
        if(req.files){
            if(req.files.place_image){
                place_image = req.files.place_image;
            }else{
                errorData.place_image = "El campo imagen es requerido";
                errors++;
            }
        }

        if(!req.body.place_name){
            errorData.place_name = "El campo nombre es requerido";
            errors++;
        }
        if(!req.body.place_description){
            errorData.place_description = "El campo descripcion es requerido";
            errors++;
        }
        if(!req.body.place_address){
            errorData.place_address = "El campo direccion es requerido";
            errors++;
        }
        if(!req.body.place_location){
            errorData.place_location = "El campo localización es requerido";
            errors++;
        }
        if(!req.token.user_id){
            errorData.user_id = "El campo usuario es requerido";
            errors++;
        }
        if(!req.body.zone_id){
            errorData.zone_id = "El campo zona es requerido";
            errors++;
        }
        if(!req.body.category_id){
            errorData.category_id = "El campo categoria es requerido";
            errors++;
        }
        if(!errors){
            if(place_image.type != 'image/jpeg' && place_image.type != 'image/png'){
                errorData.place_image = "La imagen solo admite jpeg/png";
                errors++;
            }
            if(place_image.size > 4000000){
                errorData.place_image = "La imagen excede el limite permitido";
                errors++;
            }
            if(!errors){
                fs.rename(place_image.path, target_path, function(err) {
                    fs.unlink(place_image.path, function() {
                        if(err){
                            errorData.place_image = "No se pudo cargar la imagen";
                            errors++;
                        }
                    });
                });
            }
        }

        if(errors){
            return res.status(403).send({
                status:403,
                errors: errorData,
                message: 'Error en envío de datos',
            });
        }

        const placeData = {
            place_image: place_photo,
            place_name: req.body.place_name,
            place_description: req.body.place_description,
            place_address: req.body.place_address,
            place_location: req.body.place_location,
            place_display: 1,
            user_id: req.token.user_id,
            zone_id: req.body.zone_id,
            category_id: req.body.category_id
        };

        AppModel.insert('place', placeData, function(error, result) {
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
    },

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