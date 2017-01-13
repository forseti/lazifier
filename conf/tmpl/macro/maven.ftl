[#macro jdbc_dependency database="h2"]
	[#switch database]
		[#case "h2"]
				<jdbc.groupId>com.h2database</jdbc.groupId>
				<jdbc.artifactId>h2</jdbc.artifactId>
				<jdbc.version>1.2.121</jdbc.version>
	     	[#break]
		[#case "hsql"]
				<jdbc.groupId>hsqldb</jdbc.groupId>
				<jdbc.artifactId>hsqldb</jdbc.artifactId>
				<jdbc.version>1.8.0.7</jdbc.version>
	     	[#break]
	    [#case "postgresql"]
				<jdbc.groupId>postgresql</jdbc.groupId>
				<jdbc.artifactId>postgresql</jdbc.artifactId>
				<jdbc.version>8.3-603.jdbc4</jdbc.version>
	    	[#break]
	[/#switch]
[/#macro]