package com.cebrian

import org.scalatest.matchers.ShouldMatchers
import org.scalatest.Suite


/**
 * Created with IntelliJ IDEA.
 * User: tcebrian
 * Date: 13/12/12
 * Time: 16:53
 * To change this template use File | Settings | File Templates.
 */
class AtomToHtmlTest extends Suite with ShouldMatchers {

  def testEndToEnd(){
    val runner = new AtomToHtml
    val res = runner.run("src/test/scala/oilcrash-pretty.xml")
    res should be (25)
  }
}
