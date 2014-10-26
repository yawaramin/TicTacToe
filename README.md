# TicTacToe/README.md

Copyright (c) 2014 Yawar Amin
GitHub, Reddit, Twitter: yawaramin

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Introduction

A console version of the game of tic-tac-toe (noughts and crosses).
Experimental, written in Haskell. Not working yet.

The motivation for this implementation is to explore the idea that a
position on the tic-tac-toe board can be represented as a monoid with
two positions `mappend`ed together producing a third position that is
the best next play.

## Running

Simplest way is to simply load in GHCi and run the `main` function. See
the `undefined` functions to get an idea of what's not working yet.

