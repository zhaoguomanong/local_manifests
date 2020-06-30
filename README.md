# Lineage buildscripts
========================

Please note, I use ~/android/lineage in this README but you can use whatever folder name you want.

First I recommend checking the official LineageOS wiki instructions for building for x2 here to see what are the dependencies and how to install them
https://wiki.lineageos.org/devices/x2/build


Starting from zero:
---------
    mkdir -p ~/android/lineage
    cd ~/android/lineage
    repo init -u git://github.com/LineageOS/android.git -b lineage-17.1
    mkdir -p .repo/local_manifests
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/lineage-17.1/leeco_official.xml > .repo/local_manifests/leeco_official.xml
    repo sync

If you've already synced Lineage-Sources:
----------
    mkdir -p .repo/local_manifests
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/lineage-17.1/leeco_official.xml > .repo/local_manifests/leeco_official.xml
    repo sync

Building
----------
    cd ~/android/lineage
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/lineage-17.1/tools/x2_clean_build.sh > x2_clean_build.sh
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/lineage-17.1/tools/x2_dirty_build.sh > x2_dirty_build.sh
    ./x2_clean_build.sh // for x2 clean builds
    ./x2_dirty_build.sh // for x2 dirty builds

I made these modified scripts for convenience plus logs terminal output to files for easy scrolling later in your favorite text editor.
