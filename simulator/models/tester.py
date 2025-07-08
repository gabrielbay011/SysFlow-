from simulator.models.connection import Connection

class Tester:

    def __init__(self):
        self.__database = Connection()

    def run(self):
        print("Estou rodando os testes ")