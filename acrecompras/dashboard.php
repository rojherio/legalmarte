<?php
require_once ('acrecompras/template/head.php');
?>
<!-- BEGIN CONTAINER -->
<div class="page-container row-fluid">
  <!-- BEGIN SIDEBAR -->
  <?php
  require_once ('acrecompras/template/sidebar.php');
  ?>
  <!-- END SIDEBAR -->
  <!-- BEGIN PAGE CONTAINER-->
  <div class="page-content">
    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <div id="portlet-config" class="modal hide">
      <div class="modal-header">
        <button data-dismiss="modal" class="close" type="button"></button>
        <h3>Widget Settings</h3>
      </div>
      <div class="modal-body">Widget settings form goes here</div>
    </div>
    <div class="clearfix"></div>
    <div class="content sm-gutter">
      <div class="page-title"></div>
      <!-- BEGIN DASHBOARD TILES -->
      <div class="row"></div>
      <!-- END DASHBOARD TILES -->
      <div class="row">
        <!-- BEGIN WORLD MAP WIDGET - MAP -->
        <!-- END REALTIME SALES GRAPH -->
      </div>
      <div class="row">
        <!-- BEGIN BLOG POST BIG IMAGE WIDGET -->
        <!-- END ONLY VISIBLE FOR 1600 AND ABOVE -->
      </div>
      <div class="row"></div>
      <div class="row hidden-xlg"></div>
    </div>
  </div>
  <!-- BEGIN CHAT -->
  <?php
  require_once ('acrecompras/template/chat.php');
  ?>
  <!-- END CHAT -->
</div>
<!-- END CONTAINER -->
<?php
require_once ('acrecompras/template/footer.php');
?>