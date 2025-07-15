from simulator.models.generators import Task

class Producer:

    def __init__(self):
        self._data = []

    def to_add(self, task:Task):
        self._data.append(task)

    def to_execute(self):
        if self._data:
            task = self._data.pop(0)
            task.to_generate_data()
        else:
            print("Empty")

    @property
    def data(self):
        return self._data