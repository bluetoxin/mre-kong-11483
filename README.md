### Bug "ngx.run_worker_thread"
__Kong version__: 3.4.0 (latest)
__Steps to reproduce__:
1] Build and run docker containers
```
docker-compose down ;docker-compose up -d --build
```
2] Send a request
```
~# curl 127.0.0.1        
{
  "message":"An unexpected error occurred"
}%      
```
Error in logs:
```
2023/09/01 01:50:42 [error] 3388#0: *741 [kong] init.lua:363 [mre] /usr/local/share/lua/5.1/kong/plugins/mre/handler.lua:9: attempt to call field 'run_worker_thread' (a nil value), client: 172.24.0.1, server: kong, request: "GET / HTTP/1.1", host: "127.0.0.1"
172.24.0.1 - - [01/Sep/2023:01:50:42 +0000] "GET / HTTP/1.1" 500 46 "-" "curl/7.79.1"
```
### Bug "thread_pool"
__Kong version__: 3.4.0 (latest)
__Steps to reproduce__:
1] Remove latter comment character in build.Dockerfile
```
# RUN  sed -i 's/^\(\s*pid.*\)$/\1\nthread_pool test_thread_pool threads=2 max_queue=65536;/' /usr/local/share/lua/5.1/kong/templates/nginx.lua
```
2] Build and run docker containers
```
docker-compose down ;docker-compose up -d --build
```
Error in logs:
```
Error: could not prepare Kong prefix at /usr/local/kong: nginx configuration is invalid (exit code 1):
nginx: [emerg] unknown directive "thread_pool" in /usr/local/kong/nginx.conf:2
nginx: configuration file /usr/local/kong/nginx.conf test failed


  Run with --v (verbose) or --vv (debug) for more details
```
