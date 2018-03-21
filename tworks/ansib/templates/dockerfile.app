FROM {{ appimage }}
MAINTAINER {{ version }}
#delete old war package
#RUN rm -rf {{ apppath }}{{ oldjavawar }}
ADD {{ javawar }} {{ apppath }}
