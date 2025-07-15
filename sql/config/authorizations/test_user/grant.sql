GRANT SELECT ON ALL TABLES IN SCHEMA sys_flow TO sysflow_backup;
GRANT SELECT ON ALL TABLES IN SCHEMA sys_flow TO sysflow_maintenance;
GRANT SELECT ON ALL TABLES IN SCHEMA sys_flow TO sysflow_test_user;

GRANT INSERT ON ALL TABLES IN SCHEMA sys_flow TO sysflow_test_user;

REVOKE INSERT (own_id) ON sys_flow.owner FROM sysflow_test_user;
REVOKE INSERT (mai_id) ON sys_flow.maintenance FROM sysflow_test_user;
REVOKE INSERT (bui_id) ON sys_flow.building FROM sysflow_test_user;
REVOKE INSERT (com_id) ON sys_flow.company FROM sysflow_test_user;
REVOKE INSERT (fluor_id) ON sys_flow.fluor FROM sysflow_test_user;
REVOKE INSERT (emp_id) ON sys_flow.employee FROM sysflow_test_user;
REVOKE INSERT (cam_id) ON sys_flow.camera FROM sysflow_test_user;
REVOKE INSERT (poi_id) ON sys_flow.ass_point_of_stopover FROM sysflow_test_user;
REVOKE INSERT (ele_id) ON sys_flow.elevator FROM sysflow_test_user;
REVOKE INSERT (rec_id) ON sys_flow.ass_recording_acess FROM sysflow_test_user;
REVOKE INSERT (tape_id) ON sys_flow.ass_tape FROM sysflow_test_user;
REVOKE INSERT (rat_id) ON sys_flow.ratchet FROM sysflow_test_user;
REVOKE INSERT (hout_id) ON sys_flow.historic_of_out FROM sysflow_test_user;