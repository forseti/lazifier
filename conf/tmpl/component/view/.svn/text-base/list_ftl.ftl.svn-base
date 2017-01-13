[#import "/macro/view.ftl" as view /]
[#noparse][#import "/spring.ftl" as spring /][/#noparse]
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>${list_ftl.suffix?cap_first} of ${entity_java.defaultName}</title>
	<link rel="stylesheet" href="[@view.url '/scripts/jquery/ui/jquery.ui.core.css' /]" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="[@view.url '/scripts/jquery/ui/theme/base/jquery.ui.theme.css' /]" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="[@view.url '/scripts/jquery/jquery.js' /]"></script>
	<script type="text/javascript" src="[@view.url '/scripts/jquery/ui/jquery.ui.core.js' /]"></script>
[#if default_css??]
	<link rel="stylesheet" href="[@view.url '/styles/local/${default_css.packageName?replace(".","/")}/${default_css.fileName}' /]" type="text/css" media="screen, projection" />
[/#if]
[#if default_js??]
	<script type="text/javascript" src="[@view.url '/scripts/local/${default_js.packageName?replace(".","/")}/${default_js.fileName}' /]"></script>
[/#if]
</head>
<body>
	[#noparse][[/#noparse]#if results?? && results?size > 0]
		<table class="dataTable" border="1" width="100%">
			<thead>
				<tr>
					<th>
						[#noparse][@spring.messageText '[/#noparse]${entity_java.defaultName}.${form.id.name}[#noparse]'[/#noparse], '${form.id.name}'[#noparse] /][/#noparse]
					</th>
	[#list form.inputs as input]
					<th>
						[#noparse][@spring.messageText '[/#noparse]${entity_java.defaultName}.${input.name}[#noparse]'[/#noparse], '${input.name}'[#noparse] /][/#noparse]
					</th>			
	[/#list]
	[#list form.checkboxes as checkbox]
					<th>
						[#noparse][@spring.messageText '[/#noparse]${entity_java.defaultName}.${checkbox.name}[#noparse]'[/#noparse], '${checkbox.name}'[#noparse] /][/#noparse]
					</th>
				</tr>
	[/#list]
			</thead>
			<tbody>
				[#noparse][[/#noparse]#list results as ${entity_java.defaultName}]
					<tr>
						<td>
	    					<a href="[@view.url '/${edit_ftl.packageName?replace(".","/")}' /]/${show_ftl.suffix}/[#noparse]$[/#noparse]{${entity_java.defaultName}.${form.id.name}}">					
								[#noparse]${[/#noparse]${entity_java.defaultName}.${form.id.name}}
							</a>
						</td>
	[#list form.inputs as input]
						<td>
							[#noparse]${[/#noparse]${entity_java.defaultName}.${input.name}}
						</td>
	[/#list]
	[#list form.checkboxes as checkbox]
						<td>
							[#noparse]${[/#noparse]${entity_java.defaultName}.${checkbox.name}?string}
						</td>
	[/#list]
					</tr>
				[#noparse][/#list][/#noparse]
			</tbody>
		</table>
	[#noparse]
	[#else]
		<span class="message">
			No data available.
		</span>
	[/#if]
	[/#noparse]
</body>
</html>