In your Jekyll site you will be able to use:

```
{% for item in site.data.test.items %}
   **{{item.volumeInfo.title}}**  - {{item.volumeInfo.authors[0]}} <span style="float: right; ">{{item.volumeInfo.publisher}}</span><br />
   {{item.volumeInfo.subtitle}}

{% endfor %}

```


