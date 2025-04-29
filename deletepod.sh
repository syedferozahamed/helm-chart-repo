for ns in $(kubectl get ns -o jsonpath='{.items[*].metadata.name}'); do
  kubectl delete pod --namespace="$ns" $(kubectl get pods --namespace="$ns" --field-selector=status.phase!=Running -o jsonpath='{.items[*].metadata.name}')
done
