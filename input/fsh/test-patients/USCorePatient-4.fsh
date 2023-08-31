Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $v3-MaritalStatus = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus
Alias: $v2-0131 = http://terminology.hl7.org/CodeSystem/v2-0131

RuleSet: USCoreBirthSexExtension(valueCode)
* extension[+]
  * insert USCoreBirthSex
  * insert USCoreBirthSexCode({valueCode})

RuleSet: USCoreBirthSex
* url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"

RuleSet: USCoreBirthSexCode(valueCode)
* valueCode = {valueCode}

RuleSet: USCoreBirthTimeExtension2
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/patient-birthTime"
  * valueDateTime = "1974-12-25T14:35:45-05:00"
  
RuleSet: USCoreBirthTimeExtension(valueDateTime)
* extension
  * insert USCoreBirthTime
  * insert USCoreBirthTimeValue({valueDateTime})

RuleSet: USCoreBirthTime
* url = "http://hl7.org/fhir/StructureDefinition/patient-birthTime"

RuleSet: USCoreBirthTimeValue(valueDateTime)
* valueDateTime = {valueDateTime}

RuleSet: USCoreRace
* url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"

RuleSet: USCoreEthnicity
* url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"

RuleSet: USCoreRaceEthnicityCategory(code, display)
* extension[+]
  * url = "ombCategory"
  * valueCoding = urn:oid:2.16.840.1.113883.6.238{code} {display}
  
RuleSet: USCoreRaceEthnicityDetailed(code, display)
* extension[+]
  * url = "detailed"
  * valueCoding = urn:oid:2.16.840.1.113883.6.238{code} {display}
  
RuleSet: USCoreRaceEthnicityText(description)
* extension[+]
  * url = "text"
  * valueString = {description}
  
RuleSet: USCorePhone(code, value)
* system = #phone
* value = {value}
* use = {code}

RuleSet: USCoreName(use, last, first)
* use = {use}
* family = {last}
* given[+] = {first}


Instance: USCorePatient-4
InstanceOf: USCorePatientProfile
Usage: #example
//* meta.profile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
//* meta.profile[+] = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-patient"

/** extension[+]
  * insert USCoreRace
  * insert USCoreRaceEthnicityCategory(#2106-3, "White")
  * insert USCoreRaceEthnicityCategory(#1002-5, "American Indian or Alaska Native")
  * insert USCoreRaceEthnicityCategory(#2028-9, "Asian")
  * insert USCoreRaceEthnicityDetailed(#1586-7, "Shoshone")
  * insert USCoreRaceEthnicityDetailed(#2036-2, "Filipino")
  * insert USCoreRaceEthnicityDetailed(#1735-0, "Alaska Native")
  * insert USCoreRaceEthnicityText("Mixed")

* extension[+]
  * insert USCoreEthnicity
  * insert USCoreRaceEthnicityCategory(#2135-2, "Hispanic or Latino")
  * insert USCoreRaceEthnicityDetailed(#2184-0, "Dominican")
  * insert USCoreRaceEthnicityDetailed(#2148-5, "Mexican")
  * insert USCoreRaceEthnicityText("Hispanic or Latino")

* insert USCoreBirthSexExtension(#M)
*/
* identifier
  * use = #usual
  * type = $v2-0203#MR "Medical Record Number"
  * system = "urn:oid:1.2.36.146.595.217.0.1"
  * value = "12345678"
  * period.start = "2002-05-06"
  * assigner.display = "Acme Healthcare"
  
* active = true

* name
  * family = "du Marché"
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"       
      * valueString = "VV"
  * given = "Bénédicte"
* telecom[+]
  * system = #phone
  * value = "+33 (237) 998327"
* address
  * use = #home
  * type = #both
  * line = "534 Erewhon St"
  * city = "PleasantVille"
  * district = "Rainbow"
  * state = "VT"
  * postalCode = "3999"
  * period.start = "1974-12-25"
/* name[+]
  * insert USCoreName(#official, "Elizabeth", "Jennifer")
  //* given[+] = "James"

* name[+]
  * insert USCoreName(#usual, "Chalmers", "Jim")

/* name[+]
  * insert USCoreName(#maiden, "Windsor", "Peter")
  * given[+] = "James"
  * period.end = "2002"

* telecom[+]
  * insert USCorePhone(#work, "(02\) 5555 6473")
// * rank = 1
  
/* telecom[+]
  * insert USCorePhone(#mobile, "(03\) 3410 5613")
// * rank = 2
  
* telecom[+]
  * insert USCorePhone(#old, "(03\) 5555 8834")
  * period.end = "2014"
*/
* gender = #female

* birthDate = "1936-12-25"
  * insert USCoreBirthTimeExtension("1936-12-25T14:35:45-05:00")
  
* deceasedBoolean = false

/* address
  * use = #home
  * type = #both
  * text = "536 Erewhon St PeasantVille, Utah 84416"
  * line = "536 Erewhon St"
  * city = "PleasantVille"
  * district = "Rainbow"
  * state = "UT"
  * postalCode = "84416"
  * period.start = "1977-12-25"
*/ 
* maritalStatus = $v3-MaritalStatus#M
/* contact
  * relationship = $v2-0131#N
  * name
    * family = "du Marché"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix"
        * valueString = "VV"
    * given = "Bénédicte"
  * telecom[+]
    * system = #phone
    * value = "+33 (237) 998327"
  * address
    * use = #home
    * type = #both
    * line = "534 Erewhon St"
    * city = "PleasantVille"
    * district = "Rainbow"
    * state = "VT"
    * postalCode = "3999"
    * period.start = "1974-12-25"
  * gender = #female
  * period.start = "2012"
 */ 
* managingOrganization = Reference(Organization/example)

Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $loinc = http://loinc.org

Instance: example-height
InstanceOf: Observation
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/bodyheight"
* valueQuantity = 69.4 'in' "in" // Avg height according to Diasabled World
* code = $loinc#8302-2 "Body height"
* status = #final
* subject = Reference(Patient/USCorePatient-4)
* effectiveDateTime = "2023-02-28T00:00:00-00:00"
//* category = $observation-category#vital-signs "Vital Signs"

Instance: example-weight
InstanceOf: Observation
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/bodyweight"
* valueQuantity = 180.4 'lb' "lb"
* code = $loinc#29463-7 "Body Weight"
* status = #final
* subject = Reference(Patient/USCorePatient-4)
* effectiveDateTime = "2023-02-28T00:00:00-00:00"


/*Instance: blood-pressure
InstanceOf: Observation
Usage: #example
* meta.profile[0] = "http://hl7.org/fhir/StructureDefinition/bp"
* meta.profile[+] = "http://hl7.org/fhir/StructureDefinition/vitalsigns"
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* category.text = "Vital Signs"
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* code.text = "Blood pressure systolic and diastolic"
* subject = Reference(Patient/USCorePatient-4) "Amy Shaw"
* encounter.display = "GP Visit"
* effectiveDateTime = "1999-07-02"
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[=].code.text = "Systolic blood pressure"
* component[=].valueQuantity = 109 'mm[Hg]' "mmHg"
* component[+].code = $loinc#8462-4 "Diastolic blood pressure"
* component[=].code.text = "Diastolic blood pressure"
* component[=].valueQuantity = 44 'mm[Hg]' "mmHg"
*/

Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystems/v3-ActCode
Alias: $v3-Participant = http://terminology.hl7.org/CodeSystem/v3-ParticipationType
Alias: $cpt = http://www.ama-assn.org/go/cpt

Instance: encounter-outpatient-USCorePatient-4
InstanceOf: Encounter
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
* status = #finished
* class = $v3-ActCode#AMB "ambulatory"
* type = $cpt#99201
* subject = Reference(Patient/USCorePatient-4)

* participant
  * type[+] = $v3-Participant#DIS "discharger"
  * individual = Reference(Practitioner/order-provider-USCorePatient-4)
  
Instance: order-provider-USCorePatient-4
InstanceOf: Practitioner
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practioner"
* identifier[0]
  * system = "http://hl7.org.fhir/sid/us-npi"
  * value = "1821424433"
//* identifier[+]
  //* system = "www.acme.org/practioner"
 // * value = "53432"
* name[+]
  * family = "AGGARWAL"
  * given = "VAIBHAV"
  * suffix = "PharmD"

* telecom[+]
  * system = #phone
  * value = "718-416-5672"

* address[+]
  * line = "8914 115TH ST"
  * city = "RICHMOND HIL"
  * state = "NY"
  * postalCode = "114183135"
  * country = "US"
  
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-ver-status = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $sct = http://snomed.info/sct
Alias: $icd = http://hl7.org/fhir/sid/icd-10-cm

Instance: condition-parkinson
InstanceOf: Condition
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition"
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* code = $icd#G20 "Parkinson's disease"
* subject = Reference(Patient/USCorePatient-4)
* encounter = Reference(Encounter/encounter-outpatient-USCorePatient-4)
* onsetDateTime = "2012-05-24T00:00:00+00:00"
* recordedDate = "2012-05-24T00:00:00+00:00"

Alias: $rxnorm = http://www.nlm.nih.gov/research/umls/rxnorm

/*Instance: uscore-med2
InstanceOf: USCoreMedicationProfile
Usage: #example
* code = $rxnorm#92880 "Humulin N"
* code.text = "Humulin N"
*/
Alias: $dose-rate-type = http://terminology.hl7.org/CodeSystem/dose-rate-type

Instance: MedRequest-insulin
InstanceOf: MedicationRequest
Usage: #example
* status = #active
* intent = #order
* medicationCodeableConcept
  * coding[+]
    * system = "http://www.nlm.nih.gov/research/umls/rxnorm"
    * code = $rxnorm#1806006 "rotigotine Transdermal System [Neupro]"
    * display = "rotigotine Transdermal System [Neupro]"
  * text = "rotigotine Transdermal System [Neupro]"
* subject = Reference(Patient/USCorePatient-4)
* authoredOn = "2016-03-25T19:32:52-05:00"
* requester = Reference(Practitioner/order-provider-USCorePatient-4)
* dosageInstruction.text = "qhs"
  /* timing[+]
    * repeat[+]
      * frequency = 3
      * period = 1
      * periodUnit = #d
  * site = $sct#447964005
  * route = $sct#394899003 "oral administration of treatment"
  * doseAndRate[+]
    * type = $dose-rate-type#ordered "Ordered"
    * doseQuantity = 5 'ml' "ml"
* dispenseRequest.quantity = 100 'ml' "ml"
*/