FROM python:3.10-slim-buster
 
# We copy all the project files
COPY . ./

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install gcc
     
# Add Git to the image
RUN apt-get -y install git 
RUN apt-get -y install  gcc python3-dev musl-dev wget

RUN wget -O wkhtmltox.deb https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb
RUN apt install -y ./wkhtmltox.deb
 
     
# Install the base requirements and We set-up the environment variabales
RUN pip install -r requirements.txt
RUN pip install --upgrade pip ipython ipykernel
     
ENTRYPOINT [ "python", "app.py" ]
