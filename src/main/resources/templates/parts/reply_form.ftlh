<#macro form msgId>
    <form method="post" action="/problems/${msgId}">
        <!-- Grid row -->
        <div class="row">

            <div class="col-12 mt-1">
                <div class="form-group basic-textarea">
                <textarea name="content" id="exampleFormControlTextarea6" rows="5"
                          class="form-control" placeholder="Write something here..."></textarea>
                </div>
                <input type="hidden" name="msgId" value="${msgId}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="text-right">
                    <button type="submit" class="btn btn-grey btn-sm">Submit</button>
                </div>

            </div>

        </div>
    </form>
    <!-- Grid row -->
</#macro>