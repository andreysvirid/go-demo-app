kubectl patch deployment ambassador -n demo --type='merge' -p '{
  "spec": {
    "template": {
      "spec": {
        "serviceAccountName": "ambassador",
        "securityContext": {
          "fsGroup": 1000
        },
        "containers": [
          {
            "name": "ambassador",
            "image": "datawire/ambassador:2.0",
            "command": ["/bin/sh","-c"],
            "args": ["ulimit -n 65535 && exec ambassador"],
            "securityContext": {
              "runAsUser": 1000,
              "runAsGroup": 1000
            },
            "resources": {
              "limits": {
                "cpu": "500m",
                "memory": "512Mi"
              }
            }
          }
        ]
      }
    }
  }
}'
