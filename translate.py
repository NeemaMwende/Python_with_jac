from byllm import Model, by

llm = Model(model_name="gpt-4o")

@by(llm)
def translate_to(language: str, phrase: str) -> str:
    """
    Translate the given phrase to the specified language.
    """
    # The actual translation is handled by the LLM via byllm.

if __name__ == "__main__":
    language = input("Enter the target language: ")
    phrase = input("Enter the phrase to translate: ")
    output = translate_to(language=language, phrase=phrase)
    print("Translation:", output)