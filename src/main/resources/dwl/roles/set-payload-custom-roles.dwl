%dw 2.0
output application/json
---
(vars.customRoles.matrix[0] - "Category" - "Permission") pluck $$