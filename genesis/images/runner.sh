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

# To create an instance runner:
#     On the left sidebar, at the bottom, select Admin
#     Select CI/CD > Runners
#     Select Register an instance runner
#     Copy the registration token
#
# Register the runner with command:
#     sudo gitlab-runner register --non-interactive \
#       --url "http://gitlab.example.com" \
#       --token "copied registration token" \
#       --executor "shell"
#
# or use ineractive registration with command:
#     sudo gitlab-runner register
#
# https://docs.gitlab.com/runner/commands/#interactive-registration
