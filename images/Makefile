DOCKER := docker

IMAGES := centos-7 debian-8 fedora-24 ubuntu-16.04
IMAGES += master/centos-7
#IMAGES += centos-5 debian-7 fedora-22 ubuntu-12.04
#IMAGES += master/ubuntu-16.04

DIR_TO_IMG = puppet-$(subst /,-,$(strip \
	$(shell sed 's/-\([0-9\.]*\)\(.*\)/\2:\1/' <<< "$(1)")))

all: $(IMAGES)

$(IMAGES):
	$(DOCKER) build -t $(call DIR_TO_IMG,$@) $@

clean:
	$(eval cont := $(shell $(DOCKER) ps -aq))
	$(if $(cont),$(DOCKER) rm -vf $(cont) > /dev/null)
	$(DOCKER) volume prune <<< 'y' > /dev/null

realclean: clean
	$(eval imgs := $(strip $(foreach img,$(IMAGES),\
		$(shell $(DOCKER) images -q $(call DIR_TO_IMG,$(img))))))
	$(if $(imgs),$(DOCKER) rmi $(imgs) > /dev/null)

.PHONY: all $(IMAGES) clean realclean
