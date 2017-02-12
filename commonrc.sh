########################################
#               common                 #
########################################

function td() {
  mkdir $1
  cd $1
}

function sort_subfolders_by_size() {
  du --max-depth=1 $1 | sort -n -r
}

function replace_string_in_dir() {
  find $1 -type f -name "*" -exec sed -i 's/$2/$3/g' {} +
}

########################################
#               Bazel                  #
########################################

alias bb="bazel build"

alias bt="bazel test"

alias br="bazel run"

########################################
#                 git                  #
########################################

alias gst="git status"

########################################
#               gCloud                 #
########################################

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

############ Kubectl ##################

alias kpods="kubectl get pods"

alias kservices="kubectl get services"

alias krc="kubectl get rc"

############# Hacks ###################

funciton connect_to_resilio() {
  gcloud compute ssh --quiet \
    --project "b0noi-infrastructure" \
    --zone "us-central1-f" \
    --ssh-flag="-N" \
    --ssh-flag="-L" \
    --ssh-flag="localhost:8887:localhost:8887" \
    gke-infra-default-pool-fde71673-dao3
}

funciton connect_to_datalab() {
  gcloud compute ssh --quiet \
    --project "b0noi-infrastructure" \
    --zone "us-central1-f" \
    --ssh-flag="-N" \
    --ssh-flag="-L" \
    --ssh-flag="localhost:8081:localhost:8899" \
    gke-infra-default-pool-fde71673-dao3
}