from abc import ABC, abstractmethod
from faker import Faker
from simulator.models.datas import Company
from simulator.models.connection import Connection

class Task(ABC):
    """
    Inteface for all tasks os generates
    """
    def __init__(self):
        self._fk = Faker("pt-BR")

    @abstractmethod
    def to_generate_data(self):pass

class GeneratorCompany(Task):

    def to_generate_data(self):
        return Company(self._fk.company(), self._fk.cnpj())



