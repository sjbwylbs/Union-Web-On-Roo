// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.gbd.union.domain;

import com.gbd.union.domain.MobileCityDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MobileCityIntegrationTest_Roo_IntegrationTest {
    
    declare @type: MobileCityIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: MobileCityIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: MobileCityIntegrationTest: @Transactional;
    
    @Autowired
    private MobileCityDataOnDemand MobileCityIntegrationTest.dod;
    
    @Test
    public void MobileCityIntegrationTest.testCountMobileCitys() {
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to initialize correctly", dod.getRandomMobileCity());
        long count = com.gbd.union.domain.MobileCity.countMobileCitys();
        org.junit.Assert.assertTrue("Counter for 'MobileCity' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void MobileCityIntegrationTest.testFindMobileCity() {
        com.gbd.union.domain.MobileCity obj = dod.getRandomMobileCity();
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to provide an identifier", id);
        obj = com.gbd.union.domain.MobileCity.findMobileCity(id);
        org.junit.Assert.assertNotNull("Find method for 'MobileCity' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'MobileCity' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void MobileCityIntegrationTest.testFindAllMobileCitys() {
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to initialize correctly", dod.getRandomMobileCity());
        long count = com.gbd.union.domain.MobileCity.countMobileCitys();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'MobileCity', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.gbd.union.domain.MobileCity> result = com.gbd.union.domain.MobileCity.findAllMobileCitys();
        org.junit.Assert.assertNotNull("Find all method for 'MobileCity' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'MobileCity' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void MobileCityIntegrationTest.testFindMobileCityEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to initialize correctly", dod.getRandomMobileCity());
        long count = com.gbd.union.domain.MobileCity.countMobileCitys();
        if (count > 20) count = 20;
        java.util.List<com.gbd.union.domain.MobileCity> result = com.gbd.union.domain.MobileCity.findMobileCityEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'MobileCity' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'MobileCity' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void MobileCityIntegrationTest.testFlush() {
        com.gbd.union.domain.MobileCity obj = dod.getRandomMobileCity();
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to provide an identifier", id);
        obj = com.gbd.union.domain.MobileCity.findMobileCity(id);
        org.junit.Assert.assertNotNull("Find method for 'MobileCity' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyMobileCity(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'MobileCity' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MobileCityIntegrationTest.testMerge() {
        com.gbd.union.domain.MobileCity obj = dod.getRandomMobileCity();
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to provide an identifier", id);
        obj = com.gbd.union.domain.MobileCity.findMobileCity(id);
        boolean modified =  dod.modifyMobileCity(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.gbd.union.domain.MobileCity merged = (com.gbd.union.domain.MobileCity) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'MobileCity' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MobileCityIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to initialize correctly", dod.getRandomMobileCity());
        com.gbd.union.domain.MobileCity obj = dod.getNewTransientMobileCity(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'MobileCity' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'MobileCity' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void MobileCityIntegrationTest.testRemove() {
        com.gbd.union.domain.MobileCity obj = dod.getRandomMobileCity();
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'MobileCity' failed to provide an identifier", id);
        obj = com.gbd.union.domain.MobileCity.findMobileCity(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'MobileCity' with identifier '" + id + "'", com.gbd.union.domain.MobileCity.findMobileCity(id));
    }
    
}
