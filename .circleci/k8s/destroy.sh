

#kubectl apply -f namespace.yaml


kubectl delete -f deployment.yaml \
  -f ingress.yaml \
  -f lb.yaml \
  -f job.yaml