#!/usr/bin/env bash

export ALL_PROXY=socks5://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890

end=0

while [ $end -eq 0 ]
do
    doom sync
    if [ $? -eq 0 ]; then
        end=1
    fi
done

# copy rime 配置文件
if [ ! -d "~/.emacs.d/.local/cache/rime" ]
then
    cp -rf ~/sys-cfg/Library/Rime ~/.emacs.d/.local/cache/rime
fi
