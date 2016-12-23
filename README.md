Build Docker containers in Jenkins.

Uses Docker Daemon on host system to:

* avoid complexities of running Docker-in-Docker

* share Docker image cache on host machine

Tested running container locally on OSX, with latest Docker 1.12.5 on both OSX and in container.

## How to use

* Build container

    docker build -t jenkins-with-docker .

* Run container

    ./up.sh

* Find initial admin password in the logs

    docker logs <container-id>

* Try it out

    # visit http://localhost:8080

    # Full example here => http://container-solutions.com/running-docker-in-jenkins-in-docker/
    # Essentially create a new freestyle project and add a build step that runs this:
    sudo docker run hello-world
    # then click Save, then Build Now

## Additional resources

* http://container-solutions.com/running-docker-in-jenkins-in-docker/

* https://github.com/stefanprodan/jenkins
