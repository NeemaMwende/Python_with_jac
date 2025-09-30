# import re
# text = """<gfg> 
# #GFG Geeks Learning together 
# url <https://www.geeksforgeeks.org/>, 
# email <acs@sdf.dv>
# """
# def clean_text(text):
#     # remove HTML TAG
#     html = re.compile('[<,#*?>]')
#     text = html.sub(r'',text)
#     # Remove urls:
#     url = re.compile('https?://\S+|www\.S+')
#     text = url.sub(r'',text)
#     # Remove email id:   
#     email = re.compile('[A-Za-z0-2]+@[\w]+.[\w]+')
#     text = email.sub(r'',text)
#     return text
# print(clean_text(text)) 







# import nltk
# print(nltk.data.path)
# from nltk.tokenize import word_tokenize
# from nltk.corpus import stopwords
# from nltk.stem import SnowballStemmer, WordNetLemmatizer
# from nltk.tag import pos_tag
# from nltk.chunk import ne_chunk
# import string

# # sample text to be preprocessed
# text = 'GeeksforGeeks is a very famous edutech company in the IT industry.'

# # tokenize the text
# tokens = word_tokenize(text)
# print("Tokens:", tokens)

# # remove stop words
# stop_words = set(stopwords.words('english'))
# filtered_tokens = [token for token in tokens if token.lower() not in stop_words]
# print("After Stopword Removal:", filtered_tokens)

# # perform stemming and lemmatization
# stemmer = SnowballStemmer('english')
# lemmatizer = WordNetLemmatizer()
# stemmed_tokens = [stemmer.stem(token) for token in filtered_tokens]
# lemmatized_tokens = [lemmatizer.lemmatize(token) for token in filtered_tokens]
# print("Stemmed Tokens:", stemmed_tokens)
# print("Stemmed Tokens:", lemmatized_tokens)

# # remove digits and punctuation
# cleaned_tokens = [token for token in lemmatized_tokens 
#                   if not token.isdigit() and not token in string.punctuation]
# print("Cleaned Tokens:", cleaned_tokens)

# # convert all tokens to lowercase
# lowercase_tokens = [token.lower() for token in cleaned_tokens]
# print("Lowercase Tokens:", lowercase_tokens)

# # perform part-of-speech (POS) tagging
# pos_tags = pos_tag(lowercase_tokens)
# print("Pos tags:", pos_tags)

# # perform named entity recognition (NER)
# named_entities = ne_chunk(pos_tags)
# print("Stemmed Tokens:", stemmed_tokens) 

# # print the preprocessed text
# print("Original text:", text)
# print("Preprocessed tokens:", lowercase_tokens)
# print("POS tags:", pos_tags)
# print("Named entities:", named_entities)






import nltk
# nltk.download('punkt') # Download 'punkt'
# from nltk if it's not downloaded
from nltk.tokenize import sent_tokenize
Text = """Geeks For Geeks.
         Geeks Learning Together.
         Geeks For Geeks is famous for DSA.
         Learning DSA"""
sentences = sent_tokenize(Text)
sentences = [sent.lower().replace(".", "") for sent in sentences]
print('Tokenized Sentences :', sentences)

# Create the vocabulary
vocab = {}
count = 0
for sent in sentences:
    for word in sent.split():
        if word not in vocab:
            count = count + 1
            vocab[word] = count
print('vocabulary :', vocab)

# One Hot Encoding
def OneHotEncoder(text):
    onehot_encoded = []
    for word in text.split():
        temp = [0]*len(vocab)
        if word in vocab:
            temp[vocab[word]-1] = 1
            onehot_encoded.append(temp)
    return onehot_encoded

# print('\n',sentences[0])
print('OneHotEncoded vector for sentence : "',
     sentences[0], '"is \n', OneHotEncoder(sentences[0]))


