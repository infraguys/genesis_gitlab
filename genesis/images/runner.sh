#!/usr/bin/env bash

# Copyright 2025 Genesis Corporation
#
# All Rights Reserved.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

set -eu
set -x
set -o pipefail

[[ "$EUID" == 0 ]] || exec sudo -s "$0" "$@"

curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash
apt install gitlab-runner -y

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Steps to create an instance runner:
# 1. In the left sidebar (bottom), go to Admin
# 2. Navigate to CI/CD > Runners
# 3. Click Register an instance runner
# 4. Add tags to specify which jobs the runner can execute
# 5. Copy the registration token

# To register a DOCKER runner (non-interactive):
# sudo gitlab-runner register --non-interactive \
#   --url "http://gitlab.example.com" \
#   --token "your-copied-registration-token" \
#   --executor "docker" \
#   --docker-image ubuntu:24.04

# To register a SHELL runner (non-interactive):
# sudo gitlab-runner register --non-interactive \
#   --url "http://gitlab.example.com" \
#   --token "your-copied-registration-token" \
#   --executor "shell"

# Alternatively, for interactive registration, use:
# sudo gitlab-runner register

# https://docs.gitlab.com/runner/commands/#interactive-registration
