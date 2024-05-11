This contains my NixOS configuration:
* `base/` is for settings that I want across all machines.
* `workstation/` is for settings that I want on graphical workstations. Settings here MAY overwrite settings from `base/`.
* `hosts/` is for settings that I want on specific machines. Settings here MAY overwrite settings from `base/` and `workstation/`.

Modules in `hosts/` should import from one (or both) of those directories. `base/` and `workstation/` **should not refer to each other**, except maybe in documentation.
