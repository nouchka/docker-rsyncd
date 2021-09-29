DOCKER_IMAGE=rsyncd

include Makefile.docker

.PHONY: check-version
check-version:
	docker run --rm $(DOCKER_NAMESPACE)/$(DOCKER_IMAGE):$(VERSION) dpkg -l|grep rsync| awk '{print $$3}'
