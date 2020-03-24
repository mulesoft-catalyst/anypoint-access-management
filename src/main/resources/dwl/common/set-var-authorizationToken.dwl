%dw 2.0
output application/java
---
"bearer " ++ payload.access_token default ''