%dw 2.0
output application/json
var prod = attributes.headers.prodEnvironments
---
if(sizeOf(prod) > 0)
	splitBy(prod, ",") map ((item, index) -> trim(item))
else []