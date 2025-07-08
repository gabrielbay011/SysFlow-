from simulator.models.generators import Task
from simulator.models.generators import GeneratorEmployee, GeneratorCompany

class Factory:

    def __init__(self):
        self._list_of_datas = []

    def run(self, task:Task):
        return task.to_generate_data()

