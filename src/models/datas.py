from dataclasses import dataclass

@dataclass
class Owner:
    name: str
    last_name: str
    value: float
    cpf: str
    email: str
    password: str

@dataclass
class Company:
    name: str
    cnpj: str
    country: str

@dataclass
class Building:
    uf: str
    city: str
    district: str
    street: str
    number: int
    balance: float
    photo: str
    owner: Owner
    company: Company