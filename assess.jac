import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.5-flash");

def assess_level(name: str, answers: list) -> str by llm();

with entry {
    print("Welcome to the Tech Level Assessor!");
    name = input("What is your name? ");

    questions = [
        "How many years have you been coding?",
        "Which programming languages are you comfortable with?",
        "Describe a recent project you worked on.",
        "How do you approach debugging a complex problem?",
        "What resources do you use to keep your tech skills up to date?"
    ];

    answers = [];
    for q in questions {
        ans = input(q + " ");
        answers.append(ans);
    }

    result = assess_level(name, answers);
    print("\nAssessment Result:");
    print(result);
}