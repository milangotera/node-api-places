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

    create: function(req, res) {

        let errors = 0;
        let errorData = {};

        if(!req.body.category_name){
            errorData.category_name = "El campo nombre es requerido";
            errors++;
        }
        if(!req.body.category_display){
            errorData.category_display = "El campo display es requerido";
            errors++;
        }

        if(errors){
            return res.status(403).send({
                status:403,
                errors: errorData,
                message: 'Error en envío de datos',
            });
        }

        const categoryData = {
            category_name: req.body.category_name,
            category_display: req.body.category_display,
            category_icon: 'category/0.png'
        };

        AppModel.insert('category', categoryData, function(error, result) {
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