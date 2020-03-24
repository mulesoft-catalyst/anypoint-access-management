%dw 2.0
output application/json skipNullOn="everywhere"
---
payload map ((item, index) -> 
        {
            context_params: {
                envId: item.EnvironmentId,
                org: vars.orgId
            },
            role_id: item.RoleId
        }

)