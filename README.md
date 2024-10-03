![alt text](images/ARCdiagramimag.png)

The Azure Cloud Resume Challenge
Welcome to the Azure Cloud Resume Challenge – where cloud knowledge meets real-world application! This hands-on project guides you through building and deploying a personal resume website using key Azure services. It’s your chance to prove your skills in cloud infrastructure, automation, and modern web development – all while showcasing your resume.

Key Requirements
🌐 Certification
Your resume needs to feature the Azure Fundamentals (AZ-900) certification. This exam introduces you to the Azure cloud ecosystem. Already have a higher-level cert? Great! That works too.

Tip: Need some help getting certified? Take advantage of Microsoft Learn’s free resources to get prepped and pass the exam!

Project Breakdown
✏️ HTML & CSS
Your resume should be written in HTML and styled using CSS. It doesn’t have to be complex, but it should be functional, responsive, and visually clean.

🚀 Static Website
Deploy your HTML resume as an Azure Static Web App. This keeps everything in the Azure ecosystem for a seamless experience.

🔐 HTTPS
Security is non-negotiable! Your resume site must use HTTPS, which Azure Static Web Apps provides out of the box.

🌍 Custom Domain (optional)
Point a custom domain to your static website. It adds a professional touch to your resume, and who wouldn’t want to show off a personalized URL?

📈 JavaScript & Visitor Counter
Enhance your resume by adding a real-time visitor counter using JavaScript. This feature tracks how many people have viewed your site, showing your backend chops.

🗄️ Database
Use Azure CosmosDB to store and retrieve visitor data. CosmosDB is a scalable, managed NoSQL database that will securely handle your counter data.

🛠️ API
Rather than connecting directly to CosmosDB, build an Azure Function App to serve as the API between your front-end and database. Keep the backend logic clean and secure.

🐍 Python
Your API will be written in Python, allowing you to flex your backend development skills while interacting with the Azure SDK for Python.

Automation & Infrastructure
⚙️ Infrastructure as Code (IaC)
Embrace automation by using Terraform or Azure Resource Manager (ARM) templates to define and deploy all your Azure resources, from CosmosDB to the Function App. It’s efficient and scalable, just like any modern cloud project should be.

Source Control & CI/CD
🛡️ Backend (API)
Implement GitHub Actions to automatically test and deploy your Azure Function API. No manual deployments needed!

🖥️ Frontend (Website)
For the front-end, set up a CI/CD pipeline that auto-deploys updates to your Static Web App whenever you push changes. Let automation do the heavy lifting.

✍️ Share Your Journey
Don’t forget the final piece – a blog post! Share your experience, highlight what you learned, and celebrate the challenges you overcame. Platforms like Dev.to or Hashnode are perfect for publishing your post, and you can even link it directly from your resume.

🎯 Get Started Today!
Ready to challenge yourself and launch your cloud career? The Cloud Resume Challenge is your blueprint for building, deploying, and automating a cloud-powered project, step by step.