# hypha-3-tier
1. **Clone the Repository**: Open your terminal and clone the repository to your local machine using the following command:
    
    ```bash
    git clone https://github.com/fredritchie/hypha-3-tier.git
    ```
    
2. **Open the Folder in VS Code**: Navigate to the cloned folder (`hypha-3-tier`) using the terminal and open it in Visual Studio Code:
    
    ```bash
    cd hypha-3-tier
    code .
    ```
    
3. **Modify Variables**: Inside the folder, locate the `variables.tf` and `backend.tf` files. These files contain the Terraform variables and backend configuration. Modify the variables in `variables.tf` as per your requirements. The `backend.tf` file specifies the backend configuration, such as the S3 bucket to store Terraform state. Adjust it if needed.
4. **Initialize Terraform**: Move to the `terraform` folder within the repository using the terminal:
    
    ```bash
    cd Terraform
    ```
    
    Then, initialize Terraform to download the necessary providers and modules:
    
    ```bash
    terraform init
    ```
    
5. **Plan Terraform Deployment**: Run Terraform plan to preview the changes that will be applied:
    
    ```bash
    terraform plan
    ```
    
6. **Apply Terraform Configuration**: If the plan looks good, apply the Terraform configuration to create the infrastructure:
    
    ```bash
    terraform apply -auto-approve
    ```
    
7. **Update Static Content**: Change your current directory to the static content folder containing your HTML files and images.
8. **Update HTML File with ALB DNS**: Open the `index.html` file in Visual Studio Code and replace the placeholder with the DNS name of the Application Load Balancer (ALB) obtained from the Terraform output.
9. **Upload Files to S3 Bucket**: Using the AWS CLI, upload the `index.html`, `background.jpeg`, and `logo.jpeg` files to the S3 bucket created by Terraform:
    
    ```bash
    aws s3 cp . s3://bucket-name/ --recursive
    ```
    
    Replace `bucket-name` with the name of your S3 bucket.
    
10. **Access the Static Website**: Once the files are uploaded, you can access the static website by visiting the S3 bucket URL in a web browser. Clicking on the hyperlink in the `index.html` file should redirect you to the web application running on the EC2 instance behind the ALB.