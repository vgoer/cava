#!/bin/bash

# 生成随机的 RGB 颜色值
generate_rgb_color() {
	local red=$((RANDOM % 256))
	local green=$((RANDOM % 256))
	local blue=$((RANDOM % 256))
	echo "$red,$green,$blue"
}

# 将 RGB 颜色值转换为 16 进制格式
rgb_to_hex() {
	local rgb=$1
	local hex=""
	for val in $(echo $rgb | tr "," " "); do
		hex_part=$(printf "%02x" $val)
		hex="$hex$hex_part"
	done
	echo "#$hex"
}

# 生成新的颜色配置
generate_new_colors() {
	echo "[color]"
	echo "gradient = 1"

	for ((i = 1; i <= 8; i++)); do
		rgb=$(generate_rgb_color)
		color=$(rgb_to_hex $rgb)
		echo "gradient_color_$i = '$color'"
	done
}

# 生成新的颜色配置并输出
# generate_new_colors

# 配置文件路径
config_file="$HOME/.config/cava/config"

# 替换配置文件中的主题设置
# sed -i "s/${config_file}/${random_theme}/" "${config_file}"

notify-send -i $HOME/.config/cava/cava.png -t 2000 -u normal "cava主题修改" "主题为：任意主题。"

generate_new_colors >$config_file

# 启动 Cava
cava
