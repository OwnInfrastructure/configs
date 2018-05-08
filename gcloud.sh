function allow_http_ports() {
  allow_port 80
  allow_port 443
}

function allow_port() {
  gcloud compute firewall-rules create allow-port-$1 --allow tcp:$1
}

function gregions() {
	REGIONS=$(gcloud compute regions list)
	echo $REGIONS | cut -d " " -f 1 | tail -n +2
}

function gzones() {
	ZONES=$(gcloud compute zones list)
	echo $ZONES | cut -d " " -f 1 | tail -n +2
}

alias current_project="gcloud config get-value project"
alias list_projects="gcloud projects list"

funciton set_project() {
	gcloud config set project $1
}

funciton set_zone() {
	gcloud config set compute/zone $1
}

funciton set_region() {
	gcloud config set compute/region $1
}

function gssh() {
  gcloud compute ssh $1
}

function ginstances() {
  gcloud compute instances list
}

function gproject() {
  gcloud config set project $1
}

function gprojects() {
  gcloud projects list
}
