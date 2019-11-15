/*
    VISTAR PARA LISTAR INFORMACION MAS COMPLETA
*/

/* PARA LISTAR LAS PLAZAS CON SUS DEMAS DATOS */
CREATE OR REPLACE VIEW view_places_list AS
SELECT 
	P.place_id,
    P.place_name,
    P.place_description,
    P.place_location,
    P.place_image,
    DATE_FORMAT(P.place_created_at,'%d/%m/%Y %H:%i:%s') AS place_created_at,
    P.category_id,
    P.place_display,
    C.category_name,
    P.user_id,
    U.user_firstname,
    U.user_lastname,
    U.user_avatar,
    P.zone_id,
    Z.zone_name
FROM
	place P
LEFT JOIN category C ON P.category_id = C.category_id
LEFT JOIN user U ON P.user_id = U.user_id
LEFT JOIN zone Z ON P.zone_id = P.zone_id
;

/* PARA LISTAR LOS COMENTARIOS CON SUS DEMAS DATOS */
CREATE OR REPLACE VIEW view_comments_list AS
SELECT 
	C.comment_id,
    C.comment_content,
    C.comment_vote,
    C.comment_display,
    DATE_FORMAT(C.comment_created_at,'%d/%m/%Y %H:%i:%s') AS comment_created_at,
    C.place_id,
    C.user_id,
    U.user_firstname,
    U.user_lastname,
    U.user_avatar
FROM
	comment C
LEFT JOIN place P ON C.place_id = P.place_id
LEFT JOIN user U ON C.user_id = U.user_id
;


/* PARA LISTAR LAS CATEGORIAS CON SUS DEMAS DATOS */
CREATE OR REPLACE VIEW view_categorys_list AS
SELECT 
	C.category_id,
    C.category_name,
    C.category_icon,
    C.category_display,
    (SELECT COUNT(0) FROM place P WHERE P.category_id=C.category_id) AS category_places
FROM
	category C
;


/* PARA LISTAR LAS ZONAS CON SUS DEMAS DATOS */
CREATE OR REPLACE VIEW view_zones_list AS
SELECT 
	Z.zone_id,
    Z.zone_name,
    (SELECT COUNT(0) FROM place P WHERE P.zone_id=Z.zone_id) AS zone_places
FROM
	zone Z
;

/* PARA LISTAR LOS PERFILES DE USUARIO */
CREATE OR REPLACE VIEW view_users_profile_list AS
SELECT 
	U.user_id,
    U.user_firstname,
    U.user_lastname,
    U.user_email,
    U.user_avatar
FROM
	user U
;