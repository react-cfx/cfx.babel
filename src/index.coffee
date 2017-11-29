import { transformSync } from '@babel/core'

export default (code) ->

  es5 = transformSync code
  ,
    presets: [
      [
        'env'
        targets:
          node: true
      ]
    ]
  ,
    plugins: [
      [
        '@babel/plugin-transform-runtime'
        {
          "moduleName": "@babel/runtime"
        }
      ]
    ]

  es5.code
