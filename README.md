# Installing Apache HOP 2.11 on Windows

## Table of Contents

1. [Download Apache HOP 2.11](#1-download-apache-hop-211)
2. [Install Java JDK](#2-install-java-jdk)
3. [Extract Apache HOP 2.11](#3-extract-apache-hop-211)
4. [Configure Apache HOP 2.11](#4-configure-apache-hop-211)
5. [Optional: Add HOP to System PATH](#5-optional-add-hop-to-system-path)
6. [Run Apache HOP 2.11](#6-run-apache-hop-211)
7. [Clone Project from Azure DevOps](#7-clone-project-from-azure-devops)
---

### 1. Download Apache HOP 2.11

- Visit the official Apache HOP website: [Apache HOP Download](https://hop.apache.org/download).
- Choose the **Apache HOP 2.11** version and download the ZIP file for Windows.

### 2. Install Java JDK

Apache HOP requires Java JDK 11 or higher to run.

- Download the appropriate version of the Java Development Kit (JDK) 11 or above from the Oracle website: [Java SE Downloads](https://www.oracle.com/java/technologies/javase-downloads.html).
- Install the JDK following the installation wizard.
- Add the JDK to your system PATH:
  1. Open **Control Panel** → **System** → **Advanced system settings**.
  2. Go to the **Advanced** tab and click **Environment Variables**.
  3. Under **System variables**, find the **Path** variable, select it, and click **Edit**.
  4. Add the path to the `bin` folder of the JDK installation (e.g., `C:\Program Files\Java\jdk-11.x.x_x64\bin`).
  5. Verify the Java installation by opening Command Prompt and typing:

     ```bash
     java -version
     ```

### 3. Extract Apache HOP 2.11

- Extract the downloaded ZIP file to a folder of your choice, e.g., `C:\ApacheHop`.

### 4. Configure Apache HOP 2.11

- Navigate to the folder where you extracted Apache HOP, e.g., `C:\ApacheHop`.
- Locate the `hop-gui.bat` file.
- Double-click `hop-gui.bat` to start the **Apache HOP 2.11** graphical user interface (GUI).

### 5. Optional: Add HOP to System PATH

To run Apache HOP 2.11 from anywhere in your system, you can add the `C:\ApacheHop\bin` folder to your PATH environment variable:

1. Open **Control Panel** → **System** → **Advanced system settings**.
2. Go to the **Advanced** tab and click **Environment Variables**.
3. Under **System variables**, find the **Path** variable, select it, and click **Edit**.
4. Add the path to the HOP `bin` folder (e.g., `C:\ApacheHop\bin`).

### 6. Run Apache HOP 2.11

- The **Apache HOP 2.11** GUI will launch, and you can begin creating pipelines and workflows.

### 7. Clone Project from Azure DevOps

#### Prerequisites

- Ensure Git is installed on your system. If not, download and install it from [Git's official website](https://git-scm.com/).

#### Access Azure DevOps

1. Navigate to your Azure DevOps instance using the following URL:

   [Azure DevOps - Infeed700DWETL](http://icmdevops1:8080/tfs/DefaultCollection/Infeed700DWETL)

2. Generate a Personal Access Token (PAT):
   - Click on your profile icon located in the top-right corner of the Azure DevOps interface.
   - Select "Security" from the dropdown menu, taking you to the Personal Access Tokens page:

     [Azure DevOps - Personal Access Tokens](http://icmdevops1:8080/tfs/DefaultCollection/_usersSettings/tokens)

   - Click "New Token" and follow the prompts to generate a new token. **Save this token** and your username, as they will be needed later.

#### Clone the Project

1. On your PC, navigate to the directory where you want to store the project files. Copy the full path of this directory.
2. Open a command line interface (CLI) with administrative privileges (right-click on Command Prompt or Terminal and select "Run as Administrator").
3. Use the `git clone` command followed by the project URL to clone the repository to your local machine. It should look like this:

   ```bash
   git clone http://icmdevops1:8080/tfs/DefaultCollection/Infeed700DWETL/_git/Infeed700DWETL
