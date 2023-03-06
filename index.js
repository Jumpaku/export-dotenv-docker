#!/usr/bin/env node
'use strict'

const cmd = require('commander')
const fs = require('fs');
const dotenv = require('dotenv')

cmd
    .usage(`[<dotenv-or-dir-including-dotnev>]`)
    .parse(process.argv)

const path = cmd.args[0] ?? '.';
let envPath;
try {
    envPath = fs.lstatSync(path).isFile() ? path : (path + '/.env');
} catch (e) {
    cmd.error(`Error: specified dotenv file is not found: ${path}`)
};
const data = fs.readFileSync(envPath, 'utf-8');
const env = dotenv.parse(Buffer.from(data));
Object.keys(env).forEach(v => console.log(`${v}=${env[v]}`));