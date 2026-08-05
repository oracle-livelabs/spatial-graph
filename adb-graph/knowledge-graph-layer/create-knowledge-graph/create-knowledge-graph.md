# Create the Relational Knowledge Graph

## Introduction

Use an R2RML mapping to expose the relational store tables as RDF resources. The mapping gives each row a stable URI and models foreign-key relationships as links between resources.

Estimated Time: 30 Minutes

### Objectives

In this lab, you will:

- Review the URI and relationship design of the R2RML mapping.
- Create the `KNOWLEDGEGRAPH` RDF view model.
- Verify that the model can be queried as RDF.

## Task 1: Create an RDF graph over data lake tables

1. Run the following R2RML mapping exactly as supplied. It creates the `KNOWLEDGEGRAPH` RDF view model over the electronics-store tables.

    ```
    <copy>
    DECLARE
      r2rml CLOB;
    BEGIN
      r2rml :=
    '@base <http://www.example.oracle.com/> . ' ||
    '@prefix rr: <http://www.w3.org/ns/r2rml#> . ' ||
    '<#BRAND>
    	rr:logicalTable [ rr:tableName "\"BRAND\"" ];
    	rr:subjectMap [
    		rr:template "http://www.example.oracle.com/BRAND/BRAND_ID={\"BRAND_ID\"}";
    		rr:class <BRAND>;
    	];
    	rr:predicateObjectMap [
    		rr:predicate <BRAND_ID>;
    		rr:objectMap [
    			rr:column "\"BRAND_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <BRAND_NAME>;
    		rr:objectMap [
    			rr:column "\"BRAND_NAME\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <COUNTRY_CODE>;
    		rr:objectMap [
    			rr:column "\"COUNTRY_CODE\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <WEBSITE_URL>;
    		rr:objectMap [
    			rr:column "\"WEBSITE_URL\"";
    		];
    	] . ' ||
    '<#CATEGORY>
    	rr:logicalTable [ rr:tableName "\"CATEGORY\"" ];
    	rr:subjectMap [
    		rr:template "http://www.example.oracle.com/CATEGORY/CATEGORY_ID={\"CATEGORY_ID\"}";
    		rr:class <CATEGORY>;
    	];
    	rr:predicateObjectMap [
    		rr:predicate <CATEGORY_ID>;
    		rr:objectMap [
    			rr:column "\"CATEGORY_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <CATEGORY_NAME>;
    		rr:objectMap [
    			rr:column "\"CATEGORY_NAME\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <PARENT_CATEGORY_ID>;
    		rr:objectMap [
    			rr:column "\"PARENT_CATEGORY_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <CATEGORY#ref-PARENT_CATEGORY_ID>;
    		rr:objectMap [
    			rr:parentTriplesMap <#CATEGORY>;
    			rr:joinCondition [
    				rr:child "\"PARENT_CATEGORY_ID\"";
    				rr:parent "\"CATEGORY_ID\"";
    			]
    		]
    	] . ' ||
    '<#CUSTOMER>
    	rr:logicalTable [ rr:tableName "\"CUSTOMER\"" ];
    	rr:subjectMap [
    		rr:template "http://www.example.oracle.com/CUSTOMER/CUSTOMER_ID={\"CUSTOMER_ID\"}";
    		rr:class <CUSTOMER>;
    	];
    	rr:predicateObjectMap [
    		rr:predicate <CUSTOMER_ID>;
    		rr:objectMap [
    			rr:column "\"CUSTOMER_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <CUSTOMER_NAME>;
    		rr:objectMap [
    			rr:column "\"CUSTOMER_NAME\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <EMAIL_ADDRESS>;
    		rr:objectMap [
    			rr:column "\"EMAIL_ADDRESS\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <LOYALTY_TIER>;
    		rr:objectMap [
    			rr:column "\"LOYALTY_TIER\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <STATE_CODE>;
    		rr:objectMap [
    			rr:column "\"STATE_CODE\"";
    		];
    	] . ' ||
    '<#PRODUCT>
    	rr:logicalTable [ rr:tableName "\"PRODUCT\"" ];
    	rr:subjectMap [
    		rr:template "http://www.example.oracle.com/PRODUCT/PRODUCT_ID={\"PRODUCT_ID\"}";
    		rr:class <PRODUCT>;
    	];
    	rr:predicateObjectMap [
    		rr:predicate <PRODUCT_ID>;
    		rr:objectMap [
    			rr:column "\"PRODUCT_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <SKU>;
    		rr:objectMap [
    			rr:column "\"SKU\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <PRODUCT_NAME>;
    		rr:objectMap [
    			rr:column "\"PRODUCT_NAME\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <PRODUCT_TYPE>;
    		rr:objectMap [
    			rr:column "\"PRODUCT_TYPE\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <BRAND_ID>;
    		rr:objectMap [
    			rr:column "\"BRAND_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <CATEGORY_ID>;
    		rr:objectMap [
    			rr:column "\"CATEGORY_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <UNIT_PRICE>;
    		rr:objectMap [
    			rr:column "\"UNIT_PRICE\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <RELEASE_DATE>;
    		rr:objectMap [
    			rr:column "\"RELEASE_DATE\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <ACTIVE_FLAG>;
    		rr:objectMap [
    			rr:column "\"ACTIVE_FLAG\"";
    		];
    	] . ' ||
    '<#SALES_ORDER>
    	rr:logicalTable [ rr:tableName "\"SALES_ORDER\"" ];
    	rr:subjectMap [
    		rr:template "http://www.example.oracle.com/SALES_ORDER/ORDER_ID={\"ORDER_ID\"}";
    		rr:class <SALES_ORDER>;
    	];
    	rr:predicateObjectMap [
    		rr:predicate <ORDER_ID>;
    		rr:objectMap [
    			rr:column "\"ORDER_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <CUSTOMER_ID>;
    		rr:objectMap [
    			rr:column "\"CUSTOMER_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <ORDER_DATE>;
    		rr:objectMap [
    			rr:column "\"ORDER_DATE\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <ORDER_STATUS>;
    		rr:objectMap [
    			rr:column "\"ORDER_STATUS\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <SALES_CHANNEL>;
    		rr:objectMap [
    			rr:column "\"SALES_CHANNEL\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <SALES_ORDER#ref-CUSTOMER_ID>;
    		rr:objectMap [
    			rr:parentTriplesMap <#CUSTOMER>;
    			rr:joinCondition [
    				rr:child "\"CUSTOMER_ID\"";
    				rr:parent "\"CUSTOMER_ID\"";
    			]
    		]
    	] . ' ||
    '<#SALES_ORDER_ITEM>
    	rr:logicalTable [ rr:tableName "\"SALES_ORDER_ITEM\"" ];
    	rr:subjectMap [
    		rr:template "http://www.example.oracle.com/SALES_ORDER_ITEM/ORDER_ID={\"ORDER_ID\"};LINE_NUMBER={\"LINE_NUMBER\"}";
    		rr:class <SALES_ORDER_ITEM>;
    	];
    	rr:predicateObjectMap [
    		rr:predicate <ORDER_ID>;
    		rr:objectMap [
    			rr:column "\"ORDER_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <LINE_NUMBER>;
    		rr:objectMap [
    			rr:column "\"LINE_NUMBER\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <PRODUCT_ID>;
    		rr:objectMap [
    			rr:column "\"PRODUCT_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <QUANTITY>;
    		rr:objectMap [
    			rr:column "\"QUANTITY\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <UNIT_PRICE>;
    		rr:objectMap [
    			rr:column "\"UNIT_PRICE\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <SALES_ORDER_ITEM#ref-ORDER_ID>;
    		rr:objectMap [
    			rr:parentTriplesMap <#SALES_ORDER>;
    			rr:joinCondition [
    				rr:child "\"ORDER_ID\"";
    				rr:parent "\"ORDER_ID\"";
    			]
    		]
    	];
    	rr:predicateObjectMap [
    		rr:predicate <SALES_ORDER_ITEM#ref-PRODUCT_ID>;
    		rr:objectMap [
    			rr:parentTriplesMap <#PRODUCT>;
    			rr:joinCondition [
    				rr:child "\"PRODUCT_ID\"";
    				rr:parent "\"PRODUCT_ID\"";
    			]
    		]
    	] . ' ||
    '<#SalesOrderItem>
    	rr:logicalTable [ rr:tableName "\"SALES_ORDER_ITEM\"" ];
    	rr:subjectMap [
    		rr:template "http://www.example.oracle.com/SALES_ORDER/ORDER_ID={\"ORDER_ID\"}";
    		rr:sourceTriplesMap <#SALES_ORDER>;
    		rr:joinCondition [
    			rr:child "\"ORDER_ID\"";
    			rr:parent "\"ORDER_ID\"";
    		];
    	];
    	rr:predicateObjectMap [
    		rr:predicate <SALES_ORDER_ITEM>;
    		rr:objectMap [
    			rr:parentTriplesMap <#PRODUCT>;
    			rr:joinCondition [
    				rr:child "\"PRODUCT_ID\"";
    				rr:parent "\"PRODUCT_ID\"";
    			]
    		];
    		rr:graphMap [ rr:template "http://www.example.oracle.com/SALES_ORDER_ITEM/ORDER_ID={\"ORDER_ID\"};LINE_NUMBER={\"LINE_NUMBER\"}" ]
    	] . ';
    
      sem_apis.create_rdfview_model(
        model_name => 'KNOWLEDGEGRAPH',
        tables => NULL,
        prefix => 'http://www.example.oracle.com/',
        r2rml_string => r2rml,
        r2rml_string_fmt => 'TURTLE',
        network_owner => 'KGLAYER',
        network_name => 'RDF_NETWORK',
        options => 'CREATE_ANYWAY=T'
      );
    END;
    /
    </copy>
    ```

    The mapping publishes rows from `BRAND`, `CATEGORY`, `CUSTOMER`, `PRODUCT`, `SALES_ORDER`, and `SALES_ORDER_ITEM` as RDF resources and links related rows.

Continue to the next lab to query `KNOWLEDGEGRAPH`.

## Acknowledgements

* **Source** - User-provided Electronics Store knowledge-graph script. Built with permission from the author(s).
* **Last Updated By/Date** - Codex / August 2026



