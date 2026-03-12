<div align="center">

# 🧠 Analyzing Depression Severity and Classification
### *A Comparative Study of Tweets and Survey Responses*

![Python](https://img.shields.io/badge/Python-3.10-blue?style=for-the-badge&logo=python&logoColor=white)
![Django](https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=white)
![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)

**Author:** [Thanniru Dharma Nithin](https://github.com/ThanniruDharmaNithin)  
**Project Type:** Major Project | Multimodal AI System  

---

</div>

## 🎥 Project Execution Video

[[PASTE THE GITHUB ASSET LINK HERE](https://github.com/user-attachments/assets/9e1594c1-08a1-4596-b00f-c94c36905d14)]



---

## 📖 Abstract

Depression is a widespread mental health disorder affecting millions of people worldwide. It often remains undiagnosed due to stigma, lack of awareness, and the limitations of traditional screening approaches.

> **This project presents a Multimodal AI System that combines three distinct approaches:**
> 1. 📝 **PHQ-9 questionnaire analysis** for structured self-assessment.
> 2. 👤 **Facial expression analysis** using **CNN (MobileNet)**.
> 3. 💬 **Text sentiment analysis** using **LSTM and transformer-based NLP models**.

By integrating these modalities, the system provides **real-time depression severity classification**, generates supportive recommendations, and significantly improves the reliability of early mental health assessment.

**🔑 Keywords:** `Depression Detection`, `PHQ-9`, `Facial Emotion Recognition`, `NLP`, `Sentiment Analysis`, `CNN`, `LSTM`, `Multimodal AI`, `Mental Health Diagnostics`

---

## 💡 Motivation

Depression heavily affects emotional well-being, daily functioning, and productivity. Traditional screening methods—such as questionnaire-based assessments—rely heavily on self-reporting and may fail to capture subtle emotional or behavioral indicators.

With the rapid growth of artificial intelligence and deep learning, **early detection of depressive patterns has become feasible**. This project explores how structured surveys, facial cues, and text-based sentiment can be fused to create a faster, highly accessible mental health screening tool.

---

## 🎯 Objectives

- 🧠 **Develop a multimodal AI system** integrating PHQ-9, facial analysis, and sentiment detection.
- ⏱️ **Provide real-time assessment** of depression severity.
- ❤️ **Offer motivational suggestions** and possible next-step professional guidance.
- 🔍 **Support early detection** through the analysis of user-generated text and behavioral indicators.

### 🏆 Expected Outcomes
- ✅ Automated and unbiased depression severity classification.
- ✅ Enhanced diagnostic reliability compared to single-input approaches.
- ✅ A scalable, web-based real-time mental health assessment framework.

---

## 📚 Literature Survey

| 🔬 Study Area | 🛠️ Method Used | ⚠️ Limitation |
|---|---|---|
| **Facial Expression Recognition** | CNN-based analysis | Sensitive to lighting and image quality. |
| **Social Media Sentiment Analysis** | NLP-based models | Difficulty handling sarcasm and ambiguous text. |
| **PHQ-9 Screening** | Self-assessment survey | Highly subject to user bias. |
| **Multimodal Detection** | Combined video & text | Higher computational and memory costs. |

**✨ Proposed Approach:**  
We combine **PHQ-9 scoring**, **CNN facial emotion recognition**, and **NLP sentiment analysis** through a **weighted decision process**. This balances out the individual limitations and provides a highly accurate severity detection mechanism.

---

## 🏗️ System Architecture

### 🧩 Main Modules

1. **📋 PHQ-9 Assessment:** Automatically scores questionnaire responses to categorize base severity.
2. **📸 Facial Expression Analysis:** Uses a **MobileNet CNN** model to interpret emotional patterns from facial inputs.
3. **⌨️ Text Sentiment Analysis:** Applies **LSTM / NLP models** to identify depressive sentiment in text or tweets.
4. **⚙️ Decision Fusion Algorithm:** Integrates outputs from all modules using a weighted scoring mechanism.
5. **🤝 Recommendation Engine:** Generates personalized suggestions and connects users with support resources.

### 🔄 Workflow

```mermaid
User Input → [ PHQ-9 | Facial Data | Text Input ]
                      ↓
Feature Extraction → [ Scoring | CNN | NLP ]
                      ↓
Classification → [ Severity Level Calculation ]
                      ↓
Output → [ Depression Level + Recommendations ]
```

---

## 💻 Tech Stack

| 🔧 Component | 📦 Tool / Library | 🎯 Purpose |
|---|---|---|
| **Programming Language** | Python 3.10 | Core logic and AI model integration |
| **Backend Framework** | Django | Web framework and backend APIs |
| **Frontend** | HTML5, CSS3, JS | User interface & interactivity |
| **Database** | MySQL / SQLite | Storing user data & prediction history |
| **Machine Learning** | Scikit-learn | Data processing and baseline models |
| **Deep Learning** | TensorFlow, Keras | CNN & LSTM Model training |
| **NLP** | NLTK, SpaCy, TF-IDF | Text preprocessing & sentiment analysis|
| **Computer Vision** | OpenCV | Facial image preprocessing & detection |
| **IDE** | Visual Studio Code | Primary development environment |

---

## ⚙️ Hardware and Software Requirements

### 🖥️ Hardware Requirements
| Component | Minimum | Recommended |
|---|---|---|
| **Processor** | Pentium IV 2.2 GHz | Intel Core i3 (5th Gen) or above |
| **RAM** | 1 GB | 4 GB or above |
| **Storage** | 20 GB | 500 GB |

### 💽 Software Requirements
- **OS:** Windows 10 / 11
- **Language:** Python 3.10
- **Database:** SQLite (Default) / MySQL
- **Browser:** Google Chrome / Microsoft Edge

---

## 🛠️ Methodology and Implementation

### 🔹 Step 1: Model Selection & Setup
- **Text Model:** LSTM / Transformer-based NLP model.
- **Facial Model:** MobileNet CNN for facial emotion recognition.
- **Fusion Model:** Weighted scoring method to combine all outputs.

### 🔹 Step 2: Data Preprocessing
- Cleaned **PHQ-9 responses**, **text data**, and **facial images**.
- Removed duplicates, handled missing values, and normalized data.
- Applied **tokenization** and **TF-IDF vectorization** for text.
- Used **CNN-based feature extraction** for images.

### 🔹 Step 3: Model Training & Evaluation
- **Optimizer:** Adam | **Loss Function:** Cross-Entropy Loss
- **Metrics Evaluated:** Accuracy, Precision, Recall, F1-score.
- Tuned hyperparameters to reduce overfitting and improve generalization.

### 🔹 Step 4: Django Integration
- Loaded trained `.pkl` and `.h5` models into the Django backend.
- Created views to accept text submissions, questionnaire forms, and webcam feeds.
- Displayed final severity classification alongside tailored recommendations.

---

## 📊 Results and Metrics

| 🧩 Module | 🤖 Model Used | 🎯 Accuracy |
|---|---|---|
| **PHQ-9 Scoring** | Rule-Based Logic | **100%** |
| **Facial Emotion Recognition**| MobileNet CNN | **70.0%** |
| **Text Sentiment Analysis** | LSTM | **93.7%** |

> **📌 Key Observation:** The multimodal approach drastically improves real-world reliability compared to single-input systems, offering near real-time predictions with actionable outputs.

---

## 🚀 Future Enhancements

- [ ] 🎙️ **Voice Analysis:** Integrate audio-processing for tone-based emotional detection.
- [ ] 📈 **Longitudinal Tracking:** Enable user profiles to track mental health progress over time.
- [ ] 📱 **Mobile Application:** Develop a Flutter or React Native app for remote accessibility.
- [ ] 🔍 **Explainable AI (XAI):** Add transparency features so medical professionals can understand the AI's reasoning.

---

## 🏁 Conclusion

This project successfully demonstrates a **Multimodal AI system** for depression severity classification. By combining the structured nature of PHQ-9 responses with the deep-learning capabilities of facial emotion recognition and text sentiment analysis, the system builds a highly reliable, scalable, and accessible mental health assessment framework.

---

## 📂 Project Structure

```text
Analyzing_Depression_Severity/
│
├── data/                  # Raw and processed datasets
├── notebooks/             # Jupyter notebooks for model training/EDA
├── images/                # Architecture diagrams and screenshots
├── models/                # Saved models (.pkl, .h5, tokenizer)
│
├── depression_app/        # Main Django Application
│   ├── migrations/
│   ├── templates/         # HTML Files
│   ├── static/            # CSS, JS, Images
│   ├── views.py           # Backend logic & model inference
│   └── urls.py            # Route management
│
├── Analyzing_Depression/  # Django Project Configuration
├── requirements.txt       # Python dependencies
├── manage.py              # Django execution script
└── README.md              # Project Documentation
```

---

## ▶️ How to Run in VS Code

Follow these exact steps to run the Django project locally on your system using **Visual Studio Code**.

### 1️⃣ Clone the repository
Open your command prompt or VS Code terminal and run:
```bash
git clone https://github.com/ThanniruDharmaNithin/Analyzing_Depression_Severity.git
cd Analyzing_Depression_Severity
```

### 2️⃣ Open the project in VS Code
```bash
code .
```

### 3️⃣ Open VS Code Terminal
Press `` Ctrl + ` `` (Control + Backtick) to open the integrated terminal inside VS Code. Ensure you are in the project root folder.

### 4️⃣ Create and Activate a Virtual Environment (Recommended)
Isolate your Python dependencies to avoid conflicts. Run this in the VS Code terminal:

**For Windows:**
```bash
python -m venv venv
venv\Scripts\activate
```
*(You should see `(venv)` appear at the very beginning of your terminal prompt line).*

### 5️⃣ Install Dependencies
Install Django, TensorFlow, Keras, and all other required libraries:
```bash
pip install -r requirements.txt
```

### 6️⃣ Setup the Django Database
Run the following commands to create the default database tables and apply project migrations:
```bash
python manage.py makemigrations
python manage.py migrate
```

### 7️⃣ Start the Django Development Server
Launch the application:
```bash
python manage.py runserver
```

### 8️⃣ Access the Application
Once the server is running, open your web browser and navigate to:
```text
http://127.0.0.1:8000/
```

*(To stop the server at any time, click inside the terminal and press `Ctrl + C`)*

---

<div align="center">

### 👨‍💻 Author
**Thanniru Dharma Nithin**  
[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?style=for-the-badge&logo=github)](https://github.com/ThanniruDharmaNithin)

*Thank you for viewing this project! If you found it useful, please consider giving it a ⭐ on GitHub!*

</div>
