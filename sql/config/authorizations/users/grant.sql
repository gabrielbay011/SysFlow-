-- PERMISSIONS OF INSERTS

GRANT INSERT
    (
        mai_description,
        mai_total_price,
        mai_date_prevision,
        mai_status,
        mai_type,
        mai_id_equipment
    )
    ON sys_flow.maintenance
    TO sysflow_user;

GRANT INSERT
    (
        bui_uf,
        bui_city,
        bui_district,
        bui_street,
        bui_number,
        bui_yield,
        bui_photo,
        own_id,
        com_id
    )
    ON sys_flow.building
    TO sysflow_user;

GRANT INSERT
    (
        com_name,
        com_cnpj,
        com_country
    )
    ON sys_flow.company
    TO sysflow_user;

GRANT INSERT
    (
        fluor_final_date,
        fluor_number,
        com_id,
        bui_id
    )
    ON sys_flow.fluor
    TO sysflow_user;

GRANT INSERT
    (
        emp_name,
        emp_last_name,
        emp_cpf,
        emp_photo,
        emp_phone_number,
        com_id
    )
    ON sys_flow.employee
    TO sysflow_user;

GRANT INSERT
    (
        cam_tag, cam_price_maintenance, bui_id
    )
    ON sys_flow.camera
    TO sysflow_user;

GRANT INSERT
    (ele_id, fluor_id)
    ON sys_flow.ass_point_of_stopover
    TO sysflow_user;

GRANT INSERT
    (
        ele_tag,
        ele_weight,
        ele_number_person,
        ele_risk,
        ele_amount_maintenance,
        bui_id
        )
    ON sys_flow.elevator
    TO sysflow_user;

GRANT INSERT
    (emp_id, rat_id)
    ON sys_flow.ass_recording_acess
    TO sysflow_user;

GRANT INSERT
    (cam_id, emp_id)
    ON sys_flow.ass_tape
    TO sysflow_user;

GRANT INSERT
    (rat_tag, rat_price_maintenance)
    ON sys_flow.ratchet
    TO sysflow_user;


-- SELECTS
GRANT SELECT ON sys_flow.owner TO sysflow_user;
GRANT SELECT ON sys_flow.maintenance TO sysflow_user;
GRANT SELECT ON sys_flow.building TO sysflow_user;
GRANT SELECT ON sys_flow.company TO sysflow_user;
GRANT SELECT ON sys_flow.fluor TO sysflow_user;
GRANT SELECT ON sys_flow.employee TO sysflow_user;
GRANT SELECT ON sys_flow.camera TO sysflow_user;
GRANT SELECT ON sys_flow.ass_point_of_stopover TO sysflow_user;
GRANT SELECT ON sys_flow.elevator TO sysflow_user;
GRANT SELECT ON sys_flow.ass_recording_acess TO sysflow_user;
GRANT SELECT ON sys_flow.ass_tape TO sysflow_user;
GRANT SELECT ON sys_flow.ratchet TO sysflow_user;
GRANT SELECT ON sys_flow.historic_of_out TO sysflow_user;

-- UPDATES
GRANT UPDATE
    (
        own_name,
        own_last_name,
        own_value,
        own_cpf,
        own_email,
        own_password
    )
    ON sys_flow.owner
    TO sysflow_user;

GRANT UPDATE
    (
        mai_description,
        mai_total_price,
        mai_prevision_date,
        mai_status,
        mai_type,
        mai_id_equipment
    )
    ON sys_flow.maintenance
    TO sysflow_user;

GRANT UPDATE
    (
        bui_uf,
        bui_city,
        bui_district,
        bui_street,
        bui_number,
        bui_yield,
        bui_photo,
        own_id,
        com_id
    )
    ON sys_flow.building
    TO sysflow_user;

GRANT UPDATE
    (
        com_id,
        com_name,
        com_cnpj,
        com_active,
        com_country
    )
    ON sys_flow.company
    TO sysflow_user;

GRANT UPDATE
    (fluor_final_date, fluor_number, com_id,bui_id)
    ON sys_flow.fluor
    TO sysflow_user;

GRANT UPDATE
    (emp_active, emp_name, emp_last_name, emp_cpf, emp_photo, emp_phone_number, com_id)
    ON sys_flow.employee
    TO sysflow_user;

GRANT UPDATE
    (cam_tag, cam_price_maintenance, bui_id)
    ON sys_flow.camera
    TO sysflow_user;


GRANT UPDATE
    (
        ele_tag,
        ele_weight,
        ele_number_person,
        ele_risk,
        ele_amount_maintenance,
        bui_id
    )
    ON sys_flow.elevator
    TO sysflow_user;

GRANT UPDATE
    (rat_status, rat_tag, rat_price_maintenance)
    ON sys_flow.ratchet
    TO sysflow_user;



