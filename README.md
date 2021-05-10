In order to install config please do:

```
cd /tmp
git clone https://github.com/OwnInfrastructure/configs.git
cd configs
wget https://raw.githubusercontent.com/b0noI/rcinstaller/master/install.sh
chmod +x install.sh
for file in "$(ls *.sh)"; do
    RC_PATH="${file}"
    ./install.sh "${RC_PATH}"
done
```
