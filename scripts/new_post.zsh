#!/bin/zsh

posttype=$1
if [[ "$posttype" = "training" ]]; then
  touch src/training-blog/postX.html
elif [[ "$posttype" = "books" ]]; then
  touch src/book-reviews/postX.html
elif [[ "$posttype" = "tech" ]]; then
  touch src/tech-blog/postX.html
else
  echo "Invalid posttype '$posttype'"
fi

