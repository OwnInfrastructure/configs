function list_regions() {
	REGIONS=$(gcloud compute regions list)
	echo $REGIONS | cut -d " " -f 1 | tail -n +2
}

alias current_project="gcloud config get-value project"
alias list_projects="gcloud projects list"
