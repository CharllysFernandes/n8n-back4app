FROM node:24-alpine

# Instala Python, ferramentas de compilação e setuptools para pacotes nativos
RUN apk add --no-cache python3 py3-setuptools make g++

# Força o npm a ignorar conflitos estritos de peer dependencies
RUN npm config set legacy-peer-deps true

# Instala a última versão do n8n globalmente
RUN npm install -g n8n@latest

# Garante que a porta e o host fiquem abertos para o proxy do Back4app
ENV PORT=5678
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
EXPOSE 5678

# Inicializa o n8n apontando diretamente para o binário global e limitando a memória
CMD ["node", "--max-old-space-size=1024", "/usr/local/bin/n8n", "start"]
