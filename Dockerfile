FROM node:24-alpine

# Instala ferramentas de sistema e dependências de compilação necessárias para pacotes nativos
RUN apk add --no-cache python3 py3-setuptools make g++

# Força o npm a ignorar conflitos estritos de peer dependencies durante a instalação
RUN npm config set legacy-peer-deps true

# Instala a última versão do n8n globalmente
RUN npm install -g n8n@latest

# Porta padrão exigida pelo Back4app
ENV PORT=5678
EXPOSE 5678

# Inicialização otimizada para o n8n
CMD ["node", "--max-old-space-size=1024", "/usr/local/bin/n8n", "start"]
