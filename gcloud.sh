function list_regions() {
	REGIONS=$(gcloud compute regions list)
	echo $REGIONS | cut -d " " -f 1 | tail -n +2
}
