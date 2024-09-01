# Hosting BackendService Flask Application in Azure VM

## 1. Set Up VM (Ubuntu Linux) in Azure Cloud

1. Create a new Virtual Machine (VM) in the Azure portal, selecting Ubuntu Linux as the operating system.

## 2. Using SSH, Login to Azure VM (Using VS Code)

1. Open Visual Studio Code.
2. Use the SSH extension to connect to your Azure VM.
3. Clone the repository by running:
    ```bash
    git clone https://github.com/PratapBodimalla/QbexStudentRegistrationApp.git
    ```

## 3. Navigate to the Backend Directory

1. Change the directory to the backend:
    ```bash
    cd backend
    ```

## 4. Check for Python Version

1. Verify the installed Python version:
    ```bash
    python3 --version
    ```

## 5. Create Virtual Environment

1. Create a virtual environment for the Flask application:
    ```bash
    python3 -m venv venv
    ```

## 6. Activate the Virtual Environment

1. Activate the virtual environment:

    **For Linux:**
    ```bash
    . /venv/bin/activate
    ```

    **For Windows:**
    ```bash
    cd venv/Scripts
    activate
    ```

## 7. Install Necessary Python Packages

1. Install the required Python packages using `pip`:

    **Option 1:** Install packages individually:
    ```bash
    pip install flask
    pip install flask_cors
    pip install pymongo
    ```

    **Option 2:** Install all dependencies from `requirements.txt`:
    ```bash
    pip install -r requirements.txt
    ```

## 8. Run the Flask Application

1. Run the application:
    ```bash
    python3 app.py
    ```

## 9. Enable Inbound Ports 8081 and 5001 in Azure Portal

1. In the Azure portal, go to your VM's settings.
2. Navigate to **Networking**.
3. Select the **Network Security Group** associated with your VM.
4. Add new inbound security rules to allow traffic on ports 8081 and 5001.

## 10. Set Up Nginx Web Server

1. Follow the instructions in the [Nginx Installation and Configuration Tutorial](https://ubuntu.com/tutorials/install-and-configure-nginx#5-activating-virtual-host-and-testing-results) to set up Nginx on your VM.

2. Use the following Nginx configuration setting:

    ```nginx
    server {
           listen 8081;
           listen [::]:8081;

           server_name qbextest01.com;

           location / {
                proxy_pass http://127.0.0.1:5001;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
            } 
    }
    ```

## 11. Set Up SSL Certificate

1. Follow the steps outlined in [Securing Nginx with Let's Encrypt](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04) to install and configure SSL certificates.

## 12. Additional Configuration

1. Allow OpenSSH through the firewall:

    ```bash
    sudo ufw allow 'OpenSSH'
    ```

2. Enable the firewall:

    ```bash
    sudo ufw enable
    ```

## Notes

- The Nginx configuration is set to listen on port 8081 and proxy requests to the Flask application running on port 5001.
- Ensure the domain `qbextest01.com` is correctly pointed to your Azure VM's IP address.
