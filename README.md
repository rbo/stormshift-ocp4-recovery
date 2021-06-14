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

## CR & CRB - export, check & apply missing

```
# Export
oc get -o name clusterrole,clusterrolebindings | sort  > with-logging-4.6.28.objects 
time ./export.sh with-logging-4.6.28.objects

# Check & filter
time ./check.sh with-logging-4.6.28.objects | tee -a ocp4-check-2021-06-12-with-logging.objects
grep MISSSING ocp4-check-2021-06-12-with-logging.objects |awk '{ print  }' | sort > missing.objects


# Apply missing
time ./apply -f missing.objects | tee -a missing.objects.log


```

