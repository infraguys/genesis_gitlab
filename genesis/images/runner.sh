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

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [ -f "$SCRIPT_DIR/.env" ]; then source "$SCRIPT_DIR/.env"

REGISTRATION_TOKEN="PASTE_YOUR_TOKEN_HERE"
RUNNER_DESCRIPTION="sh-runner"
RUNNER_TAGS="shell,auto"
EXECUTOR="shell"

curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash
apt install gitlab-runner -y

#gitlab-runner register --non-interactive \
#  --url "$GITLAB_URL" \
#  --registration-token "$REGISTRATION_TOKEN" \
#  --description "$RUNNER_DESCRIPTION" \
#  --tag-list "$RUNNER_TAGS" \
#  --executor "$EXECUTOR"
#
#systemctl enable gitlab-runner
#systemctl restart gitlab-runner

