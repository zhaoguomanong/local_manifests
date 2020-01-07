# Lineage buildscripts
========================

Please note, I use ~/android/lineage in this README but you can use whatever folder name you want.

Also please note that repopick.sh isn't always updated. Please check LineageOS Gerrit in case there is changes to repopick topics.

Starting from zero:
---------
    mkdir -p ~/android/lineage
    cd ~/android/lineage
    repo init -u git://github.com/LineageOS/android.git -b lineage-17.1
    mkdir -p .repo/local_manifests
    curl https://raw.githubusercontent.com/LineageOsMaxPlus/local_manifests/lineage-17.1/local_manifest.xml > .repo/local_manifests/my_manifest.xml
    repo sync
    # OPTIONAL to use repopick unless you want to test WIP commits
    curl https://raw.githubusercontent.com/LineageOsMaxPlus/local_manifests/lineage-17.1/repopick.sh > repopick.sh
    ./repopick.sh

If you've already synced Lineage-Sources:
----------
    mkdir -p .repo/local_manifests
    curl https://raw.githubusercontent.com/LineageOsMaxPlus/local_manifests/lineage-17.1/local_manifest.xml > .repo/local_manifests/my_manifest.xml
    repo sync
    # OPTIONAL to use repopick unless you want to test WIP commits
    curl https://raw.githubusercontent.com/LineageOsMaxPlus/local_manifests/lineage-17.1/repopick.sh > repopick.sh
    ./repopick.sh

Building
----------
    cd ~/android/lineage
    curl https://raw.githubusercontent.com/LineageOsMaxPlus/local_manifests/lineage-17.1/x2_clean_build.sh > x2_clean_build.sh
    curl https://raw.githubusercontent.com/LineageOsMaxPlus/local_manifests/lineage-17.1/x2_dirty_build.sh > x2_dirty_build.sh
    ./x2_clean_build.sh // for clean builds
    ./x2_dirty_build.sh // for dirty builds

I made these modified scripts for convenience plus logs terminal output to files for easy scrolling later in your favorite text editor.
