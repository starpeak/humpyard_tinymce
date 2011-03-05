/**
 * editor_plugin_src.js
 *
 * Copyright 2010, Humpyard
 * Released under LGPL License.
 *
 * License: http://tinymce.moxiecode.com/license
 * Contributing: http://tinymce.moxiecode.com/contributing
 */

(function() {
	tinymce.create('tinymce.plugins.HumpyardLinkPlugin', {
		init : function(ed, url) {
			this.editor = ed;

			// Register commands
			ed.addCommand('mceHumpyardLink', function() {
				var se = ed.selection;

				// No selection and not in link
				if (se.isCollapsed() && !ed.dom.getParent(se.getNode(), 'A'))
					return;

				ed.windowManager.open({
					file : (hyAdminPath ? '/' + hyAdminPath : '') + '/tiny_mce/link',
					width : 480 + parseInt(ed.getLang('hylink.delta_width', 0)),
					height : 400 + parseInt(ed.getLang('hylink.delta_height', 0)),
					inline : 1
				}, {
					plugin_url : url
				});
			});

			// Register buttons
			ed.addButton('link', {
				title : 'hylink.link_desc',
				cmd : 'mceHumpyardLink'
			});

			ed.addShortcut('ctrl+k', 'hylink.hylink_desc', 'mceHumpyardLink');

			ed.onNodeChange.add(function(ed, cm, n, co) {
				cm.setDisabled('link', co && n.nodeName != 'A');
				cm.setActive('link', n.nodeName == 'A' && !n.name);
			});
		},

		getInfo : function() {
			return {
				longname : 'Humpyard link',
				author : 'Sven G. Brönstrup',
				authorurl : 'http://humpyard.org',
				infourl : 'http://humpyard.org',
				version : tinymce.majorVersion + "." + tinymce.minorVersion
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('hylink', tinymce.plugins.HumpyardLinkPlugin);
})();