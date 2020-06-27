# Define Groups
resource "aws_iam_group" "GodMode_On" {
  name = "GodMode_On"
}

# Attach policy to the group
resource "aws_iam_policy_attachment" "Gods_attach" {
  name = "Gods_attach"
  groups = [
    aws_iam_group.GodMode_On.name
  ]
  policy_arn = "arn:aws:iam:aws:policy/AdministratorAccess"
}

#Create users
resource "aws_iam_user" "God" {
  name = "God"
}

#Link the users to the groups
resource "aws_iam_group_membership" "GodMode_Users" {
  name = "GodMOde_Users"
  users = [
    aws_iam_user.God.name
  ]
  group = aws_iam_group.GodMode_On.name
}
