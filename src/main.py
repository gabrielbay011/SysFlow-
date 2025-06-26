from service.generator import Generator
import psycopg2
from conn import Conection
conection = Conection("luaqljfdvxwhlwetkjpi", "postgres", "3002Grs$0604", "luaqljfdvxwhlwetkjpi.db.sa-east-1.nhost.run" , 5432).to_conect()
cur = conection.cursor()

g = Generator()
owner = g.to_generate_owner()
print(owner)
sql = f"INSERT INTO owner(own_name, own_last_name, own_value, own_cpf, own_email, own_password) VALUES ('{owner.name}', '{owner.last_name}', {owner.value},'{owner.cpf}', '{owner.email}', '{owner.password}')"

cur.execute(sql)
conection.commit()
cur.close()
conection.close()