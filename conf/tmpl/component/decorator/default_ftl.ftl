<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
[#noparse]
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>${title}</title>	
	<!-- Includes Emastic CSS Framework -->
	<link rel="stylesheet" href="${base}/styles/emastic/reset.css" type="text/css">
	<link rel="stylesheet" href="${base}/styles/emastic/grid.css" type="text/css">
	<link rel="stylesheet" href="${base}/styles/emastic/type.css" type="text/css">
	<!--[if IE]>
		<link rel="stylesheet" href="${base}/styles/emastic/ie.css" type="text/css">
	<![endif]-->
[/#noparse]
	<!-- Includes Public CSS settings -->
	<link rel="stylesheet" href="[#noparse]${base}[/#noparse]/styles/local/${public_css.fileName}" type="text/css" media="screen, projection">
[#noparse]
	${head}
</head>
<body>
	<div class="container">
		<div class="dl20">
			<br />
		</div>
		<div class="dl50">
			${body}
		</div>
	</div>
</body>
[/#noparse]
</html>