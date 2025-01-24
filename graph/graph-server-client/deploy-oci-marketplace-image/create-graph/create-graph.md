# Create the Graph

## Introduction

Now, the tables are created and populated with data. Let's create a graph representation of them.

Estimated time: 5 minutes

### Objectives

Learn how to create a graph representation of your existing tables by:

- Using a Python client to connect to the Graph Server
- Using PGQL to create and query a graph

### Prerequisites

- This lab assumes you have successfully completed the lab - Create and populate tables.

## Task 1: Start the Python client

Connect to the compute instance via SSH as **opc** user, using the private key you created earlier.

```sh
<copy>
ssh -i <private_key> opc@<public_ip_for_compute>
</copy>
```

Example:

```sh
<copy>
ssh -i key.pem opc@203.0.113.14
</copy>
```

Start the Python client (OPG4PY shell) on the Graph Server compute instance to connect to the Graph Server.

```sh
<copy>
opg4py -b https://<localhost>:7007 -u customer_360
</copy>
```

You should see the following if the client shell starts up successfully.

```sh
<copy>
password:

Oracle Graph Server Shell 24.2.0
>>>
</copy>
```

## Task 2: Create a graph

Set up the Create Property Graph statement, which creates a graph from the existing tables.

```python
<copy>
statement = '''
CREATE PROPERTY GRAPH "customer_360"
  VERTEX TABLES (
    customer
  , account
  , merchant
  )
  EDGE TABLES (
    account
      SOURCE KEY(id) REFERENCES account (id)
      DESTINATION KEY(customer_id) REFERENCES customer (id)
      LABEL owned_by PROPERTIES (id)
  , parent_of
      SOURCE KEY(customer_id_parent) REFERENCES customer (id)
      DESTINATION KEY(customer_id_child) REFERENCES customer (id)
  , purchased
      SOURCE KEY(account_id) REFERENCES account (id)
      DESTINATION KEY(merchant_id) REFERENCES merchant (id)
  , transfer
      SOURCE KEY(account_id_from) REFERENCES account (id)
      DESTINATION KEY(account_id_to) REFERENCES account (id)
  )
'''
</copy>
```

For more about DDL syntax, please see [pgql-lang.org](https://pgql-lang.org/spec/1.4/#create-property-graph). Please note that *all columns of the input tables are mapped to the properties of vertices/edges [by default](https://pgql-lang.org/spec/1.4/#properties)*. For **owned_by** edge, only **id** property is given with **PROPERTIES** keyword for edge ID generation purpose, and the other properties are not given, because they are already hold by the account vertices.

Now execute the PGQL DDL to create the graph.

```python
>>> <copy>session.prepare_pgql(statement).execute()</copy>
False
```

Please note, that the response *False* is the expected result.

## Task 3: Check the newly created graph

Check that the graph was created. Copy, paste, and run the following statements in the Python shell.

```python
>>> <copy>graph = session.get_graph("customer_360")</copy>
```

Check that the graph was created.

```python
>>> <copy>graph</copy>
PgxGraph(name: customer_360, v: 15, e: 24, directed: True, memory(Mb): 0)
```

## Task 4: Query the graph

You can use PGQL now to query the graph Let´s start with a list of all vertex labels:

```python
<copy>
graph.query_pgql("""
  SELECT DISTINCT LABEL(v) FROM MATCH (v)
""").print()
</copy>

+----------+
| LABEL(v) |
+----------+
| ACCOUNT  |
| CUSTOMER |
| MERCHANT |
+----------+
```

Find out next how many vertices each label has:

```python
<copy>
graph.query_pgql("""
  SELECT LABEL(v), COUNT(v) FROM MATCH (v) GROUP BY LABEL(v)
""").print()
</copy>

+---------------------+
| LABEL(v) | COUNT(v) |
+---------------------+
| MERCHANT | 5        |
| ACCOUNT  | 6        |
| CUSTOMER | 4        |
+---------------------+
```

Select all edge labels:

```python
<copy>
graph.query_pgql("""
  SELECT DISTINCT LABEL(e) FROM MATCH ()-[e]->()
""").print()
</copy>

+-----------+
| LABEL(e)  |
+-----------+
| OWNED_BY  |
| PARENT_OF |
| PURCHASED |
| TRANSFER  |
+-----------+
```

Find out next how many edges each label has:

```python
<copy>
graph.query_pgql("""
  SELECT LABEL(e), COUNT(e) FROM MATCH ()-[e]->() GROUP BY LABEL(e)
""").print()
</copy>

+----------------------+
| LABEL(e)  | COUNT(e) |
+----------------------+
| OWNED_BY  | 4        |
| TRANSFER  | 8        |
| PARENT_OF | 1        |
| PURCHASED | 11       |
+----------------------+
```

## Task 5: Publish the graph

The newly created graph is "private" by default, and is accessible only from the current session. To access the graph from other sessions, you can "publish" the graph.

Use the following command to publish it.

If you're no longer in the session, create the graph again following the procedure above. If you are still in the same session, you do not need to repeat Task 3. Publish the graph.
```python
<copy>
graph.publish()
</copy>
```

Next time you connect you can access the graph kept in memory without re-loading it, if the graph server has not been shutdown or restarted between logins.
```python
<copy>
graph = session.get_graph("customer_360")
</copy>
```

Please note that you are allowed to publish graphs because **`PGX_SESSION_ADD_PUBLISHED_GRAPH`** role has been granted when the user is created. Otherwise, it has to be granted by **ADMIN** user and you must re-connect with the Python shell to pick up the updated permissions.

You may now proceed to the next lab.

## Acknowledgements

- **Author** - Jayant Sharma
- **Contributors** - Arabella Yao, Jenny Tsai, Ryota Yamanaka, Karin Patenge
- **Last Updated By/Date** - Denise Myrick, July 2024
