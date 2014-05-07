PHPBB_AUTH_FORUM_DATABASE_TABLE_PREFIX = 'phpbb_'
PHPBB_AUTH_COOKIE_NAME = "bombers"
PHPBB_AUTH_LOCAL_USER_MODEL_NAME = "User" #this is the name of the model that you will use to store information about users in your rails app
PHPBB_AUTH_REMOTE_REMOTE_IDENTIFIER = 'user_name' #I use email to identify somebody, you may want to use the username instead
PHPBB_AUTH_REMOTE_LOCAL_IDENTIFIER = 'name' #this is the name of a field on your local user model that will be used to lookup the value of remote identifier.
#PHPBB_AUTH_COLUMNS_TO_DUPLICATE = {:user_website => :website} #specify any additional fields that you would like copying to your local user model 

