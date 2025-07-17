from simulator.models.connection import Connection

class Database:

    def __init__(self):
        self._conn = Connection().to_conect()

    def send_company(self, name, cnpj):
        cursor = self._conn.cursor()
        try:
            cursor.execute("SELECT ownership.f_company_t_test_user(%s, %s);", (name, cnpj))
            self._conn.commit()
        except Exception as e:
            print(f"Ocorreu o seguinte erro: {e}")
            self._conn.rollback()
        finally:
            self._conn.close()
            cursor.close()