<!-- DO NOT EDIT THIS FILE DIRECTLY - it is generated from source file src/MODEL.pks -->
<!-- markdownlint-disable MD003 MD012 MD024 MD033 -->

Oracle Data Model Utilities
===========================

## Package model

PL/SQL utilities to support data model activities like reporting, visualizations...

This project is in an early stage - use it at your own risk...

CHANGELOG

- 0.1.0 (2021-10-22): Initial minimal version

SIGNATURE

```sql
package model authid current_user is

c_name    constant varchar2 ( 30 byte ) := 'Oracle Data Model Utilities'        ;
c_version constant varchar2 ( 10 byte ) := '0.1.0'                              ;
c_url     constant varchar2 ( 34 byte ) := 'https://github.com/ogobrecht/model' ;
c_license constant varchar2 (  3 byte ) := 'MIT'                                ;
c_author  constant varchar2 ( 15 byte ) := 'Ottmar Gobrecht'                    ;
```

