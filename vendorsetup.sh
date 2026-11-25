#
# PenguinOS (AOSPA) port for miatoll.
#
# Soong parses every Android.bp in the tree. vendor/qcom/common ships display/media blob
# variants for other kernel versions whose modules depend on display HAL sources that only
# newer platforms have. Only variants that no used namespace imports can be hidden
# (QTI perf imports display/4.19,5.4,5.10,5.15; their libsdedrm need is met by a link-only
# stub in hardware/qcom/display). miatoll (4.14) uses display/4.14 and media/legacy.
# Idempotent; the markers are untracked files and repo sync leaves them alone.
#
_miatoll_top=$(gettop 2>/dev/null || pwd)
for _d in \
    vendor/qcom/common/vendor/display/4.9 \
    vendor/qcom/common/vendor/media/5.4 \
    vendor/qcom/common/vendor/media/5.10; do
    [ -d "$_miatoll_top/$_d" ] && touch "$_miatoll_top/$_d/.find-ignore"
done
unset _miatoll_top _d
