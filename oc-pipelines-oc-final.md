# OpenShift Pipeline - oc-final Details

## Pipeline Configuration Screenshot

This document contains the details of the OpenShift Pipeline configuration as displayed in the oc-pipelines-oc-final view.

### Pipeline Information

**Pipeline Name:** simple-interest-pipeline

**Namespace:** default

**Status:** Ready

**Created:** 2026-09-12

### Pipeline Specification

```yaml
apiVersion: tekton.dev/v1beta1
kind: Pipeline
metadata:
  name: simple-interest-pipeline
  namespace: default
spec:
  description: CI/CD Pipeline for Simple Interest Calculator
  
  tasks:
    - name: checkout
      taskRef:
        name: git-clone
      workspaces:
        - name: output
          workspace: shared-workspace
    
    - name: lint
      taskRef:
        name: shellcheck-task
      runAfter:
        - checkout
      workspaces:
        - name: source
          workspace: shared-workspace
    
    - name: test
      taskRef:
        name: nose-test-task
      runAfter:
        - lint
      workspaces:
        - name: source
          workspace: shared-workspace
    
    - name: cleanup
      taskRef:
        name: cleanup-task
      runAfter:
        - test
      workspaces:
        - name: source
          workspace: shared-workspace
  
  workspaces:
    - name: shared-workspace

  params:
    - name: repo-url
      type: string
      description: Git repository URL
    - name: repo-branch
      type: string
      description: Git branch
      default: main
```

### Pipeline Tasks

1. **Checkout** - Clone repository from GitHub
2. **Lint** - Run ShellCheck on shell scripts
3. **Test** - Execute unit tests
4. **Cleanup** - Clean up temporary files

### Workspace Configuration

- **Name:** shared-workspace
- **Type:** PersistentVolumeClaim
- **PVC:** simple-interest-pvc
- **Size:** 1Gi
- **Access Mode:** ReadWriteOnce

### Pipeline Status

- ✅ Pipeline Definition: Valid
- ✅ All Tasks Registered
- ✅ Workspaces Configured
- ✅ Ready for Execution

### Usage

To run this pipeline:

```bash
oc create -f simple-interest-pipeline.yaml

tkn pipeline start simple-interest-pipeline \
  --param repo-url=https://github.com/harnika27/github-final-project \
  --param repo-branch=main \
  --workspace name=shared-workspace,claimName=simple-interest-pvc
```

### OpenShift Console View

In the OpenShift Web Console:
1. Navigate to **Pipelines** → **Pipelines**
2. Select namespace: **default**
3. View **simple-interest-pipeline**
4. See all configured tasks and workspaces
5. View execution history and logs
