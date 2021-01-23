TODO

1. Keep doing npm audit fix. DONE
2. upgrade python. DONE
3. ugrade docker. DONE.
4. upgrade kubectl


This is a translator APP And Python does basic language translation.

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

TODO: now the completeDocker is running. However the current_time is getting messed up.
If this happens simply revert the public/index.html and re-run the build and it will fix the issue.

Also .dockerignore has ignored build directory, so the other dockerFile may NOT work.

TODO: add https