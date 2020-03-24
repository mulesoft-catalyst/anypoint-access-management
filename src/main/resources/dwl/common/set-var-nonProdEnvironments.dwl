%dw 2.0
output application/json
var nonProd = attributes.headers.nonProdEnvironments
---
if(sizeOf(nonProd) > 0)
	splitBy(nonProd, ",") map ((item, index) -> trim(item))
else []