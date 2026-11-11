FROM docker.n8n.io/n8nio/n8n:latest

# Define a porta padrão exigida pelo Back4app
ENV PORT=5678
EXPOSE 5678

# Comando para iniciar o n8n otimizando o uso de memória do Node.js
CMD ["node", "--max-old-space-size=1024", "/usr/local/lib/node_modules/n8n/bin/n8n", "start"]
