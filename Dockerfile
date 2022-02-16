RUN apt-get update 

ENV TZ=America/Sao_Paulo

RUN apt-get install -y tzdata

RUN apt install -y php 
RUN apt install -y php php-gd 
RUN apt install -y curl

RUN mkdir n1
