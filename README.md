# InfinityLearn - Java EE Web Application

InfinityLearn is a web-based e-learning platform (similar to Udemy/Coursera) built using Java EE (Servlets + JSP), Maven, and Jetty. It supports user profiles, course management, file/video uploads, and more.

---

## 📦 Project Structure
```bash
infinitylearn/
|── src
│   └── main/
│       ├── java/ # Java source code (Servlets, utils, etc.)    
│       ├── webapp/ # JSP pages and static resources
│           ├── uploads/ # Uploaded images (e.g., profile pics)
│               ├── videos/ # Uploaded videos
|               └── images
│       └── *.jsp # JSP views
├── pom.xml # Maven project file
└── README.md
```
---

## ⚙️ Requirements

- Java 8 or higher
- [Maven 3.6+](https://maven.apache.org/download.cgi)
- Jetty Maven Plugin

---

## 🚀 Getting Started

### ✅ 1. Install Maven

If not installed:

#### On macOS:

```bash
brew install maven
```


#### On Linux:

```bash
sudo apt update
sudo apt install maven
```

#### On window:

Download and install from https://maven.apache.org/download.cgi

Then verify:
```bash
mvn -v
```

### Clone and Build the Project
```bash
git clone https://github.com/yourusername/infinitylearn.git
cd infinitylearn
mvn clean install
```

### Run Using Jetty

```bash
    mvn jetty:run
```

### Access the app
```sh
http://localhost:8080
```

🛠 Useful Commands
Stop Jetty
Jetty does not auto-stop. You can stop it with CTRL + C in the terminal running it.

If running Jetty as a background service (rare in development), use:

```bash
    kill $(lsof -t -i:8080)
```

### 📄 License
This project is for educational use. You may reuse or extend it freely.

### 👤 Authors
[Phyoe Zaw Aung] – [phyoezawaung9696@gmail.com]
GitHub Profile