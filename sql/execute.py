from compile.executor import Executor
import os
from dotenv import load_dotenv
load_dotenv()

exe = Executor(file="config/roles.sql",dbname=os.getenv("DB_NAME"), user=os.getenv("DB_USER"), password=os.getenv("DB_PASSWORD"), host=os.getenv("DB_HOST") , port=(os.getenv("DB_PORT")))
print(exe.to_run())

