<a class="btn btn-primary my-3" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Message editor
</a>
<div class="collapse my-2 ml-5" id="collapseExample">
    <div class="form-group">
        <form method="post" action="/problems">

            <div class="form-group">
                <input type="text" name="title" placeholder="Заголовок" class="form-control"/>
            </div>

            <div class="form-group">
                <textarea name="content" class="form-control">Опишите вашу проблему</textarea>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-secondary">Опубликовать</button>
            </div>

        </form>
    </div>
</div>