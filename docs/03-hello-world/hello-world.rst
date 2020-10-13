============================
Run the Hello World playbook
============================

The `hello_world.yml <https://github.com/PaloAltoNetworks/ansible-lab/blob/master/playbooks/hello_world.yml>`_
playbook will create the following address object:

.. figure:: hello-world-object.png

For more information, see the `panos_address_object module documentation <https://ansible-pan.readthedocs.io/en/latest/modules/panos_address_object_module.html>`_.

.. code-block:: bash

   ansible-playbook -i inventory hello_world.yml --ask-vault-pass

.. figure:: hello-world.png