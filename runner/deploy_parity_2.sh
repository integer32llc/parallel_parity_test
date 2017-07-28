#!/bin/bash
mini
source ./globals.sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

./docker_cmd.sh exec parity_parity_1 /parity/run_curl.sh stakeholder_setup
sleep 2

./docker_cmd.sh exec parity_parity_1 /parity/run_curl.sh non_stakeholder_setup
sleep 2

export DC_COMMAND="./production.sh"
$DIR/docker_compose_cmd.sh -f parity/docker-compose.yml up -d