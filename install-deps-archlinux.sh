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

printf "%s\n" "${packages[@]}" | sudo pacman -Sy --needed -

pip3 install wheel future termcolor tornado sqlalchemy tqdm python-rocksdb rocksdb progress numpy configparser 
