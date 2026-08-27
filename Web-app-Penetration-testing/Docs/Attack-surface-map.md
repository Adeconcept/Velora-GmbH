# Application Attack Surface Map

This register documents the mapped entry points, processing paths, trust boundaries, and expected security controls identified across the authorized laboratory environments prior to executing active exploit vectors.

| Lab Alias | Visible Function | Endpoint | Input or State | Trust Boundary | Expected Security Control | Evidence Label |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **LAB-WEB-01** | Product category filter | `/filter` | `category` (parameter) | Browser to server to database layer | Server-side parameterized queries / input type validation mapping. | `Assumed before testing` |
| **LAB-WEB-02** | Product search engine | `/search` | `search` (parameter) | Browser to server to returned HTML output | Context-aware HTML output encoding prior to reflecting parameter data. | `Assumed before testing` |
| **LAB-WEB-03** | User administration dashboard | `/administrator-panel` | Authentication status & Role parameters | Anonymous remote user to privileged system functionality | Server-side deny-by-default access control and role validation filters. | `Assumed before testing` |
| **LAB-WEB-04** | Account authentication portal | `/login`, `/login2`, `/my-account` | Authentication workflow state machines | Password-authenticated state to MFA-complete security boundaries | State-locked validation checks forcing completion of multi-factor steps. | `Assumed before testing` |

*Note: The status value `Assumed before testing` will be updated to `Observed` within individual technical files once active manual traffic verification steps confirm the actual application routing behaviors.*
