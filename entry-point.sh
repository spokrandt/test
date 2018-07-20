#!/usr/bin/env bash
set -e

rails db:migrate RAILS_ENV=development
exec "$@"
