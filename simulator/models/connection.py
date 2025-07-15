import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

class Connection:
    """
    Class to connect to a database remotely
    Responsibility: Separate logic involving the database from the connection
    """
    def __init__(self):

        self.__dbname= os.getenv("DB_NAME")
        self.__user= os.getenv("DB_TEST_USER")
        self.__password= os.getenv("DB_TEST_PASSWORD")
        self.__host= os.getenv("DB_HOST")
        self.__port= os.getenv("DB_PORT")

    def to_conect(self):
        try:
            conn = psycopg2.connect(
                    dbname=self.__dbname,
                    user=self.__user,
                    password=self.__password,
                    host=self.__host,
                    port=self.__port
                        )
            return conn
        except Exception as e:
                    print(e)

        return False



