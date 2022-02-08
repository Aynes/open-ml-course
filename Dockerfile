FROM ubuntu:20.04

# создаем рабочую папку
RUN mkdir /open-ml-course
WORKDIR /open-ml-course

# устанавливаем python3.9 и pip
RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install -y python3.9-dev
RUN apt install -y python3.9-venv
RUN apt install -y curl
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.9 get-pip.py

# Копируем файл с зависимостями внутрь докера
COPY requirements.txt /open-ml-course/requirements.txt

# устанавливаем необходимые библиотеки
RUN pip install -r requirements.txt

# запускаем jupyter
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]