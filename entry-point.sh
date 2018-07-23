#!/usr/bin/env bash
set -e

rails db:migrate RAILS_ENV=development
#rails server -b 0.0.0.0 -p 3000
echo $@
exec "$@"
