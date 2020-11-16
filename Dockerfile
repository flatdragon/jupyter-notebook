FROM jupyter/datascience-notebook

USER root

RUN sudo apt update
RUN sudo apt install -y nodejs npm jupyter-notebook
RUN sudo npm install -y -g n
RUN sudo n 14
RUN PATH="$PATH"
RUN sudo npm config set unsafe-perm true
RUN sudo npm install -y -g zeromq@5 ijavascript
COPY jupyter-kernelspec /usr/bin/jupyter-kernelspec
RUN sudo apt-get install dos2unix
RUN sudo dos2unix /usr/bin/jupyter-kernelspec
RUN sudo ijsinstall --install=global

EXPOSE 8888

CMD [ "bash", "-c", "start-notebook.sh --ip='*' --NotebookApp.token='' --NotebookApp.password=''" ]
