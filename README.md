In order to install config please do:

```
cd /tmp
git clone https://github.com/OwnInfrastructure/configs.git
cd configs
for file in `ls *.sh`; do
    RC_PATH=$file
    curl -s https://raw.githubusercontent.com/b0noI/rcinstaller/master/install.sh | bash /dev/stdin $RC_PATH
done
```
