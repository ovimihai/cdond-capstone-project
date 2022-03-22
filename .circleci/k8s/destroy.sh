

#kubectl apply -f namespace.yaml


kubectl delete -f deployment.yaml \
  -f service.yaml \
  -f ingress.yaml \
  -f job.yaml