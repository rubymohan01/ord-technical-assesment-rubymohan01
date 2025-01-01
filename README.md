**ASK US IF YOU HAVE QUESTIONS. WE ARE HERE TO HELP YOU SUCCEED**

# Developer Assessment

We're thrilled to have you on board and can't wait to see the amazing work you'll do. We're here to support you throughout this process, and we're excited to review your contributions.

## Setup (pay close attention to detail)

- *CLONE DO NOT FORK* this project
- Create a new Repository on your own Github account
- Set the project as a *private* project.
- Use your own Github Repo for this Assessement.
- Invite these two users `neohunter` and `misterhtmlcss` *immediately* to the repo who are the reviewers of your assessment
- Notify the hiring manager that the reviewers have been invited
- You are ready to go! Continue below with the assessment.


## Objective

Design and develop a partial implementation of a Health platform, focusing on components that demonstrate your technical skills, ability to interpret requirements and strong capacity to communicate professionally at a technical level.

**Rules**

- All code must be delivered in PRs that are feature specific, isolated and with unit and request testing. \([explanation](https://axolo.co/blog/p/managing-stacked-pr)\)
- Do NOT squash your commits.
- We must be able to see your commits, we must be able to compare PR changes.
- All Repos need to be private, add `misterhtmlcss` and `neohunter` to the repo when you create the repo. We want to be able to monitor progress and give feedback if we see a need in the PRs.
- Follow our [ Code Reviews Documentation.](https://docs.google.com/document/d/1UgpuoIHZXAKz0SubjoqSGI7afmDxPRS78eQTyPLP4m4/edit?tab=t.0) & our [Code Style guidelines](https://docs.google.com/document/d/1pDiwiqPaatbHWVCdfDOTLIOdzRwi00YxGohLKrh2X18/edit?usp=sharing)

---
## Project’s Description

The application is an **insurance management platform** designed to streamline the relationship between health insurance **companies**, and their **employees**. The platform provides tools for brokers to manage policies, employee enrollments, and communication with companies. It also enables HR representatives to oversee employee data, enrollment status, and policy selections, while offering employees a seamless way to access and manage their health insurance plans. The platform emphasizes interactivity, automation, and ease of use through features like authentication, CRUD operations, and integration with scheduling tools like Calendly.

**Figma Design:** https://whimsical.com/figma-designs-JgMGMT336rUwfiHovB8VAV

**Entity Descriptions**

**Admin:** Responsible for managing the overall platform, setting up brokers, and overseeing activities. They have full permissions to configure the platform and monitor performance.

**Agency:** Represents the intermediary organization that manages brokers and their agents.

**Agent:** Works under an agency. Agents assist companies and employees with policy selection, enrollment, and ongoing support.

**Companies:** Businesses that provide health insurance benefits to their employees. Each company has a designated PoC \(such as an HR representative\) who manages employee data and coordinates with agents.

**Employees:** Individuals working for companies who are enrolled in health insurance policies. They interact with the platform to view policy details, add dependents, and manage their health insurance.

**Policies:** Health insurance plans offered to employees. Policies are associated with specific companies and managed by agents to ensure proper enrollment and coverage.

## Tasks

### Development Tasks

1. **Discovery and Refinement**
    - Create a list of questions, doubts, concerns, suggestions etc as your own discovery and refinement process in order to kickoff the project. Make sure you have all the necessary requirements to start development.
2. **Estimation table**
    - Before starting coding, first create an estimation table for the following items and submit them to your manager.
3. **Database Design**
    - Design the database for postgresql including the following entities and all of their relationships:
        - **Admin**
        - **Agency** \(including PoC - Point of Contact\)
        - **Agent**
        - **Companies** \(including PoC - Point of Contact\)
        - **Employees**
        - **Policies \(employees have policies that are are associated with their employer/company and a Agent\)**
    - Provide a document explaining your database design decisions.
4. **Authentication Module**
    - Implement a basic authentication module. \(use Devise: https://github.com/heartcombo/devise\)
    - Include unit tests and request tests using MiniTest.
5. **CRUD Operations**
    - Implement full CRUD functionality for the following:
        - **Agents**
        - **Agency**
        - **Companies**
        - **Employees**
        - **Policies**
6. **Employee CSV importer**
    - Should support progress bar and validate data.
7. **Frontend**
    - Implement views for all components using **Hotwire \(Stimulus \+ Turbo\), **ensure they work on both mobile, tablet and desktop
        - We must see examples of Turbo being used
        - We must see examples of Stimulus being used
8. **Testing \(Minitest \+ Capybara\)**
    - Write and execute unit tests for critical components. All tests must pass and it should be comprehensive for all scenarios for all services, models and requests.
        - There must be at least 5 unit tests, but we rely on your good judgement to decide if more is needed.
9. **Project Documentation**
    - Create a README.md file that includes:
        - Project overview.
        - Steps to set up and run the project.
        - Code Architecture description
        - Technical Notes.

### Technical Requirements

- Use the following technologies:
    - **Rails 8**.x
    - **Minitest \+ Capybara**
    - **PostgreSQL**
- If you propose using other technologies or have objections to any of the above, provide detailed reasons and alternatives.

## Deliverables

1. **Loom Video\(s\)**
    - Record a Loom video explaining your thought process, design decisions, and an overview of the implemented components for each PR you create. Be sure to include a video of yourself in the Loom. **WITHOUT the Loom showing yourself talking the PR is invalid.**
2. **Pull Requests**
    - If needed use stacked PR to submit your code per feature \([Explanation](https://axolo.co/blog/p/managing-stacked-pr)\)
        1. If changes depend on another open branch, point the new PR to that branch to view only the relevant changes and don’t have PR with duplicated code. Once the parent branch is merged, update the target of the PR for the child branch to master.
        2. A Stacked Pull Request \(PR\) is a powerful workflow that breaks down complex changes into smaller, manageable pieces that are opened in a specific sequence, each one building upon the previous. This approach allows for easier code review, as each PR contains a manageable chunk of changes, making it simpler for reviewers to understand the context and impact. Stacked PRs are particularly useful in larger projects where a single PR could become overwhelming to review.
    - Ensure the repository includes meaningful commit messages and a clean structure.

## Evaluation Criteria

1. **Code Quality**
    - Clean, maintainable, and well-documented code.
2. **Database Design**
    - Appropriate normalization, efficient relationships, and scalability.
3. **Testing**
    - Comprehensive unit and request tests.
    - For coverage percentage, what do you think is the right percentage to aim for, why, and what percentage your test has?
4. **Adherence to Requirements**
    - Fulfillment of all outlined tasks and use of required technologies.
5. **Problem Solving and Innovation**
    - Ability to handle challenges and propose better alternatives when needed.
6. **Communication**
    - Clarity in the Loom video, PR and documentation.
    - Ask questions if you have them. We are happy to get your questions. No dumb questions\!
7. Does the project run, can we deploy it, is your code and work team friendly and well thought out.


