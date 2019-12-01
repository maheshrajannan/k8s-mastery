This repository contains the source files needed to follow the series [Kubernetes and everything else](https://rinormaloku.com/series/kubernetes-and-everything-else/) or summarized as an article in [Learn Kubernetes in Under 3 Hours: A Detailed Guide to Orchestrating Containers](https://medium.freecodecamp.org/learn-kubernetes-in-under-3-hours-a-detailed-guide-to-orchestrating-containers-114ff420e882)

To learn more about Kubernetes and other related topics check the following examples with the **Sentiment Analysis** application:

* [Kubernetes Volumes in Practice](https://rinormaloku.com/kubernetes-volumes-in-practice/):
* [Ingress Controller - simplified routing in Kubernetes](https://www.orange-networks.com/blogs/210-ingress-controller-simplified-routing-in-kubernetes)
* [Docker Compose in Practice](https://github.com/rinormaloku/k8s-mastery/tree/docker-compose)
* [Istio around everything else series](https://rinormaloku.com/series/istio-around-everything-else/)
* [Simple CI/CD for Kubernetes with Azure DevOps](https://www.orange-networks.com/blogs/224-azure-devops-ci-cd-pipeline-to-deploy-to-kubernetes)
* Envoy series - to be added!

Maheshs-MacBook-Pro-2:resource-manifests maheshrajannan$ minikube service list
|-------------|----------------------|-----------------------------|
|  NAMESPACE  |         NAME         |             URL             |
|-------------|----------------------|-----------------------------|
| default     | kubernetes           | No node port                |
| default     | sa-frontend-lb       | http://192.168.99.103:30371 |
| default     | sa-logic             | No node port                |
| default     | sa-web-app-lb        | http://192.168.99.103:30086 |
| kube-system | kube-dns             | No node port                |
| kube-system | kubernetes-dashboard | No node port                |
|-------------|----------------------|-----------------------------|
Maheshs-MacBook-Pro-2:resource-manifests maheshrajannan$

sudo chown -R maheshrajannan:staff bin

Time tracking
maheshrajannan

Organize Later.

https://stackabuse.com/how-to-uninstall-node-js-from-mac-osx/

https://stackoverflow.com/questions/55271798/browserslist-caniuse-lite-is-outdated-please-run-next-command-npm-update-cani

TODO

Browserslist: caniuse-lite is outdated. Please run next command `yarn upgrade`

upgrade python.

Serve from node platform instead of nginx ? NOPE. Nginx is best in so many ways.

Install SSL for microservices

Install SSL on NGINX.

Except for few cases nginx is better than node. Especially serving static files.

Understand the style of explanation in . Draw diagrams and put it.


https://cloud.google.com/kubernetes-engine/docs/tutorials/configuring-domain-name-static-ip

First configure domain name.
Then configure https in nginx

Record your voice along with the diagram


gcloud compute addresses create helloweb-ip --region us-central1

#Based on mine
gcloud compute addresses create translator-ip --region us-central1

gcloud compute addresses describe translator-ip --region us-central1

35.238.248.186

Updates are available for some Cloud SDK components.  To install them,
please run:
  $ gcloud components update

TODO:
https://stackoverflow.com/questions/2870992/automatic-exit-from-bash-shell-script-on-error

Change from translator3 to translator

Record your voice along with the diagram

grep if a process is running. Then start the next process.


GOAL only do high value low cost items, next high value items after isolating it.
NOT small incremental changes.

TODO

Prevent the html file from caching in browser

pass password as a env variable.

TODO: IMPORTANT
Try in windows..cygwin. to see if it works.

Split it in to 3 separate repositories.
Also move all build code to the respective components. Including .yaml files.

Check it in to bitbucket.

Stabilize the system and process flow. CI, code quality, vulnerability scan,unit testing, component testing and end to end testing.

Then make functional changes.

TODO: publish an example on graphs.
