##Preparing Operating System###
FROM centos
RUN yum -y install wget


COPY startup.sh /tmp/startup.sh
###Preparing Elastic Search###
RUN curl http://192.168.1.103:8060/jdk-8u101-linux-x64.rpm --create-dirs -o /tmp/jdk-8u101-linux-x64.rpm;rpm -ivh /tmp/jdk-8u101-linux-x64.rpm;rpm -ivh https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.4.0/elasticsearch-2.4.0.rpm;groupadd elastic;mkdir -p /usr/share/elasticsearch/config;echo "network.host: 0.0.0.0" >/usr/share/elasticsearch/config/elasticsearch.yml;useradd -g elastic elastic;chown -R elastic:elastic /usr/share/elasticsearch

EXPOSE 9200/tcp
ENTRYPOINT ["/tmp/startup.sh"]
