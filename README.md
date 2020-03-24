# anypoint-access-management

This api can be used to create the environments and custom roles on anypoint platform in **JUST 2 clicks**. This api supports creation of environments and custom roles for the master organization and the business groups.

## How do I get started
- Create an  Anypoint Platform user (non SSO) who has the following permissions
    - Add/Create new Environments 
    - Add/Create new Roles and Permissions
- Define the environment names (non-prod & prod) that needs to be created.
- The "custom_roles.xlsx" spreadsheet (present under sr/main/resources/files) has the list of Roles and the Permissions that has to be created. The list of Roles/Permissions defined in the spreadsheet are Developer, Administrator, Operations, Business Analyst and Quality Analyst. Review the spreadsheet to see if any Role/Permission changes are required. If required, update the "custom_roles.xlsx" spreadsheet.
- As the environment creation and role creation is a one time activity, you can choose to run the app either from AnyPoint Stuido or deploy the app to your runtime (on premise or cloud hub).

This api has 2 functions/endpoints.

# Create Environments

Used to create non-prod & prod environments

## How do I call the api
```
curl -s -I -X POST 'http://localhost:8081/api/access-management/v1/environments' \
-H 'username: myusername' \
-H 'password: mypassword' \
-H 'organizationName: myOrganizationName' \
-H 'nonProdEnvironments: DEV, QA, UAT' \
-H 'prodEnvironments: PRD'
```

In the above sample request, we are trying to create 
- non-Prod environments DEV, QA, UAT
- Prod environment PRD

**Note:-**
- In order to create a single environment (either non-Prod/Prod), pass the environment name as simple value. 
- In order to create multiple environments (either non-Prod/Prod), pass the environment name as comma separated values.

`In order to create environments across various Business Groups, repeat the above steps by changing the organizationName in the HTTP header.`

## How does the response look like

```
HTTP/1.1 201 Created
Content-Type: application/java; charset=UTF-8
Content-Length: 0
Date: Tue, 10 Mar 2020 02:05:27 GMT
```

# Create Roles and Permissions

Used to create custom roles and permissions across non-Prod and Prod environments

## How do I call the api
```
curl -s -I -X POST 'http://localhost:8081/api/access-management/v1/roles' \
-H 'username: myusername' \
-H 'password: mypassword' \
-H 'organizationName: myOrganizationName' \
-H 'nonProdEnvironments: DEV, QA, UAT' \
-H 'prodEnvironments: PRD'
```

In the above sample request, we are trying to create the Roles and permission defined as per the "custom_roles.xlsx" spreadsheet (present under sr/main/resources/files) for the
- non-Prod environments DEV, QA, UAT
- Prod environment PRD

**Note:-**
- In order to create Roles and Permission for a single environment (either non-Prod/Prod), pass the environment name as simple value. 
- In order to create Roles and Permission for multiple environments (either non-Prod/Prod), pass the environment name as comma separated values.



Here's the convention used for the permissions matrix defined in the "custom_roles.xlsx" spreadsheet.

- X(all non Prod) - All non-Prod environments defined in the HTTP Headers
- X (Prod) - All Prod environments defined in the HTTP Headers
- X (all) - All non-Prod & Prod environments defined in the HTTP Headers 
- X - Permissions that are not specific to the environments 

`In order to create Roles and Permissions across various Business Groups, repeat the above steps by changing the organizationName in the HTTP header.`

## How does the response look like

```
HTTP/1.1 201 Created
Content-Type: application/java; charset=UTF-8
Content-Length: 0
Date: Tue, 10 Mar 2020 02:18:29 GMT
```
