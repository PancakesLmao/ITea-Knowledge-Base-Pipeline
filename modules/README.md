# Reusable Modules

Directory for internal Terraform modules following HashiCorp design standards:

Each module follows standard structure:
```text
modules/<module-name>/
├── terraform.tf     # Required providers and versions
├── main.tf          # Primary resources
├── variables.tf     # Input variables with type and description
├── outputs.tf       # Outputs with description
└── README.md        # Module documentation
```
