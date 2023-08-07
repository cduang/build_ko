tagg='android13-5.15-2022-11'
../git-repo/repo init --depth=1 --u https://android.googlesource.com/kernel/manifest -b common-$tagg
REMOTE_BRANCH=$(git ls-remote https://android.googlesource.com/kernel/common $tagg)
if grep -q deprecated <<< $REMOTE_BRANCH; then
    echo "Found deprecated branch: $tagg"
    /usr/bin/sed -i "s/\"$tagg\"/\"deprecated\/$tagg\"/g" .repo/manifests/default.xml
    cat .repo/manifests/default.xml
fi