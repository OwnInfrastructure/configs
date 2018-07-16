function argo_watch() {
  watch argo get $1
}

funciton argo_logs() {
  argo logs -f -w $1
}
