<?php

if ( ! defined( 'ABSPATH' ) ) exit;

class SMS_WP_Reboot
{
	function __construct ()
	{
		add_action( 'wp_enqueue_scripts', array( $this, 'scripts' ));
		add_action('admin_enqueue_scripts', array( $this, 'load_styles') );

		if (!is_admin()) {
			add_action('wp_enqueue_scripts', 'my_jquery_enqueue', 11);
		}
	}

	function load_styles ()
	{
		wp_enqueue_style('reboot.css', get_template_directory_uri() . '/reboot/reboot.css', false );
		wp_enqueue_style('admin.css', get_template_directory_uri() . '/custom-admin/admin.css', false );
		wp_enqueue_script('reboot.js', get_template_directory_uri() . '/custom-admin/admin.js', array(), '1.0.0', true);
	}
}

new SMS_WP_Reboot;