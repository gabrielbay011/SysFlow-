import schedule
import time
from simulator.models.tester import Tester

obj = Tester()

schedule.every(3).hours.do(obj.run)

while True:
    schedule.run_pending()
    time.sleep(60)


