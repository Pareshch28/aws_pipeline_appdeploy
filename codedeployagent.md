Certainly! Below is a shell script that automates the installation of the AWS CodeDeploy agent on an Amazon Linux EC2 instance:

```bash
#!/bin/bash

# Update packages
sudo yum update -y

# Install necessary packages
sudo yum install -y ruby wget

# Stop current CodeDeploy agent if running
CODEDEPLOY_BIN="/opt/codedeploy-agent/bin/codedeploy-agent"
sudo $CODEDEPLOY_BIN stop

# Uninstall existing CodeDeploy agent
sudo yum erase codedeploy-agent -y

# Download and install the latest CodeDeploy agent
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

# Check the status of the CodeDeploy agent
sudo systemctl status codedeploy-agent
```

### Explanation:

1. **Update Packages**: `sudo yum update -y`
   - Updates all installed packages on the system.

2. **Install Necessary Packages**: `sudo yum install -y ruby wget`
   - Installs Ruby and wget if they are not already installed.

3. **Stop CodeDeploy Agent**: `$CODEDEPLOY_BIN stop`
   - Stops the currently running CodeDeploy agent if it is running.

4. **Uninstall CodeDeploy Agent**: `sudo yum erase codedeploy-agent -y`
   - Removes any existing installation of the CodeDeploy agent.

5. **Download and Install the Latest CodeDeploy Agent**:
   - Change directory to `/home/ec2-user`.
   - Download the CodeDeploy agent installation script from AWS S3.
   - Make the downloaded script executable.
   - Run the installation script in automatic mode (`auto`) using `sudo`.

6. **Check Agent Status**: `sudo systemctl status codedeploy-agent`
   - Displays the status of the CodeDeploy agent service after installation.

### Notes:
- Ensure that the script is executed with appropriate permissions (e.g., `chmod +x script.sh` and then `./script.sh`) to allow it to run as a shell script.
- This script assumes that the instance has internet connectivity to download the CodeDeploy agent installation script from AWS S3.
- Adjust paths and commands as necessary based on your specific environment and requirements.
