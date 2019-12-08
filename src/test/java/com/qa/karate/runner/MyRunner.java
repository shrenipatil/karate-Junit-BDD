package com.qa.karate.runner;


import org.junit.runner.RunWith;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

@RunWith(Karate.class)
@KarateOptions(features = "/Users/Inside/workspace/karate/src/test/java/com/qa/karate/features/user.feature",
				tags="@Test")
public class MyRunner {
	
}
