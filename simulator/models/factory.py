from simulator.models.generators import Task
from simulator.models.generators import GeneratorCompany
from simulator.models.datas import Message

class Factory:

    def __init__(self):
        self._storage = []

    def to_create(self, task:Task):
        return task.to_generate_data()

    def to_send_data(self, mss:Message):
        return mss.to_send()


