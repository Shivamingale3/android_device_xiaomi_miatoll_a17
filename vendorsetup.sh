#
# PenguinOS (AOSPA) port for miatoll.
#
# Soong parses every Android.bp in the tree. vendor/qcom/common ships display/media blob
# variants for other kernel versions whose modules depend on display HAL sources that only
# newer platforms have (libsdedrm, libdisplayskuutils, ...). miatoll (4.14) uses display/4.14
# and media/legacy, so hide the other variants from Soong with .find-ignore markers.
# Idempotent; the markers are untracked files and repo sync leaves them alone.
#
_miatoll_top=$(gettop 2>/dev/null || pwd)
for _d in \
    vendor/qcom/common/vendor/display/4.9 \
    vendor/qcom/common/vendor/display/4.19 \
    vendor/qcom/common/vendor/display/5.4 \
    vendor/qcom/common/vendor/display/5.10 \
    vendor/qcom/common/vendor/display/5.15 \
    vendor/qcom/common/vendor/media/5.4 \
    vendor/qcom/common/vendor/media/5.10; do
    [ -d "$_miatoll_top/$_d" ] && touch "$_miatoll_top/$_d/.find-ignore"
done
unset _miatoll_top _d
