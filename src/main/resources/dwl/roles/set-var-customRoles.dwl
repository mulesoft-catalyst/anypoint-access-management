%dw 2.0
output application/json
---
readUrl("classpath://files/custom_roles.xlsx", "application/xlsx")