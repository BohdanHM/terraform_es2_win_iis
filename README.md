<br />
<p align="center">
  <h1 align="center">Two ic2 win2019 server with IIS instances created by Terraform. Deploy from local PC by PowerShell script.</h1>

</p>


<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#deploying-your-infrastructure">Deploying your infrastructure to AWS</a></li>
        <li><a href="#Deploying-your-new-site">Deploying your new site code to IIS in AWS ac2 win2019 server</a></li>
      </ul>
    </li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This project explains how to use terraform for creating architecture such as VPC, Subnet, LoadBalancer and ac2 instances (win 2019 server with IIS) in AWS.  
Environment:
    • Terraform >= 0.12.29
    • AWS
    • OS: Windows Server 2019
    • Traffic should be routed between two instances.
In Folder **deploy** you have PowerShell script for deploy your new site to IIS servers


### Built With

* []()Terraform
* []()PowerShell
* []()aws
* []()PowerShell



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

In your local computer you must have Terraform at least 0.12.29 version also must have an aws account
* how to install terraform
  ```sh
  https://www.terraform.io/docs/cloud/run/install-software.html
  ```
* how to create aws account
  ```sh
  https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/
  ```

### Deploying your infrastructure to AWS

1. Clone the repo to your computer
   ```sh
   git clone
   ```
2. Correct the variables in
   ```sh
   terraform_aws/variables.tf
   ```
3. Create the key pair for your instances (if you want to have RDP access )
   ```sh
   ssh-keygen -t rsa -m PEM -b 2048
   ```
4. Enter your AWS credential
   ```sh
   export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
   export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"
   ```
5. Run terraform
   ```sh
   terraform apply
   ```


### Deploying your new site code to IIS in AWS ac2 win2019 server

1. Write IP addresses your AWS windows instances and correct your instances access in file
   ```sh
   deploy/deploy.ps1
   ```
2. Correct your folder name where the new site code is
   ```sh
   deploy/deploy.ps1
   ```
3. Run the script deploy.ps1
