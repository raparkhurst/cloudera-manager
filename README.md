# cloudera-manager Cookbook

A chef cookbook to install and do basic configuration of Cloudera's distribution of Hadoop for Linux.

I started work on an nginx proxy but it doesn't work currently -- please ignore (or fork and contribute)

## Requirements


### Platforms

- Ubuntu 14.04 -- fully tested
- Ubuntu 16.04 -- agent appears to not work but manager works


### Chef

- Chef 12.0 or later

### Cookbooks

- `users`
- `sudo`


```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cloudera-manager::master]",
    "recipe[cloudera-manager::nodes]"
  ],
  "normal": {
  	"cloudera_manager": {
  		"server_host": "<ip_address>"
  	}
  }
}
```

## Contributing

TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors:  Robert Parkhurst

