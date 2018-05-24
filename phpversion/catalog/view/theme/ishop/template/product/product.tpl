<?=$header?>






<section class="breadcrumbs">
  <div class="container">
    <div class="breadcrumbs__inner">
      <h1 class="breadcrumbs__title"><?php echo $heading_title; ?></h1>
      <ul class="breadcrumbs__list">
        <li class="breadcrumbs__item"><a href="/" class="breadcrumbs__link">Главная</a></li>
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li class="breadcrumbs__item"><a class="breadcrumbs__link" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
</section>

<section class="product">
  <div id="content" class="container">
    <div class="product__inner">
      <div class="product__images">
        <?php if ($thumb || $images) { ?>

        <?php if ($thumb) { ?>
        <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="product__img product__img--big"/>
        <?php } ?>
        <?php if ($images) { ?>
        <?php foreach ($images as $image) { ?>
        <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-jslghtbx class="product__img jslghtbx-thmb"/>
        <?php } ?>
        <?php } ?>

        <?php } ?>
      </div>
      <div class="product__info" style="color: #101010; width: 100%">

        <h1 class="product__title"><?php echo $heading_title; ?></h1>
        <ul class="list-unstyled">
          <?php if ($manufacturer) { ?>
          <li class="product__text" style="margin-bottom: 0"><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
          <?php } ?>
          <li class="product__text" style="margin-bottom: 0"><?php echo $text_model; ?> <?php echo $model; ?></li>
          <?php if ($reward) { ?>
          <li class="product__text" style="margin-bottom: 0"><?php echo $text_reward; ?> <?php echo $reward; ?></li>
          <?php } ?>
          <li class="product__text" style="margin-bottom: 0"><?php echo $text_stock; ?> <?php echo $stock; ?></li>
        </ul>
        <?php if ($price) { ?>
        <ul class="list-unstyled">
          <?php if (!$special) { ?>
          <li style="display: flex; align-items: baseline">
            <span class="product__desc" style="width: auto; padding-right: 32px;font-size: 20px">Цена:</span>
            <h2 class="product__price"><?php echo $price; ?></h2>
          </li>
          <?php } else { ?>
          <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
          <li>
            <h2 ><?php echo $special; ?></h2>
          </li>
          <?php } ?>
          <?php if ($points) { ?>
          <li><?php echo $text_points; ?> <?php echo $points; ?></li>
          <?php } ?>
          <?php if ($discounts) { ?>
          <li>
            <hr>
          </li>
          <?php foreach ($discounts as $discount) { ?>
          <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
        <div id="product">
          <?php if ($options) { ?>
          <hr>
          <h3 class="product__title" style="font-size: 20px"><?php echo $text_option; ?></h3>
          <?php foreach ($options as $option) { ?>
          <?php if ($option['type'] == 'select') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control product__input">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </option>
              <?php } ?>
            </select>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'radio') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label product__link--bold product__link" >Выберите размер:</label>
            <div id="input-option<?php echo $option['product_option_id']; ?>" style="margin-bottom: 20px">
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <div class="radio">
                <label>
                  <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                  <?php if ($option_value['image']) { ?>
                  <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                  <?php } ?>
                  <?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label>
              </div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'checkbox') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <div id="input-option<?php echo $option['product_option_id']; ?>">
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <div class="checkbox">
                <label>
                  <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                  <?php if ($option_value['image']) { ?>
                  <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                  <?php } ?>
                  <?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label>
              </div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'text') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'textarea') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'file') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label"><?php echo $option['name']; ?></label>
            <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'date') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group date">
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
              <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'datetime') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group datetime">
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
              <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
          </div>
          <?php } ?>
          <?php if ($option['type'] == 'time') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
            <div class="input-group time">
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
              <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
          <?php if ($recurrings) { ?>
          <hr>
          <h3><?php echo $text_payment_recurring; ?></h3>
          <div class="form-group required">
            <select name="recurring_id" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($recurrings as $recurring) { ?>
              <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
              <?php } ?>
            </select>
            <div class="help-block" id="recurring-description"></div>
          </div>
          <?php } ?>
          <div class="form-group">
            <label style="display: inline; padding-right: 20px;" class="control-label product__desc" for="input-quantity"><?php echo $entry_qty; ?></label>
            <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control product__input" />
            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
            <br />
            <button style="margin-top: 40px;margin-bottom: 40px;max-width:150px" type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block product__btn"><?php echo $button_cart; ?></button>
          </div>
          <?php if ($minimum > 1) { ?>
          <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
          <?php } ?>
        </div>
        <?php if ($review_status) { ?>
        <div class="rating">
          <p>
            <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($rating < $i) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } ?>
            <?php } ?>
            <a class="product__link product__link--bold" href="<?php echo $_SERVER["REQUEST_URI"]; ?>#tabc"> <?php echo $reviews; ?></a>
            <a class="product__link product__link--bold" href="<?php echo $_SERVER["REQUEST_URI"]; ?>#tabc"><?php echo $text_write; ?></a></p>
          <button class="product__button" type="button" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product_id; ?>');">
            <svg class="product__icon" width="20" height="20">
              <use x="0" y="0" xlink:href="#icon-heart"></use>
            </svg>
            Добавить в желания
          </button>


          <hr>
        </div>
        <?php } ?>
      </div>
    </div>
    <div class="product__tabs" style="margin-top: 40px">
      <ul data-tabs="" class="product__tabslist tabs">
        <li class="product__tabitem"><a data-tab="" href="<?php echo $_SERVER["REQUEST_URI"]; ?>#taba" class="product__tablink active">Описание</a></li>
        <li class="product__tabitem"><a data-tab="" href="<?php echo $_SERVER["REQUEST_URI"]; ?>#tabb" class="product__tablink">Дополнительная информация</a></li>
        <li class="product__tabitem"><a data-tab="" href="<?php echo $_SERVER["REQUEST_URI"]; ?>#tabc" class="product__tablink"><span class="product__counter"><?php echo $tab_review; ?></span></a></li>
      </ul>
      <div class="product__box" data-tabs-content="">
        <div data-tabs-pane="" class="product__tab tabs-pane active" id="taba">
          <p class="product__description" ><?=$description?></p>
        </div>
        <div class="product__tab tabs-pane" data-tabs-pane="" id="tabb">
          <div class="product__caption">Особенности:</div>
          <?php if ($attribute_groups) { ?>
          <div class="tab-pane" id="tab-specification">
            <table class="table table-bordered">
              <?php foreach ($attribute_groups as $attribute_group) { ?>
              <thead>
              </thead>
              <tbody>
              <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
              <tr>
                <td class="product__caption" style="padding-right: 40px;"><?php echo $attribute['name']; ?></td>
                <td class="product__feature"><?php echo $attribute['text']; ?></td>
              </tr>
              <?php } ?>
              </tbody>
              <?php } ?>
            </table>
          </div>
          <?php } ?>
        </div>
        <div class="product__tab tabs-pane" data-tabs-pane="" id="tabc">
          <section class="review">
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal review__field" id="form-review">
                <div id="review" style="color: #101010;margin-bottom: 40px;border-bottom: 1px solid #dbdbdb;padding-top: 30px;
  padding-bottom: 30px;"></div>
                <h2 class="review__title review__title--margin"><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control review__input" placeholder="Введите имя"/>
                <textarea name="text" rows="5" id="input-review" class="form-control review__area" placeholder="Отзыв"></textarea>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label review__text" style="margin-right: 20px"><?php echo $entry_rating; ?></label>
                    <span class="review__text"><?php echo $entry_bad;?></span>
                    <input type="radio" name="rating" value="1" />
                    <input type="radio" name="rating" value="2" />
                    <input type="radio" name="rating" value="3" />
                    <input type="radio" name="rating" value="4" />
                    <input type="radio" name="rating" value="5" />
                    <span class="review__text"><?php echo $entry_good; ?></span>
                  </div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons" style="margin-top: 20px">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary review__btn">Отправить</button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </section>
        </div>
      </div>
    </div>
    <?php if ($products) { ?>
    <h3><?php echo $text_related; ?></h3>
    <div class="row">
      <?php $i = 0; ?>
      <?php foreach ($products as $product) { ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-xs-8 col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-xs-6 col-md-4'; ?>
      <?php } else { ?>
      <?php $class = 'col-xs-6 col-sm-3'; ?>
      <?php } ?>
      <div class="<?php echo $class; ?>">
        <div class="product-thumb transition">
          <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
            <p><?php echo $product['description']; ?></p>
            <?php if ($product['rating']) { ?>
            <div class="rating">
              <?php for ($j = 1; $j <= 5; $j++) { ?>
              <?php if ($product['rating'] < $j) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
            </div>
            <?php } ?>
            <?php if ($product['price']) { ?>
            <p class="price">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
              <?php } ?>
              <?php if ($product['tax']) { ?>
              <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
              <?php } ?>
            </p>
            <?php } ?>
          </div>
          <div class="button-group">
            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
            <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
          </div>
        </div>
      </div>
      <?php if (($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
      <div class="clearfix visible-md visible-sm"></div>
      <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
      <div class="clearfix visible-md"></div>
      <?php } elseif (($i+1) % 4 == 0) { ?>
      <div class="clearfix visible-md"></div>
      <?php } ?>
      <?php $i++; ?>
      <?php } ?>
    </div>
    <?php } ?>
    <?php if ($tags) { ?>
    <p><?php echo $text_tags; ?>
      <?php for ($i = 0; $i < count($tags); $i++) { ?>
      <?php if ($i < (count($tags) - 1)) { ?>
      <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
      <?php } else { ?>
      <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
      <?php } ?>
      <?php } ?>
    </p>
    <?php } ?>
</section>
</main>
<footer class="page-footer">
  <div class="container">
    <div class="page-footer__logo">
      <a href="/" class="page-footer__link">
        <img src="catalog/view/theme/ishop/image/logo-white.svg" alt="Sports Store" class="page-footer__logotype  " width="206" height="26">
      </a>
    </div>
    <section class="socials">
      <ul class="socials__list">
        <li class="socials__item">
          <a href="#" class="socials__link">
            <svg class="socials__icon" width="30" height="30">
              <use x="0" y="0" xlink:href="#icon-vk"></use>
            </svg>
          </a>
        </li>
        <li class="socials__item">
          <a href="#" class="socials__link">
            <svg class="socials__icon" width="30" height="30">
              <use x="0" y="0" xlink:href="#icon-twitter"></use>
            </svg>
          </a>
        </li>
        <li class="socials__item">
          <a href="#" class="socials__link">
            <svg class="socials__icon" width="30" height="30">
              <use x="0" y="0" xlink:href="#icon-facebook"></use>
            </svg>
          </a>
        </li>
        <li class="socials__item">
          <a href="#" class="socials__link">
            <svg class="socials__icon" width="30" height="30">
              <use x="0" y="0" xlink:href="#icon-instagram"></use>
            </svg>
          </a>
        </li>
        <li class="socials__item">
          <a href="#" class="socials__link">
            <svg class="socials__icon" width="30" height="30">
              <use x="0" y="0" xlink:href="#icon-googleplus"></use>
            </svg>
          </a>
        </li>
      </ul>
    </section>
    <div class="page-footer__copyright">
      <p class="page-footer__text">© 2018 Алексей Истомин</p>
    </div>
  </div>
</footer>
<button class="back-to-top" id="back-to-top" type="button">
  <svg class="back-to-top__icon" width="20" height="20">
    <use x="0" y="0" xlink:href="#icon-arrow-top"></use>
  </svg>
</button>
<section class="search-popup search-popup--closed">
  <?php echo $search; ?>
</section>
<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#recurring-description').html('');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-cart').button('loading');
            },
            complete: function() {
                $('#button-cart').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

                    $('html, body').animate({ scrollTop: 0 }, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--

    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function() {
                $('#button-review').button('loading');
            },
            complete: function() {
                $('#button-review').button('reset');
            },
            success: function(json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
        grecaptcha.reset();
    });



    $(document).ready(function() {
        var hash = window.location.hash;
        if (hash) {
            var hashpart = hash.split('#');
            var  vals = hashpart[1].split('-');
            for (i=0; i<vals.length; i++) {
                $('div.options').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
                $('div.options').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
            }
        }
    })
    //--></script>

<script src="catalog/view/javascript/script.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const styles = ['catalog/view/theme/ishop/stylesheet/style.min.css'];
        styles.forEach((path) => {
            const link = document.createElement('link');
            link.rel = 'stylesheet';
            link.href = path;
            document.head.appendChild(link);
        });
    });
</script>
<script>
    tabby.init();
</script>
<script>
    var lightbox = new Lightbox();
    lightbox.load();
</script>
</body>

</html>

