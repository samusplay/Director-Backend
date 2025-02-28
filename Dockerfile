# Usa una imagen oficial de Python como base
FROM python:3.10-slim

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los archivos necesarios
COPY requirements.txt .
COPY . .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto 8000 para Django
EXPOSE 8000

# Comando de inicio para el contenedor
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi:application"]

