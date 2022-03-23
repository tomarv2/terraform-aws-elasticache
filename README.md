<p align="center">
    <a href="https://github.com/tomarv2/terraform-aws-elasticache/actions/workflows/pre-commit.yml" alt="Pre Commit">
        <img src="https://github.com/tomarv2/terraform-aws-elasticache/actions/workflows/pre-commit.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-aws-elasticache" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-elasticache/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-elasticache" /></a>
    <a href="https://github.com/tomarv2/terraform-aws-elasticache/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-aws-elasticache" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

## Terraform module for [AWS Elasticache](https://registry.terraform.io/modules/tomarv2/elasticache/aws/latest)

####

> :arrow_right:  Terraform module for [Azure Cache for Redis](https://registry.terraform.io/modules/tomarv2/redis-cache/azure/latest)

> :arrow_right:  Terraform module for [Google Memorystore](https://registry.terraform.io/modules/tomarv2/memorystore/google/latest)


### Versions

- Module tested for Terraform 1.0.1.
- AWS provider version [3.74](https://registry.terraform.io/providers/hashicorp/aws/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-aws-elasticache/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-aws-elasticache" /></a> in your releases)

### Usage

#### Option 1:

```
terrafrom init
terraform plan -var='teamid=tryme' -var='prjid=project1'
terraform apply -var='teamid=tryme' -var='prjid=project1'
terraform destroy -var='teamid=tryme' -var='prjid=project1'
```
**Note:** With this option please take care of remote state storage

#### Option 2:

##### Recommended method (stores remote state in S3 using `prjid` and `teamid` to create directory structure):

- Create python 3.8+ virtual environment
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote --upgrade
```

- Set below environment variables:
```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_BUCKET_REGION=us-west-2
export TF_AWS_PROFILE=<profile from ~/.ws/credentials>
```

or

- Set below environment variables:
```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_BUCKET_REGION=us-west-2
export AWS_ACCESS_KEY_ID=<aws_access_key_id>
export AWS_SECRET_ACCESS_KEY=<aws_secret_access_key>
```

- Updated `examples` directory with required values.

- Run and verify the output before deploying:
```
tf -c=aws plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -c=aws apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:
```
tf -c=aws destroy -var='teamid=foo' -var='prjid=bar'
```

**Note:** Read more on [tfremote](https://github.com/tomarv2/tfremote)
```
terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 3.74"
    }
  }
}

provider "aws" {
  region = var.region
}

module "redis" {
  source = "../"

  deploy_redis                 = true
  deploy_redis_parameter_group = true

  security_group_ids = [module.security_group.security_group_id]
  # ----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "security_group" {
  source = "git::git@github.com:tomarv2/terraform-aws-security-group.git?ref=v0.0.6"

  deploy_security_group = true

  service_ports = [6379]
  teamid        = var.teamid
  prjid         = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.63 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_global"></a> [global](#module\_global) | git::git@github.com:tomarv2/terraform-global.git//aws | v0.0.1 |

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_parameter_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_subnet_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The Availability Zone for the cache cluster. If you want to create cache nodes in multi-az, use preferred\_availability\_zones instead. Default: System chosen Availability Zone. Changing this value will re-create the resource. | `string` | `null` | no |
| <a name="input_az_mode"></a> [az\_mode](#input\_az\_mode) | (Memcached only) Specifies whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region. Valid values for this parameter are single-az or cross-az, default is single-az. If you want to choose cross-az, num\_cache\_nodes must be greater than 1. | `string` | `null` | no |
| <a name="input_cache_nodes"></a> [cache\_nodes](#input\_cache\_nodes) | The initial number of cache nodes that the cache cluster will have. For Redis, this value must be 1. For Memcache, this value must be between 1 and 20. | `number` | `1` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Group identifier. ElastiCache converts this name to lowercase | `string` | `null` | no |
| <a name="input_cluster_mode_enabled"></a> [cluster\_mode\_enabled](#input\_cluster\_mode\_enabled) | Flag to enable/disable creation of a native redis cluster. `automatic_failover_enabled` must be set to `true`. Only 1 `cluster_mode` block is allowed | `bool` | `false` | no |
| <a name="input_deploy_redis"></a> [deploy\_redis](#input\_deploy\_redis) | Feature flag, true or false | `bool` | `true` | no |
| <a name="input_deploy_redis_parameter_group"></a> [deploy\_redis\_parameter\_group](#input\_deploy\_redis\_parameter\_group) | Feature flag, true or false | `bool` | `true` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | Name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached or redis. | `string` | `"redis"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Version of engine | `string` | `"5.0.6"` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Specifies the weekly time range for when maintenance on the cache cluster is performed. | `string` | `"mon:10:30-mon:11:30"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The compute and memory capacity of the nodes | `string` | `"cache.t2.micro"` | no |
| <a name="input_notification_topic_arn"></a> [notification\_topic\_arn](#input\_notification\_topic\_arn) | An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my\_sns\_topic. | `string` | `null` | no |
| <a name="input_parameter"></a> [parameter](#input\_parameter) | A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | The family of the ElastiCache parameter group | `string` | `"redis5.0"` | no |
| <a name="input_port"></a> [port](#input\_port) | The port number on which each of the cache nodes will accept connections. For Memcache the default is 11211, and for Redis the default port is 6379. | `number` | `6379` | no |
| <a name="input_prjid"></a> [prjid](#input\_prjid) | Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | One or more VPC security groups associated with the cache cluster | `string` | n/a | yes |
| <a name="input_snapshot_arns"></a> [snapshot\_arns](#input\_snapshot\_arns) | A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my\_bucket/snapshot1.rdb | `list(any)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | Number of days snapshot image will be retained | `number` | `5` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | Daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. Example: 05:00-09:00. | `string` | `""` | no |
| <a name="input_teamid"></a> [teamid](#input\_teamid) | Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_elasticache_parameter_group"></a> [aws\_elasticache\_parameter\_group](#output\_aws\_elasticache\_parameter\_group) | Elasticache Parameter Group |
| <a name="output_elasticache_cluster_address"></a> [elasticache\_cluster\_address](#output\_elasticache\_cluster\_address) | Elasticache Cluster address |
| <a name="output_elasticache_id"></a> [elasticache\_id](#output\_elasticache\_id) | Elasticache Id |

**Note:**

- For more information on redis: [link](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/cluster-create-determine-requirements.html#redis-cluster-configuration)
