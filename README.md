[![CircleCI](https://circleci.com/gh/BBVA/osc-docker/tree/eurocloud.svg?style=svg)](https://circleci.com/gh/BBVA/osc-docker/tree/eurocloud)
[![Docker Pulls](https://img.shields.io/docker/pulls/bbvalabs/osc-docker.svg)](https://hub.docker.com/r/bbvalabs/osc-docker/)
[![Docker Stars](https://img.shields.io/docker/stars/bbvalabs/osc-docker.svg)](https://hub.docker.com/r/bbvalabs/osc-docker/)
# Docker Image for Openstack clients (osc-docker)

Docker container for Openstack clients

## How To

First of all, you need to get your Openstack credentials at :

https://dashboard.cloud.bbva.com/dashboard/project/access_and_security/api_access/venvreqs/

> WARNING: If you have more than one tenant/project in Openstack then you should login in our Openstack dashboard and select the desired tenant,
> otherwise the downloaded credentials belong to default tenant.

Now run a docker container using this image (build it locally or download from dockerhub.com: bbvalabs/osc-docker) and the downloaded credentials file (<tenant_name>-openrc.sh), when
the container is ready then you will can use any python client (a bunch of services and for kilo version, up to now)

This example shows you how to run the container:

```sh
$ docker run --name osc -t -d -v $(pwd)/<tenant_name>-openrc.sh:/root/<tenant_name>-openrc.sh bbvalabs/osc-docker
$ docker exec -i -t osc /bin/bash
root@956e32fec408:~# source <tenant_name>-openrc.sh
Please enter your OpenStack Password:
...type your password...
root@e03f27d23fd3:~# nova list
+--------------------------------------+-------------------------------------------------------+--------+------------+-------------+----------------------------------------------+
| ID                                   | Name                                                  | Status | Task State | Power State | Networks                                     |
+--------------------------------------+-------------------------------------------------------+--------+------------+-------------+----------------------------------------------+
| b73511eb-8bfa-46ab-af55-78ec32c26bee | ba-ehcgrojgifce-0-qjfka5selicr-kube_node-w7nvwkmtn6zu | ACTIVE | -          | Running     | Subnet Template 0=10.79.118.33               |
| d384ca54-4915-4a87-bef8-1f780b8a963a | ba-ehcgrojgifce-1-uxrjhuapxddw-kube_node-zytvulipycst | ACTIVE | -          | Running     | Subnet Template 0=10.79.118.30               |
| 737fb2ed-6e28-4f0f-ba71-58dedce2369a | ba-ehcgrojgifce-2-piotgd2xbhen-kube_node-4la473wpcwni | ACTIVE | -          | Running     | Subnet Template 0=10.79.118.34               |
| 8a3157a7-2adc-4355-b9d1-1c4c05cbd9d0 | ba-ehcgrojgifce-3-o5g5bdnm2g6i-kube_node-yrkqhlu5rbsc | ACTIVE | -          | Running     | Subnet Template 0=10.79.118.32               |
| cff35d05-fcaf-44ac-883c-1e721b91dd25 | ba-ehcgrojgifce-4-fd7q3kyzfb7x-kube_node-olnfydbnljrm | ACTIVE | -          | Running     | Subnet Template 0=10.79.118.31               |
| ccbca5b3-b86e-4d0b-849f-df5f77e2d2ba | ba-ehcgrojgifce-5-7dahx2lmbpfd-kube_node-4isvdpkmlzca | ACTIVE | -          | Running     | Subnet Template 0=10.79.118.35               |
| d69d72f2-d223-4035-9307-2de4e9cd2f90 | ba-ehcgrojgifce-6-z2bhquna5dfe-kube_node-rgrkwyabt6qn | ACTIVE | -          | Running     | Subnet Template 0=10.79.118.36               |
| 3468b91d-6ba0-46c8-8278-355b19db7016 | bay-k8s-czy4er4pucir-kube_master-oqhdsyhcopei         | ACTIVE | -          | Running     | Subnet Template 0=10.79.118.29, 185.24.5.220 |
+--------------------------------------+-------------------------------------------------------+--------+------------+-------------+----------------------------------------------+
root@e03f27d23fd3:~# magnum bay-list
+--------------------------------------+---------+------------+-----------------+
| uuid                                 | name    | node_count | status          |
+--------------------------------------+---------+------------+-----------------+
| 4dd03554-b0c6-452e-ada1-6634127f1be7 | bay-k8s | 7          | UPDATE_COMPLETE |
+--------------------------------------+---------+------------+-----------------+
```

