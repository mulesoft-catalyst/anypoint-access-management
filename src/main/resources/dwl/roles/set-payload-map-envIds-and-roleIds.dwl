%dw 2.0
output application/json

var nonProdEnvDetails = vars.nonProdEnvDtls

var prodEnvDetails = vars.prodEnvDtls

var allEnvDetails = nonProdEnvDetails ++ prodEnvDetails

var platformRoleIds = vars.platformRoleIds

var permissions = vars.permissions
 
var allNonProd = flatten(
                            permissions filter($.Environment == "X(all non Prod)") map ( (item, index) -> 
                                nonProdEnvDetails map ((item1, index1) -> 
                                    (item - "Environment") ++ (Environment: item1.name) ++ (EnvironmentId: item1.id)
                                )
                            )
                        )  map ((item, index) -> 
                                item ++ RoleId: ( platformRoleIds filter ($.Category == item.Category and $.Permission == item.Permission) ).RoleId[0]
                               )

var prod = flatten(
                            permissions filter($.Environment == "X (Prod)") map ( (item, index) -> 
                                prodEnvDetails map ((item1, index1) -> 
                                    (item - "Environment") ++ (Environment: item1.name) ++ (EnvironmentId: item1.id)
                                	)
                            	)
                 			)  map ((item, index) -> 
                                item ++ RoleId: ( platformRoleIds filter ($.Category == item.Category and $.Permission == item.Permission) ).RoleId[0]
                        )
                        
var all = flatten(
                            permissions filter($.Environment == "X (all)") map ( (item, index) -> 
                                allEnvDetails map ((item1, index1) -> 
                                    (item - "Environment") ++ (Environment: item1.name) ++ (EnvironmentId: item1.id)
                                	)
                            	)
                 			)  map ((item, index) -> 
                                item ++ RoleId: ( platformRoleIds filter ($.Category == item.Category and $.Permission == item.Permission) ).RoleId[0]
                        )

var common = permissions filter($.Environment == "X") map ((item, index) -> 
                                item ++ RoleId: ( platformRoleIds filter ($.Category == item.Category and $.Permission == item.Permission) ).RoleId[0]
                            )
---
allNonProd ++ prod ++ all ++ common