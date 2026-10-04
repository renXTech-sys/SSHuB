#!/usr/bin/env bash

export COLUMNS=${COLUMNS:-110}
export LINES=${LINES:-30}

if command -v printf >/dev/null 2>&1; then
    printf '\e[8;32;112t' 2>/dev/null
fi

DATA_FILE="$HOME/.vps_list.json"

if [ ! -f "$DATA_FILE" ]; then
    echo "[]" > "$DATA_FILE"
fi

CLR_RESET="\033[0m"
CLR_BOLD="\033[1m"

COLOR_MAGENTA="\033[38;5;201m"
COLOR_SAKURA="\033[38;5;218m"
COLOR_PURPLE="\033[38;5;141m"
COLOR_MINT="\033[38;5;121m"
COLOR_CYAN="\033[38;5;87m"
COLOR_WHITE="\033[38;5;255m"

COLOR_ONLINE="\033[38;5;82m"
COLOR_WARN="\033[38;5;220m"
COLOR_OFFLINE="\033[38;5;196m"

draw_ascii_banner() {
    echo -e "${COLOR_MAGENTA}${CLR_BOLD}"
    cat << "EOF"
⡀             
      ⢀⣀⣀⣀⡀⢉⣉⠉⠉⠋⠐⣀              ⣀⠰⠒⠒⠂ ⠄       
     ⣠⣾⣿⣿⡿⠿⠿⣶⣶⣥⣴⠢              ⢊⡀⢤⣤⣤⣶⣶⣶⣖⠃     
  ⠠⢴⣾⣿⡿⠋   ⣴⣾⣿⣿⣿⣗              ⣥⣾⣿⣟⠉⠉⠙⠻⣿⣿⣦⣀   
  ⣠⣾⣿⠋    ⠠⣿⣜⢶⡗⣹⡯⠣ @renxtech  ⠰⣟⢭⣛⢹⣧    ⠻⣿⣧⡀  
⠲⠿⠿⠿⣿⡀     ⠻⠿⣷⡼⠟⠁              ⢿⣯⣫⣼⡏     ⣹⣿⠿⠷⠦
    ⠈⠉⠒  ⡀⢀⣠⠶⠖⠒                 ⠭⢭⢥⣄    ⠊⠁    
                                   ⠁
EOF
    echo -e "${CLR_RESET}"
}

draw_exit_banner_1() {
    local p="${COLOR_SAKURA}"
    local P="${COLOR_WHITE}"
    local r="${CLR_RESET}"

    echo -e "${COLOR_MAGENTA}${CLR_BOLD}"
    echo -e "⠈⠳⣿⣷⡀   ⢳⣨⡦⠄ ⠄⣀⡀⡧⣀⢷⣀   ⡀                                                                  ⠘⣯⡿⡀ ⡠⢋⠊⠈⠐⢄⠔⠁ ⠈⠉⠛⠽⢷⣦⣀ ⠉  ⠄⣀"
    echo -e "            ⢀⠟⢷⡇ ⠈⢄⠣⣀⣀⠊ ⠒⠠⠄⡀   ⠉⠻⢷⡀     ⢐⡴⠄⡀"
    echo -e "            ⡜⠑⢳⡦⠴⠚⠉⠉⠛⠉⠓ ⠙⠲⢤⣀⠁⠢⢀   ⠑⢄   ⢀⣾⡇  ⠑⠠"
    echo -e "          ⡀ ⠉⡲⠊    ⠂ ⠰⠆    ⠈⠛⢦⢄⠑⢄   ⠑⢀⣼⣻⡥⠄⣀⠤⠤⢤"
    echo -e "   ⠰⢦⣄  ⠤ ⠒⢲⠏  ⢀⠔⠁  ⢠⠃⠘⢤⢠     ⠁⠈⡢⡑⢄   ⠱⣷⠗⠊⠁    ⠹⡁"
    echo -e "    ⠈⢻⠷⣄  ⠠⠃  ⢀ ⠄  ⡠⠁  ⢸ ⣧ ⠐    ⠈⠈⢆⠑   ⠐⡀       ⠁"
    echo -e "     ⠈⢳⢸⣦⢠⠁  ⢠⢂⠊ ⢀⠜    ⠸⡇⢋⠣⡀⠈⠢⡀   ⠑⢵⡈   ⠘⣦      ⢸"
    echo -e "      ⠈⣦⣼⠃   ⡆⠎ ⢀⠊      ⣽⡜⡀⠑⠄⡀⠈⠂⢄   ⣹⣆⠁  ⠘⡥⡀    ⢸"
    echo -e "       ⢘⡏   ⢠⡘ ⢠⠃       ⢹⡶⠡⢀⣀⣈⣁⡒ ⠥⠦⢔⠌⣼⣣   ⠐⡱⡀   ⢸"
    echo -e "  ⡀⠤⠒ ⠉⣸  ⢀  ⠁⢀⠃  ⢀⡤⠄⠂   ⢻⣧⢣⠠⠐⠒⠂⠂   ⠙⠋⡇⢣   ⠘⢴   ⢸"
    echo -e "       ⠃  ⣸ ⠨ ⠆⠤⢐⡊⠥⠠⢄     ⠙⢧${p}⡡⡴⣶⣿⣻⡟⠛⡿⠋${r}${COLOR_MAGENTA}⢇⡇⡖⠫⡂   ⠣⡀ ⢸"
    echo -e "      ⢠   ⡇⡄⢸⡘${p} ⣀⣤⣤⣶⣶⢤${r}${COLOR_MAGENTA}⡀  ⢀   ⠙${p}⠪⣿⡚⠛⠃⠊${r}${COLOR_MAGENTA} ⢀⣨⡛  ⠈⣎⠢⡀ ⠈⠢⣻"
    echo -e "      ⢸   ⡇⠁⡘⡗${p}⠻⢏⡹⠿⠛⠋${r}${COLOR_MAGENTA}   ⠨⣀⠇  ⡤⡄ ⠙⡛  ⠚⢉⠎    ⠋⠫⡮⢔⠄⡀⠈⠐"
    echo -e "      ⠈ ⡇ ⠻⢰⠓⣥            ⢀⠠⠣⣀   ⠁⠒⠒⠅     ⠈ ⠠ ⠋⠙⢳⠢"
    echo -e "  ⠒⠒⠒  ⣆⠿⠸⠰⡇ ⢰⣃        ⡠⡮⣭ ⣀⣤⠰⡀⠪⡀            ⣢⢰ ⢸"
    echo -e "       ⡼⣰⢡ ⡇ ⠈⠏⢆      ⣴⡹⠞⠛⠛⠛⠉⢲⡇ ⠈⠎          ⠁⢁⠸ ⡌"
    echo -e "   ⢀⡀ ⡰ ⢧⠆⠫⣱  ⠈⠌⡆     ⡛${P}⠱⡀⢂    ${r}${COLOR_MAGENTA}⡄  ⠈⡄          ⠸⢸⢠⡃⠤"
    echo -e "⢀⢀⠔⡕⠁⠰⠁⠌ ⠾⣄⡈⢡  ⠈⢼⡄   ⡐  ${P}⣧⠈   ⡐${r}${COLOR_MAGENTA}    ⢘⢄          ⢸⡎⠈⠳"
    echo -e " ⢎⠘⠤⢄⠁⠘  ⠰⢨⠁     ⠵⣄⣀⣠⠁ ⢰ ${P}⠣⢀⣀⠔${r}${COLOR_MAGENTA}   ⢀⢠⡏⢸⣷⠤⡀       ⡎⠃"
    echo -e "⠘⠁⢠⡪⠼ ⡅⢀  ⢳⠆       ⠐⠅⠁ ⢸      ⡠⠐⠁⡜ ⠸⠃⢀⠣⡀      ⠘⡠⣢"
    echo -e " ⢀⢏⣀⠔⢆⠰⠈⠆⣀⣸⠈⠆          ⠘⠈⠁⠲⢀⠒⠁⠐⢀⡜⠄⠠⠁⠠⠃⠠⢃⠂      ⡇ ⢣"
    echo -e " ⠸⠍⢸ ⠈⢢⠁⠈⠊⢣ ⠸          ⠿⡤     ⢂⠟ ⢠⠁⢠⢁⠖⠁⠘       ⢉⠲⠼"
    echo -e "   ⠘⡡⡀⢀⢷  ⡈⡄ ⠇        ⢰ ⠙⡄   ⡠⠋⢀⣠⣿⡂⣦⠋   ⡆      ⢸⠑⢤"
    echo -e "⠠⢀⣃⣀⡈⠖⠋⢀  ⢡⢡          ⠞⠶⢶⢾⣶⣶⡾⠶⠾⠛⢿⣿⡇⠇    ⡇       ⣄⠈"
    echo -e " ⣀⠄   ⡠⠊ ⠠ ⠹         ⡜   ⠈⢸⣲⢇⣀⡠⠤⠚⢻⡟     ⡇       ⢓⠃"
    echo -e "  ⠈⠉⠉⠉  ⠁  ⠘       ⢠⢲⣏⠉⠉⣭⠉⣉⡀⠡⠖⣰⣆⣠⣿⠁   ⢀⡜⡁       ⠸"
    echo -e "⠲⢄⠂       ⢐⡇        ⡎⢿⣷⠶⡛⠛⠃ ⠉⠉  ⣸⠃   ⠠⠂⢧⠁        ⠇"
    echo -e " ⠑⢌⢢⣄⣀⣀⡤⠤⠐⢁⠃       ⠘⠁ ⠙⢧⡀    ⢀⣠⢴⠏   ⠴⠁⢰⢈"
    echo -e "⠄⡤⣴⣾⣢⢄⡀   ⡌        ⣴⠁   ⠩⠙⢿⣷⣾⠟⠁⠆   ⠘⠆ ⡌⢸"
    echo -e "⠑⠏⠁  ⠁⠊⢍⡈⡝         ⠈⠑⢄   ⠡ ⠙⡇ ⢰    ⡜ ⢠⠁⡀"
    echo -e "  ⠑⢄⡀  ⣀⠌          ⡆  ⠑⠄  ⠡⡀⢡ ⢸   ⡘  ⡌ ⠇"
    echo -e "    ⠈⠒⢤⠊⠠⠁        ⠃⠣   ⠈⢢  ⠑⠌⡀⡈  ⢠⠁ ⢀⠁"
    echo -e "     ⡠⠁          ⠘⢰ ⢡    ⡓  ⠈⢇⠇⠁⠂⠊⠄ ⢸ ⡠⡀"
    echo -e "    ⡐⠁           ⠃⡈⠐⢄⢣  ⢠⠃   ⠼⢀   ⣸  ⡐⠁⡇"
    echo -e "   ⢠⠁             ⡇  ⠑⢇  ⢃⠄⠔⠈⢰⢢⠃  ⡟ ⡜  ⢠"
    echo -e "${CLR_RESET}"
}

draw_exit_banner_2() {
    echo -e "${COLOR_WHITE}${CLR_BOLD}"
    cat << "EOF"
​んおっん～～...                                 
                     ⣀⣴⡾⡻⡅      ⠈⠙⠢⢄                             
                   ⢀⣾⣿⡌⠉⠉⠃⠃⢀        ⠈⠒⠤⡀                         
                  ⢠⣿⡿⣿⡇ ⡄  ⢀⠁⠚⠶⣂⣤⡀    ⣀⣾⣆                        
              ⡄   ⣾⣿⢱⢫ ⡰⣿  ⡎   ⠈⠓⠟⠻⢶⠶⢼⣧⣽⣿⣄⡄                      
             ⠐⡃  ⢸⢻⠃⢦⣼⡾⢱⠃ ⢀⠃⡀      ⣿⡀   ⠈⠈⢞                      
                 ⢸  ⡘⠉⠲⢄⣰⢀⢾⢠⠇    ⡄⢠⢸⡇⢣    ⠘⡆                     
                 ⠘⢴⠰⣿⣶⣄ ⠾⠃⣌⡾   ⢀⢧⣧ ⣿⢣⢸     ⢁ IG : renxtech       
               ⢠⠁ ⠁ ⠛⠃ ⠈ ⣸⢿⠃  ⣠⣾⣾⣿⡄⢻⣾⡈    ⢠⢸                     
            ⠠  ⢸        ⠐⠁⡜  ⣴⣿⠏⢀⢹⣇⢸⣿⣿  ⣦ ⢸⢸                     
          ⠁    ⢈⠠⡄       ⡜⣀⡤⢊⣼⡇⢩⠁⣸⣿⢸⡏⣿⡆ ⣿⡄⢸⡘⡀                    
                ⠇       ⠈⠉  ⢀⣘⣀⣤⣾⢿⣿⣿⡇⣿⡇⢰⣜⣇ ⣇⡇                    
                ⠸⡀          ⢹⣿⣿⣿⠏⣼⣿⡿⡇⣿⡇⣸⣿⣿⡄⣿⢧                    
                  ⠉  ⠐⢤      ⢻⣿⣫⣾⣿⢱⣷⣧⣿⣧⣿⡇⣿⣧⡟⠈⠃                   
                       ⢡   ⢀⣀⠾⠿⠛⠋⣧⣾⣿⣽⣿⣿⢟⡼⢹⡿⠁                     
              ⠐⡂       ⠈⡆⢠⠖⡋⠁   ⣀⣈⣿⡿⠿⢟⠃⠜⠁⠈                       
               ⠁⠐       ⣷⡵⢊⢀ ⣄⣀⣀⡀⡀   ⡜                           
                       ⡼⡪⠊      ⠈⠉⠻⣶⢄⣣                           
                      ⣼⡣⠐  ⠠⠄      ⠈⠇                            
                     ⢀⡟       ⡀     ⢠                            
                    ⣴⡿        ⠃     ⢸                            
                   ⠈⡿⠁       ⡎⡘ ⢀   ⢈                            
                  ⡌⢱⠁ ⣄ ⠤⡀  ⢰⡔⠁⡠⠃   ⢸                            
                 ⠘⡄⠸⡜⡂⠒⠳⠤⣰⣄ ⢼ ⠐⠁    ⢸                         
                 ⣀⢰⡥⠤⣀⡀  ⠉⣇⣸       ⠸⡀                  
                  ⠯ ⠁  ⠈⠛⣶⣴⠟⠃        ⠱⡀                  
                  ⢀⠃     ⠞⠉           ⠑⢄                
                  ⡈     ⡜ ⠘        ⠠⢀ ⢠⣼             
                 ⢰⠁    ⣘⢇⢠           ⠈⠈⠙⠦⢀           
                ⢠⠃   ⡐⣰⣿⠈⡘⡀            ⣈⠟ ⡣⢀⡀        
               ⢠⠃    ⢸⠃⡇ ⢩⠁           ⡰⠋ ⡜  ⠈⠑⠂⠤⡀  
              ⢀⠆    ⢠⠃⣠⠁ ⠘⣦       ⣀   ⠁ ⠜     ⢀⠄⠑⢄   
              ⡌     ⡄ ⡆   ⠘⡄   ⢀⠄⢈⡨⢀  ⠈    ⣀⠄   ⢀⡠⣝⣦⡠ 
             ⢠     ⡜ ⡰     ⠰⡀ ⢦⢀⠔⠉  ⢃⠎ ⠠⣎⠴⠊⠁ ⢀⡤⠖⠁⠄  ⠈⠑⠢⣱ 
             ⡌    ⡌ ⡰⠁      ⢁ ⠘⡅    ⢈⢀⢌⠔⢱  ⣠⠴⠋      ⡀  ⡠⠶    
            ⠰    ⠎⠁⢠⠃       ⠈⢂  ⡀  ⣠⡢⡮⠃  ⢦⡞⠁⠈⠢      ⡸⠍⠑⢀⠙⠲⢄ 
           ⢀⠃  ⢀⠎⠠⢀⠃          ⢆ ⠕⠆ ⡝⡟   ⡠⠊    ⢠ ⡀⡠ ⠈⢀⢡  ⡄ ⢈⠂ 
⢀⠤⠴⠄ ⠢⣀   ⢀⡞  ⢀⡮⢐⡀⡎            ⠱⢄⣀ ⡻⠃ ⢠⠎       ⡆⠁⢂   ⠊⠄ ⠈⠐⠁ ⡆  
⠘⢒⠁⠑⠢    ⠉⠛  ⢀⣞⣃⢘⡼           ⠰⣢⣄⠓ ⢘⢇⢀⡼⠁     ⠆  ⢀⡀⠂    ⣊      ⡆     
 ⠄⡜⠆⠁      ⢀⣠⣾⣿⣿⡟⠁   ⢀⣀⣀⣀⣀⡀   ⣀⣀⣈⣀⣨⣄⡙⠁     ⠁⢰⠊   ⡀⢀⢀⡀⢰⠊       ⡆  ⢀ 
⠉⠉⠠⠂⠉⠁    ⠈⠈                   ⠈⠉⠉⠉⠉⢠ ⠒⠠⢠  ⠐⡇   ⢠ ⠉  ⡜        ⡆ 
⠶⠶⠶⠒ ⠐⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠚⠋⠁⠈⠉⢹⣻⡋⠉⠉⢹⣟⢀⣀⣀⣨⡄⡰⠒⢃  ⠔⠊   ⢠        ⡆    
                               ⣈⡇  ⢸ ⡟⠁ ⠁          ⢀⠆        ⡆⡀   
 ⠒⠒⠒⠒⠒⠒⠒⠒  ⠒⠒⠂        ⠉⠉⠁ ⠉⠉⠉⠉⠉⢿⡇  ⢸⢀⠇             ⠎        ⡆    
                               ⡾   ⢸⢘             ⡜         ⠘ ⠐
EOF
    echo -e "${CLR_RESET}"
}

draw_exit_banner() {
    clear
    local rand=$((RANDOM % 2))
    if [ "$rand" -eq 0 ]; then
        draw_exit_banner_1
    else
        draw_exit_banner_2
    fi
    echo -e "${COLOR_SAKURA}${CLR_BOLD}Exiting Manager. See you again!${CLR_RESET}\n"
}

draw_border() {
    echo -e "${COLOR_MAGENTA}+-----+----------------------+-----------------+------------+-----------------------------------+${CLR_RESET}"
}

get_server_stats() {
    local ip="$1"
    local user="$2"
    local port="$3"

    local ping_val
    ping_val=$(ping -c 1 -W 1 "$ip" 2>/dev/null | grep 'time=' | awk -F'time=' '{print $2}' | awk '{print $1}')

    if [ -z "$ping_val" ]; then
        echo -e "${COLOR_OFFLINE}● OFFLINE${CLR_RESET} | N/A | N/A"
        return
    fi

    local ping_num=${ping_val%.*}
    local ping_fmt
    if [ "$ping_num" -lt 100 ]; then
        ping_fmt="${COLOR_ONLINE}${ping_val}ms${CLR_RESET}"
    elif [ "$ping_num" -lt 250 ]; then
        ping_fmt="${COLOR_WARN}${ping_val}ms${CLR_RESET}"
    else
        ping_fmt="${COLOR_OFFLINE}${ping_val}ms${CLR_RESET}"
    fi

    local remote_info
    remote_info=$(ssh -o BatchMode=yes -o ConnectTimeout=2 -p "$port" "${user}@${ip}" \
        "free -m | awk '/Mem:/ {printf \"%.0f%%\", \$3/\$2*100}'; echo -n ' | '; top -bn1 | grep 'Cpu(s)' | awk '{print 100-\$8\"%\"}'" 2>/dev/null)

    if [ -z "$remote_info" ]; then
        echo -e "${ping_fmt} | ${COLOR_WARN}Auth/Key Req${CLR_RESET} | N/A"
    else
        local ram_usage cpu_usage
        ram_usage=$(echo "$remote_info" | awk -F'|' '{print $1}' | xargs)
        cpu_usage=$(echo "$remote_info" | awk -F'|' '{print $2}' | xargs)
        echo -e "${ping_fmt} | ${COLOR_MINT}CPU: ${cpu_usage}${CLR_RESET} | ${COLOR_CYAN}RAM: ${ram_usage}${CLR_RESET}"
    fi
}

show_dashboard() {
    clear
    draw_ascii_banner

    echo -e "${COLOR_PURPLE}${CLR_BOLD} :: VPS & SSH DASHBOARD MANAGER ::${CLR_RESET}"
    draw_border
    printf "${COLOR_MAGENTA}|${CLR_RESET} ${COLOR_PURPLE}%-3s${CLR_RESET} ${COLOR_MAGENTA}|${CLR_RESET} ${COLOR_SAKURA}%-20s${CLR_RESET} ${COLOR_MAGENTA}|${CLR_RESET} ${COLOR_MINT}%-15s${CLR_RESET} ${COLOR_MAGENTA}|${CLR_RESET} ${COLOR_CYAN}%-10s${CLR_RESET} ${COLOR_MAGENTA}|${CLR_RESET} %-42s ${COLOR_MAGENTA}|${CLR_RESET}\n" \
        "NO" "SERVER NAME" "IP ADDRESS" "USER" "LIVE STATUS (PING | CPU | RAM)"
    draw_border

    local count
    count=$(jq '. | length' "$DATA_FILE")

    if [ "$count" -eq 0 ]; then
        printf "${COLOR_MAGENTA}|${CLR_RESET} %-97s ${COLOR_MAGENTA}|${CLR_RESET}\n" "${COLOR_WARN}No servers found. Press [A] to add your first VPS.${CLR_RESET}"
        draw_border
        return
    fi

    for ((i=0; i<count; i++)); do
        local name ip user port
        name=$(jq -r ".[$i].name" "$DATA_FILE")
        ip=$(jq -r ".[$i].ip" "$DATA_FILE")
        user=$(jq -r ".[$i].user" "$DATA_FILE")
        port=$(jq -r ".[$i].port" "$DATA_FILE")

        local stats
        stats=$(get_server_stats "$ip" "$user" "$port")

        printf "${COLOR_MAGENTA}|${CLR_RESET} ${COLOR_PURPLE}%-3d${CLR_RESET} ${COLOR_MAGENTA}|${CLR_RESET} ${COLOR_SAKURA}%-20s${CLR_RESET} ${COLOR_MAGENTA}|${CLR_RESET} ${COLOR_MINT}%-15s${CLR_RESET} ${COLOR_MAGENTA}|${CLR_RESET} ${COLOR_CYAN}%-10s${CLR_RESET} ${COLOR_MAGENTA}|${CLR_RESET} %-42s ${COLOR_MAGENTA}|${CLR_RESET}\n" \
            $((i+1)) "$name" "$ip" "$user" "$stats"
    done
    draw_border
}

add_server() {
    echo -e "\n${COLOR_SAKURA}${CLR_BOLD}--- ADD NEW SSH SERVER ---${CLR_RESET}"
    read -rp " Server Label Name : " name
    read -rp " Host IP / Domain  : " ip
    read -rp " Username (def: root): " user
    user=${user:-root}
    read -rp " SSH Port (def: 22)  : " port
    port=${port:-22}

    if [ -z "$name" ] || [ -z "$ip" ]; then
        echo -e "${COLOR_OFFLINE}Server name and IP cannot be empty!${CLR_RESET}"
        sleep 1.5
        return
    fi

    local new_entry
    new_entry=$(jq -n --arg name "$name" --arg ip "$ip" --arg user "$user" --arg port "$port" \
        '{name: $name, ip: $ip, user: $user, port: $port}')

    jq ". += [$new_entry]" "$DATA_FILE" > "$DATA_FILE.tmp" && mv "$DATA_FILE.tmp" "$DATA_FILE"
    echo -e "${COLOR_ONLINE}✓ Server added successfully!${CLR_RESET}"
    sleep 1.2
}

delete_server() {
    echo -e "\n${COLOR_OFFLINE}${CLR_BOLD}--- DELETE SSH SERVER ---${CLR_RESET}"
    read -rp " Enter Server Number to Delete: " num
    local count
    count=$(jq '. | length' "$DATA_FILE")

    if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -ge 1 ] && [ "$num" -le "$count" ]; then
        local index=$((num-1))
        jq "del(.[$index])" "$DATA_FILE" > "$DATA_FILE.tmp" && mv "$DATA_FILE.tmp" "$DATA_FILE"
        echo -e "${COLOR_ONLINE}✓ Server #$num deleted successfully!${CLR_RESET}"
    else
        echo -e "${COLOR_OFFLINE}Invalid server index!${CLR_RESET}"
    fi
    sleep 1.2
}

connect_server() {
    local index=$1
    local ip user port
    ip=$(jq -r ".[$index].ip" "$DATA_FILE")
    user=$(jq -r ".[$index].user" "$DATA_FILE")
    port=$(jq -r ".[$index].port" "$DATA_FILE")

    echo -e "\n${COLOR_MINT}Connecting to ${COLOR_SAKURA}${user}@${ip}:${port}${CLR_RESET} ...\n"
    ssh -p "$port" "${user}@${ip}"
}

while true; do
    show_dashboard
    echo ""
    echo -e "${COLOR_PURPLE}${CLR_BOLD}COMMANDS:${CLR_RESET}"
    echo -e " [${COLOR_CYAN}1-99${CLR_RESET}] Connect to Server   [${COLOR_SAKURA}A${CLR_RESET}] Add Server   [${COLOR_OFFLINE}D${CLR_RESET}] Delete Server   [${COLOR_MINT}R${CLR_RESET}] Refresh Stats   [${COLOR_MAGENTA}Q${CLR_RESET}] Quit"
    echo ""
    read -rp "Select Option / Server Number: " opt

    case "$opt" in
        [aA])
            add_server
            ;;
        [dD])
            delete_server
            ;;
        [rR])
            continue
            ;;
        [qQ])
            draw_exit_banner
            exit 0
            ;;
        *)
            if [[ "$opt" =~ ^[0-9]+$ ]]; then
                count=$(jq '. | length' "$DATA_FILE")
                if [ "$opt" -ge 1 ] && [ "$opt" -le "$count" ]; then
                    connect_server $((opt-1))
                else
                    echo -e "${COLOR_OFFLINE}Server number not found!${CLR_RESET}"
                    sleep 1
                fi
            else
                echo -e "${COLOR_WARN}Invalid selection!${CLR_RESET}"
                sleep 1
            fi
            ;;
    esac
done
