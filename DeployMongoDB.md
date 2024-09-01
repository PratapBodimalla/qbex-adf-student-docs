# Deploying MongoDB Using Azure Container Instance

## 1. Access Docker Hub

1. Go to Docker Hub using the following URL:
   [Docker Hub](https://hub.docker.com/)

2. In the search bar, search for "mongodb".

3. Select the community edition image:
   - **Image Name:** `mongodb/mongodb-community-server`

## 2. Deploy MongoDB Image in Azure Container Instance

1. Log in to your Azure portal.

2. Navigate to **Container instances**.

3. Click on **Create** to set up a new container instance.

4. In the **Basics** tab:
   - **Subscription:** Choose your Azure subscription.
   - **Resource Group:** Select an existing resource group or create a new one.
   - **Container name:** Enter a unique name for your MongoDB container.
   - **Region:** Select the Azure region where you want to deploy the container.

5. In the **Image Source** field:
   - **Image Type:** Select **Docker Hub**.
   - **Image:** Enter `mongodb/mongodb-community-server`.
   - **Tag:** Leave empty or specify a tag if needed (e.g., `latest`).

6. Under the **Size** tab:
   - Choose the required CPU and memory configuration for your MongoDB instance.

7. In the **Networking** tab:
   - **Port Expose:** Open port **27017** to allow access to MongoDB.

8. Review and create the container instance.

## 3. Access MongoDB Using MongoDB Compass

1. After the container is deployed, find the IP address of your Azure container instance in the Azure portal.

2. Open MongoDB Compass on your local machine.

3. Use the following connection string to connect to your MongoDB instance:

   ```plaintext
   mongodb://<ip_address>:27017/
