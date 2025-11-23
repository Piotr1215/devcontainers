# Dapr Container Apps Dev Container

Development container configuration for Dapr on Azure Container Apps.

## Features

- Azure CLI (latest)
- Docker-in-Docker support
- VS Code extensions:
  - Azure Bicep
  - Dapr
  - Docker

## Performance Optimizations

- **Build caching**: Uses BuildKit inline cache for faster rebuilds
- **Registry cache**: Pulls from `ghcr.io/piotr1215/dapr-containerapps:main`
- **Named volumes**: Go package cache persisted across rebuilds

## Security Configuration

This dev container requires elevated privileges for Dapr development:

- `--cap-add=SYS_PTRACE`: Required for debugging containerized applications
- `--security-opt seccomp=unconfined`: Required for Docker-in-Docker functionality
- Docker socket mount: Allows container to manage host Docker daemon

### Risk Mitigation

- Only use in trusted development environments
- Do not use for untrusted code execution
- Regular security scanning of container images

## Usage

### VS Code

1. Install the "Dev Containers" extension
2. Open this repository in VS Code
3. Command Palette → "Dev Containers: Reopen in Container"

### CLI

```bash
# Install the Dev Container CLI
npm install -g @devcontainers/cli

# Build and start the container
devcontainer up --workspace-folder .

# Execute commands in the container
devcontainer exec --workspace-folder . <command>
```

## Prebuild

This container is automatically prebuilt on every push to the master branch via GitHub Actions. The prebuild:

- Reduces startup time from minutes to seconds
- Ensures consistent environment across team members
- Published to `ghcr.io/piotr1215/dapr-containerapps`
