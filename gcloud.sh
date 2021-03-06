## Generic

function gregions() {
  REGIONS=$(gcloud compute regions list)
  echo $REGIONS | cut -d " " -f 1 | tail -n +2
}

function gzones() {
  ZONES=$(gcloud compute zones list)
  echo $ZONES | cut -d " " -f 1 | tail -n +2
}

function gproject_set() {
  gcloud config set project $1
}

function gproject() {
  gcloud config get-value project
}

function gprojects() {
  gcloud projects list
}

function set_zone() {
  gcloud config set compute/zone $1
}

function set_region() {
  gcloud config set compute/region $1
}

## Compute

function allow_http_ports() {
  allow_port 80
  allow_port 443
}

function allow_port() {
  gcloud compute firewall-rules create allow-port-$1 --allow tcp:$1
}

function gssh() {
  gcloud compute ssh $@
}

function gssh_8080() {
  gssh $1 -- -L 8080:localhost:8080
}

function ginstances() {
  gcloud compute instances list
}

function ginstance_delete() {
  gcloud compute instances delete --quiet $@
}

function ginstance_stop() {
  gcloud compute instances stop --quiet $@
}

function ginstance_start() {
  gcloud compute instances start --quiet $@
}

function ginstance_describe() {
  gcloud compute instances describe $@
}

function ginstance_serial_logs() {
  gcloud compute instances get-serial-port-output $@
}

## Composer

function composer_run() {
  gcloud beta composer environments run $1 --location=us-central1 $2 -- $3
}

function make_public() {
 gsutil acl ch -u AllUsers:R $1
}

function gcurl() {
  curl -H "Authorization: Bearer $(gcloud auth application-default print-access-token)" $@
}
