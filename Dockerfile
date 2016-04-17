FROM rails:latest
MAINTAINER naubergois


RUN echo "Install vsftpd"
RUN apt-get -y update; \
apt-get -y install --fix-missing vsftpd


RUN gem install sqlite3



ENV dir="." 


COPY ./run.sh /

RUN chmod +x run.sh

RUN git clone https://github.com/naubergois/TodayClass.git


RUN gem install execjs -v '2.6.0'
RUN gem install minitest -v '5.8.4' 
RUN gem install rdoc -v '4.2.2'
RUN gem install rake -v '11.1.2' 
RUN gem install multi_json -v '1.11.2'  
RUN gem install spring -v '1.7.1'
RUN gem install debug_inspector -v '0.0.2'
RUN gem install sass-rails -v '5.0.4'
RUN gem install uglifier -v '3.0.0'
RUN gem install coffee-script -v '2.4.1' 
RUN gem install sprockets -v '3.6.0'
RUN cd TodayClass; bundle install

EXPOSE 3000

ENTRYPOINT ["/run.sh"]

#CMD ["run.sh"]
