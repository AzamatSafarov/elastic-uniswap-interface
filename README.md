# Elastic Uniswap Interface

Elastic Uniswap Interface is a public fork of the official Uniswap web interface.

- Upstream: `Uniswap/interface`
- License: GPL-3.0
- Primary app: `apps/web`
- Runtime used for verification: Bun 1.3.14+, Node 22.22.2

## Public fork build

The upstream public repository references internal Uniswap monorepo workspaces that are not present in the public checkout, including `tools/uniswap-nx`. For this fork, the missing public workspace references were removed from the root TypeScript project references.

Verified local build command:

```bash
bun install
./scripts/build-web-public.sh
```

Build output: `apps/web/build`.

## Backend pairing

This frontend is paired with the forked Uniswap routing backend:

- `AzamatSafarov/elastic-uniswap-routing-api`

The routing API is the backend layer for quote/routing logic. Transaction execution still depends on supported deployed Uniswap contracts and chain configuration.
