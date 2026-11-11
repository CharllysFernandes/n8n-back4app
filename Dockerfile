FROM ghcr.io/n8nio/n8n:latest

# Porta padrão do n8n
ENV PORT=5678
EXPOSE 5678

# Inicialização otimizada para memória
CMD ["node", "--max-old-space-size=1024", "/usr/local/lib/node_modules/n8n/bin/n8n", "start"]
