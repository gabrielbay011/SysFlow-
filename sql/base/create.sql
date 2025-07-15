CREATE TABLE sys_flow.historic_of_out (
    hout_id INTEGER GENERATED ALWAYS AS IDENTITY,
    hout_value DECIMAL(7,2) NOT NULL,
    hout_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    hout_type_mov CHAR(1) NOT NULL,
    own_id INTEGER NOT NULL,
    CONSTRAINT hout_id PRIMARY KEY (hout_id),
    FOREIGN KEY (own_id) REFERENCES sys_flow.owner(own_id) ON DELETE RESTRICT
);

CREATE TABLE sys_flow.company (
    com_id INTEGER GENERATED ALWAYS AS IDENTITY,
    com_name VARCHAR(60) NOT NULL UNIQUE,
    com_cnpj VARCHAR(18) NOT NULL UNIQUE,
    com_start_date DATE DEFAULT CURRENT_DATE NOT NULL,
    com_active BOOLEAN DEFAULT TRUE,
    com_country CHAR(3) NOT NULL DEFAULT 'BRA',
    CONSTRAINT com_id PRIMARY KEY (com_id)
);

CREATE TABLE sys_flow.building (
    bui_id INTEGER GENERATED ALWAYS AS IDENTITY,
    bui_name VARCHAR(48) NOT NULL UNIQUE,
    bui_uf CHAR(2) NULL,
    bui_city VARCHAR(48) NULL,
    bui_district VARCHAR(48) NULL,
    bui_street VARCHAR(48) NULL,
    bui_number INTEGER NULL,
    bui_yield DECIMAL(8,2) NULL,
    bui_photo TEXT NULL,
    own_id INTEGER NOT NULL,
    com_id INTEGER NOT NULL,
    CONSTRAINT bui_id PRIMARY KEY (bui_id),
    FOREIGN KEY (com_id) REFERENCES sys_flow.company(com_id) ON DELETE RESTRICT,
    FOREIGN KEY (own_id) REFERENCES sys_flow.owner(own_id) ON DELETE RESTRICT
);

CREATE TABLE sys_flow.camera (
    cam_id INTEGER GENERATED ALWAYS AS IDENTITY,
    cam_tag VARCHAR(12) NOT NULL UNIQUE,
    cam_price_maintenance DECIMAL(5,2) NOT NULL,
    bui_id INTEGER NOT NULL,
    CONSTRAINT cam_id PRIMARY KEY (cam_id),
    FOREIGN KEY (bui_id) REFERENCES sys_flow.building(bui_id) ON DELETE RESTRICT
);

CREATE TABLE sys_flow.elevator (
    ele_id INTEGER GENERATED ALWAYS AS IDENTITY,
    ele_tag VARCHAR(12) NOT NULL UNIQUE ,
    ele_weight DECIMAL(4,2),
    ele_number_person INTEGER,
    ele_risk DECIMAL(2,2),
    ele_amount_maintenance INTEGER,
    bui_id INTEGER NOT NULL,
    CONSTRAINT ele_id PRIMARY KEY (ele_id),
    FOREIGN KEY (bui_id) REFERENCES sys_flow.building(bui_id) ON DELETE RESTRICT
);

CREATE TABLE sys_flow.employee (
    emp_id INTEGER GENERATED ALWAYS AS IDENTITY,
    emp_active BOOLEAN DEFAULT true,
    emp_name VARCHAR(28) NOT NULL CHECK (char_length(emp_name) > 2),
    emp_last_name VARCHAR(60) NOT NULL CHECK (char_length(emp_last_name) > 2),
    emp_cpf VARCHAR(14) NOT NULL UNIQUE,
    emp_photo TEXT,
    emp_phone_number VARCHAR(15),
    com_id INTEGER NOT NULL,
    CONSTRAINT emp_id PRIMARY KEY (emp_id),
    FOREIGN KEY (com_id) REFERENCES sys_flow.company(com_id) ON DELETE RESTRICT
);

CREATE TABLE sys_flow.ass_tape (
    tape_id INTEGER GENERATED ALWAYS AS IDENTITY,
    tape_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cam_id INTEGER NOT NULL,
    emp_id INTEGER NOT NULL,
    CONSTRAINT tape_id PRIMARY KEY (tape_id),
    FOREIGN KEY (cam_id) REFERENCES sys_flow.camera(cam_id) ON DELETE CASCADE,
    FOREIGN KEY (emp_id) REFERENCES sys_flow.employee(emp_id) ON DELETE CASCADE
);

CREATE TABLE sys_flow.ratchat (
    rat_id INTEGER GENERATED ALWAYS AS IDENTITY,
    rat_status CHAR(1) NOT NULL,
    rat_tag VARCHAR(12) NOT NULL UNIQUE,
    rat_price_maintenance DECIMAL(5,2) NULL,
    CONSTRAINT rat_id PRIMARY KEY (rat_id)
);

CREATE TABLE sys_flow.fluor (
    fluor_id INTEGER GENERATED ALWAYS AS IDENTITY,
    fluor_start_date DATE DEFAULT CURRENT_DATE,
    fluor_final_date DATE DEFAULT CURRENT_DATE,
    fluor_number INTEGER NOT NULL,
    com_id INTEGER NOT NULL,
    bui_id INTEGER NOT NULL,
    CONSTRAINT fluor_id PRIMARY KEY (fluor_id),
    FOREIGN KEY (com_id) REFERENCES sys_flow.company(com_id) ON DELETE CASCADE,
    FOREIGN KEY (bui_id) REFERENCES sys_flow.building(bui_id) ON DELETE CASCADE
);

CREATE TABLE sys_flow.ass_recording_acess (
    rec_id INTEGER GENERATED ALWAYS AS IDENTITY,
    rec_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    emp_id INTEGER NOT NULL,
    rat_id INTEGER NOT NULL,
    CONSTRAINT rec_id PRIMARY KEY (rec_id),
    FOREIGN KEY (emp_id) REFERENCES sys_flow.employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (rat_id) REFERENCES sys_flow.ratchat(rat_id) ON DELETE CASCADE
);

-- Estrutura polimórfica para equipamentos
-- mai_type: 'E' = Elevator, 'R' = Ratchat, 'C' = Camera

CREATE TABLE sys_flow.maintenance (
    mai_id INTEGER GENERATED ALWAYS AS IDENTITY,
    mai_description TEXT,
    mai_total_price DECIMAL(5,2),
    mai_start_date DATE DEFAULT CURRENT_DATE NOT NULL,
    mai_date_prevision DATE,
    mai_status CHAR(1) NOT NULL,
    mai_id_equipment INTEGER NOT NULL,
    mai_type CHAR(1) NOT NULL,
    CONSTRAINT mai_id PRIMARY KEY (mai_id)
    -- Integridade polimórfica tratada na aplicação
);

CREATE TABLE sys_flow.ass_point_of_stopover(
    poi_id INTEGER GENERATED ALWAYS AS IDENTITY,
    poi_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ele_id INTEGER NOT NULL,
    fluor_id INTEGER NOT NULL,
    CONSTRAINT poi_id PRIMARY KEY (poi_id),
    FOREIGN KEY (ele_id) REFERENCES sys_flow.elevator(ele_id) ON DELETE CASCADE,
    FOREIGN KEY (fluor_id) REFERENCES sys_flow.fluor(fluor_id) ON DELETE CASCADE
);
