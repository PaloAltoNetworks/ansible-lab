========================
Run the Upgrade playbook
========================

The ``upgrade.yml`` playbook automates a number of actions related to upgrading
the software on a PAN-OS device.  It will:

- Back up the configuration of a PAN-OS device locally.
- Download and install a new version of PAN-OS, then reboot the system.
- Polls to see when the firewall is ready again (this is actually the same as
  the ``check_ready.yml`` playbook).

For more information, see the documentation on the modules used:

- `panos_software <https://paloaltonetworks.github.io/pan-os-ansible/modules/panos_software.html>`_
- `panos_op <https://paloaltonetworks.github.io/pan-os-ansible/modules/panos_op.html>`_

.. literalinclude:: ../../playbooks/upgrade.yml

Run the playbook with ``ansible-playbook``:

.. code-block:: bash

   ansible-playbook -i inventory upgrade.yml --ask-vault-pass

Output:

.. figure:: upgrade.png

The download and installation of PAN-OS software can be observed using the
Tasks button in the bottom right corner of the firewall web UI. After the playbook has
completed, login again to the web UI of the firewall and it will show the upgrade to the
specified version was performed.

.. figure:: upgrade-complete.png
