def model(dbt, session):
    my_products_sql_df = dbt.source("qwt_src", "products")
    return my_products_sql_df