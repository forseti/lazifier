<ehcache>
    <diskStore path="java.io.tmpdir"/>
    
    <defaultCache
        maxElementsInMemory="10000"
        eternal="false"
        overflowToDisk="true"
        timeToIdleSeconds="120"
        timeToLiveSeconds="120"
        diskPersistent="false"
        diskExpiryThreadIntervalSeconds="120"/>
</ehcache>