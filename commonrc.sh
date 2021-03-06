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

function process_by_port() {
  netstat -tulpn | grep $1
}

function f() { find ./ -name "*.*" | xargs grep -ir "$@*";} #  search for keyword e.g:  s slava
function ff() { find ./ -type f -name "$@*";}    # search for a file   e.g:  sf readme
function fd() { find ./ -type d -name "$@*";}  # search for a directory  e.g.: sd nova 

alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../" 

########################################
#                AWS                   #
########################################

function change_region_to() {
  export AWS_DEFAULT_REGION=$1
}

function change_region_to_default() {
  export AWS_DEFAULT_REGION=us-east-1
}

function describe_instances() {
  res=`aws ec2 describe-instances --query 'Reservations[*].Instances[*].{name:Tags[0].Value,id:InstanceId,type:InstanceType,ip:PublicIpAddress,state:State.Name,image_id:ImageId,launch_time:LaunchTime}' --output table`
  echo $res | head -n5 && echo $res | head -n -1 | tail -n +6 | sort -d -k 7 && echo $res | tail -n 1
}

function stop_instance() {
  aws ec2 stop-instances --instance-ids $1 --output text
}

function start_instance() {
  aws ec2 stop-instances --instance-ids $1 --output text
}

function terminate_instance() {
  aws ec2 terminate-instances --instance-ids $1 --output text
}

function set_instance_name() {
  aws ec2 create-tags --resources $1 --tags Key=Name,Value="$2"
}

########################################
#               Bazel                  #
########################################

alias bb="bazel build"

alias bt="bazel test"

alias br="bazel run"

########################################
#                Conda                 #
########################################

alias list_envs="conda info --envs"

function remove_conda_env() {
   conda remove --name $1 --all
}

########################################
#                 git                  #
########################################

alias gst="git status"

function new_branch() {
  git checkout master
  git pull
  git fetch upstream
  git merge upstream/master
  git push
  git checkout -b $1
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
