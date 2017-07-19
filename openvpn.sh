#!/bin/sh

set -e -u -o pipefail


if [ -n "${USERNAME:-""}" -a -n "${PASSWORD:-""}" ]; then
  echo "$USERNAME" > auth.conf
  echo "$PASSWORD" >> auth.conf
  chmod 600 auth.conf
  set -- '--auth-user-pass' 'auth.conf' "$@"
fi

if [ -n "$REGION" ]; then
  set -- '--config' "${REGION}.ovpn" "$@"
fi

exec openvpn "$@"
