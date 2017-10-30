#!/bin/bash

${INSTALLDIR}/bin/cxbottle --create --bottle "${BOTTLE}" --description "百度网盘wine容器" --template "winxp"

for font in /tmp/fonts/*; do
  ${INSTALLDIR}/bin/wine --bottle "${BOTTLE}" --untrusted --wait-children --no-convert -- 'cxinstallfonts.exe' "${font}"
done

${INSTALLDIR}/bin/wine --bottle "${BOTTLE}" --untrusted --wait-children --no-convert --new-console -- "/tmp/installers/exe/Firefox Setup 20.0_zh-CN.exe" "-ms" && rm -f "/tmp/Firefox Setup 20.0.exe"

#  wget https://raw.githubusercontent.com/john-shine/Docker-CodeWeavers_CrossOver-VNC/master/BaiduNetdisk/BaiduNetdisk.tar.xz -O /tmp/BaiduNetdisk.tar.xz && \
tar -Jxvf /tmp/installers/BaiduNetdisk.tar.xz -C ${HOME}/.cxoffice/${BOTTLE}/drive_c/Program\ Files/
sudo mv /tmp/installers/dll/riched32.dll ${HOME}/.cxoffice/${BOTTLE}/drive_c/windows/system32/
sudo mv /tmp/installers/dll/riched32.dll ${HOME}/.cxoffice/${BOTTLE}/drive_c/windows/system32/
