#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

(
  cd packages/api
  bun ./scripts/generate-graphql-types.ts
)
node scripts/generate-trading-client.cjs
(
  cd packages/api
  bun ./scripts/modifyTradingApiTypes.mts
)
(
  cd apps/web
  bun run scripts/compile-ajv-validators.js
  SKIP_CONFIG_PULL=true \
    DISABLE_SOURCEMAP=true \
    DEPLOY_TARGET=vercel \
    NODE_OPTIONS='--max-old-space-size=8192' \
    node ../../node_modules/vite/bin/vite.js build --mode staging --config vite.config.mts
)
