# c7-elasticsearch

This image is based on c7-logstash

This image adds elasticsearch and kibana see [http://www.elasticsearch.org] (http://www.elasticsearch.org)

To use the docker image start with command:

	$ docker run --privileged -ti \
		-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
		-v /var/log:/var/log/pluto \
		-p 2222:22 -p 5601:5601 \
		dockerpinguin/c7-elasticsearch:V1

The _run --privileged_ is needed to start the systemd daemon, which controls the startup/shutdown of services within the docker container.

The statement _-v /var/log:/var/log/pluto_ makes the _/var/log_ directory of the host os available in the container in directory _/var/log/pluto_. Since the container itself also uses the directory _/var/log_.

The container uses _/var/log/pluto/messages_ for syslog messages and _/var/log/pluto/httpd/*_log_ for apache log files. This is part of the logstash configuration file.

