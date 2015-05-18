# recipe_book

Recipe Book

By Alexandar Castaneda

@ Epicodus Programming School, Portland, OR

GNU General Public License, version 3 (see below). Copyright (c) 2015 Alexandar Castaneda.

Description

This app allows a user to create, edit and delete recipes, categories and ingredients.  User can find recipes by ingredient as well as organize recipes by self created categories.  

Author

Alexandar Castaneda

Setup

This app was written in ruby '2.0.0'.

Clone this repo with

https://github.com/alexcaste/recipe_book.git

Install and run: $ bundle

Start the database in another terminal bash: $ postgres

Create the databases and tables by changing directories into your new tracker-master folder then in the terminal run the following:

$ rake db:create

$ rake db:schema:load

Start the webserver:

$ ruby app.rb

In your web browser, go to http://localhost:4567

License Copyright (C) 2015 Alexandar Castaneda

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
