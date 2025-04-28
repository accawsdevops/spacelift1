package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformIAMUsers(t *testing.T) {
	t.Parallel()

	// Define the terraform options
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../", // Path to your Terraform code
	})

	// Run terraform init and apply
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// Get the IAM User names from the outputs
	iamUser1Name := terraform.Output(t, terraformOptions, "iam_user1_name")
	iamUser2Name := terraform.Output(t, terraformOptions, "iam_user2_name")

	// Test that the IAM Users are created
	assert.NotEmpty(t, iamUser1Name)
	assert.NotEmpty(t, iamUser2Name)

	// Test that the users are named correctly
	assert.Equal(t, iamUser1Name, "terratest-user1")
	assert.Equal(t, iamUser2Name, "terratest-user2")

	// Output IAM User Info
	fmt.Printf("Created IAM User 1: %s\n", iamUser1Name)
	fmt.Printf("Created IAM User 2: %s\n", iamUser2Name)
}
