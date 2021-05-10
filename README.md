In order to install config please do:

```
INSTALL_SCRIPT_FILE_NAME="install.sh"
cd /tmp
git clone https://github.com/OwnInfrastructure/configs.git
cd configs
wget "https://raw.githubusercontent.com/b0noI/rcinstaller/master/${INSTALL_SCRIPT_FILE_NAME}"
chmod +x "./${INSTALL_SCRIPT_FILE_NAME}"
for file in "$(ls *.sh)"; do
    RC_PATH="${file}"
    if [[ "${RC_PATH}" != "${INSTALL_SCRIPT_FILE_NAME}" ]]; then
      "./${INSTALL_SCRIPT_FILE_NAME}" "${RC_PATH}"
    fi
done
```
