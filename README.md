[![Build Status](https://dev.azure.com/valentinrubio/Split/_apis/build/status/split2021.Split?branchName=master)](https://dev.azure.com/valentinrubio/Split/_build/latest?definitionId=1&branchName=master)

[![Codemagic build status](https://api.codemagic.io/apps/5dadc696813e33422e6d7dab/5dadc696813e33422e6d7daa/status_badge.svg)](https://codemagic.io/apps/5dadc696813e33422e6d7dab/5dadc696813e33422e6d7daa/latest_build)


# Split

**Description succincte du projet**

Split est une application mobile qui permet à un groupe de personnes de diviser une addition au restaurant.
Chaque personne est débitée d'une somme égale, ou modifiable selon les besoins, instantanément.
Une seule personne se charge de régler l'addition, aucune cagnotte, ni remboursement.

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

**Equipe**
Tiphaine LAURENT
Thibault LECOINTE
Alex SAUVADE
Nicolas DJUROVIC
Mathieu LACHENAIT
Valentin RUBIO
Hugo MARTIN

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

**Responsable EIP**
Faizal Nguyen

-- --

This project is managed by docker using docker-compose

\<stage\> are : development, preproduction or production
<br>
\<services\> are : db, api or none (for all)

How to:
- build: `docker-compose -f docker-compose.yml if docker-compose.<stage>.yml build <services>`
- start: `docker-compose -f docker-compose.yml if docker-compose.<stage>.yml start <services>`
- stop: `docker-compose -f docker-compose.yml if docker-compose.<stage>.yml stop <services>`
- create and start: `docker-compose -f docker-compose.yml if docker-compose.<stage>.yml up <services>`
- stop and delete: `docker-compose -f docker-compose.yml if docker-compose.<stage>.yml down <services>`
- restart: `docker-compose -f docker-compose.yml if docker-compose.<stage>.yml restart <services>`
