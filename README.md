# Instructions


## Installation

Create virtual environment

```bash
python -m venv venv
```
Activate virtual environment

```bash
source venv/Scripts/activate  - For linux
venv\Scripts\activate - For Windows CMD
```
Install dependencies

```bash
pip install -r requirements.txt
```
Create a new database in phpmyadmin and enter the database. Then database pharmarket_portal.sql

Make migrations inside projects folder and then run server

```bash
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```
### Other Software Requirements Links: 
[Tesseract OCR](https://digi.bib.uni-mannheim.de/tesseract/tesseract-ocr-w64-setup-v5.0.0-alpha.20200328.exe)

[Image Magick](https://imagemagick.org/download/binaries/ImageMagick-7.0.10-32-Q16-HDRI-x64-dll.exe)

[Ghost Script](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9533/gs9533w64.exe)


### Sample Login Credentials For Company
email: cipla@cipla.com

password: pass@123

### Sample Login Credentials For Company
email: demo.hopital@mail.com

password: pass@123
