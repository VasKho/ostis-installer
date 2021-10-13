#!/bin/bash

APP_ROOT_PATH=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd)

red="\e[1;31m"  # Red B
blue="\e[1;34m" # Blue B
green="\e[0;32m"

bwhite="\e[47m" # white background

rst="\e[0m"

st=1

stage()
{
    echo -en "$green[$st] "$blue"$1...$rst\n"
    let "st += 1"
}

clone_module()
{
    echo -en $green"Clone $2$rst\n"
    git clone $1
    cd ./$2
    git checkout $3
    cd -
}


# Start of installation
git clone https://github.com/ostis-apps/ostis-example-app.git
cd ./ostis-example-app
git checkout 0.6.0

git clone https://github.com/ostis-dev/ostis-web-platform.git
cd ./ostis-web-platform
git checkout 0.6.0



stage "Installing dependencies"

${APP_ROOT_PATH}/ostis_installer/install-deps-archlinux.sh



stage "Cloning modules"

clone_module https://github.com/ShunkevichDV/sc-machine.git sc-machine 0.6.0
clone_module https://github.com/ostis-dev/sc-web.git sc-web 0.6.0
clone_module https://github.com/ostis-dev/ims.ostis.kb.git ims.ostis.kb 432bbaa



stage "Building sc-machine"

cd ./sc-machine

# Add own CMakeList.txt
mv ${APP_ROOT_PATH}/ostis_installer/CMakeList.txt .

mkdir build
cd ./build
cmake ..
make

cat /bin/config.ini >> ../config/sc-web.ini
cd ../../


stage "Building sc-web"

cd ./sc-web
npm install
grunt build

echo -en $green"Copy server.conf"$rst"\n"

cd ..

cp -f ./config/server.conf ./sc-web/server/



stage "Building knowledge base"

rm ./ims.ostis.kb/ui/ui_start_sc_element.scs
rm -rf ./kb/menu
echo "../kb" >> ./repo.path
echo "../problem-solver" >> ./repo.path

./scripts/build_kb.sh
