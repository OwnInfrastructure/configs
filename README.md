In order to install config please do:

```
INSTALL_SCRIPT_FILE_NAME="install.sh"
CONFIG_DIR_NAME="configs"
cd /tmp
git clone https://github.com/OwnInfrastructure/configs.git
cd "${CONFIG_DIR_NAME}"
wget "https://raw.githubusercontent.com/b0noI/rcinstaller/master/${INSTALL_SCRIPT_FILE_NAME}"
chmod +x "./${INSTALL_SCRIPT_FILE_NAME}"
for file in `ls *.sh`; do
    RC_PATH="${file}"
    echo "installing: ${RC_PATH}"
    if [[ "${RC_PATH}" != "${INSTALL_SCRIPT_FILE_NAME}" ]]; then
      "./${INSTALL_SCRIPT_FILE_NAME}" "${RC_PATH}"
    fi
done
cd ..
rm -rf "${CONFIG_DIR_NAME}"
```
