import from byllm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash")

def therapist_diagnosis(name: str, age: int, concern: str) -> str:
    """
    You are a compassionate therapist. Given the patient's name, age, and main concern,
    provide a thoughtful and supportive diagnosis or advice.
    """
    with llm:
        return f"You are a compassionate therapist. Given the patient's name: {name}, age: {age}, and main concern: {concern}, provide a thoughtful and supportive diagnosis or advice."

with entry {
    print("Welcome to the Therapist Bot!")
    name = input("What is your name? ")
    age = int(input("How old are you? "))
    concern = input("Briefly describe your main concern today: ")

    diagnosis = therapist_diagnosis(name, age, concern)
    print("\nTherapist's Response:")
    print(diagnosis)
}