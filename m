Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB7PC37TAKGQEFBDFDAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73c.google.com (mail-qk1-x73c.google.com [IPv6:2607:f8b0:4864:20::73c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9261ABA7
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 12:12:14 +0200 (CEST)
Received: by mail-qk1-x73c.google.com with SMTP id i124sf10094142qkf.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 03:12:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557655933; cv=pass;
        d=google.com; s=arc-20160816;
        b=PEgwcX6xb8AXr/Q3HSTAE3T0V/WL7oTOLZH+bxA1SFk3sjwdIeQM333hF5/DHo+N/J
         OUJKASDF9gyhu41UEqycdo2LfKnYabeuAxLHIYPnfM4+JOCmog2JTQU5T9F/GfXSLOST
         IrSd3+qoGjoVEjUhASRNMaJZ0stA7/xfS7uMGwQPBkBbvblLpozxiUs6uTeyid06e0tB
         FiD1dlBHw/0FUFJav7dR1/JCHu+USEgwLuQRdeSs32H4jnTzHNrlIBFRKdtwZeZdd62t
         vyQCBrMMRMqs/nX2igUYUSBcE69jLbJeuZ1hMlZjfWgaNr55tPAZjuomkWCICMJ7VVCO
         zzGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:sender:dkim-signature;
        bh=uvcPvU5u5Oxhh/L43ZNHp+gMtXekaqkw/9zK8CiAHDo=;
        b=jbjlCGoLd8Do36L3+pUVc/af8hC9HmkHcuyD78H6V3VR+TkyAdbTOQuFKb76wuZLf7
         Zk7xcIznA5kqALhsV39swMUTo1K6fibPbkF7NmFV1uUtAEtl/i9rh4dqUTynXWGLRpcm
         MLlDLC+nPWsorjqyHEGRFbVXM/bvjnqL1s50yJfeY0HFr+hQqCq7VObApKx7/5g8Y6Mt
         TgUCzmPf8AOVWakYLji93J5KoQApFpZgbn/2nvMZx6woT7HkwSEH+FIvDFenbcOslGh3
         BiCQyYLxYpu4qVCRO91ySOPKo2Zn8EI3PzWizcd7aFNTu80d3hFyItu7V4XYcQrla82J
         jBLw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="wjZ22W/4";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uvcPvU5u5Oxhh/L43ZNHp+gMtXekaqkw/9zK8CiAHDo=;
        b=bYIunVdmTGQiXDF7lEuoqw0Uxfwm+/TNyNuAiM1OKFGamZ1zgOFRCqz3uiMNTFXGdI
         ToeT0+hn/rHwPPReSyD7gwJMxN/mYT8h/sZRqYbMd00uJ8jjuoUgRzoNV5l4FNC744D1
         nPLwQNnyMO+zP1dUPv0n1TjHH5GbZWhZCa8IyNxvkzm8wJIPmFB9Xl8f0a0gtG2g3oHf
         49u1dtyWt2YuPu1r4h4sghckB9RfwEq2xaVPxr9wQt+TJNSz+Q/ut1mMSYCwApsKvtK0
         CbXzixdmffhGdEP5AmW9TsZSB6wfngiNgMlcRGgltNCIe69DdqTNRoWj8IRKNlo2vw/b
         8SWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uvcPvU5u5Oxhh/L43ZNHp+gMtXekaqkw/9zK8CiAHDo=;
        b=DKK3xxdUqEwO2zbb2FR7bPPxPmge6LqXCN7QZf7fJXa4LCDhjBwFiEQ9d9X6R256oX
         yYXGbdIlh0opPeC9SQW2805wDlWR6pRGhcU8ZYQ65ZiGHftak9qGj1U2JhBygo5hH4xH
         Wn7tHxKiqOGxfDO1qAJ7cqw5vbk8tajmeWYkYxgFW6wjWGqIvODVC7mCaZC63d4fFhmU
         zAkloY3MFaVfqlbtvweORYdpYzrbOmSpNiWKZAAlvPeQkOybtlcJDBUkQddT97YHY4Xl
         GRkD0D2+6889/rm/QGBtOiZIpSzzkty6Y5sVzmnepO9SVYZjq3wiOPO9SY/wNxTH5YWQ
         6ohA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWFrRftOPZGpiX74E7duCb91Yc39z7+0sXFX2PKUh9k0WqFQ7nm
	A9LBzubCSiK15jqETB7+81U=
X-Google-Smtp-Source: APXvYqy4ljnCojOvo25CRyjcPQs++51JC0HxqGaccq7UEBVQazi2lyE6DOYHMRn8kHGAwU9MwsG7MA==
X-Received: by 2002:ac8:66d3:: with SMTP id m19mr17961085qtp.359.1557655933251;
        Sun, 12 May 2019 03:12:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:9d45:: with SMTP id g66ls739466qke.9.gmail; Sun, 12 May
 2019 03:12:12 -0700 (PDT)
X-Received: by 2002:a37:34b:: with SMTP id 72mr16797284qkd.42.1557655932846;
        Sun, 12 May 2019 03:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557655932; cv=none;
        d=google.com; s=arc-20160816;
        b=kdzVRZ1wC9Ljg+vtL7xu1tUSnUlAMmYfCQni7lyz6GW7BO7LDkOto6bsMieYZX+RVK
         n/FC15Z4jVN1thEREetDGyGkuWxQGCtKiltjTvQV2uvSBPKxIh9oSAvq3fjBuLfOh8Cf
         xgOmbd1ldb91S/TqtA+fx9r862lVzjcIG519iR8g3gPvHkTCxd37w+uJdh+3Qj9+bBTy
         vaajMaxTtnA6c7TizX8RiRTy38W0FQx8tKgkHjCYeJNX2ZIFYNjQRE6xDbqE5hkSLrXe
         D4HGknyFH2gSCSM3bbuEEKt1TAeZ7qRYZCXWUjB24/p/uTfvRDEaA0rzRIA0UwjrDQfd
         361A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=0dOy4DhbHAbMGqwwNA0/jBkNEf1EbJzC6J5Niupl01E=;
        b=JP2H920m8DA4iSLlCljOo2sLuHzViqK4lE1Su+EYSINh1pi2rgoY7COMgxtqb02bo6
         dPVwfwt/vSSbA2UT/y28Er8iSrgWtPdFHXc4GwdGxjsEVH6/M0tvRMU5+Ka30JCWNFoV
         ylH23i/O6jeNvPmRcsah9Q9laBczgh7/BflLaMdlvuj0sI5+WFHf1yZmnxIOezKTACxl
         q7CsY1HyiJxbse7DfNeXa0Vx6osTr5aw6uP9jw7yMBTcHfgFESEvnSTV3bFYKdgnHkxt
         NPtE7Ce85+uCBqQeGfPb1+dARtqGsfCt9AHK86YuFHcQOTm+xYsQoCuLM9uW5HWLALip
         JXkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="wjZ22W/4";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id 45si1624433qtq.4.2019.05.12.03.12.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 03:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Date: Sun, 12 May 2019 03:12:12 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/7fa3f9-f27a6e@github.com>
Subject: [siemens/jailhouse] fe7ec7: Documentation: x86: test-device: document
 the test...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="wjZ22W/4";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

  Branch: refs/heads/next

  Home:   https://github.com/siemens/jailhouse

  Commit: fe7ec7cf9340cdc616bba017676f7a8092528a54

      https://github.com/siemens/jailhouse/commit/fe7ec7cf9340cdc616bba0176=
76f7a8092528a54

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-08 (Wed, 08 May 2019)



  Changed paths:

    M Documentation/hypervisor-configuration.md

    M hypervisor/arch/x86/test-device.c

    M inmates/tests/x86/mmio-access.c



  Log Message:

  -----------

  Documentation: x86: test-device: document the test-device



There was no documentation so far. Let's mention it in

hypervisor-configuration.md, and add some comments to the code.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 740b64fedf47a7a45d0850ea6e3b016e7a9d2cff

      https://github.com/siemens/jailhouse/commit/740b64fedf47a7a45d0850ea6=
e3b016e7a9d2cff

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M inmates/lib/x86/Makefile

    R inmates/lib/x86/hypercall.c

    M inmates/lib/x86/include/inmate.h

    M inmates/lib/x86/setup.c



  Log Message:

  -----------

  inmates: x86: AMD: use the correct vmmcall instruction



I silently broke AMD inmates a while ago.



In 4d6eb915ca78, I removed the call of hypercall_init() without

reintroducing it at the right location again. No one noticed so far, as

the bug (crash of the cell due to a wrong instruction) only happens on

AMD machines only if they use the virtual debugging console.



Instead of calling hypercall_init() somewhere inside printk, let's move

it to setup.c, as we now have a arch_init_early() routine, which is the

right place for these kind of initialisations.



Also remove X86_FEATURE_VMX, it was never used.



Fixes: 4d6eb915ca78e ("inmates: x86: Use virtual console as additional cons=
ole")

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

[Jan: also remove hypercall_init from inmate.h]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 809701153eb754a62891f580ae1d0ae5ca3932c5

      https://github.com/siemens/jailhouse/commit/809701153eb754a62891f580a=
e1d0ae5ca3932c5

  Author: Hakk=C4=B1 Kurumahmut <kurumahmut@gmail.com>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M pyjailhouse/sysfs_parser.py



  Log Message:

  -----------

  Scripts: Fix for Parsing DMAR Region under Reserved Section



While kernel command parameters are intel_iommu=3Don  intremap=3Don at

some machines, cat /proc/iomem shows DMAR region under reserved section.

This patch must be done for config creation to complete because of

generating DMAR region not found error although it exist. If this patch is

not apply, an error is throw by "config create" command whether

intel_iommu On or Off because "reserved" regions are currently excluded fro=
m

the generated config although DMAR region exists. Thus, DMAR under reserved

section must be parsed by parser.



Signed-off-by: Hakk=C4=B1 Kurumahmut <kurumahmut@gmail.com>

[Jan: adjust style according to pep8]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 710d89499782657538b4e270ad1175ff799dd65b

      https://github.com/siemens/jailhouse/commit/710d89499782657538b4e270a=
d1175ff799dd65b

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M configs/x86/e1000-demo.c

    M configs/x86/f2a88xm-hd3.c

    M configs/x86/imb-a180.c

    M configs/x86/linux-x86-demo.c

    M configs/x86/pci-demo.c

    M configs/x86/qemu-x86.c

    M include/jailhouse/cell-config.h

    A include/jailhouse/pci_defs.h



  Log Message:

  -----------

  pci, configs: unmystify magic constants



Some sugar for the guidance of the reader. Use speaking name instead of

hard-coded constants.



This patch was supported by:

$ git grep -l "\.id =3D 0x1"  | xargs sed -i 's/id =3D 0x1,/id =3D PCI_CAP_=
ID_PM,/'

$ git grep -l "\.id =3D 0x3"  | xargs sed -i 's/id =3D 0x3,/id =3D PCI_CAP_=
ID_VPD,/'

$ git grep -l "\.id =3D 0x5"  | xargs sed -i 's/id =3D 0x5,/id =3D PCI_CAP_=
ID_MSI,/'

$ git grep -l "\.id =3D 0x8"  | xargs sed -i 's/id =3D 0x8,/id =3D PCI_CAP_=
ID_HT,/'

$ git grep -l "\.id =3D 0x9"  | xargs sed -i 's/id =3D 0x9,/id =3D PCI_CAP_=
ID_VNDR,/'

$ git grep -l "\.id =3D 0xa"  | xargs sed -i 's/id =3D 0xa,/id =3D PCI_CAP_=
ID_DBG,/'

$ git grep -l "\.id =3D 0xd"  | xargs sed -i 's/id =3D 0xd,/id =3D PCI_CAP_=
ID_SSVID,/'

$ git grep -l "\.id =3D 0xf"  | xargs sed -i 's/id =3D 0xf,/id =3D PCI_CAP_=
ID_SECDEV,/'

$ git grep -l "\.id =3D 0x10" | xargs sed -i 's/id =3D 0x10,/id =3D PCI_CAP=
_ID_EXP,/'

$ git grep -l "\.id =3D 0x11" | xargs sed -i 's/id =3D 0x11,/id =3D PCI_CAP=
_ID_MSIX,/'

$ git grep -l "\.id =3D 0x12" | xargs sed -i 's/id =3D 0x12,/id =3D PCI_CAP=
_ID_SATA,/'

$ git grep -l "\.id =3D 0x13" | xargs sed -i 's/id =3D 0x13,/id =3D PCI_CAP=
_ID_AF,/'



Extended cap ids were manually replaced.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 822fd81f998248d2ef7b3147662fe9000f48871b

      https://github.com/siemens/jailhouse/commit/822fd81f998248d2ef7b31476=
62fe9000f48871b

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M include/jailhouse/pci_defs.h



  Log Message:

  -----------

  pci, config: add more magic extended caps constants



We will need them later, as the config generator might generate them.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: c6be9c5fb5867fd7b88e099a8dfdc2141ab8efae

      https://github.com/siemens/jailhouse/commit/c6be9c5fb5867fd7b88e099a8=
dfdc2141ab8efae

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M pyjailhouse/sysfs_parser.py



  Log Message:

  -----------

  pyjailhouse: sysfs_parser: rearrange ext PCI cap evaluation logic



Make it easier to read for now and required for upcoming changes.



No functional change.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: b71a700caf21ab59cb44333a043327175f15fd44

      https://github.com/siemens/jailhouse/commit/b71a700caf21ab59cb44333a0=
43327175f15fd44

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    A pyjailhouse/extendedenum.py



  Log Message:

  -----------

  pyjailhouse: implement a helper class ExtendedEnum



Pythons Enums have the restriction that they only allow instances of a

with qualified known values. Unknown values are not supported.



In case of PCI capabilities, there might be IDs that do not have

speaking names. In this case, we should use the raw representation.



This helper class provides similar features to Python's enums, but is

specialised for generating C definiton-like things.



For very easy usage in code, I want this 'Enum'-like type to be directly

accessible via attributes. This is generally no problem, but we need to mak=
e a

tiny rain dance in order to support both, python2 and python3. The

with_metaclass decorator can be removed once Python 2 is EOL or we decide t=
o

only support Python3.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: eee55f900948e5fe0c840ccfe2036444dd45bf7f

      https://github.com/siemens/jailhouse/commit/eee55f900948e5fe0c840ccfe=
2036444dd45bf7f

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M .gitignore

    M Kbuild

    M Makefile

    M pyjailhouse/sysfs_parser.py

    A scripts/gen_pci_defs.sh

    M tools/root-cell-config.c.tmpl



  Log Message:

  -----------

  pyjailhouse: let the generator produce speaking names for PCI caps



Definitions on C-side are in place, so let the generator produce those

definitions.



Therefore, we autogenerate pyjailhouse/pci_defs.py.



The generator will extract PCI_CAP_IDs with grep & sed, fill the template a=
nd

print the generated python file. The Makefile will redirect the output to t=
he

final destination.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

[Jan: moved pci_defs.py generation, refactored extended caps ID string]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 51858cbf72c96c11c9b7f0b0d247904d4561840f

      https://github.com/siemens/jailhouse/commit/51858cbf72c96c11c9b7f0b0d=
247904d4561840f

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M hypervisor/include/jailhouse/pci.h

    M hypervisor/ivshmem.c

    M hypervisor/pci.c



  Log Message:

  -----------

  pci: use new PCI_CAP_ID_ definitions from pci_defs.h



pci.h also defined two IDs for MSI and MSIX. Replace usages of these

definitions with the one defined in pci_defs.h.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f27a6ec96016ce84551be1c8dea1cd132a724935

      https://github.com/siemens/jailhouse/commit/f27a6ec96016ce84551be1c8d=
ea1cd132a724935

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M inmates/lib/x86/header-32.S

    M inmates/lib/x86/header.S

    A inmates/lib/x86/include/asm/regs.h



  Log Message:

  -----------

  inmates: x86: consolidate register definitions



More duplicate register definitions are upcoming, consolidate them

first.



No functional change.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





Compare: https://github.com/siemens/jailhouse/compare/7fa3f90dabab...f27a6e=
c96016

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/siemens/jailhouse/push/refs/heads/next/7fa3f9-f27a6e%40github=
.com.
For more options, visit https://groups.google.com/d/optout.
