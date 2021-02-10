# PixelExperience buildscripts
========================

Please note, I use ~/android/pixelexperience in this README but you can use whatever folder name you want.

First I recommend checking the official PixelExperience wiki instructions for building here
https://github.com/PixelExperience/manifest/tree/ten-plus


Starting from zero:
---------
    mkdir -p ~/android/pixelexperience
    cd ~/android/pixelexperience
    repo init -u https://github.com/PixelExperience/manifest -b ten-plus
    mkdir -p .repo/local_manifests
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/pe_ten_plus/leeco.xml > .repo/local_manifests/leeco.xml
    repo sync

If you've already synced PixelExperience-Sources:
----------
    mkdir -p .repo/local_manifests
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/pe_ten_plus/leeco.xml > .repo/local_manifests/leeco.xml
    repo sync

Building
----------
    cd ~/android/pe
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/pe_ten_plus/tools/x2_clean_build.sh > x2_clean_build.sh
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/pe_ten_plus/tools/x2_dirty_build.sh > x2_dirty_build.sh
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/pe_ten_plus/tools/s2_clean_build.sh > s2_clean_build.sh
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/pe_ten_plus/tools/s2_dirty_build.sh > s2_dirty_build.sh
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/pe_ten_plus/tools/x2s2_clean_build.sh > x2s2_clean_build.sh
    curl https://raw.githubusercontent.com/zhaoguomanong/local_manifests/pe_ten_plus/tools/x2s2_dirty_build.sh > x2s2_dirty_build.sh
    chmod 777 *.sh
    ./x2_clean_build.sh // for x2 clean builds
    ./x2_dirty_build.sh // for x2 dirty builds
    ./s2_clean_build.sh // for s2 clean builds
    ./s2_dirty_build.sh // for s2 dirty builds
    ./x2s2_clean_build.sh // for x2,s2 clean builds(build both x2,s2 targets)
    ./x2s2_dirty_build.sh // for x2,s2 dirty builds(build both x2,s2 targets)

I made these modified scripts for convenience plus logs terminal output to files for easy scrolling later in your favorite text editor.
