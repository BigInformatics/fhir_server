
FROM medplum/medplum-server:latest

# Only static ENV here if needed
ENV NEXT_TELEMETRY_DISABLED=1

WORKDIR /usr/src/medplum

EXPOSE 8103

# HEALTHCHECK --interval=30s --timeout=10s --retries=5 CMD \
#   node -e "fetch('http://localhost:8103/healthcheck').then(r => r.json()).then(console.log).catch(() => { process.exit(1); })"

# ENTRYPOINT ["node","--require","./packages/server/dist/otel/instrumentation.js","packages/server/dist/index.js","env"]
