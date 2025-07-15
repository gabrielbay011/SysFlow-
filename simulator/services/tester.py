import schedule

class Tester:

    def run(self, time):
        while True:
            schedule.run_pending()