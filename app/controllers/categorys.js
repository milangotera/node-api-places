'use strict';

const AppModel = require('../models/AppModel');
const HelperService = require('../helpers');
const fs = require('fs');

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
        let category_icon = null;
        const category_image = `${HelperService.randomString(30)}.png`;
        const target_path = `./public/category/${category_image}`;
        
        if(req.files){
            if(req.files.category_icon){
                category_icon = req.files.category_icon;
            }
        }

        if(!req.body.category_name){
            errorData.category_name = "El campo nombre es requerido";
            errors++;
        }
        if(!req.body.category_display){
            errorData.category_display = "El campo display es requerido";
            errors++;
        }
        if(!category_icon){
            errorData.category_icon = "La campo imagen es requerido";
            errors++;
        }
        if(!errors){
            if(category_icon.type != 'image/jpeg' && category_icon.type != 'image/png'){
                errorData.category_icon = "La imagen solo admite jpeg/png";
                errors++;
            }
            if(category_icon.size > 4000000){
                errorData.category_icon = "La imagen excede el limite permitido";
                errors++;
            }
            if(!errors){
                fs.rename(category_icon.path, target_path, function(err) {
                    fs.unlink(category_icon.path, function() {
                        if(err){
                            errorData.category_icon = "No se pudo cargar la imagen";
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

        const categoryData = {
            category_name: req.body.category_name,
            category_display: req.body.category_display,
            category_icon: category_image
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