#!/bin/bash


function rbenv_installer() {
    #Download rbenv pkgbuild with -O flag i rename it into PKGBUILD
    wget -O PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=rbenv"
    wget -O rbenv.install "https://aur.archlinux.org/cgit/aur.git/plain/rbenv.install?h=rbenv"
    makepkg -csi
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

    ruby_builder
}

function ruby_builder() {
    wget -O PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=ruby-build"
    makepkg -csi
    cd ..
    rm -rf dev-tools
    exit

}

function main() {
    mkdir dev-tools
    cd dev-tools
    rbenv_installer

}

main
