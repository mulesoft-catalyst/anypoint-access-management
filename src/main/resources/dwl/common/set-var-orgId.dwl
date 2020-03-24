%dw 2.0
output application/java
---
(payload.memberOfOrganizations filter ($.name==vars.organizationName)).id[0]