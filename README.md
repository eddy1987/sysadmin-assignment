# Vio.com System Administrator assignment/Resolution

This repository contains the LDAP structure setup for Vio.com, designed to streamline user, system, and group management within the organization. Below is an overview of the Directory Information Tree (DIT), the organizational units (OUs), and their purpose within this LDAP server.

## Directory Information Tree (DIT) Overview

This LDAP structure is organized into three main Organizational Units (OUs): People, Systems, and Groups. Here's a brief outline and the rationale behind each OU
### People OU
* **Path**: ou=People,dc=viodotcom,dc=com
* **Description**: This OU contains all individuals within the organization. It's further subdivided into an Engineering department sub-OU, which then branches into Foo, Platform, and Bar teams. This structure allows us to organize users based on their team affiliations.
* **Sub-OUs**:
 * ou=Engineering,ou=People,dc=viodotcom,dc=com
 * ou=Foo,ou=Engineering,ou=People,dc=viodotcom,dc=com
 * ou=Platform,ou=Engineering,ou=People,dc=viodotcom,dc=com
 * ou=Bar,ou=Engineering,ou=People,dc=viodotcom,dc=com
 * 
### Systems OU
* **Path**: ou=Systems,dc=viodotcom,dc=com
* **Description**: This OU categorizes systems into Sensitive and Non-Sensitive sub-OUs. This separation aids in applying different security measures based on the sensitivity of the systems.
* **Sub-OUs**:
 * ou=Sensitive,ou=Systems,dc=viodotcom,dc=com
 * oou=NonSensitive,ou=Systems,dc=viodotcom,dc=com

### Groups OU
* **Path**: ou=Groups,dc=viodotcom,dc=com
* **Description**: Contains groups for managing roles (and further more access) within the organization. Given the limitations of dynamic groups in the current version of OpenLDAP and to avoid the complexity of modifying the LDAP schema with custom attributes, members of groups under this OU are manually added these groups: TL, EM, PM, and IC.

## Access Control and Management
System-level access is managed externally through system ACLs or IAM of that particular/forgion system and/or via external documentation, avoiding unnecessary complexity within the LDAP structure. For example if EM needs to have Admin access on AWS and R/W access on Datadog it would add complexity layer to this DIT structure such as having system-specific-access level of access like (aws-admin, aws-RW, aws-RO, datadog-admin, datadog-RW, and datadog RO) or more generic level of access such (Admin, RW, and RO). Since that system-level permissions are assessed based on roles/functions, already reflected through membership in the groups within our LDAP structure, an assumption that the requirement are met is implied.

## Implementation Notes
* This LDAP setup is intended for internal use within Vio.com's IT infrastructure.
* Modifications and updates to the LDAP structure should be managed by the system administration team, with changes documented and reviewed according to our change management policies.

## Conclusion
This LDAP structure provides a streamlined and organized approach to managing users, systems, and access within Vio.com. By maintaining a clear and simplified DIT, we aim to enhance both operational efficiency and security.

```mermaid
flowchart TD
    MS0["viodotcom-master\n(root account)"]
    DP0["viodotcom-foo\n(account)"]
    DP1["viodotcom-bar\n(account)"]

    MS0 --> DP0
    MS0 --> DP1
```
