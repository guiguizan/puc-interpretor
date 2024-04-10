Author: Gabriel Gomes Fachineli, Guilherme Zanchettin and Arthur Carvalho
Date: [09/04/2024]

# Interpreter Construction - Assessment Project RA1

This repository contains the codes as part of the RA1 assessment project for the "Interpreter Construction" course.

## Description

The aim of this project was to create lexical and syntactic analyzers for a calculator using the Antlr tool. The analyzers are capable of interpreting mathematical expressions as defined in the developed grammar.

## Repository Structure

- **lib**: Contains the JAR file with Antlr binaries.
- **bin**: Contains shell scripts used to work with Antlr, including `antlr4.bat`, `compile.bat`, and `grun.bat`.
- **sample**: Contains the developed grammar and test files for the calculator.

## Usage

To use the codes in this repository, follow the steps below:

1. Set up the necessary environment variables for Antlr.
2. For the creation of the java files, use `antlr4 Expr.g4` script.
3. Compile the generated files and necessary Java classes using the `compile Expr*.java` script.
4. Run tests using the command `grun Expr program -gui < expression_1.txt` or `grun Expr program -gui < expression_2.txt` or `grun Expr program -gui < expression_3.txt`.

## Course

This project was developed as part of the "Interpreter Construction" course, as the RA1 assessment project.