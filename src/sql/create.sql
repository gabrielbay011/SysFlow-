CREATE TABLE owner (
    own_id INTEGER GENERATED ALWAYS AS IDENTITY,
    own_name VARCHAR(28) NOT NULL,
    own_last_name VARCHAR(60) NOT NULL,
    own_value DECIMAL(7,2) NOT NULL,
    own_cpf VARCHAR(14) NOT NULL,
    own_email VARCHAR(60) NOT NULL,
    own_password VARCHAR(128),
    own_is_active BOOLEAN DEFAULT(true),
    CONSTRAINT own_id PRIMARY KEY (own_id)
);

CREATE TABLE historic_of_out (
    hout_id INTEGER GENERATED ALWAYS AS IDENTITY,
    hout_value DECIMAL(7,2) NOT NULL,
    hout_date DATE DEFAULT CURRENT_DATE,
    hout_type_mov CHAR(1) NOT NULL,
    own_id INTEGER NOT NULL,
    CONSTRAINT hout_id PRIMARY KEY (hout_id),
    FOREIGN KEY (own_id) REFERENCES owner(own_id) ON DELETE RESTRICT
);

CREATE TABLE camera (
    cam_id INTEGER GENERATED ALWAYS AS IDENTITY,
    cam_tag VARCHAR(12) NOT NULL UNIQUE,
    cam_price_maintenance DECIMAL(5,2) NOT NULL,
    CONSTRAINT cam_id PRIMARY KEY (cam_id)
);

CREATE TABLE company (
    com_id INTEGER GENERATED ALWAYS AS IDENTITY,
    com_name VARCHAR(60) NOT NULL UNIQUE,
    com_cnpj VARCHAR(18) NOT NULL UNIQUE,
    com_start_date DATE DEFAULT CURRENT_DATE NOT NULL,
    com_active BOOLEAN DEFAULT true,
    com_country CHAR(3) NOT NULL,
    CONSTRAINT com_id PRIMARY KEY (com_id)
);

CREATE TABLE building (
    bui_id INTEGER GENERATED ALWAYS AS IDENTITY,
    bui_uf CHAR(2) NOT NULL,
    bui_city VARCHAR(48) NOT NULL,
    bui_district VARCHAR(48),
    bui_street VARCHAR(60) NOT NULL,
    bui_yield DECIMAL(8,2),
    bui_photo TEXT,
    com_id INTEGER NOT NULL,
    own_id INTEGER NOT NULL,
    CONSTRAINT bui_id PRIMARY KEY (bui_id),
    FOREIGN KEY (com_id) REFERENCES company(com_id) ON DELETE RESTRICT,
    FOREIGN KEY (own_id) REFERENCES owner(own_id) ON DELETE RESTRICT
);

CREATE TABLE fluor (
    fluor_id INTEGER GENERATED ALWAYS AS IDENTITY,
    bui_id INTEGER NOT NULL,
    CONSTRAINT fluor_id PRIMARY KEY (fluor_id),
    FOREIGN KEY (bui_id) REFERENCES building(bui_id) ON DELETE RESTRICT
);

CREATE TABLE elevator (
    ele_id INTEGER GENERATED ALWAYS AS IDENTITY,
    ele_tag VARCHAR(12) NOT NULL UNIQUE,
    ele_weight DECIMAL(4,2),
    ele_number_peoples INTEGER,
    ele_risk DECIMAL(2,2),
    ele_amount_maintenance INTEGER,
    bui_id INTEGER NOT NULL,
    CONSTRAINT ele_id PRIMARY KEY (ele_id),
    FOREIGN KEY (bui_id) REFERENCES building(bui_id) ON DELETE RESTRICT
);

CREATE TABLE employee (
    emp_id INTEGER GENERATED ALWAYS AS IDENTITY,
    emp_active BOOLEAN DEFAULT true,
    emp_name VARCHAR(28) NOT NULL,
    emp_last_name VARCHAR(60) NOT NULL,
    emp_cpf VARCHAR(14) NOT NULL UNIQUE,
    emp_photo TEXT,
    emp_phone_number VARCHAR(15),
    com_id INTEGER NOT NULL,
    CONSTRAINT emp_id PRIMARY KEY (emp_id),
    FOREIGN KEY (com_id) REFERENCES company(com_id) ON DELETE RESTRICT
);

CREATE TABLE camera_employee (
    cem_id INTEGER GENERATED ALWAYS AS IDENTITY,
    cem_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cam_id INTEGER NOT NULL,
    emp_id INTEGER NOT NULL,
    CONSTRAINT cem_id PRIMARY KEY (cem_id),
    FOREIGN KEY (cam_id) REFERENCES camera(cam_id) ON DELETE CASCADE,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE
);

CREATE TABLE ratchat (
    rat_id INTEGER GENERATED ALWAYS AS IDENTITY,
    rat_status CHAR(1) NOT NULL,
    rat_tag VARCHAR(12) NOT NULL UNIQUE,
    rat_price DECIMAL(5,2) NOT NULL,
    bui_id INTEGER NOT NULL,
    CONSTRAINT rat_id PRIMARY KEY (rat_id),
    FOREIGN KEY (bui_id) REFERENCES building(bui_id) ON DELETE RESTRICT
);

CREATE TABLE elevator_fluor (
    efl_id INTEGER GENERATED ALWAYS AS IDENTITY,
    efl_date_hour TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ele_id INTEGER NOT NULL,
    fluor_id INTEGER NOT NULL,
    CONSTRAINT efl_id PRIMARY KEY (efl_id),
    FOREIGN KEY (ele_id) REFERENCES elevator(ele_id) ON DELETE CASCADE,
    FOREIGN KEY (fluor_id) REFERENCES fluor(fluor_id) ON DELETE CASCADE
);

CREATE TABLE company_fluor (
    cfl_id INTEGER GENERATED ALWAYS AS IDENTITY,
    cfl_start_date DATE DEFAULT CURRENT_DATE NOT NULL,
    cfl_final_date DATE,
    com_id INTEGER NOT NULL,
    fluor_id INTEGER NOT NULL,
    CONSTRAINT cfl_id PRIMARY KEY (cfl_id),
    FOREIGN KEY (com_id) REFERENCES company(com_id) ON DELETE CASCADE,
    FOREIGN KEY (fluor_id) REFERENCES fluor(fluor_id) ON DELETE CASCADE
);

CREATE TABLE employee_ratchat (
    era_id INTEGER GENERATED ALWAYS AS IDENTITY,
    era_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    emp_id INTEGER NOT NULL,
    rat_id INTEGER NOT NULL,
    CONSTRAINT era_id PRIMARY KEY (era_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (rat_id) REFERENCES ratchat(rat_id) ON DELETE CASCADE
);

-- Estrutura polimórfica para equipamentos
-- mai_type: 'E' = Elevator, 'R' = Ratchat, 'C' = Camera

CREATE TABLE maintenance (
    mai_id INTEGER GENERATED ALWAYS AS IDENTITY,
    mai_description TEXT,
    mai_total_price DECIMAL(5,2),
    mai_start_date DATE DEFAULT CURRENT_DATE NOT NULL,
    mai_date_prevision DATE,
    mai_status CHAR(1) NOT NULL,
    mai_id_equipment INTEGER NOT NULL,
    mai_type CHAR(1) NOT NULL CHECK (mai_type IN ('E', 'R', 'C')),
    CONSTRAINT mai_id PRIMARY KEY (mai_id)
    -- Integridade polimórfica tratada na aplicação
);

CREATE TABLE balanco (
    bal_id INTEGER GENERATED ALWAYS AS IDENTITY,
    bal_amount_pay DECIMAL(7,2) NOT NULL,
    bal_date DATE DEFAULT CURRENT_DATE NOT NULL,
    man_id INTEGER NOT NULL,
    own_id INTEGER NOT NULL,
    CONSTRAINT bal_id PRIMARY KEY (bal_id),
    FOREIGN KEY (man_id) REFERENCES maintenance(mai_id) ON DELETE CASCADE,
    FOREIGN KEY (own_id) REFERENCES owner(own_id) ON DELETE CASCADE
);
