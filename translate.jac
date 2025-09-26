import from byllm { Model }

glob llm = Model(model_name="gpt-4o");

def translate_to(language: str, phrase: str) -> str by llm();

with entry {
    language = input("Enter the target language: ");
    phrase = input("Enter the phrase to translate: ");
    output = translate_to(language, phrase);
    print("Translation: " + output);
}