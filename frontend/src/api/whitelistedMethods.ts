const whitelistedMethods = {
	'Insights Settings': {
		update_settings: 'update_settings',
		send_support_login_link: 'send_support_login_link',
	},
	'Insights Data Source': {
		enqueue_sync_tables: 'enqueue_sync_tables',
		get_tables: 'get_tables',
	},
	'Insights Table': {
		syncTable: 'sync_table',
		updateVisibility: 'update_visibility',
		getPreview: 'get_preview',
		update_column_type: 'update_column_type',
	},
}
export default function getWhitelistedMethods(doctype: string) {
	return whitelistedMethods[doctype as keyof typeof whitelistedMethods] || {}
}
