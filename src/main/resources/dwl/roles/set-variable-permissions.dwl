%dw 2.0
output application/json
var role = vars.currentRole
---
vars.customRoles.matrix filter (sizeOf($[role])>0) map ((item, index) -> {
                                Category: item.Category,
                                Permission: item.Permission,
                                Environment: item[role]
                            }
                    )