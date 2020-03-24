%dw 2.0
output application/json
var prod = vars.prodEnvironments
var environments = payload.data
---
(environments filter ((item, index) -> contains(prod, item.name))) map ((item, index) -> item - "organizationId" - "isProduction" - "type" - "clientId")