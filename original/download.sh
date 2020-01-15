original_arches=("arc" "armv4l" "armv4tl" "armv5l" "armv6l" "armv7l" "i486" "i586" "i686" "m68k" "mips" "mips64" "mipsel" "powerpc-440fp" "powerpc" "sh2eb" "sh2elf" "sh4" "sparc" "x86_64")
function get_binaries {
    togo=21
    for i in "${original_arches[@]}"
        do
        togo=$((togo-1))
        printf "\033[32mDownloading\033[0m -> $i.tar.gz togo=\033[31m$togo\033[0m\n"
        wget https://github.com/Carlos-741/Cross-compilers/raw/master/original/$i.tar.gz  >/dev/null 2>&1
    done
}

function extract_trash {
    togo=21
    for i in "${original_arches[@]}"
        do
        togo=$((togo-1))
        printf "\033[32mextracting\033[0m -> $i.tar.gz togo=\033[31m$togo\033[0m\n"
        tar -xvf $i.tar.gz >/dev/null 2>&1 && mv cross-compiler-$i $i >/dev/null 2>&1
    done
mv arc_gnu_2019.09_prebuilt_uclibc_le_arc700_linux_install arc >/dev/null 2>&1
rm *.tar.gz >/dev/null 2>&1
}
get_binaries
extract_trash
rm $0
