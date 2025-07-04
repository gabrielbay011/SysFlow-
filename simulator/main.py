from simulator.service.generator import Generator
from sql.compile.conn import Conection
from dotenv import load_dotenv
import os

load_dotenv()

conection = Conection(os.getenv("DB_NAME"), os.getenv("DB_USER"), os.getenv("DB_PASSWORD"), os.getenv("DB_HOST") , (os.getenv("DB_PORT"))).to_conect()
cur = conection.cursor()


