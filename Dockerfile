FROM node
RUN npm install -g dotenv
ENV NODE_PATH=/usr/local/lib/node_modules
RUN echo "const dotenv=require('dotenv'),fs=require('fs');fs.readFile('/workdir/.env','utf-8',(a,b)=>{if(a)throw a;const c=dotenv.parse(Buffer.from(b));Object.keys(c).forEach(a=>{console.log(\`\${a}=\${c[a]}\`)})});" > /export.js
CMD node /export.js
