%dw 2.0
output application/json

var nonProd = vars.nonProdEnvironments map ((item, index) -> {
                                        						name: item,
                                        						organizationId: vars.orgId,
                                        						"type": "sandbox"
                                    						 }
                        					)
                        					
var prod = vars.prodEnvironments map ((item, index) -> {
                                        					name: item,
                                        					organizationId: vars.orgId,
                                        					"type": "production"
                                    				   }
                        			 )
---
nonProd ++ prod