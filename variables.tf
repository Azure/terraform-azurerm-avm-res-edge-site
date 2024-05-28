variable "resourceGroup" {
  description = "The resource group of the site."
}

variable "siteId" {
  type        = string
  description = "A unique identifier for the site."
}

variable "city" {
  type        = string
  default     = ""
  description = "The city of the site."
}

variable "companyName" {
  type        = string
  default     = ""
  description = "The company name of the site."
}

variable "contactName" {
  type        = string
  default     = " "
  description = "The contact name of the site."
}

variable "country" {
  type        = string
  default     = ""
  description = "The order country of the site."
}

variable "emailList" {
  type        = list(string)
  default     = []
  description = "A list of email addresses for the site."
}

variable "mobile" {
  type        = string
  default     = ""
  description = "The mobile phone number of the site."
}

variable "phone" {
  type        = string
  default     = ""
  description = "The phone number of the site."
}

variable "phoneExtension" {
  type        = string
  default     = ""
  description = "The phone extension of the site."
}

variable "postalCode" {
  type        = string
  default     = ""
  description = "The postal code of the site."
}

variable "stateOrProvince" {
  type        = string
  default     = ""
  description = "The state or province of the site."
}

variable "streetAddress1" {
  type        = string
  default     = ""
  description = "The first line of the street address of the site."
}

variable "streetAddress2" {
  type        = string
  default     = ""
  description = "The second line of the street address of the site."
}

variable "streetAddress3" {
  type        = string
  default     = ""
  description = "The third line of the street address of the site."
}

variable "zipExtendedCode" {
  type        = string
  default     = ""
  description = "The extended ZIP code of the site."
}
