Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBQ7KY7TAKGQELXTEVMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C916CEF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 23:14:45 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id 7sf9932716otj.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 14:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xH+bv/3Ywp1Gm3ShTHUs62opDH0Lx2+/fL3jeFP3aMI=;
        b=tBl4xv0//GTcr4oa1OmbeveFp1LtDfW7tHGj2xDx8doqWeb2wMr63K0WijrozlJoJG
         hzrL3dnIgpVUv32rnfVK1gSl7dk9EHYqcFLn3fRfbMDBkl5KDC9HGSId1zcZU5gYlqYS
         ucoU4NlGyZ2aD+2paNkUH6q1q2mjrtJsGOkYrkFdP8Qfxs//HnQPDavsvxMptJZzuWuX
         O4bonpm0JOK9jBOF/nG++wk78kA2blA5oYKznsU+O/QbrhHaFbVt40PGGn2aSzg9gqHf
         ET9YMtGIXoybqnOMZwAcYqTf/UqcJfKA1jI+PPeW49/kBLIrXW5q/CQsKdIH/h6g/bKj
         RdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xH+bv/3Ywp1Gm3ShTHUs62opDH0Lx2+/fL3jeFP3aMI=;
        b=BUF97Bdzz7w4+krMEXDJciUNSEmpgY5/dF837EsifAmUG6sL/deyP545FPuJOQnZx+
         zN4SARfWYa9Tl4/65AYCFRCpXEucZjayTrtgqMkcTpTapSooefVU6Q5cWp+39i8dOkKi
         7r4Uoeo6Zp3uKhqKEwH7LL/vD4dJlSfPW61k/EgqpdHB22HZqN6Es08rcmeIz/AgiOMI
         naX71yrOwNil0xZ4+sg3LpzafnoqTICBSr5TAUFqb0TsHXQbyNDyih22fMYkApeybD2k
         eJ98eJUkmB9v+APDHHVhWZa+WWtfAlK0LVdv/EV4h9NCRlqY0eVx1kAnjnfR6LSqz/rQ
         qA0A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWGKj85cDl0jFafFokkt/CAHYcONI1izuTrwm7Guipz3JyCee2c
	5ZbOeP678KgGjWTafOzGA70=
X-Google-Smtp-Source: APXvYqxgQOrgOnxyW8zW8M6yNntVJk/UEtEc5symDo2B7uprwdZRCEXkq7pFYbdTrAOSrgkHCwpt0w==
X-Received: by 2002:a05:6830:155a:: with SMTP id l26mr24873829otp.101.1557263683945;
        Tue, 07 May 2019 14:14:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:be41:: with SMTP id o62ls2566740oif.1.gmail; Tue, 07 May
 2019 14:14:43 -0700 (PDT)
X-Received: by 2002:aca:280e:: with SMTP id 14mr14590oix.7.1557263682542;
        Tue, 07 May 2019 14:14:42 -0700 (PDT)
Date: Tue, 7 May 2019 14:14:41 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
In-Reply-To: <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8_1101446795.1557263681602"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_8_1101446795.1557263681602
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan, Jeanne

@Jeanne

I prepared a solution about the problem. Please apply two patch for jailhou=
se/next branch. Or download attached file sysfs_parser.py.

I also sent sysconfig.c for your platform. When you use the new script, you=
 will produce a similar file.

Please test it.

Could you send us below command outputs?

sudo lspci -D
sudo lspci -Dtvvv
sudo lspci -Dkvvvnnxxx


@Jan

I have a question about the patch. assign_iommu_info and append_comment_inf=
o methods is running for PCI-PCI bridge primary and secondary bus,dev,fn.=
=20

I'm not sure it should work for the primary bus,dev,fn.

Example Device Scope:

01 0A 00 00 00 00 1C 07 00 00=20
01 0A 00 00 00 00 1C 07 00 02=20
01 0A 00 00 00 00 1C 07 00 04

It is running order

1.) 00:1C.07
2.) sec-bus:00.00
3.) 00:1C.07
4.) sec-bus:00.02=20
5.) 00:1C.07
6.) sec-bus:00.04=20

May be it is run for only secondary buses.

1.) sec-bus:00.00
2.) sec-bus:00.02=20
3.) sec-bus:00.04=20


---------------------------------------------------------------------------
[PATCH 1/2]

From aa9e7f0e25317d2f516da68b4163f9f08fc6c76d Mon Sep 17 00:00:00 2001
From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
Date: Tue, 7 May 2019 19:37:59 +0300
Subject: [PATCH 1/2] Scripts: Fix for Parsing DMAR Region under Reserved
 Section

 While kernel command parameters are intel_iommu=3Don  intremap=3Don at
 some machines, cat /proc/iomem shows DMAR region under reserved section.
 This patch must be done for config creation to complete because of
 generating DMAR region not found error although it exist. If this patch is
 not apply, an error is throw by "config create" command whether
 intel_iommu On or Off because "reserved" regions are currently excluded fr=
om
 the generated config although DMAR region exists. Thus, DMAR under reserve=
d
 section must be parsed by parser.

Signed-off-by: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
---
 pyjailhouse/sysfs_parser.py | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 46c95fc2..4f5da12e 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):
=20
=20
 def parse_iomem(pcidevices):
-    regions =3D IOMemRegionTree.parse_iomem_tree(
+    (regions, dmar_regions) =3D IOMemRegionTree.parse_iomem_tree(
         IOMemRegionTree.parse_iomem_file())
=20
     rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region =3D False
=20
     ret =3D []
-    dmar_regions =3D []
     for r in regions:
         append_r =3D True
         # filter the list for MSI-X pages
@@ -860,21 +859,21 @@ class IOMemRegionTree:
=20
         return root
=20
-    # find HPET regions in tree
+    # find specific regions in tree
     @staticmethod
-    def find_hpet_regions(tree):
+    def find_regions_by_name(tree, string):
         regions =3D []
=20
         for tree in tree.children:
             r =3D tree.region
             s =3D r.typestr
=20
-            if (s.find('HPET') >=3D 0):
+            if (s.find(string) >=3D 0):
                 regions.append(r)
=20
             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
-                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
+                regions.extend(IOMemRegionTree.find_regions_by_name(tree, =
string))
=20
         return regions
=20
@@ -882,6 +881,7 @@ class IOMemRegionTree:
     @staticmethod
     def parse_iomem_tree(tree):
         regions =3D []
+        dmar_regions =3D []
=20
         for tree in tree.children:
             r =3D tree.region
@@ -901,20 +901,23 @@ class IOMemRegionTree:
             ):
                 continue
=20
-            # generally blacklisted, unless we find an HPET behind it
+            # generally blacklisted, with a few exceptions
             if (s.lower() =3D=3D 'reserved'):
-                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
+                regions.extend(IOMemRegionTree.find_regions_by_name(tree, =
'HPET'))
+                dmar_regions.extend(IOMemRegionTree.find_regions_by_name(t=
ree, 'dmar'))
                 continue
=20
             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
-                regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
+                (temp_regions, temp_dmar_regions) =3D IOMemRegionTree.pars=
e_iomem_tree(tree)
+                regions.extend(temp_regions)
+                dmar_regions.extend(temp_dmar_regions)
                 continue
=20
             # add all remaining leaves
             regions.append(r)
=20
-        return regions
+        return regions, dmar_regions
=20
=20
 class IOMMUConfig:
--=20
2.17.1


---------------------------------------------------------------------------
[PATCH 2/2]

From d7f925b10f32a37b4595255afe8690abf50a4a3d Mon Sep 17 00:00:00 2001
From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
Date: Tue, 7 May 2019 23:25:14 +0300
Subject: [PATCH 2/2] Scrits: Fix for Unsupported DMAR Device Scope Structur=
e
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

 Currently DMAR parser does not support parsing secondary path info for PCI=
-PCI bridge that is "PCI Endpoint Device" type.
 For example: 8086:1d1e Patsburg PCI Express Root Port 8

 If the =E2=80=98Path=E2=80=99 field length is more than 2 bytes (N > 1), t=
he Device Scope
 Entry identifies a device behind one or more system software visible PCI-
 PCI bridges. Bus rebalancing actions by system software modifying bus
 assignments of the device=E2=80=99s parent bridge impacts the bus number p=
ortion
 of device=E2=80=99s requester-id.

 Please read VT-d Specification Chapter 8.3.1

Signed-off-by: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
---
 pyjailhouse/sysfs_parser.py | 113 ++++++++++++++++++++++--------------
 1 file changed, 70 insertions(+), 43 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 4f5da12e..9e5c08d1 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -194,12 +194,45 @@ def parse_madt():
     return ioapics
=20
=20
-def parse_dmar_devscope(f):
-    (scope_type, scope_len, id, bus, dev, fn) =3D \
-        struct.unpack('<BBxxBBBB', f.read(8))
-    if scope_len !=3D 8:
-        raise RuntimeError('Unsupported DMAR Device Scope Structure')
-    return (scope_type, scope_len, id, bus, dev, fn)
+def assign_iommu_info(flags, pcidevices, units, ioapics, scope_type, id, b=
us, dev, fn):
+    # PCI Endpoint Device
+    if scope_type =3D=3D 1:
+        assert not (flags & 1)
+        for d in pcidevices:
+            if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =3D=3D fn:
+                d.iommu =3D len(units) - 1
+                break
+    # PCI Sub-hierarchy
+    elif scope_type =3D=3D 2:
+        assert not (flags & 1)
+        for d in pcidevices:
+            if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =3D=3D fn:
+                (secondbus, subordinate) =3D \
+                    PCIPCIBridge.get_2nd_busses(d)
+                for d2 in pcidevices:
+                    if (
+                        d2.bus >=3D secondbus and
+                        d2.bus <=3D subordinate
+                    ):
+                        d2.iommu =3D len(units) - 1
+                break
+    # IOAPIC
+    elif scope_type =3D=3D 3:
+        ioapic =3D next(chip for chip in ioapics if chip.id =3D=3D id)
+        bdf =3D (bus << 8) | (dev << 3) | fn
+        for chip in ioapics:
+            if chip.bdf =3D=3D bdf:
+                raise RuntimeError('IOAPICs with identical BDF')
+        ioapic.bdf =3D bdf
+        ioapic.iommu =3D len(units) - 1
+
+
+def append_comment_info(comments, scope_type, bus, dev, fn):
+    if scope_type =3D=3D 1:
+        comments.append('PCI device: %02x:%02x.%x' %
+                        (bus, dev, fn))
+    else:
+        comments.append('DMAR parser could not decode device path')
=20
=20
 # parsing of DMAR ACPI Table
@@ -249,38 +282,22 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
                         d.iommu =3D len(units) - 1
             offset +=3D 16 - offset
             while offset < struct_len:
-                (scope_type, scope_len, id, bus, dev, fn) =3D\
-                    parse_dmar_devscope(f)
-                # PCI Endpoint Device
-                if scope_type =3D=3D 1:
-                    assert not (flags & 1)
-                    for d in pcidevices:
-                        if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =
=3D=3D fn:
-                            d.iommu =3D len(units) - 1
-                            break
-                # PCI Sub-hierarchy
-                elif scope_type =3D=3D 2:
-                    assert not (flags & 1)
+                (scope_type, scope_len) =3D struct.unpack('<BB', f.read(2)=
)
+
+                N =3D (int)((scope_len - 6) / 2) - 1
+
+                (id, starting_bus, starting_dev, starting_fn) =3D struct.u=
npack('<xxBBBB', f.read(6))
+
+                assign_iommu_info(flags, pcidevices, units, ioapics, scope=
_type, id, starting_bus, starting_dev, starting_fn)
+
+                while N !=3D 0:
+                    N-=3D1
+                    (secondary_dev, secondary_fn) =3D struct.unpack('<BB',=
 f.read(2))
                     for d in pcidevices:
-                        if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =
=3D=3D fn:
-                            (secondbus, subordinate) =3D \
-                                PCIPCIBridge.get_2nd_busses(d)
-                            for d2 in pcidevices:
-                                if (
-                                    d2.bus >=3D secondbus and
-                                    d2.bus <=3D subordinate
-                                ):
-                                    d2.iommu =3D len(units) - 1
+                        if d.bus =3D=3D starting_bus and d.dev =3D=3D star=
ting_dev and d.fn =3D=3D starting_fn:
+                            (secondbus, subordinate) =3D PCIPCIBridge.get_=
2nd_busses(d)
                             break
-                # IOAPIC
-                elif scope_type =3D=3D 3:
-                    ioapic =3D next(chip for chip in ioapics if chip.id =
=3D=3D id)
-                    bdf =3D (bus << 8) | (dev << 3) | fn
-                    for chip in ioapics:
-                        if chip.bdf =3D=3D bdf:
-                            raise RuntimeError('IOAPICs with identical BDF=
')
-                    ioapic.bdf =3D bdf
-                    ioapic.iommu =3D len(units) - 1
+                    assign_iommu_info(flags, pcidevices, units, ioapics, s=
cope_type, id, secondbus, secondary_dev, secondary_fn)
                 offset +=3D scope_len
=20
         # Reserved Memory Region Reporting Structure
@@ -292,13 +309,23 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
=20
             comments =3D []
             while offset < struct_len:
-                (scope_type, scope_len, id, bus, dev, fn) =3D\
-                    parse_dmar_devscope(f)
-                if scope_type =3D=3D 1:
-                    comments.append('PCI device: %02x:%02x.%x' %
-                                    (bus, dev, fn))
-                else:
-                    comments.append('DMAR parser could not decode device p=
ath')
+                (scope_type, scope_len) =3D struct.unpack('<BB', f.read(2)=
)
+
+                N =3D (int)((scope_len - 6) / 2) - 1
+
+                (id, starting_bus, starting_dev, starting_fn) =3D struct.u=
npack('<xxBBBB', f.read(6))
+
+                append_comment_info(comments, scope_type, starting_bus, st=
arting_dev, starting_fn)
+
+                while N !=3D 0:
+                    N-=3D1
+                    (secondary_dev, secondary_fn) =3D struct.unpack('<BB',=
 f.read(2))
+                    for d in pcidevices:
+                        if d.bus =3D=3D starting_bus and d.dev =3D=3D star=
ting_dev and d.fn =3D=3D starting_fn:
+                            (secondbus, subordinate) =3D PCIPCIBridge.get_=
2nd_busses(d)
+                            break
+
+                    append_comment_info(comments, scope_type, secondbus, s=
econdary_dev, secondary_fn)
                 offset +=3D scope_len
=20
             reg =3D MemRegion(base, limit, 'ACPI DMAR RMRR', comments)
--=20
2.17.1

---------------------------------------------------------------------------


Thanks.

HAKKI

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cda9daa8-fbe8-46fb-aaba-75ebd38e141e%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_8_1101446795.1557263681602
Content-Type: text/x-python; charset=US-ASCII; name=sysfs_parser.py
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=sysfs_parser.py
X-Attachment-Id: eee156a0-ffd5-4645-bc87-7217418f0eae
Content-ID: <eee156a0-ffd5-4645-bc87-7217418f0eae>

#
# Jailhouse, a Linux-based partitioning hypervisor
#
# Copyright (c) Siemens AG, 2014-2017
# Copyright (c) Valentine Sinitsyn, 2014-2015
#
# Authors:
#  Henning Schild <henning.schild@siemens.com>
#  Jan Kiszka <jan.kiszka@siemens.com>
#  Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
#
# This work is licensed under the terms of the GNU GPL, version 2.  See
# the COPYING file in the top-level directory.
#
# This script should help to create a basic jailhouse configuration file.
# It needs to be executed on the target machine, where it will gather
# information about the system. For more advanced scenarios you will have
# to change the generated C-code.


import struct
import os
import fnmatch

root_dir = "/"

def set_root_dir(dir):
    global root_dir
    root_dir = dir

inputs = {
    'files': set(),
    'files_opt': set(),
    'files_intel': set(),
    'files_amd': set()
}

# required files
inputs['files'].add('/proc/iomem')
inputs['files'].add('/proc/cpuinfo')
inputs['files'].add('/proc/cmdline')
inputs['files'].add('/proc/ioports')
inputs['files'].add('/sys/bus/pci/devices/*/config')
inputs['files'].add('/sys/bus/pci/devices/*/resource')
inputs['files'].add('/sys/devices/system/cpu/cpu*/uevent')
inputs['files'].add('/sys/firmware/acpi/tables/APIC')
inputs['files'].add('/sys/firmware/acpi/tables/MCFG')
# optional files
inputs['files_opt'].add('/sys/class/dmi/id/product_name')
inputs['files_opt'].add('/sys/class/dmi/id/sys_vendor')
inputs['files_opt'].add('/sys/class/tty/*/iomem_base')
inputs['files_opt'].add('/sys/class/tty/*/iomem_reg_shift')
inputs['files_opt'].add('/sys/class/tty/*/io_type')
inputs['files_opt'].add('/sys/class/tty/*/port')
inputs['files_opt'].add('/sys/devices/jailhouse/enabled')
# platform specific files
inputs['files_intel'].add('/sys/firmware/acpi/tables/DMAR')
inputs['files_amd'].add('/sys/firmware/acpi/tables/IVRS')


def check_input_listed(name, optional=False):
    set = inputs['files_opt']
    if optional is False:
        set = inputs['files']
        cpuvendor = get_cpu_vendor()
        if cpuvendor == 'GenuineIntel':
            set = set.union(inputs['files_intel'])
        elif cpuvendor == 'AuthenticAMD':
            set = set.union(inputs['files_amd'])

    for file in set:
        if fnmatch.fnmatch(name, file):
            return True
    raise RuntimeError('"' + name + '" is not a listed input file')


def input_open(name, mode='r', optional=False):
    check_input_listed(name, optional)
    try:
        f = open(root_dir + name, mode)
    except Exception as e:
        if optional:
            return open("/dev/null", mode)
        raise e
    return f


def input_listdir(dir, wildcards):
    for w in wildcards:
        check_input_listed(os.path.join(dir, w))
    dirs = os.listdir(root_dir + dir)
    dirs.sort()
    return dirs


def parse_iomem(pcidevices):
    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(
        IOMemRegionTree.parse_iomem_file())

    rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
    add_rom_region = False

    ret = []
    for r in regions:
        append_r = True
        # filter the list for MSI-X pages
        for d in pcidevices:
            if d.msix_address >= r.start and d.msix_address <= r.stop:
                if d.msix_address > r.start:
                    head_r = MemRegion(r.start, d.msix_address - 1,
                                       r.typestr, r.comments)
                    ret.append(head_r)
                if d.msix_address + d.msix_region_size < r.stop:
                    tail_r = MemRegion(d.msix_address + d.msix_region_size,
                                       r.stop, r.typestr, r.comments)
                    ret.append(tail_r)
                append_r = False
                break
        # filter out the ROMs
        if (r.start >= rom_region.start and r.stop <= rom_region.stop):
            add_rom_region = True
            append_r = False
        # filter out and save DMAR regions
        if r.typestr.find('dmar') >= 0:
            dmar_regions.append(r)
            append_r = False
        if append_r:
            ret.append(r)

    # add a region that covers all potential ROMs
    if add_rom_region:
        ret.append(rom_region)

    # newer Linux kernels will report the first page as reserved
    # it is needed for CPU init so include it anyways
    if (ret[0].typestr == 'System RAM' and ret[0].start == 0x1000):
        ret[0].start = 0

    return ret, dmar_regions


def parse_pcidevices():
    int_src_cnt = 0
    devices = []
    caps = []
    basedir = '/sys/bus/pci/devices'
    list = input_listdir(basedir, ['*/config'])
    for dir in list:
        d = PCIDevice.parse_pcidevice_sysfsdir(basedir, dir)
        if d is not None:
            if len(d.caps) > 0:
                duplicate = False
                # look for duplicate capability patterns
                for d2 in devices:
                    if d2.caps == d.caps:
                        # reused existing capability list, but record all users
                        d2.caps[0].comments.append(str(d))
                        d.caps_start = d2.caps_start
                        duplicate = True
                        break
                if not duplicate:
                    d.caps[0].comments.append(str(d))
                    d.caps_start = len(caps)
                    caps.extend(d.caps)
            int_src_cnt += max(d.num_msi_vectors, d.num_msix_vectors)
            devices.append(d)
    return (devices, caps, int_src_cnt)


def parse_madt():
    f = input_open('/sys/firmware/acpi/tables/APIC', 'rb')
    signature = f.read(4)
    if signature != b'APIC':
        raise RuntimeError('MADT: incorrect input file format %s' % signature)
    (length,) = struct.unpack('<I', f.read(4))
    f.seek(44)
    length -= 44
    ioapics = []

    while length > 0:
        offset = 0
        (struct_type, struct_len) = struct.unpack('<BB', f.read(2))
        offset += 2
        length -= struct_len

        if struct_type == 1:
            (id, address, gsi_base) = struct.unpack('<BxII', f.read(10))
            offset += 10
            ioapics.append(IOAPIC(id, address, gsi_base))

        f.seek(struct_len - offset, os.SEEK_CUR)

    f.close()
    return ioapics


def assign_iommu_info(flags, pcidevices, units, ioapics, scope_type, id, bus, dev, fn):
    # PCI Endpoint Device
    if scope_type == 1:
        assert not (flags & 1)
        for d in pcidevices:
            if d.bus == bus and d.dev == dev and d.fn == fn:
                d.iommu = len(units) - 1
                break
    # PCI Sub-hierarchy
    elif scope_type == 2:
        assert not (flags & 1)
        for d in pcidevices:
            if d.bus == bus and d.dev == dev and d.fn == fn:
                (secondbus, subordinate) = \
                    PCIPCIBridge.get_2nd_busses(d)
                for d2 in pcidevices:
                    if (
                        d2.bus >= secondbus and
                        d2.bus <= subordinate
                    ):
                        d2.iommu = len(units) - 1
                break
    # IOAPIC
    elif scope_type == 3:
        ioapic = next(chip for chip in ioapics if chip.id == id)
        bdf = (bus << 8) | (dev << 3) | fn
        for chip in ioapics:
            if chip.bdf == bdf:
                raise RuntimeError('IOAPICs with identical BDF')
        ioapic.bdf = bdf
        ioapic.iommu = len(units) - 1


def append_comment_info(comments, scope_type, bus, dev, fn):
    if scope_type == 1:
        comments.append('PCI device: %02x:%02x.%x' %
                        (bus, dev, fn))
    else:
        comments.append('DMAR parser could not decode device path')


# parsing of DMAR ACPI Table
# see Intel VT-d Spec chapter 8
def parse_dmar(pcidevices, ioapics, dmar_regions):
    f = input_open('/sys/firmware/acpi/tables/DMAR', 'rb')
    signature = f.read(4)
    if signature != b'DMAR':
        raise RuntimeError('DMAR: incorrect input file format %s' % signature)
    (length,) = struct.unpack('<I', f.read(4))
    f.seek(48)
    length -= 48
    units = []
    regions = []

    while length > 0:
        offset = 0
        (struct_type, struct_len) = struct.unpack('<HH', f.read(4))
        offset += 4
        length -= struct_len

        # DMA Remapping Hardware Unit Definition
        if struct_type == 0:
            (flags, segment, base) = struct.unpack('<BxHQ', f.read(12))
            if segment != 0:
                raise RuntimeError('We do not support multiple PCI segments')
            if len(units) >= 8:
                raise RuntimeError('Too many DMAR units. '
                                   'Raise JAILHOUSE_MAX_IOMMU_UNITS.')
            size = 0
            for r in dmar_regions:
                if base == r.start:
                    size = r.size()
            if size == 0:
                raise RuntimeError('DMAR region size cannot be identified.\n'
                                   'Target Linux must run with Intel IOMMU '
                                   'enabled.')
            if size > 0x3000:
                raise RuntimeError('Unexpectedly large DMAR region.')
            units.append(IOMMUConfig({
                'base_addr': base,
                'mmio_size': size
            }))
            if flags & 1:
                for d in pcidevices:
                    if d.iommu is None:
                        d.iommu = len(units) - 1
            offset += 16 - offset
            while offset < struct_len:
                (scope_type, scope_len) = struct.unpack('<BB', f.read(2))

                N = (int)((scope_len - 6) / 2) - 1

                (id, starting_bus, starting_dev, starting_fn) = struct.unpack('<xxBBBB', f.read(6))

                assign_iommu_info(flags, pcidevices, units, ioapics, scope_type, id, starting_bus, starting_dev, starting_fn)

                while N != 0:
                    N-=1
                    (secondary_dev, secondary_fn) = struct.unpack('<BB', f.read(2))
                    for d in pcidevices:
                        if d.bus == starting_bus and d.dev == starting_dev and d.fn == starting_fn:
                            (secondbus, subordinate) = PCIPCIBridge.get_2nd_busses(d)
                            break
                    assign_iommu_info(flags, pcidevices, units, ioapics, scope_type, id, secondbus, secondary_dev, secondary_fn)
                offset += scope_len

        # Reserved Memory Region Reporting Structure
        if struct_type == 1:
            f.seek(8 - offset, os.SEEK_CUR)
            offset += 8 - offset
            (base, limit) = struct.unpack('<QQ', f.read(16))
            offset += 16

            comments = []
            while offset < struct_len:
                (scope_type, scope_len) = struct.unpack('<BB', f.read(2))

                N = (int)((scope_len - 6) / 2) - 1

                (id, starting_bus, starting_dev, starting_fn) = struct.unpack('<xxBBBB', f.read(6))

                append_comment_info(comments, scope_type, starting_bus, starting_dev, starting_fn)

                while N != 0:
                    N-=1
                    (secondary_dev, secondary_fn) = struct.unpack('<BB', f.read(2))
                    for d in pcidevices:
                        if d.bus == starting_bus and d.dev == starting_dev and d.fn == starting_fn:
                            (secondbus, subordinate) = PCIPCIBridge.get_2nd_busses(d)
                            break

                    append_comment_info(comments, scope_type, secondbus, secondary_dev, secondary_fn)
                offset += scope_len

            reg = MemRegion(base, limit, 'ACPI DMAR RMRR', comments)
            regions.append(reg)

        f.seek(struct_len - offset, os.SEEK_CUR)

    f.close()

    for d in pcidevices:
        if d.iommu is None:
            raise RuntimeError(
                'PCI device %02x:%02x.%x outside the scope of an '
                'IOMMU' % (d.bus, d.dev, d.fn))

    return units, regions


def parse_ivrs(pcidevices, ioapics):
    def format_bdf(bdf):
        bus, dev, fun = (bdf >> 8) & 0xff, (bdf >> 3) & 0x1f, bdf & 0x7
        return '%02x:%02x.%x' % (bus, dev, fun)

    f = input_open('/sys/firmware/acpi/tables/IVRS', 'rb')
    signature = f.read(4)
    if signature != b'IVRS':
        raise RuntimeError('IVRS: incorrect input file format %s' % signature)

    (length, revision) = struct.unpack('<IB', f.read(5))
    if revision > 2:
        raise RuntimeError('IVRS: unsupported Revision %02x' % revision)

    f.seek(48, os.SEEK_SET)
    length -= 48

    units = []
    regions = []
    # BDF of devices that are permitted outside IOMMU: root complex
    iommu_skiplist = set([0x0])
    ivhd_blocks = 0
    while length > 0:
        (block_type, block_length) = struct.unpack('<BxH', f.read(4))
        if block_type in [0x10, 0x11]:
            ivhd_blocks += 1
            if ivhd_blocks > 1:
                raise RuntimeError('Jailhouse doesn\'t support more than one '
                                   'AMD IOMMU per PCI function.')
            # IVHD block
            ivhd_fields = struct.unpack('<HHQHxxL', f.read(20))
            (iommu_bdf, base_cap_ofs,
             base_addr, pci_seg, iommu_feat) = ivhd_fields

            length -= block_length
            block_length -= 24

            if pci_seg != 0:
                raise RuntimeError('We do not support multiple PCI segments')

            if len(units) > 8:
                raise RuntimeError('Too many IOMMU units. '
                                   'Raise JAILHOUSE_MAX_IOMMU_UNITS.')

            msi_cap_ofs = None

            for i, d in enumerate(pcidevices):
                if d.bdf() == iommu_bdf:
                    # Extract MSI capability offset
                    for c in d.caps:
                        if c.id == 0x05:
                            msi_cap_ofs = c.start
                    # We must not map IOMMU to the cells
                    del pcidevices[i]

            if msi_cap_ofs is None:
                raise RuntimeError('AMD IOMMU lacks MSI support, and '
                                   'Jailhouse doesn\'t support MSI-X yet.')

            if (iommu_feat & (0xF << 13)) and (iommu_feat & (0x3F << 17)):
                # Performance Counters are supported, allocate 512K
                mmio_size = 524288
            else:
                # Allocate 16K
                mmio_size = 16384

            units.append(IOMMUConfig({
                'base_addr': base_addr,
                'mmio_size': mmio_size,
                'amd_bdf': iommu_bdf,
                'amd_base_cap': base_cap_ofs,
                'amd_msi_cap': msi_cap_ofs,
                # IVHD block type 0x11 has exact EFR copy but type 0x10 may
                # overwrite what hardware reports. Set reserved bit 0 in that
                # case to indicate that the value is in use.
                'amd_features': (iommu_feat | 0x1) if block_type == 0x10 else 0
            }))

            bdf_start_range = None
            while block_length > 0:
                (entry_type, device_id) = struct.unpack('<BHx', f.read(4))
                block_length -= 4

                if entry_type == 0x01:
                    # All
                    for d in pcidevices:
                        d.iommu = len(units) - 1
                elif entry_type == 0x02:
                    # Select
                    for d in pcidevices:
                        if d.bdf() == device_id:
                            d.iommu = len(units) - 1
                elif entry_type == 0x03:
                    # Start of range
                    bdf_start_range = device_id
                elif entry_type == 0x04:
                    # End of range
                    if bdf_start_range is None:
                        continue
                    for d in pcidevices:
                        if d.bdf() >= bdf_start_range and d.bdf() <= device_id:
                            d.iommu = len(units) - 1
                    bdf_start_range = None
                elif entry_type == 0x42:
                    # Alias select
                    (device_id_b,) = struct.unpack('<xHx', f.read(4))
                    block_length -= 4
                    for d in pcidevices:
                        if d.bdf() == device_id_b:
                            d.iommu = len(units) - 1
                elif entry_type == 0x43:
                    # Alias start of range
                    (device_id_b,) = struct.unpack('<xHx', f.read(4))
                    block_length -= 4
                    bdf_start_range = device_id_b
                elif entry_type == 0x48:
                    # Special device
                    (handle, device_id_b, variety) = struct.unpack(
                        '<BHB', f.read(4))
                    block_length -= 4
                    if variety == 0x01:  # IOAPIC
                        for chip in ioapics:
                            if chip.id == handle:
                                chip.bdf = device_id_b
                                chip.iommu = len(units) - 1
                else:
                    # Reserved or ignored entries
                    if entry_type >= 0x40:
                        f.seek(4, os.SEEK_CUR)
                        block_length -= 4

        elif type in [0x20, 0x21, 0x22]:
            # IVMD block
            ivmd_fields = struct.unpack('<BBHHHxxxxxxxxQQ', f.read(32))
            (block_type, block_flags, block_length,
             device_id, aux_data, mem_addr, mem_len) = ivmd_fields
            length -= block_length

            if int(block_flags):
                bdf_str = format_bdf(device_id)
                print(
                    'WARNING: Jailhouse doesn\'t support configurable '
                    '(eg. read-only) device memory. Device %s may not '
                    'work properly, especially in non-root cell.' % bdf_str)

            if block_type == 0x20:
                # All devices
                comment = None
            elif block_type == 0x21:
                # Selected device
                comment = 'PCI Device: %s' % format_bdf(device_id)
            elif block_type == 0x22:
                # Device range
                comment = 'PCI Device: %s - %s' % (
                    format_bdf(device_id), format_bdf(aux_data))

            if comment:
                print('WARNING: Jailhouse doesn\'t support per-device memory '
                      'regions. The memory at 0x%x will be mapped accessible '
                      'to all devices.' % mem_addr)

            regions.append(MemRegion(mem_addr, mem_len, 'ACPI IVRS', comment))
        elif type == 0x40:
            raise RuntimeError(
                'You board uses IVRS Rev. 2 feature Jailhouse doesn\'t '
                'support yet. Please report this to '
                'jailhouse-dev@googlegroups.com.')
        else:
            print(
                'WARNING: Skipping unknown IVRS '
                'block type 0x%02x' % block_type)

        for d in pcidevices:
            if d.bdf() not in iommu_skiplist and d.iommu is None:
                raise RuntimeError(
                    'PCI device %02x:%02x.%x outside the scope of an '
                    'IOMMU' % (d.bus, d.dev, d.fn))

        f.close()
        return units, regions


def get_cpu_vendor():
    with open(root_dir + '/proc/cpuinfo') as f:
        for line in f:
            if not line.strip():
                continue
            key, value = line.split(':')
            if key.strip() == 'vendor_id':
                return value.strip()


class PCIBARs:
    IORESOURCE_IO = 0x00000100
    IORESOURCE_MEM = 0x00000200
    IORESOURCE_MEM_64 = 0x00100000

    def __init__(self, dir):
        self.mask = []
        f = input_open(os.path.join(dir, 'resource'), 'r')
        n = 0
        while (n < 6):
            (start, end, flags) = f.readline().split()
            n += 1
            flags = int(flags, 16)
            if flags & PCIBARs.IORESOURCE_IO:
                mask = ~(int(end, 16) - int(start, 16))
            elif flags & PCIBARs.IORESOURCE_MEM:
                if flags & PCIBARs.IORESOURCE_MEM_64:
                    mask = int(end, 16) - int(start, 16)
                    (start, end, flags) = f.readline().split()
                    mask |= (int(end, 16) - int(start, 16)) << 32
                    mask = ~(mask)
                    self.mask.append(mask & 0xffffffff)
                    mask >>= 32
                    n += 1
                else:
                    mask = ~(int(end, 16) - int(start, 16))
            else:
                mask = 0
            self.mask.append(mask & 0xffffffff)
        f.close()


class PCICapability:
    def __init__(self, id, start, len, flags, content, msix_address):
        self.id = id
        self.start = start
        self.len = len
        self.flags = flags
        self.content = content
        self.msix_address = msix_address
        self.comments = []

    def __eq__(self, other):
        return self.id == other.id and self.start == other.start and \
            self.len == other.len and self.flags == other.flags

    RD = '0'
    RW = 'JAILHOUSE_PCICAPS_WRITE'

    JAILHOUSE_PCI_EXT_CAP = 0x8000

    @staticmethod
    def parse_pcicaps(dir):
        caps = []
        has_extended_caps = False
        f = input_open(os.path.join(dir, 'config'), 'rb')
        f.seek(0x06)
        (status,) = struct.unpack('<H', f.read(2))
        # capability list supported?
        if (status & (1 << 4)) == 0:
            f.close()
            return caps
        # walk capability list
        f.seek(0x34)
        (next,) = struct.unpack('B', f.read(1))
        while next != 0:
            cap = next
            msix_address = 0
            f.seek(cap)
            (id, next) = struct.unpack('<BB', f.read(2))
            if id == 0x01:  # Power Management
                # this cap can be handed out completely
                len = 8
                flags = PCICapability.RW
            elif id == 0x05:  # MSI
                # access will be moderated by hypervisor
                len = 10
                (msgctl,) = struct.unpack('<H', f.read(2))
                if (msgctl & (1 << 7)) != 0:  # 64-bit support
                    len += 4
                if (msgctl & (1 << 8)) != 0:  # per-vector masking support
                    len += 10
                flags = PCICapability.RW
            elif id == 0x10:  # Express
                len = 20
                (cap_reg,) = struct.unpack('<H', f.read(2))
                if (cap_reg & 0xf) >= 2:  # v2 capability
                    len = 60
                # access side effects still need to be analyzed
                flags = PCICapability.RD
                has_extended_caps = True
            elif id == 0x11:  # MSI-X
                # access will be moderated by hypervisor
                len = 12
                (table,) = struct.unpack('<xxI', f.read(6))
                f.seek(0x10 + (table & 7) * 4)
                (bar,) = struct.unpack('<I', f.read(4))
                if (bar & 0x3) != 0:
                    raise RuntimeError('Invalid MSI-X BAR found')
                if (bar & 0x4) != 0:
                    bar |= struct.unpack('<I', f.read(4))[0] << 32
                msix_address = \
                    (bar & 0xfffffffffffffff0) + (table & 0xfffffff8)
                flags = PCICapability.RW
            else:
                # unknown/unhandled cap, mark its existence
                len = 2
                flags = PCICapability.RD
            f.seek(cap + 2)
            content = f.read(len - 2)
            caps.append(PCICapability(id, cap, len, flags, content,
                                      msix_address))

        if has_extended_caps:
            # walk extended capability list
            next = 0x100
            while next != 0:
                cap = next
                f.seek(cap)
                (id, version_next) = struct.unpack('<HH', f.read(4))
                next = version_next >> 4
                if id == 0xffff:
                    break
                elif id == 0x0010:  # SR-IOV
                    len = 64
                    # access side effects still need to be analyzed
                    flags = PCICapability.RD
                else:
                    if (id & PCICapability.JAILHOUSE_PCI_EXT_CAP) != 0:
                        print('WARNING: Ignoring unsupported PCI Express '
                              'Extended Capability ID %x' % id)
                        continue
                    # unknown/unhandled cap, mark its existence
                    len = 4
                    flags = PCICapability.RD
                f.seek(cap + 4)
                content = f.read(len - 4)
                id |= PCICapability.JAILHOUSE_PCI_EXT_CAP
                caps.append(PCICapability(id, cap, len, flags, content, 0))

        f.close()
        return caps


class PCIDevice:
    def __init__(self, type, domain, bus, dev, fn, bars, caps, path):
        self.type = type
        self.iommu = None
        self.domain = domain
        self.bus = bus
        self.dev = dev
        self.fn = fn
        self.bars = bars
        self.caps = caps
        self.path = path
        self.caps_start = 0
        self.num_caps = len(caps)
        self.num_msi_vectors = 0
        self.msi_64bits = 0
        self.num_msix_vectors = 0
        self.msix_region_size = 0
        self.msix_address = 0
        for c in caps:
            if c.id in (0x05, 0x11):
                msg_ctrl = struct.unpack('<H', c.content[:2])[0]
                if c.id == 0x05:  # MSI
                    self.num_msi_vectors = 1 << ((msg_ctrl >> 1) & 0x7)
                    self.msi_64bits = (msg_ctrl >> 7) & 1
                else:  # MSI-X
                    if c.msix_address != 0:
                        vectors = (msg_ctrl & 0x7ff) + 1
                        self.num_msix_vectors = vectors
                        self.msix_region_size = (vectors * 16 + 0xfff) & 0xf000
                        self.msix_address = c.msix_address
                    else:
                        print('WARNING: Ignoring invalid MSI-X configuration'
                              ' of device %02x:%02x.%x' % (bus, dev, fn))

    def __str__(self):
        return 'PCIDevice: %02x:%02x.%x' % (self.bus, self.dev, self.fn)

    def bdf(self):
        return self.bus << 8 | self.dev << 3 | self.fn

    @staticmethod
    def parse_pcidevice_sysfsdir(basedir, dir):
        dpath = os.path.join(basedir, dir)
        f = input_open(os.path.join(dpath, 'config'), 'rb')
        (vendor_device,) = struct.unpack('<I', f.read(4))
        if vendor_device == 0xffffffff:
            print('WARNING: Ignoring apparently disabled PCI device %s' % dir)
            return None
        f.seek(0x0A)
        (classcode,) = struct.unpack('<H', f.read(2))
        f.close()
        if classcode == 0x0604:
            type = 'JAILHOUSE_PCI_TYPE_BRIDGE'
        else:
            type = 'JAILHOUSE_PCI_TYPE_DEVICE'
        a = dir.split(':')
        domain = int(a[0], 16)
        bus = int(a[1], 16)
        df = a[2].split('.')
        bars = PCIBARs(dpath)
        caps = PCICapability.parse_pcicaps(dpath)
        return PCIDevice(type, domain, bus, int(df[0], 16), int(df[1], 16),
                         bars, caps, dpath)


class PCIPCIBridge(PCIDevice):
    @staticmethod
    def get_2nd_busses(dev):
        assert dev.type == 'JAILHOUSE_PCI_TYPE_BRIDGE'
        f = input_open(os.path.join(dev.path, 'config'), 'rb')
        f.seek(0x19)
        (secondbus, subordinate) = struct.unpack('<BB', f.read(2))
        f.close()
        return (secondbus, subordinate)


class MemRegion:
    def __init__(self, start, stop, typestr, comments=None):
        self.start = start
        self.stop = stop
        self.typestr = typestr
        self.comments = comments or []

    def __str__(self):
        return 'MemRegion: %08x-%08x : %s' % \
            (self.start, self.stop, self.typestr)

    def size(self):
        # round up to full PAGE_SIZE
        return int((self.stop - self.start + 0xfff) / 0x1000) * 0x1000

    def flagstr(self, p=''):
        if (
            self.typestr == 'System RAM' or
            self.typestr == 'Kernel' or
            self.typestr == 'RAM buffer' or
            self.typestr == 'ACPI DMAR RMRR' or
            self.typestr == 'ACPI IVRS'
        ):
            s = 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |\n'
            s += p + '\t\tJAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA'
            return s
        return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'


class IOAPIC:
    def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
        self.id = id
        self.address = address
        self.gsi_base = gsi_base
        self.iommu = iommu
        self.bdf = bdf

    def __str__(self):
        return 'IOAPIC %d, GSI base %d' % (self.id, self.gsi_base)

    def irqchip_id(self):
        # encode the IOMMU number into the irqchip ID
        return (self.iommu << 16) | self.bdf


class IOMemRegionTree:
    def __init__(self, region, level):
        self.region = region
        self.level = level
        self.parent = None
        self.children = []

    def __str__(self):
        s = ''
        if (self.region):
            s = (' ' * (self.level - 1)) + str(self.region)
            if self.parent and self.parent.region:
                s += ' --> ' + self.parent.region.typestr
            s += '\n'
        for c in self.children:
            s += str(c)
        return s

    def regions_split_by_kernel(self):
        kernel = [x for x in self.children if
                  x.region.typestr.startswith('Kernel ')]

        if (len(kernel) == 0):
            return [self.region]

        r = self.region
        s = r.typestr

        kernel_start = kernel[0].region.start
        kernel_stop = kernel[len(kernel) - 1].region.stop

        # align this for 16M, but only if we have enough space
        kernel_stop = (kernel_stop & ~0xFFFFFF) + 0xFFFFFF
        if (kernel_stop > r.stop):
            kernel_stop = r.stop

        before_kernel = None
        after_kernel = None

        # before Kernel if any
        if (r.start < kernel_start):
            before_kernel = MemRegion(r.start, kernel_start - 1, s)

        kernel_region = MemRegion(kernel_start, kernel_stop, "Kernel")

        # after Kernel if any
        if (r.stop > kernel_stop):
            after_kernel = MemRegion(kernel_stop + 1, r.stop, s)

        return [before_kernel, kernel_region, after_kernel]

    @staticmethod
    def parse_iomem_line(line):
        a = line.split(':', 1)
        level = int(a[0].count(' ') / 2) + 1
        region = a[0].split('-', 1)
        a[1] = a[1].strip()
        return level, MemRegion(int(region[0], 16), int(region[1], 16), a[1])

    @staticmethod
    def parse_iomem_file():
        root = IOMemRegionTree(None, 0)
        f = input_open('/proc/iomem')
        lastlevel = 0
        lastnode = root
        for line in f:
            (level, r) = IOMemRegionTree.parse_iomem_line(line)
            t = IOMemRegionTree(r, level)
            if (t.level > lastlevel):
                t.parent = lastnode
            if (t.level == lastlevel):
                t.parent = lastnode.parent
            if (t.level < lastlevel):
                p = lastnode.parent
                while(t.level < p.level):
                    p = p.parent
                t.parent = p.parent

            t.parent.children.append(t)
            lastnode = t
            lastlevel = t.level
        f.close()

        return root

    # find specific regions in tree
    @staticmethod
    def find_regions_by_name(tree, string):
        regions = []

        for tree in tree.children:
            r = tree.region
            s = r.typestr

            if (s.find(string) >= 0):
                regions.append(r)

            # if the tree continues recurse further down ...
            if (len(tree.children) > 0):
                regions.extend(IOMemRegionTree.find_regions_by_name(tree, string))

        return regions

    # recurse down the tree
    @staticmethod
    def parse_iomem_tree(tree):
        regions = []
        dmar_regions = []

        for tree in tree.children:
            r = tree.region
            s = r.typestr

            # System RAM on the first level will be added completely,
            # if they don't contain the kernel itself, if they do,
            # we split them
            if (tree.level == 1 and s == 'System RAM'):
                regions.extend(tree.regions_split_by_kernel())
                continue

            # blacklisted on all levels
            if (
                (s.find('PCI MMCONFIG') >= 0) or
                (s.find('APIC') >= 0)  # covers both APIC and IOAPIC
            ):
                continue

            # generally blacklisted, with a few exceptions
            if (s.lower() == 'reserved'):
                regions.extend(IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
                dmar_regions.extend(IOMemRegionTree.find_regions_by_name(tree, 'dmar'))
                continue

            # if the tree continues recurse further down ...
            if (len(tree.children) > 0):
                (temp_regions, temp_dmar_regions) = IOMemRegionTree.parse_iomem_tree(tree)
                regions.extend(temp_regions)
                dmar_regions.extend(temp_dmar_regions)
                continue

            # add all remaining leaves
            regions.append(r)

        return regions, dmar_regions


class IOMMUConfig:
    def __init__(self, props):
        self.base_addr = props['base_addr']
        self.mmio_size = props['mmio_size']
        if 'amd_bdf' in props:
            self.amd_bdf = props['amd_bdf']
            self.amd_base_cap = props['amd_base_cap']
            self.amd_msi_cap = props['amd_msi_cap']
            self.amd_features = props['amd_features']

    @property
    def is_amd_iommu(self):
        return hasattr(self, 'amd_bdf')

------=_Part_8_1101446795.1557263681602
Content-Type: text/x-csrc; charset=US-ASCII; name=sysconfig2.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=sysconfig2.c
X-Attachment-Id: 5e359ab7-a50a-4ef8-9c22-7ff0b96b1474
Content-ID: <5e359ab7-a50a-4ef8-9c22-7ff0b96b1474>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for HP ProLiant DL360p Gen8
 * created with '/home/ubuntu/repos/siemens/jailhouse/tools/jailhouse config create /home/ubuntu/repos/siemens/jailhouse/configs/x86/sysconfig2.c --mem-hv 128M --mem-inmates 256M --root /home/ubuntu/repos/siemens/jailhouse/HP_ProLiant_DL360p_Gen8'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x18000000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[88];
	struct jailhouse_irqchip irqchips[3];
	__u8 pio_bitmap[0x2000];
	struct jailhouse_pci_device pci_devices[149];
	struct jailhouse_pci_capability pci_caps[81];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
			.size = 0x8000000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xc0000000,
			.pci_mmconfig_end_bus = 0xff,
			.x86 = {
				.pm_timer_address = 0x908,
				.vtd_interrupt_limit = 512,
				.iommu_units = {
					{
						.base = 0xfbefe000,
						.size = 0x1000,
					},
					{
						.base = 0xf4ffe000,
						.size = 0x1000,
					},
				},
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x0000000000ffffff,
	},

	.mem_regions = {
		/* MemRegion: 00000000-000967ff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x97000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000a0000-000bffff : PCI Bus 0000:00 */
		{
			.phys_start = 0xa0000,
			.virt_start = 0xa0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 00100000-00ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0xf00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 01000000-02ffffff : Kernel */
		{
			.phys_start = 0x1000000,
			.virt_start = 0x1000000,
			.size = 0x2000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 03000000-39ffffff : System RAM */
		{
			.phys_start = 0x3000000,
			.virt_start = 0x3000000,
			.size = 0x37000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 52000000-bddcbfff : System RAM */
		{
			.phys_start = 0x52000000,
			.virt_start = 0x52000000,
			.size = 0x6bdcc000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: bddcc000-bddddfff : ACPI Tables */
		{
			.phys_start = 0xbddcc000,
			.virt_start = 0xbddcc000,
			.size = 0x12000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: bddde000-bdddefff : System RAM */
		{
			.phys_start = 0xbddde000,
			.virt_start = 0xbddde000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: f4000000-f401ffff : 0000:03:00.0 */
		{
			.phys_start = 0xf4000000,
			.virt_start = 0xf4000000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f4020000-f403ffff : 0000:03:00.1 */
		{
			.phys_start = 0xf4020000,
			.virt_start = 0xf4020000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f4040000-f405ffff : 0000:03:00.2 */
		{
			.phys_start = 0xf4040000,
			.virt_start = 0xf4040000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f4060000-f407ffff : 0000:03:00.3 */
		{
			.phys_start = 0xf4060000,
			.virt_start = 0xf4060000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f5000000-f512ffff : vesafb */
		{
			.phys_start = 0xf5000000,
			.virt_start = 0xf5000000,
			.size = 0x130000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6b41000-f6b4ffff : tg3 */
		{
			.phys_start = 0xf6b41000,
			.virt_start = 0xf6b41000,
			.size = 0xf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6b50000-f6b5ffff : tg3 */
		{
			.phys_start = 0xf6b50000,
			.virt_start = 0xf6b50000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6b60000-f6b6ffff : tg3 */
		{
			.phys_start = 0xf6b60000,
			.virt_start = 0xf6b60000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6b71000-f6b7ffff : tg3 */
		{
			.phys_start = 0xf6b71000,
			.virt_start = 0xf6b71000,
			.size = 0xf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6b80000-f6b8ffff : tg3 */
		{
			.phys_start = 0xf6b80000,
			.virt_start = 0xf6b80000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6b90000-f6b9ffff : tg3 */
		{
			.phys_start = 0xf6b90000,
			.virt_start = 0xf6b90000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6ba1000-f6baffff : tg3 */
		{
			.phys_start = 0xf6ba1000,
			.virt_start = 0xf6ba1000,
			.size = 0xf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6bb0000-f6bbffff : tg3 */
		{
			.phys_start = 0xf6bb0000,
			.virt_start = 0xf6bb0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6bc0000-f6bcffff : tg3 */
		{
			.phys_start = 0xf6bc0000,
			.virt_start = 0xf6bc0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6bd1000-f6bdffff : tg3 */
		{
			.phys_start = 0xf6bd1000,
			.virt_start = 0xf6bd1000,
			.size = 0xf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6be0000-f6beffff : tg3 */
		{
			.phys_start = 0xf6be0000,
			.virt_start = 0xf6be0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6bf0000-f6bfffff : tg3 */
		{
			.phys_start = 0xf6bf0000,
			.virt_start = 0xf6bf0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6c50000-f6c503ff : ehci_hcd */
		{
			.phys_start = 0xf6c50000,
			.virt_start = 0xf6c50000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6c60000-f6c603ff : ehci_hcd */
		{
			.phys_start = 0xf6c60000,
			.virt_start = 0xf6c60000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6c70000-f6c70fff : 0000:00:05.4 */
		{
			.phys_start = 0xf6c70000,
			.virt_start = 0xf6c70000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6c80000-f6c81fff : ioatdma */
		{
			.phys_start = 0xf6c80000,
			.virt_start = 0xf6c80000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6c83000-f6c83fff : ioatdma */
		{
			.phys_start = 0xf6c83000,
			.virt_start = 0xf6c83000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6c90000-f6c91fff : ioatdma */
		{
			.phys_start = 0xf6c90000,
			.virt_start = 0xf6c90000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6c93000-f6c93fff : ioatdma */
		{
			.phys_start = 0xf6c93000,
			.virt_start = 0xf6c93000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6ca0000-f6ca1fff : ioatdma */
		{
			.phys_start = 0xf6ca0000,
			.virt_start = 0xf6ca0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6ca3000-f6ca3fff : ioatdma */
		{
			.phys_start = 0xf6ca3000,
			.virt_start = 0xf6ca3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6cb0000-f6cb1fff : ioatdma */
		{
			.phys_start = 0xf6cb0000,
			.virt_start = 0xf6cb0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6cb3000-f6cb3fff : ioatdma */
		{
			.phys_start = 0xf6cb3000,
			.virt_start = 0xf6cb3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6cc0000-f6cc1fff : ioatdma */
		{
			.phys_start = 0xf6cc0000,
			.virt_start = 0xf6cc0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6cc3000-f6cc3fff : ioatdma */
		{
			.phys_start = 0xf6cc3000,
			.virt_start = 0xf6cc3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6cd0000-f6cd1fff : ioatdma */
		{
			.phys_start = 0xf6cd0000,
			.virt_start = 0xf6cd0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6cd3000-f6cd3fff : ioatdma */
		{
			.phys_start = 0xf6cd3000,
			.virt_start = 0xf6cd3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6ce0000-f6ce1fff : ioatdma */
		{
			.phys_start = 0xf6ce0000,
			.virt_start = 0xf6ce0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6ce3000-f6ce3fff : ioatdma */
		{
			.phys_start = 0xf6ce3000,
			.virt_start = 0xf6ce3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6cf0000-f6cf1fff : ioatdma */
		{
			.phys_start = 0xf6cf0000,
			.virt_start = 0xf6cf0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6cf3000-f6cf3fff : ioatdma */
		{
			.phys_start = 0xf6cf3000,
			.virt_start = 0xf6cf3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6d00000-f6d0ffff : 0000:01:00.2 */
		{
			.phys_start = 0xf6d00000,
			.virt_start = 0xf6d00000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6d60000-f6d67fff : hpilo */
		{
			.phys_start = 0xf6d60000,
			.virt_start = 0xf6d60000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6d70000-f6d77fff : hpilo */
		{
			.phys_start = 0xf6d70000,
			.virt_start = 0xf6d70000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6d80000-f6dfffff : hpilo */
		{
			.phys_start = 0xf6d80000,
			.virt_start = 0xf6d80000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6e00000-f6efffff : hpilo */
		{
			.phys_start = 0xf6e00000,
			.virt_start = 0xf6e00000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6ff0000-f6ff00ff : hpilo */
		{
			.phys_start = 0xf6ff0000,
			.virt_start = 0xf6ff0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7000000-f77fffff : 0000:01:00.1 */
		{
			.phys_start = 0xf7000000,
			.virt_start = 0xf7000000,
			.size = 0x800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7de0000-f7de3fff : 0000:01:00.1 */
		{
			.phys_start = 0xf7de0000,
			.virt_start = 0xf7de0000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7df0000-f7df01ff : 0000:01:00.0 */
		{
			.phys_start = 0xf7df0000,
			.virt_start = 0xf7df0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7e00000-f7e7ffff : 0000:02:00.0 */
		{
			.phys_start = 0xf7e00000,
			.virt_start = 0xf7e00000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7ef0000-f7ef03ff : hpsa */
		{
			.phys_start = 0xf7ef0000,
			.virt_start = 0xf7ef0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7f00000-f7f01fff : hpsa */
		{
			.phys_start = 0xf7f00000,
			.virt_start = 0xf7f00000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7f03000-f7ffffff : hpsa */
		{
			.phys_start = 0xf7f03000,
			.virt_start = 0xf7f03000,
			.size = 0xfd000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbf70000-fbf70fff : 0000:20:05.4 */
		{
			.phys_start = 0xfbf70000,
			.virt_start = 0xfbf70000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbf80000-fbf81fff : ioatdma */
		{
			.phys_start = 0xfbf80000,
			.virt_start = 0xfbf80000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbf83000-fbf83fff : ioatdma */
		{
			.phys_start = 0xfbf83000,
			.virt_start = 0xfbf83000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbf90000-fbf91fff : ioatdma */
		{
			.phys_start = 0xfbf90000,
			.virt_start = 0xfbf90000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbf93000-fbf93fff : ioatdma */
		{
			.phys_start = 0xfbf93000,
			.virt_start = 0xfbf93000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbfa0000-fbfa1fff : ioatdma */
		{
			.phys_start = 0xfbfa0000,
			.virt_start = 0xfbfa0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbfa3000-fbfa3fff : ioatdma */
		{
			.phys_start = 0xfbfa3000,
			.virt_start = 0xfbfa3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbfb0000-fbfb1fff : ioatdma */
		{
			.phys_start = 0xfbfb0000,
			.virt_start = 0xfbfb0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbfb3000-fbfb3fff : ioatdma */
		{
			.phys_start = 0xfbfb3000,
			.virt_start = 0xfbfb3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbfc0000-fbfc1fff : ioatdma */
		{
			.phys_start = 0xfbfc0000,
			.virt_start = 0xfbfc0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbfc3000-fbfc3fff : ioatdma */
		{
			.phys_start = 0xfbfc3000,
			.virt_start = 0xfbfc3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbfd0000-fbfd1fff : ioatdma */
		{
			.phys_start = 0xfbfd0000,
			.virt_start = 0xfbfd0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbfd3000-fbfd3fff : ioatdma */
		{
			.phys_start = 0xfbfd3000,
			.virt_start = 0xfbfd3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbfe0000-fbfe1fff : ioatdma */
		{
			.phys_start = 0xfbfe0000,
			.virt_start = 0xfbfe0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbfe3000-fbfe3fff : ioatdma */
		{
			.phys_start = 0xfbfe3000,
			.virt_start = 0xfbfe3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbff0000-fbff1fff : ioatdma */
		{
			.phys_start = 0xfbff0000,
			.virt_start = 0xfbff0000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbff3000-fbff3fff : ioatdma */
		{
			.phys_start = 0xfbff3000,
			.virt_start = 0xfbff3000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fc000000-fc000fff : pnp 00:01 */
		{
			.phys_start = 0xfc000000,
			.virt_start = 0xfc000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe000000-febfffff : pnp 00:01 */
		{
			.phys_start = 0xfe000000,
			.virt_start = 0xfe000000,
			.size = 0xc00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : HPET 0 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-103fffefff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0xf3ffff000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 103ffff000-103fffffff : RAM buffer */
		{
			.phys_start = 0x103ffff000,
			.virt_start = 0x103ffff000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000c0000-000dffff : ROMs */
		{
			.phys_start = 0xc0000,
			.virt_start = 0xc0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: bdffd000-bdffffff : ACPI DMAR RMRR */
		/* PCI device: 00:1d.0 */
		/* PCI device: 00:1a.0 */
		{
			.phys_start = 0xbdffd000,
			.virt_start = 0xbdffd000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: bdff6000-bdffcfff : ACPI DMAR RMRR */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.2 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.4 */
		{
			.phys_start = 0xbdff6000,
			.virt_start = 0xbdff6000,
			.size = 0x7000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: bdf83000-bdf84fff : ACPI DMAR RMRR */
		/* PCI device: 00:02.2 */
		/* PCI device: 02:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.2 */
		/* PCI device: 00:1f.2 */
		/* PCI device: 00:1f.5 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.0 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.1 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.2 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.3 */
		{
			.phys_start = 0xbdf83000,
			.virt_start = 0xbdf83000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: bdf7f000-bdf82fff : ACPI DMAR RMRR */
		/* PCI device: 00:02.2 */
		/* PCI device: 02:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.2 */
		/* PCI device: 00:1f.2 */
		/* PCI device: 00:1f.5 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.0 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.1 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.2 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.3 */
		{
			.phys_start = 0xbdf7f000,
			.virt_start = 0xbdf7f000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: bdf6f000-bdf7efff : ACPI DMAR RMRR */
		/* PCI device: 00:02.2 */
		/* PCI device: 02:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.2 */
		/* PCI device: 00:1f.2 */
		/* PCI device: 00:1f.5 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.0 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.1 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.2 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.3 */
		{
			.phys_start = 0xbdf6f000,
			.virt_start = 0xbdf6f000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000f4000-000f4fff : ACPI DMAR RMRR */
		/* PCI device: 00:02.2 */
		/* PCI device: 02:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.2 */
		/* PCI device: 00:1f.2 */
		/* PCI device: 00:1f.5 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.0 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.1 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.2 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.3 */
		{
			.phys_start = 0xf4000,
			.virt_start = 0xf4000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000e8000-000e8fff : ACPI DMAR RMRR */
		/* PCI device: 00:02.2 */
		/* PCI device: 02:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.0 */
		/* PCI device: 00:1c.7 */
		/* PCI device: 01:00.2 */
		/* PCI device: 00:1f.2 */
		/* PCI device: 00:1f.5 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.0 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.1 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.2 */
		/* PCI device: 00:02.0 */
		/* PCI device: 03:00.3 */
		{
			.phys_start = 0xe8000,
			.virt_start = 0xe8000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 42000000-51ffffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x42000000,
			.virt_start = 0x42000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 8, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x100f1,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 0, GSI base 24 */
		{
			.address = 0xfec10000,
			.id = 0x1002c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 10, GSI base 48 */
		{
			.address = 0xfec40000,
			.id = 0x202c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_bitmap = {
		[     0/8 ...   0x3f/8] = -1,
		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
		[  0x48/8 ...   0x5f/8] = -1,
		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI status/control */
		[  0x68/8 ...   0x6f/8] = -1,
		[  0x70/8 ...   0x77/8] = 0xfc, /* RTC */
		[  0x78/8 ...  0x3af/8] = -1,
		[ 0x3b0/8 ...  0x3df/8] = 0x00, /* VGA */
		[ 0x3e0/8 ...  0xcff/8] = -1,
		[ 0xd00/8 ... 0xffff/8] = 0, /* HACK: PCI bus */
	},

	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 6,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x9,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x10,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x11,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x12,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x13,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x18,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x19,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x20,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6cf2000,
		},
		/* PCIDevice: 00:04.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x21,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6ce2000,
		},
		/* PCIDevice: 00:04.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x22,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6cd2000,
		},
		/* PCIDevice: 00:04.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x23,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6cc2000,
		},
		/* PCIDevice: 00:04.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x24,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6cb2000,
		},
		/* PCIDevice: 00:04.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x25,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6ca2000,
		},
		/* PCIDevice: 00:04.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x26,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6c92000,
		},
		/* PCIDevice: 00:04.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x27,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6c82000,
		},
		/* PCIDevice: 00:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x28,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 20,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 20,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 22,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:11.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x88,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 23,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xd0,
			.bar_mask = {
				0xfffffc00, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 29,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe7,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe8,
			.bar_mask = {
				0xfffffc00, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 29,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xf0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 37,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xf8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 38,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfa,
			.bar_mask = {
				0xfffffff8, 0xfffffffc, 0xfffffff8,
				0xfffffffc, 0xfffffff0, 0xfffffff0,
			},
			.caps_start = 39,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 01:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x100,
			.bar_mask = {
				0xffffff00, 0xfffffe00, 0xffffff00,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 41,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 01:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x101,
			.bar_mask = {
				0xff000000, 0xffffc000, 0xff800000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 45,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 01:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x102,
			.bar_mask = {
				0xffffff00, 0xffffff00, 0xfff00000,
				0xfff80000, 0xffff8000, 0xffff8000,
			},
			.caps_start = 41,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 01:00.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x104,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffe0, 0x00000000,
			},
			.caps_start = 49,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 02:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x200,
			.bar_mask = {
				0xfff00000, 0xffffffff, 0xfffffc00,
				0xffffffff, 0xffffff00, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 6,
			.num_msi_vectors = 32,
			.msi_64bits = 1,
			.num_msix_vectors = 64,
			.msix_region_size = 0x1000,
			.msix_address = 0xf7f02000,
		},
		/* PCIDevice: 03:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x300,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0xffff0000,
				0xffffffff, 0xffff0000, 0xffffffff,
			},
			.caps_start = 59,
			.num_caps = 9,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.num_msix_vectors = 17,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6bd0000,
		},
		/* PCIDevice: 03:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x301,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0xffff0000,
				0xffffffff, 0xffff0000, 0xffffffff,
			},
			.caps_start = 59,
			.num_caps = 9,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.num_msix_vectors = 17,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6ba0000,
		},
		/* PCIDevice: 03:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x302,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0xffff0000,
				0xffffffff, 0xffff0000, 0xffffffff,
			},
			.caps_start = 59,
			.num_caps = 9,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.num_msix_vectors = 17,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6b70000,
		},
		/* PCIDevice: 03:00.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x303,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0xffff0000,
				0xffffffff, 0xffff0000, 0xffffffff,
			},
			.caps_start = 59,
			.num_caps = 9,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.num_msix_vectors = 17,
			.msix_region_size = 0x1000,
			.msix_address = 0xf6b40000,
		},
		/* PCIDevice: 1f:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f40,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:08.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f43,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 68,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:08.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f44,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:09.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f48,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:09.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f4b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 68,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:09.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f4c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f50,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0a.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f51,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0a.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f52,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0a.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f53,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f58,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0b.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f5b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f60,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0c.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f61,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0c.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f62,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0c.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f66,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0c.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f67,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f68,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f69,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0d.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f6a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0d.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f6e,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f70,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f71,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f78,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f79,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f7a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f7b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0f.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f7c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0f.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f7d,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:0f.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f7e,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:10.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f80,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:10.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f81,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:10.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f82,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:10.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f83,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:10.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f84,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:10.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f85,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:10.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f86,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:10.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f87,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:11.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f88,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:13.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f98,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:13.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f99,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:13.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f9c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:13.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f9d,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1f:13.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1f9e,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2000,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 72,
			.num_caps = 9,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2008,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:01.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2009,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2010,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:02.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2011,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:02.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2012,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:02.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2013,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2018,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:03.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2019,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:03.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x201a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:03.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x201b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2020,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xfbff2000,
		},
		/* PCIDevice: 20:04.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2021,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xfbfe2000,
		},
		/* PCIDevice: 20:04.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2022,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xfbfd2000,
		},
		/* PCIDevice: 20:04.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2023,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xfbfc2000,
		},
		/* PCIDevice: 20:04.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2024,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xfbfb2000,
		},
		/* PCIDevice: 20:04.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2025,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xfbfa2000,
		},
		/* PCIDevice: 20:04.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2026,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xfbf92000,
		},
		/* PCIDevice: 20:04.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2027,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 4,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 1,
			.msix_region_size = 0x1000,
			.msix_address = 0xfbf82000,
		},
		/* PCIDevice: 20:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2028,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 20,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x202a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 20,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 20:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x202c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 22,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f40,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:08.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f43,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 68,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:08.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f44,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:09.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f48,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:09.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f4b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 68,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:09.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f4c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f50,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0a.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f51,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0a.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f52,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0a.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f53,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f58,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0b.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f5b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f60,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0c.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f61,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0c.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f62,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0c.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f66,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0c.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f67,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f68,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f69,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0d.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f6a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0d.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f6e,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f70,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f71,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f78,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f79,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f7a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f7b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0f.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f7c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0f.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f7d,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:0f.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f7e,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:10.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f80,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:10.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f81,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:10.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f82,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:10.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f83,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:10.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f84,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:10.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f85,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:10.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f86,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:10.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f87,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 70,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:11.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f88,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:13.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f98,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:13.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f99,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:13.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f9c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:13.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f9d,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 3f:13.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x3f9e,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:00.0 */
		{
			.id = 0x10,
			.start = 0x90,
			.len = 60,
			.flags = 0,
		},
		{
			.id = 0x1,
			.start = 0xe0,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x144,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:01.0 */
		/* PCIDevice: 00:01.1 */
		/* PCIDevice: 00:02.0 */
		/* PCIDevice: 00:02.1 */
		/* PCIDevice: 00:02.2 */
		/* PCIDevice: 00:02.3 */
		/* PCIDevice: 00:03.0 */
		/* PCIDevice: 00:03.1 */
		/* PCIDevice: 00:03.2 */
		/* PCIDevice: 00:03.3 */
		/* PCIDevice: 20:01.0 */
		/* PCIDevice: 20:01.1 */
		/* PCIDevice: 20:02.0 */
		/* PCIDevice: 20:02.1 */
		/* PCIDevice: 20:02.2 */
		/* PCIDevice: 20:02.3 */
		/* PCIDevice: 20:03.0 */
		/* PCIDevice: 20:03.1 */
		/* PCIDevice: 20:03.2 */
		/* PCIDevice: 20:03.3 */
		{
			.id = 0xd,
			.start = 0x40,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x5,
			.start = 0x60,
			.len = 20,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0x90,
			.len = 60,
			.flags = 0,
		},
		{
			.id = 0x1,
			.start = 0xe0,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0xd | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x110,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x148,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0x19 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x250,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:04.0 */
		/* PCIDevice: 00:04.1 */
		/* PCIDevice: 00:04.2 */
		/* PCIDevice: 00:04.3 */
		/* PCIDevice: 00:04.4 */
		/* PCIDevice: 00:04.5 */
		/* PCIDevice: 00:04.6 */
		/* PCIDevice: 00:04.7 */
		/* PCIDevice: 20:04.0 */
		/* PCIDevice: 20:04.1 */
		/* PCIDevice: 20:04.2 */
		/* PCIDevice: 20:04.3 */
		/* PCIDevice: 20:04.4 */
		/* PCIDevice: 20:04.5 */
		/* PCIDevice: 20:04.6 */
		/* PCIDevice: 20:04.7 */
		{
			.id = 0x11,
			.start = 0x80,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0x90,
			.len = 60,
			.flags = 0,
		},
		{
			.id = 0x1,
			.start = 0xe0,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:05.0 */
		/* PCIDevice: 00:05.2 */
		/* PCIDevice: 20:05.0 */
		/* PCIDevice: 20:05.2 */
		{
			.id = 0x10,
			.start = 0x40,
			.len = 60,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:05.4 */
		/* PCIDevice: 20:05.4 */
		{
			.id = 0x1,
			.start = 0x6c,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:11.0 */
		{
			.id = 0x10,
			.start = 0x40,
			.len = 60,
			.flags = 0,
		},
		{
			.id = 0x1,
			.start = 0x80,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0xd,
			.start = 0x88,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x5,
			.start = 0x90,
			.len = 10,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0xd | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x138,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:1a.0 */
		/* PCIDevice: 00:1d.0 */
		{
			.id = 0x1,
			.start = 0x50,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0xa,
			.start = 0x58,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x13,
			.start = 0x98,
			.len = 2,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.0 */
		/* PCIDevice: 00:1c.7 */
		{
			.id = 0x10,
			.start = 0x40,
			.len = 60,
			.flags = 0,
		},
		{
			.id = 0x5,
			.start = 0x80,
			.len = 10,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0xd,
			.start = 0x90,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x1,
			.start = 0xa0,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:1e.0 */
		{
			.id = 0xd,
			.start = 0x50,
			.len = 2,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.id = 0x9,
			.start = 0xe0,
			.len = 2,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.id = 0x1,
			.start = 0x70,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x13,
			.start = 0xb0,
			.len = 2,
			.flags = 0,
		},
		/* PCIDevice: 01:00.0 */
		/* PCIDevice: 01:00.2 */
		{
			.id = 0x1,
			.start = 0x78,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x5,
			.start = 0xb0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0xc0,
			.len = 20,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 01:00.1 */
		{
			.id = 0x1,
			.start = 0xa8,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x5,
			.start = 0xb0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0xc0,
			.len = 20,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 01:00.4 */
		{
			.id = 0x5,
			.start = 0x70,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0x80,
			.len = 20,
			.flags = 0,
		},
		{
			.id = 0x1,
			.start = 0xf0,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 02:00.0 */
		{
			.id = 0x1,
			.start = 0x80,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x5,
			.start = 0x90,
			.len = 24,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x11,
			.start = 0xb0,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0xc0,
			.len = 60,
			.flags = 0,
		},
		{
			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0x19 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 03:00.0 */
		/* PCIDevice: 03:00.1 */
		/* PCIDevice: 03:00.2 */
		/* PCIDevice: 03:00.3 */
		{
			.id = 0x1,
			.start = 0x48,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x3,
			.start = 0x50,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x5,
			.start = 0x58,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x11,
			.start = 0xa0,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0xac,
			.len = 60,
			.flags = 0,
		},
		{
			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x13c,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0x4 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0x2 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 1f:08.3 */
		/* PCIDevice: 1f:09.3 */
		/* PCIDevice: 3f:08.3 */
		/* PCIDevice: 3f:09.3 */
		{
			.id = 0x10,
			.start = 0x40,
			.len = 20,
			.flags = 0,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 1f:08.4 */
		/* PCIDevice: 1f:09.4 */
		/* PCIDevice: 1f:0f.0 */
		/* PCIDevice: 1f:0f.1 */
		/* PCIDevice: 1f:0f.2 */
		/* PCIDevice: 1f:0f.3 */
		/* PCIDevice: 1f:0f.4 */
		/* PCIDevice: 1f:0f.5 */
		/* PCIDevice: 1f:10.0 */
		/* PCIDevice: 1f:10.1 */
		/* PCIDevice: 1f:10.2 */
		/* PCIDevice: 1f:10.3 */
		/* PCIDevice: 1f:10.4 */
		/* PCIDevice: 1f:10.5 */
		/* PCIDevice: 1f:10.6 */
		/* PCIDevice: 1f:10.7 */
		/* PCIDevice: 3f:08.4 */
		/* PCIDevice: 3f:09.4 */
		/* PCIDevice: 3f:0f.0 */
		/* PCIDevice: 3f:0f.1 */
		/* PCIDevice: 3f:0f.2 */
		/* PCIDevice: 3f:0f.3 */
		/* PCIDevice: 3f:0f.4 */
		/* PCIDevice: 3f:0f.5 */
		/* PCIDevice: 3f:10.0 */
		/* PCIDevice: 3f:10.1 */
		/* PCIDevice: 3f:10.2 */
		/* PCIDevice: 3f:10.3 */
		/* PCIDevice: 3f:10.4 */
		/* PCIDevice: 3f:10.5 */
		/* PCIDevice: 3f:10.6 */
		/* PCIDevice: 3f:10.7 */
		{
			.id = 0x10,
			.start = 0x40,
			.len = 20,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 20:00.0 */
		{
			.id = 0xd,
			.start = 0x40,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x5,
			.start = 0x60,
			.len = 20,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0x90,
			.len = 60,
			.flags = 0,
		},
		{
			.id = 0x1,
			.start = 0xe0,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0xd | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x110,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x148,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0xb | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 4,
			.flags = 0,
		},
	},
};

------=_Part_8_1101446795.1557263681602
Content-Type: text/x-diff; charset=US-ASCII; 
	name=0001-Scripts-Fix-for-Parsing-DMAR-Region-under-Reserved-S.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=0001-Scripts-Fix-for-Parsing-DMAR-Region-under-Reserved-S.patch
X-Attachment-Id: 591e88ed-6274-415a-9ce4-4dc63a2f5e45
Content-ID: <591e88ed-6274-415a-9ce4-4dc63a2f5e45>

From aa9e7f0e25317d2f516da68b4163f9f08fc6c76d Mon Sep 17 00:00:00 2001
From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
Date: Tue, 7 May 2019 19:37:59 +0300
Subject: [PATCH 1/2] Scripts: Fix for Parsing DMAR Region under Reserved
 Section

 While kernel command parameters are intel_iommu=on  intremap=on at
 some machines, cat /proc/iomem shows DMAR region under reserved section.
 This patch must be done for config creation to complete because of
 generating DMAR region not found error although it exist. If this patch is
 not apply, an error is throw by "config create" command whether
 intel_iommu On or Off because "reserved" regions are currently excluded from
 the generated config although DMAR region exists. Thus, DMAR under reserved
 section must be parsed by parser.

Signed-off-by: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
---
 pyjailhouse/sysfs_parser.py | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 46c95fc2..4f5da12e 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):
 
 
 def parse_iomem(pcidevices):
-    regions = IOMemRegionTree.parse_iomem_tree(
+    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(
         IOMemRegionTree.parse_iomem_file())
 
     rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region = False
 
     ret = []
-    dmar_regions = []
     for r in regions:
         append_r = True
         # filter the list for MSI-X pages
@@ -860,21 +859,21 @@ class IOMemRegionTree:
 
         return root
 
-    # find HPET regions in tree
+    # find specific regions in tree
     @staticmethod
-    def find_hpet_regions(tree):
+    def find_regions_by_name(tree, string):
         regions = []
 
         for tree in tree.children:
             r = tree.region
             s = r.typestr
 
-            if (s.find('HPET') >= 0):
+            if (s.find(string) >= 0):
                 regions.append(r)
 
             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
-                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
+                regions.extend(IOMemRegionTree.find_regions_by_name(tree, string))
 
         return regions
 
@@ -882,6 +881,7 @@ class IOMemRegionTree:
     @staticmethod
     def parse_iomem_tree(tree):
         regions = []
+        dmar_regions = []
 
         for tree in tree.children:
             r = tree.region
@@ -901,20 +901,23 @@ class IOMemRegionTree:
             ):
                 continue
 
-            # generally blacklisted, unless we find an HPET behind it
+            # generally blacklisted, with a few exceptions
             if (s.lower() == 'reserved'):
-                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
+                regions.extend(IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
+                dmar_regions.extend(IOMemRegionTree.find_regions_by_name(tree, 'dmar'))
                 continue
 
             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
-                regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
+                (temp_regions, temp_dmar_regions) = IOMemRegionTree.parse_iomem_tree(tree)
+                regions.extend(temp_regions)
+                dmar_regions.extend(temp_dmar_regions)
                 continue
 
             # add all remaining leaves
             regions.append(r)
 
-        return regions
+        return regions, dmar_regions
 
 
 class IOMMUConfig:
-- 
2.17.1


------=_Part_8_1101446795.1557263681602
Content-Type: text/x-diff; charset=UTF-8; 
	name=0002-Scrits-Fix-for-Unsupported-DMAR-Device-Scope-Structu.patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; 
	filename=0002-Scrits-Fix-for-Unsupported-DMAR-Device-Scope-Structu.patch
X-Attachment-Id: b2b9ac79-67ef-4add-a224-1b746df10f17
Content-ID: <b2b9ac79-67ef-4add-a224-1b746df10f17>

From d7f925b10f32a37b4595255afe8690abf50a4a3d Mon Sep 17 00:00:00 2001
From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
Date: Tue, 7 May 2019 23:25:14 +0300
Subject: [PATCH 2/2] Scrits: Fix for Unsupported DMAR Device Scope Structur=
e
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

 Currently DMAR parser does not support parsing secondary path info for PCI=
-PCI bridge that is "PCI Endpoint Device" type.
 For example: 8086:1d1e Patsburg PCI Express Root Port 8

 If the =E2=80=98Path=E2=80=99 field length is more than 2 bytes (N > 1), t=
he Device Scope
 Entry identifies a device behind one or more system software visible PCI-
 PCI bridges. Bus rebalancing actions by system software modifying bus
 assignments of the device=E2=80=99s parent bridge impacts the bus number p=
ortion
 of device=E2=80=99s requester-id.

 Please read VT-d Specification Chapter 8.3.1

Signed-off-by: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
---
 pyjailhouse/sysfs_parser.py | 113 ++++++++++++++++++++++--------------
 1 file changed, 70 insertions(+), 43 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 4f5da12e..9e5c08d1 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -194,12 +194,45 @@ def parse_madt():
     return ioapics
=20
=20
-def parse_dmar_devscope(f):
-    (scope_type, scope_len, id, bus, dev, fn) =3D \
-        struct.unpack('<BBxxBBBB', f.read(8))
-    if scope_len !=3D 8:
-        raise RuntimeError('Unsupported DMAR Device Scope Structure')
-    return (scope_type, scope_len, id, bus, dev, fn)
+def assign_iommu_info(flags, pcidevices, units, ioapics, scope_type, id, b=
us, dev, fn):
+    # PCI Endpoint Device
+    if scope_type =3D=3D 1:
+        assert not (flags & 1)
+        for d in pcidevices:
+            if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =3D=3D fn:
+                d.iommu =3D len(units) - 1
+                break
+    # PCI Sub-hierarchy
+    elif scope_type =3D=3D 2:
+        assert not (flags & 1)
+        for d in pcidevices:
+            if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =3D=3D fn:
+                (secondbus, subordinate) =3D \
+                    PCIPCIBridge.get_2nd_busses(d)
+                for d2 in pcidevices:
+                    if (
+                        d2.bus >=3D secondbus and
+                        d2.bus <=3D subordinate
+                    ):
+                        d2.iommu =3D len(units) - 1
+                break
+    # IOAPIC
+    elif scope_type =3D=3D 3:
+        ioapic =3D next(chip for chip in ioapics if chip.id =3D=3D id)
+        bdf =3D (bus << 8) | (dev << 3) | fn
+        for chip in ioapics:
+            if chip.bdf =3D=3D bdf:
+                raise RuntimeError('IOAPICs with identical BDF')
+        ioapic.bdf =3D bdf
+        ioapic.iommu =3D len(units) - 1
+
+
+def append_comment_info(comments, scope_type, bus, dev, fn):
+    if scope_type =3D=3D 1:
+        comments.append('PCI device: %02x:%02x.%x' %
+                        (bus, dev, fn))
+    else:
+        comments.append('DMAR parser could not decode device path')
=20
=20
 # parsing of DMAR ACPI Table
@@ -249,38 +282,22 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
                         d.iommu =3D len(units) - 1
             offset +=3D 16 - offset
             while offset < struct_len:
-                (scope_type, scope_len, id, bus, dev, fn) =3D\
-                    parse_dmar_devscope(f)
-                # PCI Endpoint Device
-                if scope_type =3D=3D 1:
-                    assert not (flags & 1)
-                    for d in pcidevices:
-                        if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =
=3D=3D fn:
-                            d.iommu =3D len(units) - 1
-                            break
-                # PCI Sub-hierarchy
-                elif scope_type =3D=3D 2:
-                    assert not (flags & 1)
+                (scope_type, scope_len) =3D struct.unpack('<BB', f.read(2)=
)
+
+                N =3D (int)((scope_len - 6) / 2) - 1
+
+                (id, starting_bus, starting_dev, starting_fn) =3D struct.u=
npack('<xxBBBB', f.read(6))
+
+                assign_iommu_info(flags, pcidevices, units, ioapics, scope=
_type, id, starting_bus, starting_dev, starting_fn)
+
+                while N !=3D 0:
+                    N-=3D1
+                    (secondary_dev, secondary_fn) =3D struct.unpack('<BB',=
 f.read(2))
                     for d in pcidevices:
-                        if d.bus =3D=3D bus and d.dev =3D=3D dev and d.fn =
=3D=3D fn:
-                            (secondbus, subordinate) =3D \
-                                PCIPCIBridge.get_2nd_busses(d)
-                            for d2 in pcidevices:
-                                if (
-                                    d2.bus >=3D secondbus and
-                                    d2.bus <=3D subordinate
-                                ):
-                                    d2.iommu =3D len(units) - 1
+                        if d.bus =3D=3D starting_bus and d.dev =3D=3D star=
ting_dev and d.fn =3D=3D starting_fn:
+                            (secondbus, subordinate) =3D PCIPCIBridge.get_=
2nd_busses(d)
                             break
-                # IOAPIC
-                elif scope_type =3D=3D 3:
-                    ioapic =3D next(chip for chip in ioapics if chip.id =
=3D=3D id)
-                    bdf =3D (bus << 8) | (dev << 3) | fn
-                    for chip in ioapics:
-                        if chip.bdf =3D=3D bdf:
-                            raise RuntimeError('IOAPICs with identical BDF=
')
-                    ioapic.bdf =3D bdf
-                    ioapic.iommu =3D len(units) - 1
+                    assign_iommu_info(flags, pcidevices, units, ioapics, s=
cope_type, id, secondbus, secondary_dev, secondary_fn)
                 offset +=3D scope_len
=20
         # Reserved Memory Region Reporting Structure
@@ -292,13 +309,23 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
=20
             comments =3D []
             while offset < struct_len:
-                (scope_type, scope_len, id, bus, dev, fn) =3D\
-                    parse_dmar_devscope(f)
-                if scope_type =3D=3D 1:
-                    comments.append('PCI device: %02x:%02x.%x' %
-                                    (bus, dev, fn))
-                else:
-                    comments.append('DMAR parser could not decode device p=
ath')
+                (scope_type, scope_len) =3D struct.unpack('<BB', f.read(2)=
)
+
+                N =3D (int)((scope_len - 6) / 2) - 1
+
+                (id, starting_bus, starting_dev, starting_fn) =3D struct.u=
npack('<xxBBBB', f.read(6))
+
+                append_comment_info(comments, scope_type, starting_bus, st=
arting_dev, starting_fn)
+
+                while N !=3D 0:
+                    N-=3D1
+                    (secondary_dev, secondary_fn) =3D struct.unpack('<BB',=
 f.read(2))
+                    for d in pcidevices:
+                        if d.bus =3D=3D starting_bus and d.dev =3D=3D star=
ting_dev and d.fn =3D=3D starting_fn:
+                            (secondbus, subordinate) =3D PCIPCIBridge.get_=
2nd_busses(d)
+                            break
+
+                    append_comment_info(comments, scope_type, secondbus, s=
econdary_dev, secondary_fn)
                 offset +=3D scope_len
=20
             reg =3D MemRegion(base, limit, 'ACPI DMAR RMRR', comments)
--=20
2.17.1


------=_Part_8_1101446795.1557263681602--
