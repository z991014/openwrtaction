#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.2/g' package/base-files/files/bin/config_generate
sed -i "s/OpenWrt /Jun build $(TZ=UTC-8 date "+%Y.%m.%d") @ X86 /g" package/lean/default-settings/files/zzz-default-settings
sed -i '/uci commit system/i\uci set system.@system[0].hostname='Openwrt'' package/lean/default-settings/files/zzz-default-settings
curl -fsSL https://raw.githubusercontent.com/craytona170/openwrttest/main/banner > package/base-files/files/etc/banner
