# : Build Australia Map: Add layers and background

## Introduction

In this exercise, you will generate a map of Australia and apply a background color. You will then add multiple layers to the map, including the route, speed, labels, and the car’s live location.

_Estimated Time:_ 15 minutes

### Objectives

In this lab, you will:

- Generate a map of Australia and give it a color
- Add multiple layers to the map
- Add layers to the map
- Add color background

###  Prerequisites

This lab assumes you have:

- An Oracle Free Tier, Always Free, Paid or Live Labs Cloud Account
- Provisioned Oracle Analytics Cloud
- All previous labs successfully completed

## Task 1: Import the data sets created in lab 2

1. Go to Create and select workbook (**Create**)

    ![Select the create icon and workbook](./images/51%20Create%20Workbook.jpg)

2. Import the data sets created in lab 3 , using the + icon . **Use the Add Data to upload the data sets one by one in this workbook**

    ![Drag data file](./images/52%20Add%20both%20data%20files%20to%20the%20workbook%20and%20save%20the%20workbook.%20Name%20it%20Solar%20race%20car%20Map.png)

  The data pane looks like this when the data sets get uploaded.

    ![Date Pane has both workbooks](./images/53%20The%20data%20pane%20should%20look%20like%20this.jpg)

## Task 2: Create Australia map and add map color to it

1. Double Click Country column from live locations data set and change viz to maps

    ![map](./images/54%20Add%20country%20and%20change%20viz%20to%20maps.jpg)

2. Select the Map layer and change it to world countries and change color to #fbcb05

    ![Map color](./images/55%20Map%20change%20layer%20and%20add%20color.jpg)

    You have now created a map of Australia and applied color to it.
    Next we will layer it with speed, route and add labels.

## Task 3: Add layers to the map

1. Add a new layer to the map by selecting the three dots. Select add Data Layer

    ![Add data layer](./images/56%20Add%20Layer%202%20to%20Map.jpg)

2. Add Route_WKT column in the category and Avg_vehicle_velocity to the Color section

    ![add route and speed](./images/57%20Add%20Route%20and%20Speed%20to%20layer%202%20.jpg)

3. Go to Layers and rename the layer to Route and change color to #0b4574

    ![add route](./images/58%20Add%20color%20to%20Layer%202%20and%20rename%20layer%202%20as%20route.jpg)

4. Add another layer by selecting the three dots

    ![add layer 3](./images/59%20Add%20layer%203.jpg)

5. Add Segment name in the Category

    ![segment name](./images/59.1%20Add%20Segment%20name%20to%20Layer%203.jpg)

6. Go to the layers and change the name to Segment Name , color to Black and outline to custom size of 8, change the data labels option to  right and set columns to SEGMENT_NAME

    ![add layer 3 properties](./images/60%20Add%20layer%203%20Properties.jpg)

7. Add layer 4 to the map

    ![add layer 4](./images/61%20Add%20Layer%204.jpg)

8. Add latitude and longitude to layer 4

    ![add layer 4 attributes](./images/62%20Add%20elements%20to%20Layer4.jpg)

9. In the shape section, select the down arrow to reset the custom shapes and change the shape to down triangle

    ![add shape to layer 4](./images/63%20Custom%20shape%20of%20Car.jpg)

10. Go to layers and rename this layer to live race position, change color to #fbcb05, change outline to custom and size it to 18

    ![add shape to layer 4](./images/64%20Live%20Race%20properties%20add.jpg)

## Task 4: Add color background

1. Go to canvas properties.

    ![add color background](./images/66%20Change%20background%20to%20blue.jpg)

2. Select the custom option for the background and change the color as #0b4574

    ![change color to blue](./images/66%20Change%20background%20to%20blue.jpg)

    Your visualization should look like this.
    ![final map](./images/Final%20Map.jpg)

Congratulations on completing this workshop!

## **Acknowledgements**

- **Author** - Anita Gupta (Oracle Analytics Product Strategy)
- **Contributors** - Gautam Pisharam (Oracle Analytics Product Management)
- **Last Updated By/Date** -