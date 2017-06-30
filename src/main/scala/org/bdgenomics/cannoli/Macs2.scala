/**
 * Licensed to Big Data Genomics (BDG) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The BDG licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.bdgenomics.cannoli

import htsjdk.samtools.ValidationStringency
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.rdd.RDD
import org.bdgenomics.adam.rdd.ADAMContext._
import org.bdgenomics.adam.rdd.ADAMSaveAnyArgs
import org.bdgenomics.adam.rdd.fragment.{ FragmentRDD, InterleavedFASTQInFormatter }
import org.bdgenomics.adam.rdd.read.{ AlignmentRecordRDD, AnySAMOutFormatter }
import org.bdgenomics.formats.avro.AlignmentRecord
import org.bdgenomics.utils.cli._
import org.bdgenomics.utils.misc.Logging
import org.kohsuke.args4j.{ Argument, Option => Args4jOption }

object Macs2 extends BDGCommandCompanion {
  val commandName = "macs2"
  val commandDescription = "ADAM Pipe API wrapper for MACS2."

  def apply(cmdLine: Array[String]) = {
    new Macs2(Args4j[Macs2Args](cmdLine))
  }
}

class Macs2Args extends Args4jBase with ADAMSaveAnyArgs with ParquetArgs {
  // currently only adding support for one MACS2 function: callpeak 
  // -Gunjan

  // callpeak only has one required parameter: -t 
  // -Gunjan
  @Args4jOption(required = true, name = "-t", aliases = {"-treatment"}, usage = "Input treatment file. File can be in any supported format specified by –format option.")
  var inputPath: String = null

  // must be defined due to ADAMSaveAnyArgs, but unused here
  var sortFastqOutput: Boolean = false
}

/**
 * MACS2.
 */
class Macs2(protected val args: Macs2Args) extends BDGSparkCommand[Macs2Args] with Logging {
  val companion = Macs2
  val stringency = ValidationStringency.valueOf(args.stringency)

  def run(sc: SparkContext) {
    // not sure if FragmentRDD the right choice here
    // -Gunjan
    val input: FragmentRDD = sc.loadFragments(args.inputPath)

    // not sure about the right choice for formatter types since
    // MACS2 input file can be of many formats: “ELAND”, “BED”, “ELANDMULTI”, “ELANDEXPORT” 
    // “ELANDMULTIPET” (for pair-end tags), “SAM”, “BAM”, “BOWTIE”, “BAMPE” or “BEDPE”
    // -Gunjan
    
    //implicit val tFormatter =  
    //implicit val uFormatter =  

    val macs2Command = "macs2 callpeak -t " + args.inputPath

    // callpeak outputs many files
    // not sure how to use pipe and format output
  }
}
