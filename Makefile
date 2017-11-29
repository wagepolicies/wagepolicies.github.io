
#Wage Policies Tasks

install:
	go get -v github.com/wendal/gor/gor

http: compile
	gor http ":8080"

compile:
	gor compile

payload:
	gor payload

pprof:
	gor pprof

config:
	gor config

setup:
	cd compiled && git init
	cd compiled && git remote add origin git@github.com:wagepolicies/wagepolicies.github.io.git


push:compile
	cp README.md compiled
	cd compiled && git add .
	cd compiled && git add -u
	cd compiled && git commit -m "new deploy"
	cd compiled && git push --set-upstream origin master --force
	@echo "Push finished."

