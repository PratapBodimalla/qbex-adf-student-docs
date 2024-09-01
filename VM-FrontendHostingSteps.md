# Hosting Frontend Application in Azure VM

## 1. Set Up VM (Ubuntu Linux) in Azure Cloud

1. Create a new Virtual Machine (VM) in the Azure portal, selecting Ubuntu Linux as the operating system.

## 2. Using SSH, Login to Azure VM (Using VS Code)

1. Open Visual Studio Code.
2. Use the SSH extension to connect to your Azure VM.
3. Run the following command to clone the repository:
    ```bash
    git clone https://github.com/PratapBodimalla/QbexStudentRegistrationApp.git
    ```

## 3. Enable Inbound Port 8081 in Azure Portal

1. In the Azure portal, go to your VM's settings.
2. Navigate to **Networking**.
3. Select the **Network Security Group** associated with your VM.
4. Add a new inbound security rule to allow traffic on port 8081.

## 4. Set Up Nginx Web Server to Host the Web App

1. Follow the instructions in the [Nginx Installation and Configuration Tutorial](https://ubuntu.com/tutorials/install-and-configure-nginx#5-activating-virtual-host-and-testing-results) to set up Nginx on your VM.

2. Use the following Nginx configuration setting:

    ```nginx
    server {
           listen 81;
           listen [::]:81;

           server_name qbextest01.com;

           root /home/ubuntu/frontend;
           index index.html;

           location / {
                try_files $uri $uri/ =404;
            }
    }
    ```

## 5. Set Up SSL Certificate

1. Follow the steps outlined in [Securing Nginx with Let's Encrypt](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04) to install and configure SSL certificates.

## 6. Additional Configuration

1. Allow OpenSSH through the firewall:

    ```bash
    sudo ufw allow 'OpenSSH'
    ```

2. Enable the firewall:

    ```bash
    sudo ufw enable
    ```

## Notes

- The Nginx configuration is set to listen on port 81 and serve content from `/home/ubuntu/frontend`.
- Ensure the domain `qbextest01.com` is correctly pointed to your Azure VM's IP address.
