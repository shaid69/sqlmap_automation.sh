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
   
