<#macro part_com comm>
    <!-- First row -->
    <div class="row mb-5">
        <!-- Image column -->
        <div class="col-sm-2 col-12 mb-3">
            <img src="/img/${comm.author.avatarFilename!'avatar.jpg'}"
                 class="avatar rounded-circle z-depth-1-half" alt="sample image">
        </div>
        <!-- Image column -->

        <!-- Content column -->
        <div class="col-sm-10 col-12">
            <a>
                <h5 class="user-name font-weight-bold">${comm.author.surname} ${comm.author.name} ${comm.author.patronymic!''}</h5>
            </a>
            <div class="card-data">
                <ul class="list-unstyled">
                    <li class="comment-date font-small">
                        <i class="far fa-clock-o"></i> ${comm.publishedAt.dayOfMonth}/${comm.publishedAt.monthValue}/${comm.publishedAt.year}
                    </li>
                </ul>
            </div>
            <p class="dark-grey-text article">${comm.content}</p>
        </div>
        <!-- Content column -->
    </div>
    <!-- First row -->
</#macro>