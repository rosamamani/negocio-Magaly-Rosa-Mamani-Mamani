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

## 4. PATCH
- **¿Para qué sirve?:** Sirve para **actualizar parcialmente** un recurso existente en el servidor. A diferencia de `PUT`, solo modifica los campos específicos que se envían en la petición, manteniendo intacto el resto de la información original.
- **¿Cómo se usa?:** Se especifica en la URL el ID del recurso (`/posts/1`), se incluye la cabecera `Content-Type: application/json` y en el `body` se envían únicamente las propiedades que se desean modificar.

### Ejemplo real:
- **URL:** `https://jsonplaceholder.typicode.com/posts/1`
- **Código de estado de la respuesta:** `200 OK`

#### Body enviado:
```json
{
  "title": "Título actualizado parcialmente con PATCH"
}
```

#### Respuesta del servidor (simulada por JSONPlaceholder):
```json
{
  "userId": 1,
  "id": 1,
  "title": "Título actualizado parcialmente con PATCH",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
```

---

## 5. DELETE
- **¿Para qué sirve?:** Sirve para **eliminar** un recurso específico del servidor de forma permanente.
- **¿Cómo se usa?:** Se especifica en la URL el ID del recurso que se desea borrar (`/posts/1`). No requiere enviar un `body`.

### Ejemplo real:
- **URL:** `https://jsonplaceholder.typicode.com/posts/1`
- **Body:** *No lleva (N/A)*
- **Código de estado de la respuesta:** `200 OK` *(En otras APIs también es común recibir `204 No Content`)*.

#### Respuesta del servidor:
```json
{}
```

---

## ⚖️ Diferencia entre PUT y PATCH

Aunque ambos métodos se utilizan para **actualizar** recursos existentes en el servidor, la diferencia clave radica en **el alcance de la modificación**:

| Característica | `PUT` (Reemplazo total) | `PATCH` (Modificación parcial) |
| :--- | :--- | :--- |
| **Propósito** | Sobrescribe el recurso **completo**. | Actualiza **solo los campos indicados**. |
| **Datos en el `body`** | Debes enviar **todos** los campos del objeto (incluso los que no cambiaron). | Solo envías el campo o campos que quieres cambiar. |
| **¿Qué pasa si omites un campo?** | El servidor lo borrará o lo pondrá como `null` / vacío. | El servidor conserva el valor original que ya tenía ese campo. |
| **Consumo de red** | Mayor (envía todo el objeto cada vez). | Menor y más eficiente (envía solo el fragmento necesario). |

### Ejemplo práctico de la diferencia:
Imagina que en la base de datos existe este post original en `/posts/1`:
```json
{
  "id": 1,
  "title": "Hola Mundo",
  "body": "Este es el contenido original",
  "userId": 10
}
```

Si envías únicamente `{"title": "Nuevo Título"}`:
1. **Con `PUT`:** El registro entero se reemplaza por lo que enviaste. Como no mandaste `body` ni `userId`, se pierden:
   `{"id": 1, "title": "Nuevo Título"}` *(Pierdes el resto de datos)*.
2. **Con `PATCH`:** Solo se cambia la propiedad `title` y se respeta todo lo demás:
   `{"id": 1, "title": "Nuevo Título", "body": "Este es el contenido original", "userId": 10}`.
