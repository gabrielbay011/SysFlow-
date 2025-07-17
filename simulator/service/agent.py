import schedule
import time
from datetime import datetime
from simulator.models.generators import GeneratorCompany
from simulator.models.factory import Factory

class Agent:
    def __init__(self):
        self._data_storage = []
        self._company = GeneratorCompany()
        self._factory = Factory()

    def start(self, hour_generate_data: int, up_time: int):
        schedule.every(hour_generate_data).hours.do(self._collect_and_store_data)
        print("Agente iniciado. Coleta de dados agendada para cada minuto.")

        schedule.every(up_time).hours.do(self._upload_one_data_to_db)
        while True:
            schedule.run_pending()
            time.sleep(1)

    def _collect_and_store_data(self):
        """Coleta dados da fábrica e os armazena."""
        task_result = self._factory.to_create(self._company)
        self._data_storage.append(task_result)
        print(f"Tarefa executada. Dados armazenados: {len(self._data_storage)} itens.")

    def _upload_one_data_to_db(self):
        """Envia o primeiro dado da fila para o banco de dados e o remove."""
        if not self._data_storage:
            print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Fila vazia. Nenhuns dados para enviar ao banco de dados.")
            return
        data_to_upload = self._data_storage[0]
        print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Iniciando upload de 1 item para o banco de dados...")

        try:
            self._factory.to_send_data(self._data_storage[0])
            self._data_storage.pop(0)  # Remove o item da fila após o upload bem-sucedido
            print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Upload de 1 dado concluído com sucesso! Item removido da fila.")
        except Exception as e:
            print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ERRO ao enviar dado para o banco de dados: {e}")
        finally:
            print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Dados restantes na fila: {len(self._data_storage)} itens.")
