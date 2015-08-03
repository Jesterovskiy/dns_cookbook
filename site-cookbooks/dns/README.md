dns Cookbook
============
Create or Delete DNS record in Route53 service

Requirements
------------
- `Ruby`

Attributes
----------
#### dns::create
<table>
  <tr>
    <th>Instance Name</th>
    <th>Stack Name</th>
    <th>Value</th>
    <th>Type</th>
    <th>Zone ID</th>
    <th>AWS Access Key ID</th>
    <th>AWS Secret Access Key</th>
  </tr>
  <tr>
    <td>name of instance</td>
    <td>stack name</td>
    <td>DNS IP addresses, separated by comma</td>
    <td>DNS record type</td>
    <td>DNS zone ID</td>
    <td>access key id for AWS</td>
    <td>secret access key for AWS</td>
  </tr>
</table>

#### dns::delete
<table>
  <tr>
    <th>Instance Name</th>
    <th>Stack Name</th>
    <th>Type</th>
    <th>Zone ID</th>
    <th>AWS Access Key ID</th>
    <th>AWS Secret Access Key</th>
  </tr>
  <tr>
    <td>name of instance</td>
    <td>stack name</td>
    <td>DNS record type</td>
    <td>DNS zone ID</td>
    <td>access key id for AWS</td>
    <td>secret access key for AWS</td>
  </tr>
</table>

Usage
-----
#### dns::create
Just include `dns` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dns::create]"
  ]
}
```

#### dns::delete
Just include `dns` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dns::delete]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Jester
