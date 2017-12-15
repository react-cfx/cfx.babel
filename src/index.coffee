import {
  transformSync
  transformFromAst
} from '@babel/core'

export default (codeOrAst, ops) ->

  transform =
    if typeof codeOrAst is 'string'
    then transformSync
    else (ast, options) ->
      transformFromAst ast, ''
      , options

  es5 = transform codeOrAst
  , {
    (
      if ops?.preset?
      then (
        presets: [
          [
            '@babel/preset-env'
            targets:
              node: true
          ]
        ]
      )
      else {}
    )...
    ( do ->
      conf = plugins: []
      flag = false

      # runtime
      if ops?.runtime?
        flag = true
        conf.plugins.push [
          '@babel/plugin-transform-runtime'
        ]

      # regenerator
      if ops?.regenerator?
        flag = true
        conf.plugins.push [
          '@babel/plugin-transform-regenerator'
        ]

      # spread
      if ops?.spread?
        flag = true
        conf.plugins.push [
          '@babel/plugin-transform-spread'
        ]

      if flag is false
        return {}
      else
        return conf
    )...
  }

  es5.code
