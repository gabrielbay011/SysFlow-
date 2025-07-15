GRANT CREATE
        ON SCHEMA ownership
        TO sysflow_test_user;

SET ROLE sysflow_test_user;

CREATE OR REPLACE FUNCTION
    ownership.f_company_t_test_user(
        name VARCHAR(60), cnpj VARCHAR(18)
    )
RETURNS INTEGER AS $$
DECLARE
    id INTEGER;
BEGIN
    INSERT INTO ownership.tb_company(com_name, com_cnpj) VALUES (name, cnpj)
    RETURNING com_id INTO id;
    RETURN id;
END;
$$ LANGUAGE plpgsql
SECURITY DEFINER;
SET search_path = ownership, pg_temp;
RESET ROLE;

REVOKE CREATE
    ON SCHEMA ownership
    FROM sysflow_test_user;
