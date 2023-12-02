#!/bin/bash

# 定义主题列表
cava_theme_dir="$HOME/.config/cava/theme"

# 从主题列表中随机选择一个主题
random_theme=$(ls "${cava_theme_dir}" | shuf -n 1)

# 配置文件路径
config_file="$HOME/.config/cava/config"

# 替换配置文件中的主题设置
# sed -i "s/${config_file}/${random_theme}/" "${config_file}"

notify-send -i $HOME/.config/cava/cava.png -t 2000 -u normal "cava主题修改" "主题为：${random_theme}"

cat "$cava_theme_dir/$random_theme" >$config_file

# 启动 Cava
cava
