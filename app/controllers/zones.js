'use strict';

var AppModel = require('../models/AppModel');

const ZonesController = {
    
    list: function(req, res) {
        AppModel.select('view_zones_list', null, function(error, result) {
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
        let zone_id = req.params.id;
        AppModel.select('view_places_list', { zone_id : zone_id }, function(error, result) {
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

module.exports = ZonesController;