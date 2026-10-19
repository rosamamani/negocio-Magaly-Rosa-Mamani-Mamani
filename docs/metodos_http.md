# Documentación de Métodos HTTP con JSONPlaceholder

En este documento se detallan los 5 métodos HTTP principales probados contra la API pública `https://jsonplaceholder.typicode.com/posts`.

---

## 1. GET
- **¿Para qué sirve?:** Sirve para **consultar u obtener** recursos del servidor sin modificarlos. Es un método de solo lectura e idempotente.
- **¿Cómo se usa?:** Se envía una petición indicando la URL del recurso general o con un identificador específico (por ejemplo, `/posts/1`). No lleva cuerpo (`body`).

### Ejemplo real:
- **URL:** `https://jsonplaceholder.typicode.com/posts/1`
- **Body:** *No lleva (N/A)*
- **Código de estado de la respuesta:** `200 OK`

---

## 2. POST
- **¿Para qué sirve?:** Sirve para **crear un nuevo recurso** dentro del servidor.
- **¿Cómo se usa?:** Se envía la petición a la ruta de la colección (`/posts`), incluyendo la cabecera `Content-Type: application/json` y enviando en el `body` los datos en formato JSON.

### Ejemplo real:
- **URL:** `https://jsonplaceholder.typicode.com/posts`
- **Código de estado de la respuesta:** `201 Created`

#### Body enviado:
```json
{
  "title": "Práctica 1 Programación Web III",
  "body": "Probando la creación de un post mediante POST",
  "userId": 10
}
```

---

## 3. PUT
- **¿Para qué sirve?:** Sirve para **reemplazar por completo** un recurso existente en el servidor.
- **¿Cómo se usa?:** Se especifica en la URL el ID del recurso (`/posts/1`) y en el `body` se envían todos los campos del recurso actualizado.

### Ejemplo real:
- **URL:** `https://jsonplaceholder.typicode.com/posts/1`
- **Código de estado de la respuesta:** `200 OK`

#### Body enviado:
```json
{
  "id": 1,
  "title": "Título completamente reemplazado con PUT",
  "body": "Contenido actualizado en su totalidad",
  "userId": 1
}
```
