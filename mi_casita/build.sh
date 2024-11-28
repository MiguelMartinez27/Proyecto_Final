#!/usr/bin/env bash
# Exit on error
set -o errexit

# Modify this line as needed for your package manager (pip, poetry, etc.)
pip install -r requirements.txt

# Convert static asset files
python manage.py collectstatic --no-input

# Apply any outstanding database migrations
python manage.py migrate
python manage.py loaddata Inmuebles\fixtures\users.json
python manage.py loaddata Inmuebles\fixtures\Inmuebles.json
python manage.py shell
from Inmuebles.cargar_regiones_y_comunas import cargar_datos
cargar_datos()
