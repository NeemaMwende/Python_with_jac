# Tech Level Assessor (Jac + Gemini)

This project is a simple command-line tool that uses Jac and Google Gemini (via byllm) to assess a user's technology/coding skill level (Beginner, Intermediate, or Expert) based on their answers to five questions.

## Project Structure

```
.
├── assess.jac         # Main Jac file (user interaction and entry point)
├── assess.impl.jac    # Jac implementation file (LLM prompt and logic)
├── .gitignore
└── ... (other files)
```

## Prerequisites

- [Jac language](https://jaclang.com/) installed and available in your PATH
- Python environment (if required by Jac runtime)
- Access to Gemini API via byllm (ensure your API key is set in your environment)
- `byllm` Jac package installed

## Setup

1. **Clone the repository** (if not already done):

   ```sh
   git clone <your-repo-url>
   cd <your-repo-folder>
   ```

2. **Install Jac** (if not already installed):

   ```sh
   pip install jaclang
   ```

3. **Install byllm** (if not already installed):

   ```sh
   jac package install byllm
   ```

4. **Set your Gemini API key** (if required):

   ```sh
   export GEMINI_API_KEY=your_api_key_here
   ```

## Usage

Run the assessor from your terminal:

```sh
jac assess.jac
```

You will be prompted to enter your name and answer five questions about your tech/coding experience.  
After answering, the program will use Gemini to assess your skill level and display the result.

## Notes

- Make sure your `.env` file (if any) contains your API keys and is **not** tracked by git.
- The `.gitignore` is set up to prevent sensitive files from being committed.

## Example Interaction

```
Welcome to the Tech Level Assessor!
What is your name? Jane Doe
How many years have you been coding? 2
Which programming languages are you comfortable with? Python, JavaScript
Describe a recent project you worked on. Built a personal website
How do you approach debugging a complex problem? I use print statements and online resources
What resources do you use to keep your tech skills up to date? Blogs, YouTube, and online courses

Assessment Result:
Intermediate - You have a solid foundation and some project experience.
```

---

**Enjoy assessing your tech level!**
