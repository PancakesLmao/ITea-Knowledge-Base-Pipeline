# Cloudflare Infrastructure as Code Pipeline

Terraform workspace managing ITea Knowledge Base resources on Cloudflare with remote state stored on Cloudflare R2.

## Repository Structure

```text
itea-kb-pipeline/
├── .github/
│   └── workflows/                # CI/CD pipelines (Plan, Approval gate, Apply)
├── bootstrap/                    # One-time bootstrap for remote state backend
│   ├── terraform.tf              # Version constraints (Cloudflare v5)
│   ├── providers.tf              # Cloudflare provider setup
│   ├── variables.tf              # Account ID, bucket name variables
│   ├── locals.tf                 # Common tags and locals
│   ├── main.tf                   # cloudflare_r2_bucket resource
│   ├── outputs.tf                # Bucket name, endpoint, backend config snippets
│   └── terraform.tfvars.example  # Bootstrap variable inputs
├── modules/                      # Reusable Terraform modules
│   └── README.md                 # Module design and usage guidelines
├── terraform.tf                  # Root version constraints & S3/R2 backend
├── providers.tf                  # Cloudflare provider configuration
├── variables.tf                  # Root input variable definitions
├── locals.tf                     # Root local value definitions
├── main.tf                       # Primary Cloudflare infrastructure resources
├── outputs.tf                    # Root output definitions
├── terraform.tfvars.example      # Root variable inputs
└── README.md                     # Operational runbook & documentation
```

---

## Authentication & Credentials

Terraform interacts with Cloudflare using two sets of credentials:

### 1. Cloudflare Resource API
- `CLOUDFLARE_API_TOKEN`: Scoped API token created in Cloudflare Dashboard with permissions for target resources (e.g. Zone, DNS, Workers, R2).

### 2. Cloudflare R2 State Backend (S3-Compatible)
Generated via **Cloudflare Dashboard > R2 Object Storage > Manage R2 API Tokens > Create API Token**:
- `AWS_ACCESS_KEY_ID`: R2 Access Key ID
- `AWS_SECRET_ACCESS_KEY`: R2 Secret Access Key
- `AWS_ENDPOINT_URL_S3` / Endpoint: `https://<CLOUDFLARE_ACCOUNT_ID>.r2.cloudflarestorage.com`

---

## Remote Backend Bootstrap (One-Time Setup)

Run `bootstrap/` locally to provision the R2 bucket for state storage:

```bash
# 1. Enter bootstrap directory
cd bootstrap

# 2. Copy and populate variable inputs
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your cloudflare_account_id and desired bucket name

# 3. Export Cloudflare API token
export CLOUDFLARE_API_TOKEN="<your-cloudflare-api-token>"

# 4. Initialize and apply bootstrap
terraform init
terraform plan -out=tfplan
terraform apply tfplan

# 5. Note the outputs
# Outputs provide the exact bucket name and S3 endpoint for the root workspace
```

---

## Root Workspace: Local Plan & Apply

### 1. Configure Environment Variables

```bash
export CLOUDFLARE_API_TOKEN="<your-cloudflare-api-token>"
export AWS_ACCESS_KEY_ID="<your-r2-access-key-id>"
export AWS_SECRET_ACCESS_KEY="<your-r2-secret-access-key>"
```

### 2. Initialize Backend

Initialize root workspace pointing to the R2 bucket:

```bash
terraform init \
  -backend-config="bucket=<R2_BUCKET_NAME>" \
  -backend-config="key=production/terraform.tfstate" \
  -backend-config="endpoint=https://<CLOUDFLARE_ACCOUNT_ID>.r2.cloudflarestorage.com"
```

> **Tip:** You can also define a `backend.conf` file (gitignored) and run:
> ```bash
> terraform init -backend-config=backend.conf
> ```

### 3. Local Plan & Apply

```bash
# Copy and populate root variables
cp terraform.tfvars.example terraform.tfvars

# Format code check
terraform fmt -check

# Validate configuration syntax and schema
terraform validate

# Generate speculative plan
terraform plan -out=tfplan

# Apply approved plan
terraform apply tfplan
```

---

## Backend Maintenance Commands

### Inspect Remote State
```bash
# List all resources tracked in R2 remote state
terraform state list

# Show detailed state of a specific resource
terraform state show <resource_address>

# Pull raw remote state to stdout / file (read-only)
terraform state pull > state-backup.json
```

### Force Reconfiguration / Backend Migration
```bash
# Reinitialize backend after changing backend config
terraform init -reconfigure

# Migrate state from local to remote (or between backends)
terraform init -migrate-state
```

### State Lock Management
If a CI/CD job or process crashes and leaves an orphaned state lock:
```bash
# Force unlock with lock ID shown in error output
terraform force-unlock <LOCK_ID>
```

---

## Git Pre-Commit / Pre-Push Hooks

Repository includes hooks in `.githooks/` to automatically run `terraform fmt -check` and `terraform validate` before commit and push:

```bash
# Enable repository hooks (one-time setup per clone)
git config core.hooksPath .githooks
```

