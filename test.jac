# import from byllm { Model }

# glob llm = Model(model_name="gemini/gemini-2.0-flash")
# def therapist_diagnosis(name: str, age: int, concern: str) -> str:
#     """
#     You are a compassionate therapist. Given the patient's name, age, and main concern,
#     provide a thoughtful and supportive diagnosis or advice.
#     """
#     with llm:
#         return f"You are a compassionate therapist. Given the patient's name: {name}, age: {age}, and main concern: {concern}, provide a thoughtful and supportive diagnosis or advice."

# with entry {
#     print("Welcome to the Therapist Bot!")
#     name = input("What is your name? ")
#     age = int(input("How old are you? "))
#     concern = input("Briefly descritestbe your main concern today: ")

#     diagnosis = therapist_diagnosis(name, age, concern)
#     print("\nTherapist's Response:")
#     print(diagnosis)
# }


import from byllm.llm {Model}

glob llm = Model(model_name="gemini/gemini-2.5-flash");

node Equipment {}

node Weights(Equipment) {
    has available: bool = False;

    can check with FitnessAgent entry {
        visitor.gear["weights"] = self.available;
    }
}

node Cardio(Equipment) {
    has machine: str = "treadmill";

    can check with FitnessAgent entry {
        visitor.gear["cardio"] = self.machine;
    }
}

node Trainer {
    can plan with FitnessAgent entry {
        visitor.gear["workout"] = visitor.create_workout(visitor.gear);
    }
}

walker FitnessAgent {
    has gear: dict = {};

    can start with `root entry {
        visit [-->(`?Equipment)];
    }

    """Create a personalized workout plan based on available equipment and space."""
    def create_workout(gear: dict) -> str by llm();
}

walker CoachWalker(FitnessAgent) {
    can get_plan with `root entry {
        visit [-->(`?Trainer)];
    }
}

with entry {
    root ++> Weights();
    root ++> Cardio();
    root ++> Trainer();

    agent = CoachWalker() spawn root;
    print("Your Workout Plan:");
    print(agent.gear['workout']);
}