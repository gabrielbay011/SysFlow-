-- OWNER CHECKS
ALTER TABLE sys_flow.owner ADD CONSTRAINT chk_own_name CHECK (char_length(own_name) > 2);
ALTER TABLE sys_flow.owner ADD CONSTRAINT chk_own_last_name_length CHECK (char_length(own_last_name) > 2);
ALTER TABLE sys_flow.owner ADD CONSTRAINT chk_own_cpf_format CHECK (own_cpf ~ '^\d{3}\.\d{3}\.\d{3}\-\d{2}$');
ALTER TABLE sys_flow.owner ADD CONSTRAINT chk_own_email_format CHECK (own_email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

-- COMPANY CHECKS
ALTER TABLE sys_flow.company ADD CONSTRAINT chk_com_cnpj_format CHECK (com_cnpj ~ '^\d{2}\.\d{3}\.\d{3}/\d{4}\-\d{2}$');

-- BUILDING CHECKS
ALTER TABLE sys_flow.building ADD CONSTRAINT chk_bui_city_length CHECK (char_length(bui_city) > 2);
ALTER TABLE sys_flow.building ADD CONSTRAINT chk_bui_street_length CHECK (char_length(bui_street) > 2);
ALTER TABLE sys_flow.building ADD CONSTRAINT chk_bui_name_lenght CHECK (char_length(bui_name) > 2)

-- EMPLOYEE CHECKS
ALTER TABLE sys_flow.employee ADD CONSTRAINT chk_emp_name_length CHECK (char_length(emp_name) > 2);
ALTER TABLE sys_flow.employee ADD CONSTRAINT chk_emp_last_name_length CHECK (char_length(emp_last_name) > 2);
ALTER TABLE sys_flow.employee ADD CONSTRAINT chk_emp_cpf_format CHECK (emp_cpf ~ '^\d{3}\.\d{3}\.\d{3}\-\d{2}$');
ALTER TABLE sys_flow.employee ADD CONSTRAINT chk_emp_phone_format CHECK (emp_phone_number ~ '^\(?\d{2}\)?\s?\d{4,5}\-?\d{4}$');

-- ELEVATOR CHECK
ALTER TABLE sys_flow.elevator ADD CONSTRAINT chk_ele_tag_length CHECK (char_length(ele_tag) = 12);

-- CAMERA CHECK
ALTER TABLE sys_flow.camera ADD CONSTRAINT chk_cam_tag_length CHECK (char_length(cam_tag) = 12);

-- RATCHAT CHECK
ALTER TABLE sys_flow.ratchat ADD CONSTRAINT chk_rat_tag_length CHECK (char_length(rat_tag) = 12);
