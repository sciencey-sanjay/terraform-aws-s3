test_bucket=input('bucket_name')
puts test_bucket
 
control 's3_test' do
describe aws_s3_bucket(test_bucket) do
  it { should exist }
end
end
