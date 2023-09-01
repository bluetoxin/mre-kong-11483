FROM kong:3.4.0-ubuntu

USER root

COPY kong-plugin /usr/local/share/lua/5.1/kong/plugins/mre
RUN  chown -R kong:kong /usr/local/share/lua/5.1/kong/plugins/mre
# Second Problem (regarding thread_pool)
RUN  sed -i 's/^\(\s*pid.*\)$/\1\nthread_pool test_thread_pool threads=2 max_queue=65536;/' /usr/local/share/lua/5.1/kong/templates/nginx.lua

