from simulator.service.generator import Generator
from sql.compile.conn import Conection
from dotenv import load_dotenv
import os

load_dotenv()

conection = Conection(os.getenv("DB_NAME"), os.getenv("DB_USER"), os.getenv("DB_PASSWORD"), os.getenv("DB_HOST") , (os.getenv("DB_PORT"))).to_conect()
cur = conection.cursor()



g = Generator()
owner = g.to_generate_owner()
print(owner)
sql = f"INSERT INTO owner(own_name, own_last_name, own_value, own_cpf, own_email, own_password) VALUES ('{owner.name}', '{owner.last_name}', {owner.value},'{owner.cpf}', '{owner.email}', '{owner.password}')"

cur.execute(sql)
conection.commit()
cur.close()
conection.close()