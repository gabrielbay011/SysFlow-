from dataclasses import dataclass

@dataclass
class People:
    _name: str
    _last_name: str
    _cpf: str

@dataclass
class Owner(People):
    _value: str
    _email: str
    _password: str

@dataclass
class Employee(People):
    _photo: str
    _phone_number: str


@dataclass
class Fluor:
    _final_date: str
    _number: int




@dataclass
class Company:
    _name: str
    _cnpj: str
    _country: str
    _employees = []
    _fluor: Fluor

@dataclass
class Equipment:
    _tag: str
    _amount_price: float

@dataclass
class Elevator(Equipment):
    _weight: float
    _number_person: int
    _risk: float

@dataclass
class Camera(Equipment):
    pass

@dataclass
class Ratchet(Equipment):
    pass

@dataclass
class Building:
    _name: str
    _uf: str
    _city: str
    _district: str
    _street: str
    _number: int
    _yield: str
    _photo: str
    _fluor: list[Fluor]
    _equipment: list[Equipment]

@dataclass
class Maintenance:
    mai_description: str
    price: float
    prevision_date: str

