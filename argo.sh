function argo_watch() {
  watch argo get $1
}

function argo_logs() {
  argo logs -f -w $1
}
