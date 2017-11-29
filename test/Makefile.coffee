import dd from 'ddeyes'
import 'shelljs/make'
import fs from 'fs'
import path from 'path'
import CoffeeScript from 'coffeescript'
import es6ToEs5 from '../dist/bundle'

target.all = ->
  dd 'Hello Wolrd!!!'

target.compile = ->

  file = path.join __dirname, '../src/index.coffee'
  coffee = fs.readFileSync file
  , 'utf-8'
  es6 = CoffeeScript.compile coffee
  es5 = es6ToEs5 es6

  dd es5
