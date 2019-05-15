Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMVQ57TAKGQE7UM4ARA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D5E1EABD
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 11:13:24 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id q82sf752156oif.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 02:13:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557911603; cv=pass;
        d=google.com; s=arc-20160816;
        b=NbuxF6MTHLewZUfOIRROve7T2eevCkQ2mI3g0ocDnhcbWl55T/uTcB/qXpzBr8kKLK
         XnSfhis8/vwlguAanC3WOmiCKqft/aOImydkfU2+qI6g8p3EUJK0wC4LRkb12K8a1m9q
         ZNzOS59dwv1h256kaXuUxLw7zKEfPi94DA28mzQoB2wcJALv2pRhK5N9oHTbkGlQqOHu
         EoDEBaKtUnv88HaEU90Zs3B0awvKJPXToLai0nIjKOQzZcV4qN4EZ9XI2FZOHhraZAc7
         U3DKB96LSF6R5gHqxdyVTOdLuLcLxNXEUCOLSuOdcmRXVEMyRf4fGDuHs8Z95kPNdEQU
         M7kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:sender:dkim-signature;
        bh=vmhcXLjhLObJQScFMkiDh9n6/yVMyuoL13rWvmBEPkM=;
        b=QdpwOEXiS2+Y/m10MTCmIDFdCN/Qgj+OalxJHGOfzambOQ9+9/Uh7oxh8qi7LSpAah
         sjfwlu9zUcunacSIMilellsOXBYAAypyW07mMq3in9FmaHlPek1lsOgRPoheGQupV84D
         +Exf1aBuxMs46slrqwFqEgbnrb2rKlYV8QyNZmZESHXfVc3KlBAtQhfgsEHtxC/OHkLz
         1/EDGM2uwxPkLinwMk5JKctVEg4oxFBWLLwDs6UIuA7Ub4DRwUxbXtOWoLFIoKEeTVmL
         SRSUiJI1nu4/VvF0CspHB1m8Wc7IRI5sl21Jgyy3RiwNckbICt8+PTzdNXxr62OwWdk7
         nzdQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NLfYxCJg;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vmhcXLjhLObJQScFMkiDh9n6/yVMyuoL13rWvmBEPkM=;
        b=gvaUgFi6PFIvult+k7+7yA5xKmDeFMCOe9qdjv9jloLxaH2WNb4qfoLL8rVmLjFAZp
         vlhnrdFpynls+i5z3VriVeTlqu4D0VuDb09O/8NRd0ocfv2oqWNLKiEE9+z7CXG5ttGL
         J07pcMKCX9EpEFjurqLKI4wcrMHaSPwyWcAMDOqxpI0Ve9Of0335JMJUeBdMqpVtaL2n
         nHLDZobvAzW78LnYfCZoaCl9XG9ZcF32FxhAQP1/6V+yXF9wooQJemJQANY3wYBi9o3v
         PlVVg2A7ES9fltsMp2FvavXxRexTuT4WoK3ugpkaOeJleizJYE7glL7/LXFebWrJQE1E
         YRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vmhcXLjhLObJQScFMkiDh9n6/yVMyuoL13rWvmBEPkM=;
        b=ni9AsX0at/oEJjdlF8p8H151FDt0UQxy/ehSPYG/75jvcEH2ciBhR2hcjOx9JrJqNy
         brx/6hhMFVM5kLf7M/tku1q3vgJRYPKlP9KIUjV2Pe4ibh6O3aowgsoZK53puw425gRu
         pN3ni6C5WU2onjqZHbAUrxRwZopM/xOMfr1XsF9wwRw7ezCl6O3T5aGcDbIrEZnGVWdb
         fADxSH+cotzzmc8QpdXYPou1JYpXTFM8NoAAzEVfVqA85zNKhMfczlBTrCE2qXJXPuxi
         o5K+x3cACOcmb5xqHrjHbzYWvfKNbltVWrvB+pqcG2oLGN2pndM3cPhfgzahZImmvZya
         zUmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXgFmyrC95XdT36G2EDceReOtxiJuL/+ZgDSB82t+asfUs3G3Jm
	NsFtw/9CVhQo5hqq/J57uWA=
X-Google-Smtp-Source: APXvYqwsyABMEZVfCulxwOUrSuZAZf2+skHIFemPV77iXGfpW9pg0vMWK7nadqgZEASDlruYyuD89Q==
X-Received: by 2002:a9d:6543:: with SMTP id q3mr46487otl.370.1557911603337;
        Wed, 15 May 2019 02:13:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:63da:: with SMTP id e26ls306013otl.14.gmail; Wed, 15 May
 2019 02:13:22 -0700 (PDT)
X-Received: by 2002:a9d:664e:: with SMTP id q14mr6283326otm.8.1557911602672;
        Wed, 15 May 2019 02:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557911602; cv=none;
        d=google.com; s=arc-20160816;
        b=f2d528c39NaEF6y1hqD8wHk8kLO8vhdUxPf4Z1RCuPyEGDEm/KNKkzNg5jrIEFjsW1
         0n92kAGEvybONudAZzc2lfKT5l75QIgEBoUcGXXbfinJ6JywwJcpmJ/zvnWBmFh0m5/z
         W7KrPHy8TjnbwdenbF43DXjcINVzK8R+wNBxxRCpNv5vH8ll2OZLX/C9q37vTdodjafa
         fA9ws4XxJ/zm7dJN0KzECahNepnXa5mhFMJt+4VBZWr3iy3A/q4bVQwOOeGYMmxTFsLb
         SfDgtL2pIBoi0UmBiMWY9+LTSHcfHG9HTKO9fnb+9d3cZ8xuOqGLn5qiuclAJWnEwhZe
         /Jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=NDFgSrR2u8Nk4tgepFdVx88bbotXUO3WxZ6ZTeLv3kM=;
        b=CV23I7NJNhYpgHbRK9H3/w3/LhIaham05APIaXkqJTFoesPVE0f2pa/v3oEs+NnCRD
         kpndXZvvGHM0rknDdOMTkx1lsvpJecSoStdH57p5zP/sIGt08QCtin6UgMPtSp0GYxii
         rCRjhMcqOirinHHZk9W6TW9hyye+rYvO3VxbAWx5H3gxD49VRfnSX//zf7THzF7qpS8c
         zC0O/gRrOO8lJ3/7+PHfC0GJ6xy8PM7m/fMLVUUjKvXhLhb8DMLzXP8UmkrZCkFM37J/
         CtiwCuOCPmexYBeEhPwsFXSuclFrY5X9eYSdB60IsOAjMvQu+kxSZ3laRLyyrZ7qU8jc
         jLEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NLfYxCJg;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-7.smtp.github.com (out-7.smtp.github.com. [192.30.252.198])
        by gmr-mx.google.com with ESMTPS id f8si92198oia.0.2019.05.15.02.13.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 02:13:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) client-ip=192.30.252.198;
Date: Wed, 15 May 2019 02:13:22 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/7fa3f9-f27a6e@github.com>
Subject: [siemens/jailhouse] fe7ec7: Documentation: x86: test-device: document
 the test...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=NLfYxCJg;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.198 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/coverity_scan

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
jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/7fa3f9-f27a6e=
%40github.com.
For more options, visit https://groups.google.com/d/optout.
