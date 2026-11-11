FROM node:20-alpine

# Instala dependências do sistema necessárias para o n8n
RUN apk add --no-cache python3 make g++

# Instala o n8n globalmente a partir do npm oficial
RUN npm install -g n8n@latest

# Porta padrão do n8n
ENV PORT=5678
EXPOSE 5678

# Comando de inicialização otimizado para memória
CMD ["node", "--max-old-space-size=1024", "/usr/local/bin/n8n", "start"]
