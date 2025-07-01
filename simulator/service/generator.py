from simulator.models.datas import Owner, Company, Building, Employee, Ratchet
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
            id_company
        )

    def to_generate_employee(self, id_company):
        return Employee(
            self.fake.name(),
            self.fake.last_name(),
            self.fake.cpf(),
            f"{random.randint(10000, 99999)}.jpg",
            self.fake.phone_number(),
            id_company
        )

    def to_generate_ratchet(self, id_building):
        return Ratchet(
            str(self.fake.word()),
            random.uniform(500.00, 1800.00),
            id_building
        )






