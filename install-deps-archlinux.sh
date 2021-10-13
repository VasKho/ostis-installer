packages=(
    pkgconf
    rocksdb
    glib2
    qt5-base
    boost-libs
    make
    cmake
    antlr4
    gcc
    llvm
    curl
    openssl
    clang
    python
    nodejs
    npm
    python-pip
)

for i in "${packages[@]}"
do
    sudo pacman -S --needed $i
done

sudo pip3 install wheel future termcolor tornado sqlalchemy python-rocksdb progress numpy configparser 
