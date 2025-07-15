from abc import ABC, abstractmethod
from faker import Faker
from simulator.models.datas import Owner, Employee, Company


class Task(ABC):
    """
    Inteface for all tasks os generates
    """
    def __init__(self):
        self._fk = Faker("pt-BR")

    @abstractmethod
    def to_generate_data(self):pass

class GeneratorEmployee(Task):

    def to_generate_data(self):
        return Employee(self._fk.name(), self._fk.last_name(), self._fk.cpf(),self._fk.catch_phrase(), self._fk.phone_number())

class GeneratorCompany(Task):

    def to_generate_data(self):
        return Company(self._fk.company(), self._fk.cnpj())
