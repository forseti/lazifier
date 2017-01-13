[#macro dialect database="h2"]
[#compress]
	[#switch database]
		[#case "h2"]
			org.hibernate.dialect.H2Dialect
	     	[#break]
		[#case "hsql"]
	    	org.hibernate.dialect.HSQLDialect
	     	[#break]
	    [#case "postgresql"]
	    	org.hibernate.dialect.PostgreSQLDialect
	    	[#break]
	[/#switch]
[/#compress]  
[/#macro]