# OpenAPI Support

The goal is to completely cover OpenAPI 3.x spec.

Currently, the following features are **not** supported:

- External References

Some discrepancies with the OpenAPI spec are by design:

- `allowReserved` keyword in parameters is ignored and all parameter values are percent-encoded
- `allowEmptyValue` keyword in parameters is ignored as it's not recommended to be used
