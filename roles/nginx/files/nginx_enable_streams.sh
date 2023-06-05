#!/bin/bash

export NGINX_ROOT_DIR=$1

grep -qxF 'stream {' $NGINX_ROOT_DIR/nginx.conf || log -s "Enabling nginx streams at $NGINX_ROOT_DIR"

grep -qxF 'stream {' $NGINX_ROOT_DIR/nginx.conf || printf '\nstream {\n\tinclude $NGINX_ROOT_DIR/conf.d/*.conf;\n\tinclude $NGINX_ROOT_DIR/sites-stream-enabled/*;\n}\n' | tee -a $NGINX_ROOT_DIR/nginx.conf