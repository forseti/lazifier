<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE urlrewrite PUBLIC "-//tuckey.org//DTD UrlRewrite 3.0//EN" "http://tuckey.org/res/dtds/urlrewrite3.0.dtd">
<urlrewrite default-match-type="regex">
	<rule>
		<from>^/images/(.*)$</from>
		<to>/images/$1</to>
	</rule>
	<rule>
		<from>^/scripts/(.*)$</from>
		<to>/scripts/$1</to>
	</rule>
	<rule>
		<from>^/styles/(.*)$</from>
		<to>/styles/$1</to>
	</rule>
	<rule>
		<from>^/(.*)/$</from>
		<to>/app/$1/${index_ftl.suffix}</to>
	</rule>
	<rule>
		<from>^/(.*)$</from>
		<to>/app/$1</to>
	</rule>
	<outbound-rule>
		<from>^/app/(.*)$</from>
		<to>/$1</to>
	</outbound-rule>	
</urlrewrite>