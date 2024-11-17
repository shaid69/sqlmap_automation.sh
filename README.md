# Advanced SQLMap Automation Script

### **Description**
The **Advanced SQLMap Automation Script** is a highly customizable Bash script designed for automating SQL injection testing using SQLMap. It features a professional, colorful, and user-friendly interface, enabling users to generate and execute SQLMap commands for both basic and advanced scenarios. Whether you're a cybersecurity professional, ethical hacker, or a student, this script simplifies SQL injection testing while offering robust customization options.

---

### **Features**
- **GET and POST Request Support**:
  - Handles both GET-based URLs and POST request files seamlessly.
- **Advanced WAF/Cloudflare Bypass**:
  - Offers tamper script options (e.g., `space2comment`, `charunicodeencode`) to bypass protections.
- **Database-Specific Targeting**:
  - Accepts database, table, and column names for precise injection.
- **Proxy and TOR Support**:
  - Use proxies or TOR network for enhanced anonymity.
- **Dynamic SQLMap Command Generation**:
  - Builds commands based on user input and advanced configurations.
- **Logging**:
  - Automatically saves execution output to a log file for auditing.
- **Customizable Options**:
  - Supports delays, retries, timeout, and random user-agent for stealth testing.
- **Professional and Colorful UI**:
  - Engaging interface for better readability and user experience.

---

### **Requirements**
- **Dependencies**:
  - Bash Shell
  - SQLMap installed (`sudo apt install sqlmap`)
  - TOR installed (optional, for anonymity)
- **Operating System**:
  - Linux-based OS (Kali Linux, Parrot OS, etc.)

---

### **Usage Instructions**

1. Clone the repository:
   ```bash
   git clone https://github.com/shaid69/sqlmap-automation.git
   cd sqlmap-automation
   chmod +x sqlmap_automation.sh
   ./sqlmap_automation.sh

   
➤ Choose Request Type:
  1. GET Request
  2. POST Request
Enter your choice (1 or 2): 1
Enter the target URL: http://example.com/vulnerable.php?id=1
➤ Enable Advanced Features?
  1. Yes
  2. No (Basic mode)
Enter your choice (1 or 2): 1
➤ Select Tamper Scripts to Bypass WAF/Cloudflare:
  1. space2comment (Spaces to comments)
  2. charunicodeencode (Encode payload to Unicode)
  3. between (Use BETWEEN operator)
  4. hexencode (Encode strings to Hexadecimal)
  5. Use All Tamper Scripts
Enter your choice (1-5): 5
➤ Generated SQLMap Command:
sqlmap -u "http://example.com/vulnerable.php?id=1" --tamper=space2comment,charunicodeencode,between,hexencode --random-agent --delay=2 --timeout=10 --retries=5
Do you want to execute this command? (y/n): y
Executing the command...
   
