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

function ginstances() {
  gcloud compute instances list
}

function ginstance_delete() {
  gcloud compute instances delete --quiet $1
}

function ginstance_stop() {
  gcloud compute instances stop --quiet $1
}

function ginstance_start() {
  gcloud compute instances start --quiet $1
}

