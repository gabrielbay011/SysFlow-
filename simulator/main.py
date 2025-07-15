import schedule
import time
from simulator.models.factory import Factory
from simulator.models.generators import GeneratorCompany
from simulator.models.database import Database

obj = Factory()
g = GeneratorCompany()

db = Database()

company  = obj.run(g)
name = company.name
cnpj = company.cnpj
print(f"Nome: {(name)} Cnpj: {cnpj}")
schedule.every(1).minutes.do(lambda: db.to_insert_in_company(str(name), str(cnpj)))

if __name__ == "__main__":
    while True:
        schedule.run_pending()
        time.sleep(60)
