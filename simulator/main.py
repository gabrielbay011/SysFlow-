import schedule
import time
from simulator.models.generators import GeneratorCompany
from simulator.models.database import DBExecute


g_company = GeneratorCompany()

db = DBExecute()

company  = factory.create(g_company)

schedule.every(1).minutes.do(lambda: db.to_insert_in_company(company.name, company.cnpj))

if __name__ == "__main__":
    while True:
        schedule.run_pending()
        time.sleep(60)
