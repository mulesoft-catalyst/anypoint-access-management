%dw 2.0
output application/json
---
readUrl("classpath://files/anypoint-platform-roleIds.json", "application/json")