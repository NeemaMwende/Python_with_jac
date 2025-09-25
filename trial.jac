# import math;
# import from random { uniform }

# def calc_distance(x1: float, y1: float, x2: float, y2: float) -> float {
# return math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2);
# }
# with entry { # Generate random points
# (x1, y1) = (uniform(0, 10), uniform(0, 10));
# (x2, y2) = (uniform(0, 10), uniform(0, 10));
#     distance = calc_distance(x1, y1, x2, y2);
#     area = math.pi * (distance / 2) ** 2;
#     print("Distance:", round(distance, 2), ", Circle area:", round(area, 2));
# }



# import from byllm { Model }
# glob llm = Model(model_name="gemini/gemini-2.0-flash");

# enum Personality {
#     INTROVERT = "Introvert",
#     EXTROVERT = "Extrovert",
#     AMBIVERT = "Ambivert"
# }
# def get_personality(name: str) -> Personality by llm();
# with entry {
#     name = "Neema Mwende";
#     result = get_personality(name);
#     print(f"{result.value} personality detected for {name}");
# }


import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.5-flash");

def get_lyrics(audio_data: bytes) -> str by llm():
    """
    You are a music transcription expert. Listen to the provided audio data and return the lyrics as accurately as possible.
    """

with entry {
    print("Welcome to the Lyrics Bot!")
    audio_path = input("Please enter the path to your song audio file: ")
    f = open(audio_path, "rb")
    audio_data = f.read()
    f.close()
    lyrics = get_lyrics(audio_data)
    print("\nLyrics:")
    print(lyrics)
}


