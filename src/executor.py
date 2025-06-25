import psycopg2.errors

from conn import Conection

class Executor:
    def __init__(self, file):
        self.conection = Conection("yegiwntixbsumitogtkt", "postgres", "3002Grs$0604", "yegiwntixbsumitogtkt.db.sa-east-1.nhost.run" , 5432)
        self.conn = self.conection.to_conect()
        self.cursor = self.conn.cursor()
        self.__file = file

    def to_run(self):
        if "sql/create" in  self.__file: exe = self.__to_create()
        elif "sql/alter" in self.__file: exe = self.__to_alter()
        elif  "sql/views" in self.__file: exe = self.__to_consulte()
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

    def __to_consulte(self):
        """
        Method private for to consult the database
        :return: data or error
        """
        try:
            self.__execute(f"sql/views/{self.__file}")
            data = self.cursor.fetchall()
            return data
        except FileNotFoundError:
            return "Arquivo não encontrado, verifique se o nome do arquivo está correto e tente novamente"


    def __to_alter(self):
        """
        Method private for to alter the database
        :return: Message sucess or Error
        """
        pass

    def __execute(self, file):
        with open(file, "r") as file_sql: script = file_sql.read()
        for command in script.strip().split(";"):
            if command.strip():
                self.cursor.execute(command + ';')

e = Executor("sql/views.sql")
print(e.to_run())


