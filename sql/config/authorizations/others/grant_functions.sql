GRANT USAGE
    ON SCHEMA sys_flow
    TO usr_test_user;

GRANT INSERT
    ON sys_flow.view_insert_t_company_r_sysflow_test_user
    TO usr_test_user;

GRANT EXECUTE
    ON FUNCTION sys_flow.view_insert_function_t_company_r_sysflow_test_user()
    TO usr_test_user;

