GRANT SELECT ON SCHEMA sysflow TO sysflow_backup;
GRANT DELETE ON SCHEMA sysflow TO sysflow_maintenance;
GRANT INSERT ON SCHEMA sysflow TO sysflow_test_user;

REVOKE INSERT (own_id) ON sysflow.owner TO sysflow_test_user;
REVOKE INSERT (man_id) ON sysflow.maintenance TO sysflow_test_user;
REVOKE INSERT (bui_id) ON sysflow.building TO sysflow_test_user;
REVOKE INSERT (com_id) ON sysflow.company TO sysflow_test_user;
REVOKE INSERT (fluor_id) ON sysflow.fluor TO sysflow_test_user;
REVOKE INSERT (emp_id) ON sysflow.employee TO sysflow_test_user;
REVOKE INSERT (cam_id) ON sysflow.camera TO sysflow_test_user;
REVOKE INSERT (poi_id) ON sysflow.ass_point_of_stopover TO sysflow_test_user;
REVOKE INSERT (ele_id) ON sysflow.elevator TO sysflow_test_user;
REVOKE INSERT (rec_id) ON sysflow.ass_recording_acess TO sysflow_test_user;
REVOKE INSERT (tape_id) ON sysflow.ass_tape TO sysflow_test_user;
REVOKE INSERT (rat_id) ON sysflow.ratchet TO sysflow_test_user;
REVOKE INSERT (hout_id) ON sysflow.historic_of_out TO sysflow_test_user;