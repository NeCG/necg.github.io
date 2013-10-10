---
layout: page
title: Home
tagline: Computer Graphics Student Group of FEUP
---
{% include JB/setup %}

<img alt="logo" src="{{ site.assets }}\necg-logo-2011-white-resampled.png" style="width: 128px; height: 128px; float: left" />
The Computer Graphics Student Group of FEUP, NeCG|FEUP, was created back in 2006 by a group of undergraduated Informatics and Computing Engineering students who were passionate about Computer Graphics.

Our main goals are to create a group of mutual help raising the awareness of our members about the subjects related to Computer Graphics, to promote undergraduate R&D activities and to spread The Word of the Pixel! We also have a very special interest in the science and development of Digital Games.

Usually our activities are related to software development, yet we also promote open academic/industrial events since we believe that openness and awareness are the path to the next iteration of the global knowledge.

Fortunately we are not alone! Since our creation we have been strongly supported by the [Department of Informatics Engineering](http://www.fe.up.pt/si_uk/unidades_geral.visualizar?p_unidade=151) (DEI) of the [Engineering Faculty of Porto University](http://www.fe.up.pt/si_uk/web_page.inicial) (FEUP).

Alone we are powerful. Together we are absolute!

---

Latest News
===========

<ul class="posts">
  {% for post in site.posts %}
    {% if post.category == "news" %}
      <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
    {% endif %}
  {% endfor %}
</ul>
