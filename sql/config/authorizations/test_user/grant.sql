GRANT USAGE ON SCHEMA ownership TO sysflow_test_user;

GRANT INSERT
    (
        peo_name,
        peo_last_name,
        peo_salary,
        peo_cep,
        peo_uf,
        peo_town,
        peo_district,
        peo_street,
        peo_number,
        peo_rg,
        peo_phone,
        peo_photo,
        peo_cpf,
        com_id
    )
    ON ownership
    TO sysflow_test_user;

GRANT SELECT (peo_id) ON ownership TO sysflow_test_user;

GRANT INSERT (com_name, com_cnpj) ON ownership.tb_company TO sysflow_test_user;
GRANT SELECT (com_id) ON ownership.tb_company TO sysflow_test_user;