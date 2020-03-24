%dw 2.0
output application/json
var nonProd = vars.nonProdEnvironments
var environments = payload.data
---
(environments filter ((item, index) -> contains(nonProd, item.name))) map ((item, index) -> item - "organizationId" - "isProduction" - "type" - "clientId")