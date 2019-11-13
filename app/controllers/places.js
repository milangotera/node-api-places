'use strict';

var AppModel = require('../models/AppModel');

const PlacesController = {
    
    list: function(req, res) {
        AppModel.select('place', null, function(error, result) {
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
        AppModel.select('place', { place_id : place_id }, function(error, result) {
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
        AppModel.select('comment', { place_id : place_id }, function(error, result) {
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
        let place_id = req.params.id;
        AppModel.select('comment', { place_id : place_id }, function(error, result) {
            if(error){
                return res.status(500).send({
                    status: 500,
                    message: 'Error interno del servidor',
                });
            }
            if(result.length){
                return res.status(200).send({
                    status: 'POST',
                    data: result,
                });
            }
            return res.status(404).send({
                status: 404,
                message: "No existen los datos que buscas",
            });
        });
    },

};

module.exports = PlacesController;