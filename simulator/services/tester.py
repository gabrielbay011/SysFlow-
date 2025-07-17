import schedule
import time

class Scheduler:

    def __init__(self, hour):
        self._interval_hours = hour

    def start(self):
        schedule.every(self._interval_hours).hours.do()
        print("Iniciando a criação de dados")
        while True:
            schedule.run_pending()
            time.sleep(1)