export HSA_OVERRIDE_GFX_VERSION=11.0.0

alias watt="cat /sys/class/power_supply/BAT0/power_now"

# AOS
export BFBUILD=/home/thomas/git/eth/aos/aos2026-main-hand-out/build
export BFAOS=/home/thomas/git/eth/aos/aos2026-main-hand-out

# wget https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
# tar -xf arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz -C ~/
# mkdir -p ~/gcc-13.3-bin
# cd ~/gcc-13.3-bin
# for f in ~/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-*; do
#     ln -s "$f" "$(basename "$f" | sed 's/none-//')"
# done
export PATH=~/gcc-13.3-bin:~/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/bin:$PATH
