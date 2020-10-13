========================
Run the Upgrade playbook
========================

The `upgrade.yml <https://github.com/PaloAltoNetworks/ansible-lab/blob/master/playbooks/upgrade.yml>`_
playbook automates a number of actions related to upgrading the software on a
PAN-OS device.  It will:

- Back up the configuration of a PAN-OS device locally.
- Download and install a new version of PAN-OS, then reboot the system.
- Polls to see when the firewall is ready again (this is actually the same as
  the ``check_ready.yml`` playbook).

For more information, see the documentation on the modules used:

- `panos_software <https://paloaltonetworks.github.io/pan-os-ansible/modules/panos_software.html>`_
- `panos_op <https://paloaltonetworks.github.io/pan-os-ansible/modules/panos_op.html>`_

.. code-block:: bash

   ansible-playbook -i inventory upgrade.yml --ask-vault-pass

.. figure:: upgrade.png

.. figure:: upgrade-complete.png
