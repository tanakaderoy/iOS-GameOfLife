# Assignment 5

Assigned: 2/28/2019
Due: 3/21/2019
Points: 200

## Purpose
Learn and harness the full MVC pattern by making a custom UIView with complex, interactive behavior and underlying logic. Combine low-level finger gesture recognition, geometry calculation, timed animation, and model logic to create an entertaining simulation.

## Overview
You will implement COnways Game of Life Simulation.  Rules can be found here: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

For this implementation, use a toroidal grid.  A torus is the mathematical abstraction of a donut: it wraps around like a circle in the x-y plane, but is 3-dimensional so that at any point around the circle, it can be navigated in a connected loop vertically. It reduces to very simple modular arithmetic for simulating the Game of Life, in fact conveniently eliminating boundary conditons. In particular, a cell’s neighbor coordinates are simply calculated modulo the grid size, meaning when a boundary is reached, the grid wraps around at the other extreme. This is also referred to as periodic boundary conditions such as on the Wikipedia page.

## Requirements
1. UI Rendering: Implement a custom subclass of UIView that renders the state of the model in an on-screen grid. It should be constrained to be square (Aspect ratio 1:1). For this assignment only worry about portrait mode on iPhones. The view should fill the horizontal width of the screen (with margins if you wish). Its background color and optional border should clearly separate it from the rest of the interface even when the grid is empty and the simulation is not running. Assume a fixed grid size of 24x24 cells.  You will probably find grid lines or cell borders helpful or pleasing to implement but it is not required.

2. Modeling: All mutations to the grid, and the generation number, must be tracked and calculated in a separate, pure (non-UIKit) data model residing in a separate class which resides in its own .swift file. Model update notifications must be sent using the fully de-coupled NotificationCenter API.

3. Timers: Implement timer events so that when the simulation is on, new Game-of-Life cell generations are calculated and displayed, at regular timed intervals with no user intervention. Timer events should not be generated when the simulation is off.

4. Custom UI Interaction: When the simulation is off, allow the user to set up or change the cell state. Tapping will toggle the tapped-on cell.


