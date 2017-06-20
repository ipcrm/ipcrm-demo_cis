Example CIS Enforcement
-----------------------
Based On
- CIS Guide RHEL 7, v2.10 - 06-02-2016 (see docs folder)
- CIS Guide WINDOWS 2012R2, v2.2.0 - 04-28-2016 (see docs folder)

>
> THIS IS AN EXAMPLE - NOT DESIGNED FOR PRDOUCTION USE
>


To use:

```puppet
include ::demo_cis
```

To enable windows firewall helper:

```
demo_cis::controls::windows::server2012r2::cis_helpers::create_service_helper: true
```

To enable RHEL MOTD management:

```
demo_cis::controls::redhat::seven::cis_1_7_1_1::enable: true
```


