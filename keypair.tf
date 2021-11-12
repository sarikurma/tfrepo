resource "aws_key_pair" "tf_key_pair" {
  key_name   = "aws_key_tf"
  public_key = file("C:\\Users\\GNLN\\00_others\\00_keys\\pubkey-gari-test.pub")
}
