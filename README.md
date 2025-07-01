# 🎭 Emotion Classifier API – Built with Raku & Cro

A simple web server that classifies text-based emotion input using Raku and the Cro HTTP framework. This project was built as part of an exploration into niche programming languages and experimental tech stacks.


## 🚀 Features

- Built entirely using **Raku**, a powerful yet underrated language
- API server created with **Cro HTTP**
- Accepts a string of input and returns the predicted emotion
- Clean and minimal server-side logic
- Great for learning web servers, NLP, or working with Raku


## 🧠 Tech Stack

- **Language:** Raku  
- **Web Framework:** Cro HTTP  
- **Parser/Classifier:** Simple keyword-based emotion mapping  
- *(Optional)* Terminal/CLI for logs and server interaction


## 🧪 How It Works

1. You send a `POST` request to `/emotion` with a JSON payload like:
   ```json
   {
     "text": "I am feeling really happy today!"
   }
