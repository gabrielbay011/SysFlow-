from abc import ABC, abstractmethod
from faker import Faker
<<<<<<< HEAD
from simulator.models.datas import Owner
from random import Random

class Task(ABC):
    """Interface to all tasks in Generators, introduzing a schema default"""
    def __init__(self):
        self._fk = Faker("pt-BR")
    @abstractmethod
    def to_generate_data(self): pass

class GeneratorPeople(Task):
    def to_generate_data(self):
        random = Random()
        return Owner(
            self._fk.name(),
            self._fk.last_name(),
            random.uniform(1, 10),
            self._fk.cpf(), self._fk.email(),
            self._fk.password()
        )

class GeneratorBuilding(Task):
    def to_generate_data(self):
        pass

class Executor:
    def __init__(self):
        self._list_task = []

    def run(self, task: Task):
        self._list_task(task.to_generate_data())




=======
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
>>>>>>> fa769570ececed7961d2f7859a4927f0d9cb892c

