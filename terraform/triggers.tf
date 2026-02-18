resource "null_resource" "sendmail" {
  triggers = {
    config = filemd5("${path.module}/test.yaml")
  }

  provisioner "local-exec" {
    command = <<-EOT
      sendmail kfelix <<EOF
      To: kfelix
      Subject: Config Change - $(date '+%Y-%m-%d %H:%M:%S')

      The yaml config has changed and was applied.
      EOF
    EOT
  }
}
