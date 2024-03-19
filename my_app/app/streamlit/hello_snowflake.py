# Import python packages
import streamlit as st
from snowflake.snowpark.context import get_active_session

# Write directly to the app
st.title("Hello Snowflake - Streamlit Edition")
st.write(
   """The following data is from the accounts table in the application package.
      However, the Streamlit app queries this data from a view called
      code_schema.accounts_view.
   """
)

# Get the current credentials
session = get_active_session()

#  Create an example data frame
data_frame = session.sql("SELECT * FROM code_schema.accounts_view;")

# Execute the query and convert it into a Pandas data frame
queried_data = data_frame.to_pandas()

# Display the Pandas data frame as a Streamlit data frame.
st.dataframe(queried_data, use_container_width=True)