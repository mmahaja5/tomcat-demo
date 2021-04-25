# tomcat-demo
#Using Docker commands you can build image to your repository.
  -->   docker build --force-rm --no-cache --pull --rm=true -t mukul-test/tomcat .

#login to repository
  -->  docker login -u **** -p **** -e mukul@xyz.com dockerhub.com

Tagging Image
  --> docker tag -f mukul-test/tomcat dockerhub.com/mukul-test/tomcat:8.0

Pushing image
  --> docker push dockerhub.uhc.com/mukul-test/tomcat:8.0

using above commands you will be able to build image from source code.

you can use direct image to run tomcat instance i.e. by navigating to openshift console/k8 dashboard.

else you can use kubectl/oc commands to deploy and spin up the pods.

#Openshift 

  --> oc login {Openshift-URL}

  --> oc project {Project name}

  --> oc create -f tomcat-deployment-k8-openshift.yaml

  --> oc create -f tomcat-service.yaml

  --> oc create -f route.yaml

#k8s

  --> kubectl config use-context (k8s-namespace)
  
  --> kubectl apply -f tomcat-deployment-k8-openshift.yaml
  
  --> kubectl apply -f tomcat-service.yaml
  
  --> kubectl apply -f route.yaml
  
Your Tomcat instance is ready to test
