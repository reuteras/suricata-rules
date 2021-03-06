all: update-git total
force: clean all
clean:
	rm -f total/total.rules
total:
	./bin/create-total.sh
update-git:
	git submodule foreach git pull origin master
init:
	git submodule update --init

.PHONY: clean force total update-git init
