# c7-elasticsearch

This image is based on c7-logstash

This image adds elasticsearch and kibana see <http://www.elasticsearch.org>

To use the docker image start with command:
> docker run --privileged -ti -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
>   -v /var/log:/var/log/pluto -p 2222:22 -p 5601:5601 \
>   dockerpinguin/c7-elasticsearch:V1

The statement -v /var/log:/var/log/pluto makes the /var/log directory of the host os available in the container. 

The container uses /var/log/pluto/messages for syslog messages and /var/log/pluto/httpd/*_log for apache log files.

