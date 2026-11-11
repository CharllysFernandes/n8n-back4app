FROM node:20-alpine

# Instala Python 3, ferramentas de compilação e setuptools (para o distutils do node-gyp)
RUN apk add --no-cache python3 py3-setuptools make g++

# Instala o n8n globalmente
RUN npm install -g n8n@latest

# Porta padrão do n8n
ENV PORT=5678
EXPOSE 5678

# Comando otimizado para memória
CMD ["node", "--max-old-space-size=1024", "/usr/local/bin/n8n", "start"]
