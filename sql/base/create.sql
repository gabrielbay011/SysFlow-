CREATE TABLE IF NOT EXISTS ownership.tb_company(
    com_id INTEGER GENERATED ALWAYS AS IDENTITY,
    com_created_at DATE DEFAULT CURRENT_DATE NOT NULL,
    com_active BOOLEAN DEFAULT TRUE NOT NULL,
    com_country CHAR(3) DEFAULT 'BRA' NOT NULL,
    com_cnpj VARCHAR(18) UNIQUE NULL,
    com_name VARCHAR(60) UNIQUE NOT NULL,
    CONSTRAINT com_id PRIMARY KEY (com_id)
);

CREATE TABLE IF NOT EXISTS ownership.tb_owner(
	own_id INTEGER GENERATED ALWAYS AS IDENTITY,
	own_name VARCHAR(28) NOT NULL,
	own_last_name VARCHAR(60) NOT NULL,
	own_amount DECIMAL(8,2) NOT NULL,
	own_password VARCHAR(128) NOT NULL,
	own_cpf VARCHAR(14) UNIQUE NULL ,
	own_email TEXT UNIQUE NOT NULL,
	CONSTRAINT own_id PRIMARY KEY (own_id)
);

CREATE TABLE IF NOT EXISTS ownership.tb_building(
	bui_id INTEGER GENERATED ALWAYS AS IDENTITY,
	bui_name VARCHAR(48) NOT NULL,
	bui_amount DECIMAL(8,2) NULL,
	bui_photo TEXT NOT NULL,
	own_id INTEGER NOT NULL,
	CONSTRAINT bui_id PRIMARY KEY (bui_id),
	FOREIGN KEY (own_id) REFERENCES ownership.tb_owner(own_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS ownership.tb_floor(
	flo_id INTEGER GENERATED ALWAYS AS IDENTITY,
	flo_created_at DATE DEFAULT CURRENT_DATE NOT NULL,
	flo_end_of_contract DATE NULL,
	flo_number INTEGER NOT NULL,
	bui_id INTEGER NOT NULL,
	com_id INTEGER NOT NULL,
	CONSTRAINT flo_id PRIMARY KEY (flo_id),
	FOREIGN KEY (com_id) REFERENCES ownership.tb_company(com_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (bui_id) REFERENCES ownership.tb_building ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS ownership.tb_people(
	peo_id INTEGER GENERATED ALWAYS AS IDENTITY,
	peo_name VARCHAR(28) NOT NULL,
	peo_last_name TEXT NOT NULL,
	peo_salary DECIMAL(8,2) NULL,
	peo_cep VARCHAR(9) NULL,
	peo_uf VARCHAR(48) NULL,
	peo_town VARCHAR(48) NULL,
	peo_district CHAR(2) NULL,
	peo_street TEXT NULL,
	peo_number INTEGER NULL,
	peo_rg VARCHAR(12) UNIQUE NOT NULL,
	peo_phone_number VARCHAR(15) NOT NULL UNIQUE,
	peo_photo TEXT UNIQUE NOT NULL,
	peo_cpf VARCHAR(14) UNIQUE NOT NULL,
	com_id INTEGER UNIQUE NOT NULL,
	CONSTRAINT peo_id PRIMARY KEY (peo_id),
	FOREIGN KEY (com_id) REFERENCES ownership.tb_company ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS equipment.tb_equipment(
	equ_id INTEGER GENERATED ALWAYS AS IDENTITY,
	equ_type CHAR(1) NOT NULL,
	equ_tag TEXT UNIQUE NOT NULL,
	schema_ownership_flu_id INTEGER NOT NULL,
	CONSTRAINT equ_id PRIMARY KEY (equ_id),
	FOREIGN KEY (schema_ownership_flo_id) REFERENCES ownership.tb_floor(flo_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS equipment.tb_capture(
	cap_id INTEGER GENERATED ALWAYS AS IDENTITY,
	cap_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	cap_content TEXT UNIQUE NULL,
	equ_id INTEGER NOT NULL,
	CONSTRAINT cap_id PRIMARY KEY (cap_id),
	FOREIGN KEY (equ_id) REFERENCES equipment.tb_equipment(equ_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS equipment.tb_token(
	tok_id INTEGER  GENERATED ALWAYS AS IDENTITY,
	tok_in BOOLEAN NOT NULL,
	tok_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ,
	tok_content TEXT UNIQUE NULL,
	equ_id INTEGER NOT NULL,
	schema_ownership_peo_id INTEGER NOT NULL,
	CONSTRAINT tok_id PRIMARY KEY (tok_id),
	FOREIGN KEY (equ_id) REFERENCES equipment.tb_equipment(equ_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (schema_ownership_peo_id) REFERENCES ownership.tb_people(peo_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS equipment.tb_elevator(
	ele_id INTEGER GENERATED ALWAYS AS IDENTITY,
	ele_weight DECIMAL(7,2) NULL,
	ele_risk DECIMAL(2,2) NULL,
	ele_tag TEXT UNIQUE NOT NULL,
	schema_ownership_bui_id INTEGER NOT NULL,
	CONSTRAINT ele_id PRIMARY KEY (ele_id),
	FOREIGN KEY (schema_ownership_bui_id) REFERENCES ownership.tb_building(bui_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS equipment.tb_point_of_stopover(
	poi_id INTEGER GENERATED ALWAYS AS IDENTITY,
	poi_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	ele_id INTEGER NOT NULL,
	schema_ownership_flu_id INTEGER NOT NULL,
	CONSTRAINT poi_id PRIMARY KEY (poi_id),
	FOREIGN KEY (ele_id) REFERENCES equipment.tb_elevator(ele_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (schema_ownership_flu_id) REFERENCES ownership.tb_fluor(flu_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS equipment.tb_maintenance(
	mai_id INTEGER GENERATED ALWAYS AS IDENTITY,
	mai_description TEXT NULL,
	mai_total_price DECIMAL(8,2),
	mai_created_at DATE DEFAULT CURRENT_DATE NOT NULL,
	mai_finish_at DATE NULL,
	mai_status CHAR(1) DEFAULT 'Q' NOT NULL,
	mai_type CHAR(1) NOT NULL,
	mai_id_equipment INTEGER NOT NULL,
	CONSTRAINT mai_id PRIMARY KEY (mai_id),
	FOREIGN KEY (mai_id_equipment) REFERENCES equipment.tb_equipment(equ_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (mai_id_equipment) REFERENCES equipment.tb_elevator(ele_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS ownership.tb_statement(
	sta_id INTEGER GENERATED ALWAYS AS IDENTITY,
	sta_amount DECIMAL(8,2) NOT NULL,
	sta_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	own_id INTEGER NOT NULL,
	schema_equipment_mai_id INTEGER NULL,
	CONSTRAINT sta_id PRIMARY KEY (sta_id),
	FOREIGN KEY (own_id) REFERENCES ownership.tb_owner(own_id)  ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (schema_equipment_mai_id) REFERENCES equipment.tb_maintenance(mai_id)  ON DELETE RESTRICT ON UPDATE RESTRICT
);
