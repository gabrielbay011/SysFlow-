from src.models.datas import Owner, Company, Building
from faker import Faker
import random

fake = Faker("pt-BR")

class Generator:

    def __init__(self):
        self.fake = Faker("pt-BR")


    def to_generate_owner(self):
        return Owner(fake.name(), fake.last_name(), random.uniform(100.0, 50000.00), fake.cpf(), fake.email(), fake.password())

    def to_generate_company(self):
        return Company(self.fake.company(), self.fake.cnpj(), self.fake.country())

    def to_generate_building(self, id_company, id_owner):
        return Building(
            self.fake.estado_sigla(),
            self.fake.city(),
            self.fake.cnpj(),
            self.fake.street_name(),
            random.randint(1, 999),
            random.uniform(500.00, 600000.00),
            f"{random.randint(10000, 99999)}.jpg",
            id_owner,
            id_company)



g = Generator()
pessoa1 = g.to_generate_owner()
empresa1 = g.to_generate_company()
print("Commitando no banco de dados ")
predio1 = g.to_generate_building(id(empresa1), id(pessoa1))
print(predio1)

