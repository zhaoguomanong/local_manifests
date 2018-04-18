# Lineage buildscripts
========================

Starting from zero:
---------
    mkdir -p ~/android/lineage
    cd ~/android/lineage
    repo init -u git://github.com/LineageOS/android.git -b lineage-15.1
    curl https://raw.githubusercontent.com/LineageOsMaxPlus/local_manifests/working/lineage-15.1/local_manifest.xml > ~/android/lineage/.repo/local_manifests/my_manifest.xml
    repo sync

If you've already synced Lineage-Sources:
----------
    curl https://raw.githubusercontent.com/LineageOsMaxPlus/local_manifests/working/lineage-15.1/local_manifest.xml > /path/to/lineage/.repo/local_manifests/my_manifest.xml
    repo sync

Building
----------
    curl https://raw.githubusercontent.com/LineageOsMaxPlus/local_manifests/lineage-15.1/clean-max_plus-build.sh > /path/to/lineage/clean-max_plus-build.sh
    curl https://raw.githubusercontent.com/LineageOsMaxPlus/local_manifests/lineage-15.1/dirty-max_plus-build.sh > /path/to/lineage/dirty-max_plus-build.sh
    . clean-max_plus-build.sh // for clean builds
    . dirty-max_plus-build.sh // for dirty builds

I made these modified scripts for convenience plus logs terminal output to files for easy scrolling later in your favorite text editor.
