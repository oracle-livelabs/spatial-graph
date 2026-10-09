# Traverse Skills to Discover Roles

## Introduction

Now turn your experience into graph evidence. The Career Explorer submits your profile, returns candidate occupations, and shows the path behind each result.

Estimated Time: 15 minutes

### Objectives

In this lab, you will:

- Submit a personal or sample skills profile.
- Read the role results and graph visualization.
- Inspect the stored graph query behind the visualization.

## Task 1: Submit a skills profile

1. In **Career Explorer**, go to the **Lab 2** section. In **Career Profile**, enter your experience or select a sample: **Chef**, **Marketing manager**, **Data engineer**, or **Music teacher**. Each sample fills in one of these profiles:

    ```text
    I'm a professional chef with over eight years of experience in the culinary industry. I specialize in creating flavorful dishes using fresh, seasonal ingredients while maintaining high standards of quality and presentation. Throughout my career, I've worked in fine dining restaurants, managed kitchen operations, and collaborated with talented teams to deliver memorable dining experiences.

    I enjoy experimenting with new recipes, blending traditional techniques with modern flavors, and continuously learning about different cuisines from around the world.
    ```

    ```text
    I'm a Marketing Manager with over six years of experience in developing and executing marketing strategies that drive brand awareness, customer engagement, and business growth. I have experience managing both digital and traditional marketing campaigns, conducting market research, and working closely with sales and product teams to achieve organizational goals.

    I'm passionate about understanding customer behavior and using data-driven insights to create effective marketing campaigns. I've led successful product launches, managed social media and content marketing initiatives, and optimized campaign performance to maximize return on investment.
    ```

    ```text
    I build SQL data models and Python data pipelines, create dashboards, work with REST APIs, and explain technical results to business stakeholders. I mentor teammates and turn ambiguous questions into practical solutions.
    ```

    ```text
    I have experience planning and delivering engaging music lessons for children and adults in school and private settings. I teach guitar, voice, piano, music theory, choral conducting, general music, and classroom music. I have experience with lesson planning, classroom management, Google Classroom, Google Meet, Microsoft Teams, and educational technology. I enjoy music education and lifelong learning.
    ```

2. Select **Explore career options**, the sparkle button at the top right of **Career Profile**. Wait for the results to refresh.

    ![Career Profile with the Chef sample selected.](images/career-profile.png " ")

3. In **Career Exploration Results**, record one role that interests or surprises you.

    ![Career Exploration Results listing five occupations.](images/career-results.png " ")

## Task 2: Explore the graph result

1. In **Visualization Result**, move the network and select a vertex. Identify the target roles (yellow), the tasks that connect them to your profile (green), and the work activities (blue). Darker green means a stronger match, and the percentage on each task shows how similar it is to your profile.

2. Select a green task. The card in the lower-left corner explains why it matches: the phrase from your profile that is closest to the task, the similarity, and the path from the role.

    ![Visualization Result with a selected task and its match explanation.](images/visualize-result.png " ")

3. Find an indirect path. A two-hop path shows how a role reaches a work activity through an intermediate task.

4. Review **Career Fit Details**. Note the **Good fit**, **Needs improvement**, and **Suggestions** sections.

    ![Career fit details.](images/career-fit-details.png " ")

## Task 3: Explore Skills-to-Role Paths with SQL

1. Under **Start simple: a two-hop pattern**, review the pattern below and select **Run**.

    ```sql
    <copy>
    SELECT skill_name, target_role
    FROM GRAPH_TABLE (
      onet_graph
      MATCH
        (skill_text IS CONTENT_ELEMENT)
          -[content_edge IS SOFTWARE_SKILL_FOR_CONTENT]-
        (skill IS SOFTWARE_SKILL)
          -[occupation_edge IS SOFTWARE_SKILL_FOR_OCCUPATION]-
        (role IS OCCUPATION)
      COLUMNS (
        skill_text.element_name AS skill_name,
        role.title              AS target_role
      )
    )
    FETCH FIRST 50 ROWS ONLY;
    </copy>
    ```

    ![Two-hop pattern and its results.](images/pattern-matching.png " ")

2. Add `WHERE role.title LIKE '%Engineer%'` on a new line just before `COLUMNS`, then select **Run** again. Select **Reset** to restore the query.

3. Return to the graph and answer: **Which role became visible because the graph followed an intermediate connection?**

## Learn More

- [Graph Pattern in Oracle Database 26ai](https://docs.oracle.com/en/database/oracle/oracle-database/26/sqlrf/graph-pattern.html)
- [Explore Operational Property Graphs in Oracle AI Database](https://livelabs.oracle.com/ords/r/dbpm/livelabs/view-workshop?wid=3978)

## Acknowledgements

- **Authors** - Denise Myrick, Ramu Murakami Gutierrez, Ruiqi Jiang
- **Last Updated By/Date** - Denise Myrick, Oracle AI Database Product Management, October 2026
