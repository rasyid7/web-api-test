# web-api-test
## Prerequisite
1. node with NVM
2. python with pip
3. virtualenv or equals
4. chromedriver in path

## Setup
1. clone repo and cd to folder
2. create virtualenv `virtualenv venv` or your environtment setup
3. install the requirements with `pip -r install requirements.txt`

## Run Web Test
Make sure the chromedriver is in path <br>
on the folder, run `robot Web/Tests/SearchWeb.robot`

#### Note
I want to add other test cases such as:
1. One char search test e.g "a"
2. Wrong Char e.g "*" test
3. Max char test
4. Empty char test
But no corresponding results expected

## Run API Test
on the folder, run `robot API/Tests/SearchAPI.robot`
