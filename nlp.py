import re
text = """<gfg> 
#GFG Geeks Learning together 
url <https://www.geeksforgeeks.org/>, 
email <acs@sdf.dv>
"""
def clean_text(text):
    # remove HTML TAG
    html = re.compile('[<,#*?>]')
    text = html.sub(r'',text)
    # Remove urls:
    url = re.compile('https?://\S+|www\.S+')
    text = url.sub(r'',text)
    # Remove email id:   
    email = re.compile('[A-Za-z0-2]+@[\w]+.[\w]+')
    text = email.sub(r'',text)
    return text
print(clean_text(text)) 