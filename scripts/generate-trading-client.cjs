const fs = require('fs')
const path = require('path')
const OpenAPI = require('../node_modules/openapi-typescript-codegen/dist/index.js')

async function main() {
  const root = path.resolve(__dirname, '..', 'packages/api')
  const input = JSON.parse(fs.readFileSync(path.join(root, 'src/clients/trading/api.json'), 'utf8'))
  await OpenAPI.generate({
    input,
    output: path.join(root, 'src/clients/trading/__generated__'),
    httpClient: 'fetch',
    useOptions: true,
    exportServices: true,
    exportModels: true,
    exportCore: true,
    exportSchemas: false,
    indent: '4',
    postfixServices: 'Service',
  })
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
