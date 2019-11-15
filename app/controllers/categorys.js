'use strict';

var AppModel = require('../models/AppModel');

const CategorysController = {
    
    list: function(req, res) {
        AppModel.select('view_categorys_list', null, function(error, result) {
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

    listPlaces: function(req, res) {
        let category_id = req.params.id;
        AppModel.select('view_places_list', { category_id : category_id }, function(error, result) {
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

};

module.exports = CategorysController;