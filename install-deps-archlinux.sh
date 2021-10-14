packages=(
    pkgconf
    rocksdb
    glib2
    qt5-base
    boost
    boost-libs
    make
    cmake
    antlr4
    gcc
    grunt-cli
    llvm
    curl
    openssl
    clang
    python
    nodejs
    npm
    python-pip
    python-tqdm
)

for i in "${packages[@]}"
do
    sudo pacman -S --needed $i
done

sudo pip3 install wheel future termcolor tornado sqlalchemy python-rocksdb progress numpy configparser 
