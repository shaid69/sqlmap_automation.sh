# Advanced SQLMap Automation Script

A **professional, user-friendly, and colorful Bash script** to automate SQL injection testing with SQLMap. This script is designed to streamline the process, provide advanced features, and ensure a professional experience for ethical hackers and cybersecurity enthusiasts.

---

## Features

- **Colorful UI** for better usability and enhanced readability.
- **GET and POST request support**.
- **Tamper script selection** to bypass WAF/Cloudflare.
- **Advanced options** including random user agents, delay, retries, and timeout configuration.
- **Database, table, and column-specific injection** for targeted testing.
- **Proxy and TOR support** for anonymity and flexibility.
- **Automatic log generation** for detailed activity tracking.

---

## Requirements

- **SQLMap**: Ensure that `sqlmap` is installed on your system.
  - Install SQLMap using:
    ```bash
    sudo apt install sqlmap
    ```
- **Bash**: This script is compatible with most Linux systems and macOS.

---

## Usage

1. Clone the repository or copy the script to your system:
    ```bash
    git clone https://github.com/shaid69/Advanced-SQLMap-Automation.git
    cd Advanced-SQLMap-Automation
    ```

2. Make the script executable:
    ```bash
    chmod +x sqlmap_automation.sh
    ```

3. Run the script:
    ```bash
    ./sqlmap_automation.sh
    ```

4. Follow the interactive prompts to configure and execute your SQLMap commands.

---

## Script Walkthrough

### **1. Request Type Selection**
Choose between a GET or POST request to target the vulnerable endpoint.

### **2. Advanced Features**
Enable advanced options to improve your testing:
- Use tamper scripts like `space2comment`, `charunicodeencode`, `between`, or `hexencode`.
- Add delays, retries, and other performance optimizations.

### **3. Target-Specific Injection**
Provide:
- Database name
- Table name
- Column names (optional)

### **4. Proxy & TOR Support**
Enable proxy or TOR for anonymity during the testing process.

### **5. Execution & Logging**
- Review the generated SQLMap command before execution.
- All activities are logged to a timestamped file for your reference.

---

## Sample Screenshot

![SQLMap Automation Script](https://your-image-link-here)

---

## Contribution

Contributions are welcome! Feel free to submit issues or pull requests to improve the script.

---

## Disclaimer

This script is intended for **educational and ethical purposes** only. Misuse of this script for unauthorized activities is strictly prohibited. Always obtain proper permissions before testing a website or application.

---

### Created By:
**Shaid Mahamud**  
- 📧 [Contact Email](shaidmahamud92@gamil.com)
- 🌐 [GitHub](https://github.com/shaid69)
- 
