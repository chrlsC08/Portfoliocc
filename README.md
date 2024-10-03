![alt text](images/ARCdiagramimag.png)

🚀 The Cloud Resume Challenge - AWS Edition

🌟 NEW for 2024: Check out the latest Cloud Resume Challenge Guidebook for AWS with updated content and tips!
What Is the Cloud Resume Challenge?
The Cloud Resume Challenge is more than just a task – it’s your gateway to cloud mastery. This hands-on project takes you from deploying a personal resume website to showcasing real cloud skills using AWS services. Ready to prove you can handle cloud infrastructure, APIs, and automation? Let's dive in!

🏅 Certification
Your cloud resume starts with validation: the AWS Cloud Practitioner certification. This entry-level cert orients you with AWS, setting you up for success in cloud computing. If you’ve already got a more advanced cert, great! Otherwise, you can take the exam online for just $100 USD.

Pro Tip: Get started with the Cloud Practitioner certification using a 30-day free trial from Pluralsight! Study up with this special offer and pass your cert in no time. Get it here.

💻 Your Tech-Enhanced Resume
This challenge isn't about static Word docs or PDFs—your resume lives in HTML and CSS. Whether you're a design pro or just getting started, your resume will be styled and deployed for the web.

HTML: Craft your resume as a web page. Think of it as a living, breathing document!
CSS: Add some styling to give your resume a personal touch.
🌐 Get Your Resume Online
Your resume will be deployed as a static website on AWS using Amazon S3. Forget about third-party platforms like Netlify or GitHub Pages—this challenge is all about learning AWS services firsthand!

🔒 Secure with HTTPS
Use Amazon CloudFront to add HTTPS to your S3-hosted site, ensuring secure access to your resume.

🏷️ Custom Domain Name
A professional cloud resume needs a memorable domain. Use Amazon Route 53 or any DNS provider to set up a custom domain, making your resume accessible at something like my-awesome-resume.com.

📊 Add Some Interactivity – Javascript & Visitor Counter
Make your resume dynamic with a visitor counter! You'll write some JavaScript to track how many people have viewed your site. But wait, it’s not just a front-end trick—this data will live in a database.

🗄️ Database: Store Visitor Counts in DynamoDB
Your visitor counter needs somewhere to store its data. Enter Amazon DynamoDB! With on-demand pricing, you'll pay next to nothing while learning how to interact with cloud databases.

🔗 Build an API to Connect Front-End and Back-End
Your visitor counter shouldn’t communicate with DynamoDB directly. Instead, use API Gateway and AWS Lambda to build a secure, scalable API that handles requests from your JavaScript code.

🐍 Python and boto3 for Lambda Functions
The serverless magic happens in AWS Lambda. Use Python and the boto3 library to interact with AWS services and implement your backend logic. Even if you're new to Python, this is a great opportunity to learn!

✅ Test Your Code
Your Lambda functions should come with unit tests. Write some Python tests to ensure your functions work correctly. Test-driven development is a key skill for cloud engineers!

🚀 Infrastructure as Code (IaC)
Forget manual configuration—everything should be automated! Use AWS Serverless Application Model (SAM) to define your API resources (DynamoDB, Lambda, API Gateway) as code and deploy them using the AWS SAM CLI.

Want more flexibility? Many people use Terraform instead of SAM. If you'd like a challenge, try building the infrastructure with Terraform!

🗂️ Source Control and CI/CD
No more manual updates! Set up GitHub Actions to automate deployments. Push changes to your code, and let GitHub run your tests and deploy updates automatically.

Back-End: Set up CI/CD so every update to your Python code and SAM templates gets automatically tested and deployed to AWS.
Front-End: Set up a second GitHub repo for your HTML/CSS resume. Use GitHub Actions to automatically update your S3 bucket and invalidate your CloudFront cache on every push.
✍️ Blog Post
Finally, share your journey! Write a blog post on platforms like Dev.to or Hashnode about what you’ve learned during this challenge. Link it directly from your resume to show off your newfound cloud skills!

🎯 Get Started Today!
Ready to challenge yourself and launch your cloud career? The Cloud Resume Challenge is your blueprint for building, deploying, and automating a cloud-powered project, step by step.