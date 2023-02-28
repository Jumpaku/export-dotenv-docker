const fs = require('fs');
const path = process.argv[2] ?? '.';
const envPath = fs.lstatSync(path).isFile() ? path : (path + '/.env');
const data = fs.readFileSync(envPath, 'utf-8');
const env = require('dotenv').parse(Buffer.from(data));
Object.keys(env).forEach(v => console.log(`${v}=${env[v]}`));