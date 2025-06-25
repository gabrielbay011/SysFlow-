import psycopg2


class Conection:
    def __init__(self, dbname, user, password, host, port):
        self.__dbname=dbname
        self.__user=user
        self.__password=password
        self.__host=host
        self.__port=port
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
