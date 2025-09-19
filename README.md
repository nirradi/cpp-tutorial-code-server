# cpp-tutorial-code-serve

This repository contains Terraform configuration and a startup script to provision a **remote C++ development environment** with **code-server** on Google Cloud.  

With this setup, you can start coding in C++ in a browser-based VS Code environment, complete with Clang, LLDB, CMake, and preconfigured VS Code extensions.

---

## 🌐 Prerequisites: Google Cloud Setup

Before you begin, make sure you have:

1. A **Google Cloud account**: [https://console.cloud.google.com](https://console.cloud.google.com)  
2. A **GCP project** (e.g., `cpp-tutorial-code-serve`)  
3. **Billing enabled** on the project (free tier is sufficient)  
4. **Cloud SDK installed** on your local machine: [https://cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install)  
5. **Terraform installed**: [https://developer.hashicorp.com/terraform](https://developer.hashicorp.com/terraform)  
6. A **local SSH key** (`~/.ssh/id_rsa` or similar) for connecting to the VM  

Once these prerequisites are ready, you can provision the VM and start coding.

---

---

## ⚡ Getting Started

### 1. Clone the repository

```bash
git clone git@github.com:YOURUSERNAME/cpp-tutorial-code-serve.git
cd cpp-tutorial-code-serve
```

Initialize Terraform
```bash
terraform init
terraform apply
```

Terraform will create a VM and firewall rules.

Wait for the startup script to finish installing packages.

Connect via SSH
```bash
ssh -L 8080:localhost:8080 your-username@your-vm-ip
```
Add code-server authentication

code-server supports a password or token-based login.
You can set this in ~/.config/code-server/config.yaml:

```bash
auth: password
password: "some-strong-password"
```

Combined with SSH tunneling, that’s already double protection.

5. Access code-server

Open a browser and go to:

http://127.0.0.1:8080
Use the password defined in the startup script.



