#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

TEST_USER_HOME=/home/vscode

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "direnv is installed" direnv --version

check "direnv hook is installed for zsh" grep -q 'eval "$(direnv hook zsh)"' $TEST_USER_HOME/.zshrc

check "direnv hook is installed for bash" grep -q 'eval "$(direnv hook bash)"' $TEST_USER_HOME/.bashrc

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults