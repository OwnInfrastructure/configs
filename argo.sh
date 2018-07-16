function argo_watch() {
  watch argo get $1
}

function argo_logs() {
  argo logs -f -w $1
}

function argo_enable_ui () {
	echo "visit: http://127.0.0.1:8001/"
	kubectl port-forward $(kubectl get pods -n kube-system -l app=argo-ui -o jsonpath='{.items[0].metadata.name}') -n kube-system 8001:8001
}
