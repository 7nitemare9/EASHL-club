<?php if (!defined('IN_PHPBB')) exit; if ($this->_tpldata['DEFINE']['.']['CA_COMMENTS']) {  ?>


To change width of forum edit variable $CA_WIDTH below. Add "px" at the end if width is in pixels.
Examples of correct values: '100%', '90%', '1024px', '800px'

<?php } $this->_tpldata['DEFINE']['.']['CA_WIDTH'] = '100%'; if ($this->_tpldata['DEFINE']['.']['CA_COMMENTS']) {  ?>




Do not edit code below unless you know what you are doing.

<?php } $this->_tpldata['DEFINE']['.']['CA_BLOCK_START'] = '<div class="block-header"><span><span></span></span></div><div class="block-content"><div class="block-inner">'; $this->_tpldata['DEFINE']['.']['CA_BLOCK_END'] = '<div class="block-clear"></div></div></div><div class="block-footer"><span><span></span></span></div>'; $this->_tpldata['DEFINE']['.']['CA_PANEL_START'] = ''; $this->_tpldata['DEFINE']['.']['CA_PANEL_END'] = ''; $this->_tpldata['DEFINE']['.']['CA_CP_BLOCK_START'] = '<div class="block-header"><span><span></span></span></div><div class="block-content"><div class="block-inner">'; $this->_tpldata['DEFINE']['.']['CA_CP_BLOCK_END'] = '<div class="block-clear"></div></div></div><div class="block-footer"><span><span></span></span></div>'; $this->_tpldata['DEFINE']['.']['CA_TABLE_START'] = '<div class="block-header"><span><span></span></span></div><div class="block-content block-table">'; $this->_tpldata['DEFINE']['.']['CA_TABLE_END'] = '<div class="block-clear"></div></div><div class="block-footer"><span><span></span></span></div>'; $this->_tpldata['DEFINE']['.']['CA_POST_START'] = '<div class="block-header"><span><span></span></span></div><div class="block-content block-post"><div class="block-inner">'; $this->_tpldata['DEFINE']['.']['CA_POST_FIRST_START'] = '<div class="block-header"><span><span></span></span></div><div class="block-content block-post block-post-first"><div class="block-inner">'; $this->_tpldata['DEFINE']['.']['CA_POST_END'] = '<div class="block-clear"></div></div></div><div class="block-footer"><span><span></span></span></div>'; $this->_tpldata['DEFINE']['.']['CA_POST_PROFILE_START'] = '<div class="profile-block">'; $this->_tpldata['DEFINE']['.']['CA_POST_PROFILE_END'] = '</div>'; $this->_tpldata['DEFINE']['.']['CA_POST_PROFILE_EMPTY'] = '<div class="profile-block profile-block-empty">&nbsp;</div>'; $this->_tpldata['DEFINE']['.']['CA_TABLE_SPACING'] = '0'; ?>