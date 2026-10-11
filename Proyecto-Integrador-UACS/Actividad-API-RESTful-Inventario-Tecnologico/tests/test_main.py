from fastapi.testclient import TestClient
from main import app, db_dispositivos

client = TestClient(app)


def setup_function():
    db_dispositivos.clear()


def ejemplo(id=101):
    return {"id": id, "nombre": "Router empresarial", "categoria": "Router", "precio": 1499.50, "disponible": True}


def test_crud_completo():
    assert client.get("/api/v1/dispositivos").json() == []
    assert client.post("/api/v1/dispositivos", json=ejemplo()).status_code == 201
    assert client.get("/api/v1/dispositivos/101").json()["categoria"] == "Router"
    assert len(client.get("/api/v1/dispositivos").json()) == 1
    actualizacion = {"nombre": "Router actualizado", "categoria": "Router", "precio": 1899.0, "disponible": False}
    respuesta = client.put("/api/v1/dispositivos/101", json=actualizacion)
    assert respuesta.status_code == 200
    assert respuesta.json()["id"] == 101
    assert respuesta.json()["disponible"] is False
    assert client.delete("/api/v1/dispositivos/101").status_code == 200
    assert client.get("/api/v1/dispositivos/101").status_code == 404


def test_validaciones_y_errores():
    assert client.post("/api/v1/dispositivos", json={**ejemplo(), "precio": 0}).status_code == 422
    assert client.post("/api/v1/dispositivos", json={**ejemplo(), "categoria": "Monitor"}).status_code == 422
    assert client.post("/api/v1/dispositivos", json={**ejemplo(), "nombre": "  "}).status_code == 422
    assert client.post("/api/v1/dispositivos", json={**ejemplo(), "id": -1}).status_code == 422
    assert client.get("/api/v1/dispositivos/999").status_code == 404
    assert client.put("/api/v1/dispositivos/999", json={"nombre": "Laptop", "categoria": "Laptop", "precio": 1000, "disponible": True}).status_code == 404
    assert client.delete("/api/v1/dispositivos/999").status_code == 404
    assert client.post("/api/v1/dispositivos", json=ejemplo()).status_code == 201
    assert client.post("/api/v1/dispositivos", json=ejemplo()).status_code == 409
