[#macro driver database="h2"]
[#compress]
	[#switch database]
		[#case "h2"]
			org.h2.Driver
			[#break]
		[#case "hsql"]
	    	org.hsqldb.jdbcDriver
	     	[#break]
	    [#case "postgresql"]
	    	org.postgresql.Driver
	    	[#break]
	[/#switch]
[/#compress]  
[/#macro]

[#macro url database="h2" name="db_name"]
[#compress]
	[#switch database]
		[#case "h2"]
			jdbc:h2:file:target/${name}
			[#break]
		[#case "hsql"]
	    	jdbc:hsqldb:file:target/${name}
	     	[#break]
	    [#case "postgresql"]
	    	jdbc:postgresql://localhost/${name}
	    	[#break]
	[/#switch]
[/#compress]
[/#macro]