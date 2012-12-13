package com.cebrian
import scala.xml._

/**
 * Created with IntelliJ IDEA.
 * User: tcebrian
 * Date: 13/12/12
 * Time: 16:52
 * To change this template use File | Settings | File Templates.
 */
object AtomToHtml {
  def main(args:Array[String]){

  }
}

class AtomToHtml {
  def run(filename:String) = {
    val blog = XML.load(filename) \\ "entry" \\ "content"
    blog.length
  }
}
