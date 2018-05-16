<?=$header?>
<section class="breadcrumbs">
  <div class="container">
    <div class="breadcrumbs__inner">
      <h1 class="breadcrumbs__title">Желания</h1>
      <ul class="breadcrumbs__list">
        <li class="breadcrumbs__item">
          <a href="my-account/" class="breadcrumbs__link">Мой аккаунт</a>
        </li>
        <li class="breadcrumbs__item">
          <a href="wishlist/" class="breadcrumbs__link breadcrumbs__link--active">Желания</a>
        </li>
      </ul>
    </div>
  </div>
</section>
<section class="wishlist">
  <div id="content" class="container">
    <h2 class="wishlist__title"><?php echo $heading_title; ?></h2>
    <?php if ($products) { ?>
    <div class="table-responsive">
      <table class="table table-bordered table-hover">
        <thead>
        <tr>
          <td class="text-center"><?php echo $column_image; ?></td>
          <td class="text-left"><?php echo $column_name; ?></td>
          <td class="text-left"><?php echo $column_model; ?></td>
          <td class="text-right"><?php echo $column_stock; ?></td>
          <td class="text-right"><?php echo $column_price; ?></td>
          <td class="text-right"><?php echo $column_action; ?></td>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
          <td class="text-left"><?php echo $product['model']; ?></td>
          <td class="text-right"><?php echo $product['stock']; ?></td>
          <td class="text-right"><?php if ($product['price']) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
              <?php } ?>
            </div>
            <?php } ?></td>
          <td class="text-right"><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></button>
            <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
        </tr>
        <?php } ?>
        </tbody>
      </table>
    </div>
    <?php } else { ?>
    <p><?php echo $text_empty; ?></p>
    <?php } ?>
    <div class="buttons clearfix">
      <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
    </div>
    <?php echo $content_bottom; ?></div>
</section>
</div>
<?=$footer?>