from abc import ABC, abstractmethod
from simulator.models.database import Database

class Message(ABC):
    def __init__(self):
        self._db =Database()

    @abstractmethod
    def to_send(self): pass

class Company(Message):

    def __init__(self, name, cnpj):
        super().__init__()
        self._name = name
        self._cnpj = cnpj

    def to_send(self):
        self._db.send_company(self._name, self._cnpj)

class Employee(Message):

    def __init__(self, name, last_name):
        self._name = name
        self._last_name

    def to_send(self):
        pass

