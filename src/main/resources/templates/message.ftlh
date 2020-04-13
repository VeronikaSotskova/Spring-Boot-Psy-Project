<#import "parts/common.ftlh" as c>
<#import "parts/comment.ftlh" as com_part>
<#import "parts/reply_form.ftlh" as form>

<@c.page>
    <!-- Grid row -->
    <div class="row" style="margin-top: -100px;">

        <!-- Grid column -->
        <div class="col-md-12 px-lg-5">
            <!-- Card -->
            <div class="card pb-5 mx-md-3">
                <div class="card-body">
                    <div class="container">
                        <!-- Section heading -->
                        <h1 class="text-center h1 pt-4 mb-3">
                            <strong>${message.title}</strong>
                        </h1>

                        <div class="row">
                            <div class="col-md-12 col-xl-12 d-flex justify-content-center">
                                <p class="font-small dark-grey-text mb-1">
                                    <strong>Author:</strong> ${message.author.surname} ${message.author.name} ${message.author.patronymic!''}
                                </p>
                                <p class="font-small grey-text mb-0 ml-3">
                                    <i class="far fa-clock-o dark-grey-text"></i> ${date} at ${time}</p>
                            </div>
                        </div>
                        <!-- Grid row -->
                        <div class="row pt-lg-5 pt-3">
                            <!-- Grid column -->
                            <div class="col-md-12 col-xl-12">
                                <!-- Grid row -->
                                <div class="row mt-3">
                                    <p class="dark-grey-text article">${message.content}</p>
                                </div>
                                <!-- Grid row -->
                                <hr class="mt-5">
                                <!-- Comments -->
                                <section>
                                    <!-- Main wrapper -->
                                    <div class="comments-list text-center text-md-left">
                                        <div class="text-center my-5">
                                            <h3 class="font-weight-bold">Comments
                                                <span class="badge indigo">${comCount}</span>
                                            </h3>
                                        </div>

                                        <#list comments as comm>
                                            <@com_part.part_com comm></@com_part.part_com>
                                        </#list>
                                    </div>
                                    <!-- Main wrapper -->
                                </section>
                                <!-- Comments -->
                                <hr>
                                <!-- Section: Leave a reply (   Not Logged In User) -->
                                <section class="mb-4 wow fadeIn" data-wow-delay="0.2s">
                                    <h3 class="font-weight-bold text-center my-5">Leave a reply</h3>
                                    <@form.form message.id/>
                                </section>
                                <!-- Section: Leave a reply (Not Logged In User) -->
                            </div>
                            <!-- Grid column -->
                        </div>
                        <!-- Grid row -->
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
            <!-- Card -->
        </div>
        <!-- Grid column -->
    </div>
    <!-- Grid row -->
</@c.page>