# OpenShift PersistentVolumeClaim Details

## PersistentVolumeClaim Configuration

This document provides the details for the OpenShift PersistentVolumeClaim (PVC) used in the Tekton/OpenShift Pipelines for the Simple Interest Calculator project.

### PVC Configuration

**Name:** simple-interest-pvc

**Namespace:** default

**Status:** Bound

**Capacity:** 1Gi

**Access Modes:** 
- ReadWriteOnce (RWO)

**Storage Class:** standard

### Description

This PersistentVolumeClaim is used to store:
- Workspace data for Tekton tasks
- Build artifacts
- Test reports
- Temporary files during pipeline execution

### YAML Configuration

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: simple-interest-pvc
  namespace: default
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: standard
```

### Usage in Tekton Tasks

This PVC is mounted in Tekton tasks for:
1. **Cleanup Task** - Cleans up temporary files
2. **Test Task** - Stores test execution results
3. **Build Task** - Preserves build artifacts

### Connection to OpenShift Console

To view this PVC in OpenShift Web Console:
1. Navigate to **Storage** → **PersistentVolumeClaims**
2. Select namespace: **default**
3. Click on **simple-interest-pvc**
4. View status, capacity, and mounting details
