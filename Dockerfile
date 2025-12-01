FROM medplum/medplum-server:latest

WORKDIR /usr/src/medplum

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 8103

HEALTHCHECK --interval=30s --timeout=10s --retries=5 CMD \
  node -e "fetch('http://localhost:8103/healthcheck').then(r => r.json()).then(console.log).catch(() => { process.exit(1); })"

ENTRYPOINT ["/docker-entrypoint.sh"]
