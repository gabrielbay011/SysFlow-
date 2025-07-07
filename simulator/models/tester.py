from simulator.models.database import Database

class Tester:

    def __init__(self):
        self.__database = Database()

    def run(self):
        print("Estou rodando os testes")