from fastapi import FastAPI, HTTPException, status
from pydantic import BaseModel, Field, ConfigDict
from typing import Literal

app = FastAPI(
    title="API RESTful de Inventario Tecnológico",
    description="CRUD de dispositivos tecnológicos con FastAPI y validación Pydantic.",
    version="1.0.0",
)

Categoria = Literal["Servidor", "Router", "Laptop"]


class DispositivoBase(BaseModel):
    nombre: str = Field(..., min_length=1)
    categoria: Categoria
    precio: float = Field(..., gt=0)
    disponible: bool

    model_config = ConfigDict(str_strip_whitespace=True)


class DispositivoTecnologico(DispositivoBase):
    id: int = Field(..., gt=0)


class DispositivoCrear(DispositivoTecnologico):
    pass


class DispositivoActualizar(DispositivoBase):
    pass


db_dispositivos: dict[int, DispositivoTecnologico] = {}


@app.get("/api/v1/dispositivos", response_model=list[DispositivoTecnologico])
def listar_dispositivos():
    return list(db_dispositivos.values())


@app.get("/api/v1/dispositivos/{id}", response_model=DispositivoTecnologico)
def consultar_dispositivo(id: int):
    dispositivo = db_dispositivos.get(id)
    if dispositivo is None:
        raise HTTPException(status_code=404, detail="Dispositivo no encontrado")
    return dispositivo


@app.post("/api/v1/dispositivos", response_model=DispositivoTecnologico, status_code=status.HTTP_201_CREATED)
def registrar_dispositivo(dispositivo: DispositivoCrear):
    if dispositivo.id in db_dispositivos:
        raise HTTPException(status_code=409, detail="Ya existe un dispositivo con ese ID")
    db_dispositivos[dispositivo.id] = dispositivo
    return dispositivo


@app.put("/api/v1/dispositivos/{id}", response_model=DispositivoTecnologico)
def actualizar_dispositivo(id: int, datos: DispositivoActualizar):
    if id not in db_dispositivos:
        raise HTTPException(status_code=404, detail="Dispositivo no encontrado")
    actualizado = DispositivoTecnologico(id=id, **datos.model_dump())
    db_dispositivos[id] = actualizado
    return actualizado


@app.delete("/api/v1/dispositivos/{id}")
def eliminar_dispositivo(id: int):
    if id not in db_dispositivos:
        raise HTTPException(status_code=404, detail="Dispositivo no encontrado")
    del db_dispositivos[id]
    return {"mensaje": f"Dispositivo {id} eliminado correctamente"}
