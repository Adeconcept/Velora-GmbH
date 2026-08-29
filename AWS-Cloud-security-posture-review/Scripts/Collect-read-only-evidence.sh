#!/usr/bin/env bash

# Enforce strict variable verification and capture pipe failures natively
set -u
set -o pipefail

# Establish baseline variables matching project schema parameters
VELORA_PROFILE="${1:-velora-audit}"
VELORA_REGION="${2:-eu-central-1}"
VELORA_PRIVATE_DIR="private-evidence"

# Enforce secure local file permissions (Read/Write restricted to owner only)
umask 077

# Ensure local-only private storage structures are active
mkdir -p \
  "$VELORA_PRIVATE_DIR/account" \
  "$VELORA_PRIVATE_DIR/iam" \
  "$VELORA_PRIVATE_DIR/s3" \
  "$VELORA_PRIVATE_DIR/cloudtrail"

# Define structured automation collector function
collect() {
  VELORA_OUTPUT="$1"
  shift

  # Execute API call with multi-region/profile parameters and catch runtime streams
  if "$@" --no-cli-pager > "$VELORA_OUTPUT" 2> "${VELORA_OUTPUT}.error"; then
    rm -f "${VELORA_OUTPUT}.error"
    echo "Collected: $VELORA_OUTPUT"
  else
    echo "Review error: ${VELORA_OUTPUT}.error"
  fi
}

# 1. Account Perimeter & Identity Context Probes
collect "$VELORA_PRIVATE_DIR/account/caller-identity.json" \
  aws sts get-caller-identity --profile "$VELORA_PROFILE" --region "$VELORA_REGION"

# 2. IAM Identity Tier and Credential Security Posture Probes
collect "$VELORA_PRIVATE_DIR/iam/account-summary.json" \
  aws iam get-account-summary --profile "$VELORA_PROFILE"

collect "$VELORA_PRIVATE_DIR/iam/password-policy.json" \
  aws iam get-account-password-policy --profile "$VELORA_PROFILE"

collect "$VELORA_PRIVATE_DIR/iam/users.json" \
  aws iam list-users --profile "$VELORA_PROFILE"

collect "$VELORA_PRIVATE_DIR/iam/groups.json" \
  aws iam list-groups --profile "$VELORA_PROFILE"

collect "$VELORA_PRIVATE_DIR/iam/roles.json" \
  aws iam list-roles --profile "$VELORA_PROFILE"

collect "$VELORA_PRIVATE_DIR/iam/local-attached-policies.json" \
  aws iam list-policies --scope Local --only-attached --profile "$VELORA_PROFILE"

collect "$VELORA_PRIVATE_DIR/iam/access-analyzers.json" \
  aws accessanalyzer list-analyzers --type ACCOUNT \
  --profile "$VELORA_PROFILE" --region "$VELORA_REGION"

# 3. S3 Storage Security Controls Probes
collect "$VELORA_PRIVATE_DIR/s3/buckets.json" \
  aws s3api list-buckets --profile "$VELORA_PROFILE"

# 4. CloudTrail Forensic Audit Log Tracking Probes
collect "$VELORA_PRIVATE_DIR/cloudtrail/recent-management-events.json" \
  aws cloudtrail lookup-events --max-results 50 \
  --profile "$VELORA_PROFILE" --region "$VELORA_REGION"

collect "$VELORA_PRIVATE_DIR/cloudtrail/trails.json" \
  aws cloudtrail describe-trails --include-shadow-trails \
  --profile "$VELORA_PROFILE" --region "$VELORA_REGION"

echo "Collection finished. Review every error and sanitize evidence manually."

