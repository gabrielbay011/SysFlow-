from simulator.models.connection import Connection

class Database:
    def __init__(self):
        self._conn = Connection().to_conect()

    def to_insert_in_company(self, name: str, cnpj: str):
        cursor = self._conn.cursor()
        try:
            cursor.execute("INSERT INTO  sys_flow.view_insert_t_company_r_sysflow_test_user (com_name, com_cnpj) VALUES (%s, %s);", (name, cnpj))
            self._conn.commit()
        except Exception as e:
            print(f"Ocorreu o seguinte erro: {e}")
        finally:
            self._conn.close()
            cursor.close()


