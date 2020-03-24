%dw 2.0
output application/json
---
{
    "name" : vars.currentRole,
    "description" : "Custom Role for " ++ vars.currentRole
}
