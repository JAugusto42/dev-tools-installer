#!/bin/bash


function rbenv_installer() {
    #Download rbenv pkgbuild with -O flag i rename it into PKGBUILD
    curl "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=rbenv" --output PKGBUILD
    curl "https://aur.archlinux.org/cgit/aur.git/plain/rbenv.install?h=rbenv" --output rbenv.install
    makepkg -csi
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

    ruby_builder
}

function ruby_builder() {
    curl "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=ruby-build" --output PKGBUILD
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
