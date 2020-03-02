---
AWS Shell
---

# Shln

To install aws cli via shln

```bash
shln install github.com/dockcmd/aws-sh v0.0.2

# requires the following directories
mkdir -p $HOME/.aws
mkdir -p $HOME/.kube
```

# awsts and awsrole

## Setup

```bash
# assumes shln installed
shln ln awsts
shln ln awsrole

# access to root account
export aws_access_key_id=<access key>
export aws_secret_access_key=<secret>
export mfa_serial=arn:aws:iam::<account>:mfa/<login>

aws configure set default.region us-east-2
aws configure set default.source_profile sts
aws configure set profile.sts.mfa_serial $mfa_serial

aws configure set profile.sts.aws_access_key_id $aws_access_key_id
aws configure set profile.sts.aws_secret_access_key $aws_secret_access_key 

aws configure set profile.dev.role_arn arn:aws:iam::<organizationaccount>:role/OrganizationAccountAccessRole
```

## Usage

```bash
# Authenticate using an MFA code using sts profile
awsts <mfa>

# List any s3 buckets in root account.
aws s3 ls

# Set the role to dev profile for another account
awsrole dev

aws s3 ls

# Subsequent awsts will stay on dev profile
```