Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBH7VXTTAKGQENGBSN3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9EE1421D
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 21:33:53 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id f11sf6300773otl.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 12:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=M696wJetQetG5BaTzD6/39woFw5U0qCgYCwQsgc5/u4=;
        b=cCInIiD8ML+xuHJIVPPVZqFweBIsYIoYDyvLRjXvzHA9EuJJgPMKlNQAYSYDlZmBpL
         1MtUrJXQw1AKar2olv5kiFd4e6yzO3v3wVGyX1/ZgUGRoHiHKLQdzi7V28RYAJq8LKzK
         5CCMlPOdfAXoV1qCtaeArPOH+VbYI9Qeto4I96kYRq93Rd4TVd6e2GyRgl1CGWrFZ084
         cmvjWHKci6T7sWRgJ4TMQCAsYg+38M5sgml6uUFP+cDTf4LnwieG4Jk0DS0Re56DqvYR
         d5LhuxgDdihZoTmkCewXvhvbWpEtsNtAYCJd/P84YEF886RbbQvnL5PczbkpZuYUm4eb
         04Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M696wJetQetG5BaTzD6/39woFw5U0qCgYCwQsgc5/u4=;
        b=Q46tpJc5zdRUQ/TCX5dq7bCtesrknLnObWtaBBIWLOkkiBrh80sLE9LxMA/LO9iiKJ
         NJpuxb7t1x26M65QqmCnrJ70YfkUHeAy5ht5uZXE9Mm4MUSJFEFPjDiQuKwicgBpnqLU
         Nbr16cMC+MbUUeYeE9aaTNvHEkoYejwSBZNtXySNP2YRH5boDu3bz7C2MgvPUAUz7pZp
         bOfvHboQ+VuJX3zAOLG+mUrcbUsOXVUiM9AW31RzWA2AMU9F0YwcUohD1fp/5/v6EV7B
         eV2hOXacaSYkXoJw+3Mv4bpEEf0ncwLcYYqLLHIl1DZmP/VfyA4dlXlX3B5L/s6AFX1p
         nFLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUWvK8SftEA/FF1TGYNUI3WLHCwAstcPh2FJJCvqz8jhBUo5lOr
	Jzn3rQNvpb3vi89coxHOCvI=
X-Google-Smtp-Source: APXvYqwmSr4/l31odR6HZ4s9g5CwKLXacILlexdJb+Uiy69YrzED21SogfHDD1C1zx/E28b8PPwi1w==
X-Received: by 2002:a9d:7851:: with SMTP id c17mr8817054otm.52.1557084832122;
        Sun, 05 May 2019 12:33:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:c003:: with SMTP id q3ls1469744oif.9.gmail; Sun, 05 May
 2019 12:33:51 -0700 (PDT)
X-Received: by 2002:aca:5c55:: with SMTP id q82mr6093772oib.95.1557084831180;
        Sun, 05 May 2019 12:33:51 -0700 (PDT)
Date: Sun, 5 May 2019 12:33:50 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <468407b6-68eb-4eee-8869-e48aeecdb4fd@googlegroups.com>
Subject: [PATCH] Scripts: Fix fpr Parsing DMAR Region under Reserved Section
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1677_1836817744.1557084830450"
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

------=_Part_1677_1836817744.1557084830450
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While kernel command parameters are intel_iommu=3Don intremap=3Don at some =
machines, cat /proc/iomem shows DMAR region under reserved section. This pa=
tch must be done for config creation to complete because of generating DMAR=
 region not found error although it exist.=20

If this patch is not apply, below error is throw by "cell create" command w=
hether intel_iommu On or Off because "reserved" regions are currently exclu=
ded from the generated config although DMAR region exists. Thus, DMAR under=
 reserved section must be parsed by parser.=20


            if size =3D=3D 0:=20
                raise RuntimeError('DMAR region size cannot be identified.\=
n'=20
                                   'Target Linux must run with Intel IOMMU =
'=20
                                   'enabled.')=20


git diff=20
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py=20
index 46c95fc2..70fe8869 100644=20
--- a/pyjailhouse/sysfs_parser.py=20
+++ b/pyjailhouse/sysfs_parser.py=20
@@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):=20
 =20
 =20
 def parse_iomem(pcidevices):=20
-    regions =3D IOMemRegionTree.parse_iomem_tree(=20
-        IOMemRegionTree.parse_iomem_file())=20
+    dmar_regions =3D []=20
+    regions =3D IOMemRegionTree.parse_iomem_tree(IOMemRegionTree.parse_iom=
em_file(), dmar_regions)=20
 =20
     rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')=20
     add_rom_region =3D False=20
 =20
     ret =3D []=20
-    dmar_regions =3D []=20
     for r in regions:=20
         append_r =3D True=20
         # filter the list for MSI-X pages=20
@@ -878,9 +877,27 @@ class IOMemRegionTree:=20
 =20
         return regions=20
 =20
+    # find DMAR regions in tree=20
+    @staticmethod=20
+    def find_dmar_regions(tree):=20
+        regions =3D []=20
+=20
+        for tree in tree.children:=20
+            r =3D tree.region=20
+            s =3D r.typestr=20
+=20
+            if (s.find('dmar') >=3D 0):=20
+                regions.append(r)=20
+=20
+            # if the tree continues recurse further down ...=20
+            if (len(tree.children) > 0):=20
+                regions.extend(IOMemRegionTree.find_dmar_regions(tree))=20
+=20
+        return regions=20
+=20
     # recurse down the tree=20
     @staticmethod=20
-    def parse_iomem_tree(tree):=20
+    def parse_iomem_tree(tree, dmar_regions):=20

         regions =3D []=20
 =20
         for tree in tree.children:=20
@@ -904,11 +921,12 @@ class IOMemRegionTree:=20

             # generally blacklisted, unless we find an HPET behind it=20
             if (s.lower() =3D=3D 'reserved'):=20
                 regions.extend(IOMemRegionTree.find_hpet_regions(tree))=20
+                dmar_regions.extend(IOMemRegionTree.find_dmar_regions(tree=
))=20
                 continue=20

 =20
             # if the tree continues recurse further down ...=20
             if (len(tree.children) > 0):=20
-                regions.extend(IOMemRegionTree.parse_iomem_tree(tree))=20
+                regions.extend(IOMemRegionTree.parse_iomem_tree(tree, dmar=
_regions))=20
                 continue=20
 =20
             # add all remaining leaves=20


Example /proc/iomem=20

"intel_iommu=3Don intremap=3Don"=20

You can see that dmar0 under Reserved region.

ubuntu@ubuntu-HP8300:~$ sudo cat /proc/iomem=20
00000000-00000fff : Reserved=20
00001000-0009ffff : System RAM=20
000a0000-000bffff : PCI Bus 0000:00=20
000c0000-000ce9ff : Video ROM=20
000cf000-000cffff : Adapter ROM=20
000d0000-000d3fff : PCI Bus 0000:00=20
000d4000-000d7fff : PCI Bus 0000:00=20
000d8000-000dbfff : PCI Bus 0000:00=20
000dc000-000dffff : PCI Bus 0000:00=20
000f0000-000fffff : System ROM=20
00100000-38ffffff : System RAM=20
39000000-78ffffff : Reserved=20
79000000-de35bfff : System RAM=20
de35c000-de365fff : Unknown E820 type=20
de366000-de3e6fff : Reserved=20
de3e7000-de414fff : Unknown E820 type=20
de415000-de93efff : Reserved=20
de93f000-deba4fff : ACPI Non-volatile Storage=20
deba5000-debb5fff : ACPI Tables=20
debb6000-debbefff : ACPI Non-volatile Storage=20
debbf000-debc3fff : ACPI Tables=20
debc4000-dec06fff : ACPI Non-volatile Storage=20
dec07000-deffffff : System RAM=20
df000000-dfffffff : RAM buffer=20
e0000000-feafffff : PCI Bus 0000:00=20
  e0000000-efffffff : PCI Bus 0000:01=20
    e0000000-efffffff : 0000:01:00.0=20
  f0000000-f0000fff : pnp 00:0a=20
  f7e00000-f7efffff : PCI Bus 0000:01=20
    f7e20000-f7e3ffff : 0000:01:00.0=20
  f7f00000-f7f1ffff : 0000:00:19.0=20
    f7f00000-f7f1ffff : e1000e=20
  f7f20000-f7f2ffff : 0000:00:14.0=20
    f7f20000-f7f2ffff : xhci-hcd=20
  f7f30000-f7f33fff : 0000:00:1b.0=20
    f7f30000-f7f33fff : ICH HD audio=20
  f7f35000-f7f350ff : 0000:00:1f.3=20
  f7f36000-f7f367ff : 0000:00:1f.2=20
    f7f36000-f7f367ff : ahci=20
  f7f37000-f7f373ff : 0000:00:1d.0=20
    f7f37000-f7f373ff : ehci_hcd=20
  f7f38000-f7f383ff : 0000:00:1a.0=20
    f7f38000-f7f383ff : ehci_hcd=20
  f7f39000-f7f39fff : 0000:00:19.0=20
    f7f39000-f7f39fff : e1000e=20
  f7f3a000-f7f3afff : 0000:00:16.3=20
  f7f3c000-f7f3c00f : 0000:00:16.0=20
    f7f3c000-f7f3c00f : mei_me=20
  f8000000-fbffffff : PCI MMCONFIG 0000 [bus 00-3f]=20
    f8000000-fbffffff : Reserved=20
      f8000000-fbffffff : pnp 00:0a=20
fec00000-fec00fff : Reserved=20
  fec00000-fec003ff : IOAPIC 0=20
fed00000-fed03fff : Reserved=20
  fed00000-fed003ff : HPET 0=20
    fed00000-fed003ff : PNP0103:00=20
fed10000-fed17fff : pnp 00:0a=20
fed18000-fed18fff : pnp 00:0a=20
fed19000-fed19fff : pnp 00:0a=20
fed1c000-fed44fff : Reserved=20
  fed1c000-fed1ffff : pnp 00:0a=20
    fed1f410-fed1f414 : iTCO_wdt.0.auto=20
  fed20000-fed3ffff : pnp 00:0a=20
  fed40000-fed44fff : pnp 00:00=20
    fed40000-fed44fff : TPM=20
fed45000-fed8ffff : pnp 00:0a=20
fed90000-fed93fff : Reserved=20
  fed90000-fed90fff : dmar0                *****DMAR is under reserved regi=
on, current parser ignores******=20
fee00000-fee00fff : Local APIC=20
  fee00000-fee00fff : Reserved=20
ff000000-ffffffff : Reserved=20
  ff000000-ffffffff : INT0800:00=20
    ff000000-ffffffff : pnp 00:0a=20
100000000-21dffffff : System RAM=20
  1fe800000-1ff4031d0 : Kernel code=20
  1ff4031d1-1ffe928ff : Kernel data=20
  200119000-200361fff : Kernel bss=20
21e000000-21fffffff : RAM buffer=20
ubuntu@ubuntu-HP8300:~$=20


HAKKI

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1677_1836817744.1557084830450--
