from simulator.service.agent import Agent

if __name__ == "__main__":

    time_in = input("Digite em quanto tempo deseja para criar dados")
    time_out = input("Digite a hora para subir os dados")
    agent = Agent()
    agent.start(int(time_in), int(time_out))