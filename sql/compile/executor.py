from sql.compile.conn import Conection
import psycopg2

class Executor:
    def __init__(self, file, host, dbname, port, user, password):
        self.conection = Conection(dbname=dbname, user=user, password=password, host=host, port=port)
        self.conn = self.conection.to_conect()
        self.cursor = self.conn.cursor()
        self.__file = file

    def to_run(self):
        if "base/" or "checks/" or "functions/" or "config/" in  self.__file: exe = self.__to_create()
        elif  "sql/views" in self.__file: exe = self.__to_consulte()
        else: exe = "No data"
        return exe

    def __to_create(self):
        """
        Method private for to create a new component in database using the pacth of file in directory sql
        Date: 25/06/2025
        :return: Sucess or Message Error
        """
        try:
            self.__execute( self.__file)
            self.conn.commit()
            return "Sucess"
        except FileNotFoundError:
            print(self.__file)
            return "Arquivo não encontrado, verifique se o nome do arquivo está correto e tente novamente"
        except psycopg2.errors.DuplicateTable:
            return "Tabela já criada, verifique se o arquivo já não foi rodado alguma vez"

        except Exception as e:
            print(e)

    def __to_consulte(self):
        try:
            self.__execute(f"sql/views/{self.__file}")
            data = self.cursor.fetchall()
            return data
        except FileNotFoundError:
            return "Arquivo não encontrado, verifique se o nome do arquivo está correto e tente novamente"


    def __to_alter(self):
        pass

    def __execute(self, file):
        """
        Method create to execute a script sql, using methods of strip and split in strings
        :param file: path of file in directory
        :return:
        """
        with open(file, "r") as file_sql: script = file_sql.read()
        for command in script.strip().split(";"):
            if command.strip():
                self.cursor.execute(command + ';')



