# 🖼️ Resultado de la Aplicación

Esta sección muestra el funcionamiento y el resultado final de la aplicación **Generador de Tarjeta de Presentación** desarrollada durante la Sesión 04.

---

## 📝 Formulario de entrada

Al iniciar la aplicación, el usuario puede ingresar la información necesaria para generar su tarjeta de presentación:

- Nombre completo
- Carrera
- Semestre / Cuatrimestre
- Frase personal

<p align="center">
  <img src="../Assets/Generado%20de%20tarjeta%201.png" alt="Formulario para generar la tarjeta" width="850">
</p>

---

## ✅ Tarjeta generada

Después de completar el formulario y presionar **Generar tarjeta**, PHP recibe la información mediante el método `POST`, valida los campos y genera dinámicamente la tarjeta de presentación.

<p align="center">
  <img src="../Assets/Generado%20de%20tarjeta%202.png" alt="Resultado final de la tarjeta" width="850">
</p>

---

## ⚙️ Funcionamiento

```text
Usuario completa el formulario
          ↓
       POST
          ↓
PHP recibe los datos
          ↓
trim() limpia los valores
          ↓
empty() valida los campos
          ↓
¿Datos válidos?
     ↙          ↘
   NO            SÍ
   ↓              ↓
Errores       Generar tarjeta
