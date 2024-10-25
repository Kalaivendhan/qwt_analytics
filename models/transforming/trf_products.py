def prodavailable(x,y):
    return x-y

def model(dbt, session):
    dbt.config(materialized = "table", schema = "transforming")
    temp_df = dbt.ref("stg_products")

    df = temp_df.withColumn("productavailability", prodavailable(temp_df["unitsinstock"],temp_df["unitsonorder"]))

    return df
