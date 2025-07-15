ALTER TABLE ownership.tb_company
ADD CONSTRAINT chk_com_name
CHECK (char_length(com_name) >= 3 AND com_name <> '');

ALTER TABLE ownership.tb_owner
ADD CONSTRAINT chk_own_name
CHECK (char_length(own_name) >= 3 AND own_name <> '');

ALTER TABLE ownership.tb_owner
ADD CONSTRAINT chk_own_last_name
CHECK (char_length(own_last_name) >= 3 AND own_last_name <> '');

ALTER TABLE ownership.tb_owner
ADD CONSTRAINT chk__own_cpf_format
CHECK (own_cpf ~ '^\d{3}\.\d{3}\.\d{3}-\d{2}$');

ALTER TABLE ownership.tb_owner
ADD CONSTRAINT chk_email_format
CHECK (own_email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

ALTER TABLE ownership.tb_people
ADD CONSTRAINT chk_peo_name
CHECK (char_length(peo_name) >= 3 AND peo_name <> '');

ALTER TABLE ownership.tb_people
ADD CONSTRAINT chk_peo_last_name
CHECK (char_length(peo_last_name) >= 3 AND peo_last_name <> '');

ALTER TABLE ownership.tb_people
ADD CONSTRAINT chk_peo_rg_format
CHECK (peo_rg ~ '^\d{2}\.\d{3}\.\d{3}-[0-9Xx]$');

ALTER TABLE ownership.tb_people
ADD CONSTRAINT chk_peo_cpf_format
CHECK (peo_cpf ~ '^\d{3}\.\d{3}\.\d{3}-\d{2}$');

