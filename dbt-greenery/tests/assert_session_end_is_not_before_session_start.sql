select 
    *
from 
    {{ ref('fct_sessions') }}
where 
    session_end < session_start
/* checking if there are any instances where the session end is before the session start which wouldn't make sense logically and indicate some sort of data issue */