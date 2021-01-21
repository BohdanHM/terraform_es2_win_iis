<p align="center">
  <h1 align="center">Trainee task.</h1>
  <p align="center">
  <h3 align="center"> Two EC2 win2019 servers with IIS instances created by Terraform. PowerShell script for deployment code. </h3>
  </p>
</p>
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#tech-stack">Tech stack</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#requirement">Requirement</a></li>
        <li><a href="#deployment-to-aws>Deployment to AWS</a></li>
        <li><a href="#Deploying-your-new-site">Deploying your new site code to IIS in AWS EC2 win2019 server</a></li>
      </ul>
    </li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

This project uses Terraform for creating infrastructure such as VPC, Subnet, LoadBalancer and EC2 instances (win 2019 server with IIS) in AWS. Traffic is routed between two ES2 instances.
Environment:
  * []()Terraform v0.14.4
  * []()AWS
  * []()OS: Windows Server 2019
  * []()OS: IIS 10
  <br />
PowerShell script for deployment your a new site IIS version servers is in Folder **deploy**.


### Tech stack

* []()Terraform
* []()AWS
* []()Windows Server
* []()IIS
* []()PowerShell



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Requirements

Terraform at least 0.12.29 version, an AWS account
* how to install terraform
  ```sh
  <a href="https://www.terraform.io/docs/cloud/run/install-software.html">https://www.terraform.io/docs/cloud/run/install-software.html</a>
  ```
* how to create AWS account
  ```sh
  <a href="https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/">https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/</a>
  ```

### Deployment to AWS

1. Clone the repo to your computer
   ```sh
   git clone <a href="https://github.com/BohdanHM/terraform_es2_win_iis.git">https://github.com/BohdanHM/terraform_es2_win_iis.git</a>
   ```
2. Setup the variables in
   ```sh
   terraform_aws/variables.tf
   ```
3. Create the key pair for your instances (if you want to have RDP access )
   ```sh
   ssh-keygen -t rsa -m PEM -b 2048
   ```
4. To export your credential (secure way) run the following commands
   ```sh
   export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
   export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"
   ```
5. Run terraform
   ```sh
   terraform apply
   ```


### Deploying your new site code to IIS in AWS EC2 win2019 server

1. Copy IP addresses your AWS windows instances from Terraform output and past them in file
   ```sh
   deploy/deploy.ps1
   ```
2. Enter your instances access and change folder name in **deploy/deploy.ps1** to the one you want to deploy
3. Run the  **deploy.ps1** script
