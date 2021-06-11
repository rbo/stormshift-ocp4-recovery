# stormshift-ocp4-recovery

## Install logforwarding into file

<https://examples.openshift.pub/cluster-configuration/logging/forwarding-demo/>

## Audit log analyse

Install <https://github.com/openshift/cluster-debug-tools>

```bash
# Prepare auditlog

cut /media/nfs-logging/data.20210611.log  -f3- > /media/sda/audit.20210611.log

time kubectl-dev_tool audit -f /media/sda/audit.20210611.log --verb delete | tee -a /media/sda/audit.20210611-delete.log

```
