GRANT CREATE
        ON SCHEMA ownership
        TO sysflow_test_user;

SET ROLE sysflow_test_user;
CREATE OR REPLACE FUNCTION
        ownership.f_people_t_test_user(
        name VARCHAR(28),
        last_name TEXT,
        salary DECIMAL(8,2),
        cep VARCHAR(9),
        uf CHAR(2),
        town VARCHAR(48),
        district VARCHAR(48),
        street TEXT,
        number INTEGER,
        rg VARCHAR(12),
        phone_number VARCHAR(15),
        photo TEXT,
        cpf VARCHAR(14),
        company INTEGER
)
RETURNS INTEGER AS $$
DECLARE
        id INTEGER;
BEGIN
        INSERT INTO ownership.tb_people(
                                        peo_name, peo_last_name, peo_salary, peo_cep, peo_uf, peo_town, peo_district,
                                        peo_street, peo_number, peo_rg, peo_phone_number, peo_photo, peo_cpf, com_id)
        VALUES (name, last_name, salary, cep, uf, town, district, street, number, rg, phone_number, photo, cpf, company)
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
