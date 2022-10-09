create or replace package model_joel authid current_user is

/**

Oracle Data Model Utilities - APEX Extension
============================================

Helpers to support a generic Interactive Report to show the data any table.

**/

function get_table_query_apex (
    p_table_name             in varchar2,
    p_schema_name            in varchar2 default sys_context('USERENV', 'CURRENT_USER'),
    p_max_cols_number        in integer default 20,
    p_max_cols_varchar       in integer default 20,
    p_max_cols_clob          in integer default  5,
    p_max_cols_date          in integer default  5,
    p_max_cols_timestamp     in integer default  5,
    p_max_cols_timestamp_tz  in integer default  5,
    p_max_cols_timestamp_ltz in integer default  5 )
    return varchar2;
/**

Get the query for a given table.

This prepares also APEX session state for the conditional display of generic
columns.

EXAMPLE

```sql
select model_joel.get_table_query(p_table_name => 'CONSOLE_LOGS')
  from dual;
```

**/

procedure create_application_items (
    p_app_id                 in integer,
    p_max_cols_number        in integer default 20,
    p_max_cols_varchar       in integer default 20,
    p_max_cols_clob          in integer default  5,
    p_max_cols_date          in integer default  5,
    p_max_cols_timestamp     in integer default  5,
    p_max_cols_timestamp_tz  in integer default  5,
    p_max_cols_timestamp_ltz in integer default  5 );
/**

Create application items for the generic report to control which columns to
show and what the headers are.

This procedure needs an APEX session to work and the application needs to be
runtime modifiable. This cn be set under: Shared Components > Security
Attributes > Runtime API Usage > Check "Modify This Application".

EXAMPLE

```sql
-- in a script with defaults
exec apex_session.create_session(100, 1, 'MY_USER');
exec model_joel.create_application_items(100);

-- with custom settings
begin
    apex_session.create_session (
        p_app_id   => 100,
        p_page_id  => 1,
        p_username => 'MY_USER' );

    model_joel.create_application_items (
        p_app_id                 => 100,
        p_max_cols_number        =>  40,
        p_max_cols_varchar       =>  40,
        p_max_cols_clob          =>  10,
        p_max_cols_date          =>  10,
        p_max_cols_timestamp     =>  10,
        p_max_cols_timestamp_tz  =>  10,
        p_max_cols_timestamp_ltz =>  10 );
end;
{{/}}
```

**/

--------------------------------------------------------------------------------

end model_joel;
/