QUESTION: How does kitchen-docker compare to kitchen-vagrant

PREREQUISITE: 
- Install boot2docker and get it working.  The `docker run
hello-world` example should work before continuing.
- Install ChefDK
- Install kitchen-docker gem: `chef gem install kitchen-docker` 

EXAMPLE: 

- Vagrant: 
    rake vagrant
    rake which
    rake kitchen

- Docker:
    $(boot2docker shellinit)
    rake docker
    rake which
    rake kitchen

