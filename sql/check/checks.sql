SELECT add_check_if_not_exists('sys_flow.ratchat', 'chk_rat_tag_length', 'char_length(rat_tag) = 12'); --A call for to use the function add_check_if_not_exists. Args: Name of table, Name of constraint, check


-- OWNER
SELECT add_check_if_not_exists(
  'sys_flow.owner',
  'chk_own_name_minlen',
  'char_length(own_name) > 2'
);

SELECT add_check_if_not_exists(
  'sys_flow.owner',
  'chk_own_last_name_minlen',
  'char_length(own_last_name) > 2'
);

SELECT add_check_if_not_exists(
  'sys_flow.owner',
  'chk_own_email_format',
  'own_email ~* ''^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'''
);

SELECT add_check_if_not_exists(
  'sys_flow.owner',
  'chk_own_cpf_format',
  'own_cpf ~ ''^\d{3}\.\d{3}\.\d{3}\-\d{2}$'' OR own_cpf ~ ''^\d{11}$'''
);

-- COMPANY
SELECT add_check_if_not_exists(
  'sys_flow.company',
  'chk_com_name_minlen',
  'char_length(com_name) > 2'
);

SELECT add_check_if_not_exists(
  'sys_flow.company',
  'chk_com_cnpj_format',
  'com_cnpj ~ ''^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}$'' OR com_cnpj ~ ''^\d{14}$'''
);

SELECT add_check_if_not_exists(
  'sys_flow.company',
  'chk_com_country_length',
  'char_length(com_country) = 3'
);

-- RATCHAT
SELECT add_check_if_not_exists(
  'sys_flow.ratchat',
  'chk_rat_tag_length',
  'char_length(rat_tag) = 12'
);

