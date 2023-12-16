function updateClock() {
    $('#timer').text(moment().format('HH:mm | DD/MM/yyyy'));
}

function timedUpdate() {
    updateClock();
    setTimeout(timedUpdate, 1000);
}

function getEmbedUrl() {
    let tinhThanh = $('input[name=TinhThanh]').val();
    if (!tinhThanh) {
        tinhThanh = $('#TinhTnanh').val();
    }
    let days = $('#soNgay').val();
    let headerColor = $('#HeaderColor').val();
    let headerBackground = $('#HeaderBackground').val();
    let textColor = $('#TextColor').val();
    let borderColor = $('#BorderColor').val();
    let lineColor = $('#LineColor').val();

    let url = `https://thoitiet.vn/embed/${tinhThanh}?days=${days}&hC=${encodeURIComponent(headerColor)}&hB=${encodeURIComponent(headerBackground)}&tC=${encodeURIComponent(textColor)}&bC=${encodeURIComponent(borderColor)}&lC=${encodeURIComponent(lineColor)}`;

    return url;
}

function fillEmbedUrl() {
    let url = getEmbedUrl();
    let htmlData = `<!--Begin thoitiet.vn Weather Widget --><iframe src="${url}" id="widgeturl" width="100%" height="297" scrolling="no" frameborder="0" allowtransparency="true" style="border:none;overflow:hidden;"></iframe><!-- End Widget -->`;
    $('#urlValue').val(htmlData);
}

$(document).ready(function() {
    $('#carousel-days').on('slide.bs.carousel', function(e) {
        var $e = $(e.relatedTarget);
        var idx = $e.index();
        var itemsPerSlide = 4;
        var totalItems = $('.carousel-item').length;

        if (idx >= totalItems - (itemsPerSlide - 1)) {
            var it = itemsPerSlide - (totalItems - idx);
            for (var i = 0; i < it; i++) {
                // append slides to end
                if (e.direction == "left") {
                    $('.carousel-item').eq(i).appendTo('.carousel-inner');
                } else {
                    $('.carousel-item').eq(0).appendTo('.carousel-inner');
                }
            }
        }
    });

    $('#carousel-days').carousel({
        interval: false,
        touch: true
    });

    $(document).on('click', '.dropdown-menu', function(e) {
        e.stopPropagation();
    });

    timedUpdate();

    $('.basicModalAutoSelect').autoComplete();

    $('.basicModalAutoSelect').on('autocomplete.select', function(evt, item) {
        console.log('select: ', item);
        if (item) {
            window.location.href = item.value;
        }
    });




    $('#showMoreContent').click(function(evt) {
        evt.preventDefault();
        if ($('.cover-content').hasClass('active')) {
            $('.cover-content').removeClass('active')
            $('#showMoreContent').text('Mở rộng')
        } else {
            $('.cover-content').addClass('active')
            $('#showMoreContent').text('Thu gọn')
        }
    })

    $('.dropdown-toggle').on('shown.bs.dropdown', function() {
        console.log('show')
    })

    $('#bienDrop').on('hiden.bs.dropdown', function() {
        console.log('hide')
    })

    $('.btn-toggle-toc').click(function(evt) {
        evt.preventDefault();
        //let isShow = $(this).hasClass('show');
        //if (isShow) {
        //    $('.toc-links').toggle();
        //    let isShow = $(this).removeClass('show');
        //}
        //else {
        //    $('.toc-links').show();
        //    let isShow = $(this).addClass('show');
        //}
        $('.toc-links').toggle();
    })

    $('#btnWidget').click(function(evt) {
        evt.preventDefault();

        let url = getEmbedUrl();

        $('#widgeturl').attr('src', url);

        fillEmbedUrl();
    })

    $(".btn-copy").click(function() {
        $("#urlValue").select();
        document.execCommand('copy');
        alert('Đã copy thành công');
    });

    $('#formControlRange').change(function(evt) {
        let val = $(this).val();
        $('.widget-container').css('width', val);
        $('#range').text(val + 'px')
    })
    fillEmbedUrl();

});