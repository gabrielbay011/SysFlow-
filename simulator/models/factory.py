from simulator.models.generators import Task
class Factory:

    def __init__(self):
        self._list_of_datas = []

    def run(self, task:Task):
        task.to_generate_data()
