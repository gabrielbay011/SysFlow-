import psycopg2
import os

class Database:
    def __init__(self):

        self.__dbname= os.getenv("DB_NAME")
        self.__user= os.getenv("DB_USER")
        self.__password= os.getenv("DB_PASSWORD")
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



