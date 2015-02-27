#!/usr/bin/env ruby

require './lib/runner'
require './lib/printer'

mastermind = Runner.new
Printer.greeting
mastermind.the_game
