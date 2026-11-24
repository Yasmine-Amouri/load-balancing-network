FROM nginx:1.27.3

RUN apt-get update \
 && apt-get install -y --no-install-recommends iperf3 iproute2 curl \
 && rm -rf /var/lib/apt/lists/* \
 && head -c 10M /dev/urandom > /usr/share/nginx/html/big.bin

RUN sed -i '1i load_module modules/ngx_http_js_module.so;' /etc/nginx/nginx.conf

COPY njs/slow.js /etc/nginx/njs/slow.js
COPY default.conf.template /etc/nginx/templates/default.conf.template
COPY 40-iperf3.sh /docker-entrypoint.d/40-iperf3.sh
RUN chmod +x /docker-entrypoint.d/40-iperf3.sh