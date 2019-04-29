Return-Path: <jailhouse-dev+bncBCL6VUP7RYARB56NTXTAKGQE5VVWKHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33f.google.com (mail-ot1-x33f.google.com [IPv6:2607:f8b0:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE82EBE6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 23:04:57 +0200 (CEST)
Received: by mail-ot1-x33f.google.com with SMTP id o13sf6479091otk.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xuZOyOuOicH+ApuGTTKttw7y9shc/sX0SfHDaCtcHhs=;
        b=IVVP2MMrm28bD1+Ycs7ZqTguwl4A8ZzkgjcL+5W17591G8HWL9sKwQ0fwgboE9HrO5
         iu6EoLsMiVDdSI4Ke3G3G+58tzqwXcHxiKnfBPBvqLvqCPxi73x7Hs87mBaPOJLO/PVm
         cYKm95cPxR7rzTfUgeik3+xFSZ3/50zIExQK9kY+ZykoXg9VSYorhkroQhAEAMxrjs4U
         MZizpiJu+PGsYH87S42ckWdlidpRQbc6nZP/qbrJVqmgkUkNUfWKtdqrdswCRUe/b1RI
         iXHhs8Gv3eYR/4NU3T2p6Cudqi16yAtFmKJhjjQvcvhu59KpOT7qMT9k4J2lKBGIN8de
         juIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xuZOyOuOicH+ApuGTTKttw7y9shc/sX0SfHDaCtcHhs=;
        b=Wh3D2Utrv2bxXcR4Fi6JUP5srnUrblgSdd66yRriSbw3Prh1etyyEKVAHob/bL6TV/
         EqizUlf6Og7r17TIFfnDuPWOmmIymYIGeuG5MgAZ+N3pZQJOFCoKj+1YxV4gACSvJ+RO
         4xi3xJkgJRFdrwOWrIO79wQ/o4dzFqojKjjoAPzMKZFKzd/8bdslyDmEQhzg6tRPtXMJ
         oBo8HIbZyJ0MSZis7cKjABOGuTUZYh2EA6vER3ZQB9R6XqxSVbdRuI6iIkN9AfGlarNJ
         5M5oeomPybNakrM66k9BmlWqrjRjAfcMMNpuYEc1puwX07N02MDBMSmFcawxwT2VWwIz
         4Awg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUPS38RLSSlpYVZFR2ZWgHjdib+D+aWXGGjrsZii67vzYbDgGyI
	iqZfHz44GT0n+J6DkEcW6qU=
X-Google-Smtp-Source: APXvYqxI/krEEcC+ZZ1OtZTMCzw1Rgt0HigNC7TT7BwQ3SPcVPTuUOfgNRxDzDByJO/g3So8rD/A/w==
X-Received: by 2002:aca:8d8:: with SMTP id 207mr777032oii.75.1556571896155;
        Mon, 29 Apr 2019 14:04:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:76d2:: with SMTP id p18ls3721123otl.13.gmail; Mon, 29
 Apr 2019 14:04:55 -0700 (PDT)
X-Received: by 2002:a05:6830:1501:: with SMTP id k1mr2687074otp.361.1556571895164;
        Mon, 29 Apr 2019 14:04:55 -0700 (PDT)
Date: Mon, 29 Apr 2019 14:04:54 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
In-Reply-To: <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <6526d7d9-09fb-c25e-0037-628998267794@siemens.com>
 <81bb9c90-1557-47ae-990d-b1bf417a58b9@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
 <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
 <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
 <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_466_1691676408.1556571894499"
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

------=_Part_466_1691676408.1556571894499
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

I have write new patch that is attached below: (for jailhouse master branch)

It is not touch to tree only update dmar_regions variable.


git diff
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 46c95fc2..70fe8869 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):
 
 
 def parse_iomem(pcidevices):
-    regions = IOMemRegionTree.parse_iomem_tree(
-        IOMemRegionTree.parse_iomem_file())
+    dmar_regions = []
+    regions = IOMemRegionTree.parse_iomem_tree(IOMemRegionTree.parse_iomem_file(), dmar_regions)
 
     rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region = False
 
     ret = []
-    dmar_regions = []
     for r in regions:
         append_r = True
         # filter the list for MSI-X pages
@@ -878,9 +877,27 @@ class IOMemRegionTree:
 
         return regions
 
+    # find DMAR regions in tree
+    @staticmethod
+    def find_dmar_regions(tree):
+        regions = []
+
+        for tree in tree.children:
+            r = tree.region
+            s = r.typestr
+
+            if (s.find('dmar') >= 0):
+                regions.append(r)
+
+            # if the tree continues recurse further down ...
+            if (len(tree.children) > 0):
+                regions.extend(IOMemRegionTree.find_dmar_regions(tree))
+
+        return regions
+
     # recurse down the tree
     @staticmethod
-    def parse_iomem_tree(tree):
+    def parse_iomem_tree(tree, dmar_regions):
         regions = []
 
         for tree in tree.children:
@@ -904,11 +921,12 @@ class IOMemRegionTree:
             # generally blacklisted, unless we find an HPET behind it
             if (s.lower() == 'reserved'):
                 regions.extend(IOMemRegionTree.find_hpet_regions(tree))
+                dmar_regions.extend(IOMemRegionTree.find_dmar_regions(tree))
                 continue
 
             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
-                regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
+                regions.extend(IOMemRegionTree.parse_iomem_tree(tree, dmar_regions))
                 continue
 
             # add all remaining leaves



Example /proc/iomem for HP8300

 
> You can see that dmar0 under Reserved region...
> 
> ubuntu@ubuntu-HP8300:~$ sudo cat /proc/iomem
> [sudo] password for ubuntu:
> 00000000-00000fff : Reserved
> 00001000-0009ffff : System RAM
> 000a0000-000bffff : PCI Bus 0000:00
> 000c0000-000ce9ff : Video ROM
> 000cf000-000cffff : Adapter ROM
> 000d0000-000d3fff : PCI Bus 0000:00
> 000d4000-000d7fff : PCI Bus 0000:00
> 000d8000-000dbfff : PCI Bus 0000:00
> 000dc000-000dffff : PCI Bus 0000:00
> 000f0000-000fffff : System ROM
> 00100000-38ffffff : System RAM
> 39000000-78ffffff : Reserved
> 79000000-de35bfff : System RAM
> de35c000-de365fff : Unknown E820 type
> de366000-de3e6fff : Reserved
> de3e7000-de414fff : Unknown E820 type
> de415000-de93efff : Reserved
> de93f000-deba4fff : ACPI Non-volatile Storage
> deba5000-debb5fff : ACPI Tables
> debb6000-debbefff : ACPI Non-volatile Storage
> debbf000-debc3fff : ACPI Tables
> debc4000-dec06fff : ACPI Non-volatile Storage
> dec07000-deffffff : System RAM
> df000000-dfffffff : RAM buffer
> e0000000-feafffff : PCI Bus 0000:00
>   e0000000-efffffff : PCI Bus 0000:01
>     e0000000-efffffff : 0000:01:00.0
>   f0000000-f0000fff : pnp 00:0a
>   f7e00000-f7efffff : PCI Bus 0000:01
>     f7e20000-f7e3ffff : 0000:01:00.0
>   f7f00000-f7f1ffff : 0000:00:19.0
>     f7f00000-f7f1ffff : e1000e
>   f7f20000-f7f2ffff : 0000:00:14.0
>     f7f20000-f7f2ffff : xhci-hcd
>   f7f30000-f7f33fff : 0000:00:1b.0
>     f7f30000-f7f33fff : ICH HD audio
>   f7f35000-f7f350ff : 0000:00:1f.3
>   f7f36000-f7f367ff : 0000:00:1f.2
>     f7f36000-f7f367ff : ahci
>   f7f37000-f7f373ff : 0000:00:1d.0
>     f7f37000-f7f373ff : ehci_hcd
>   f7f38000-f7f383ff : 0000:00:1a.0
>     f7f38000-f7f383ff : ehci_hcd
>   f7f39000-f7f39fff : 0000:00:19.0
>     f7f39000-f7f39fff : e1000e
>   f7f3a000-f7f3afff : 0000:00:16.3
>   f7f3c000-f7f3c00f : 0000:00:16.0
>     f7f3c000-f7f3c00f : mei_me
>   f8000000-fbffffff : PCI MMCONFIG 0000 [bus 00-3f]
>     f8000000-fbffffff : Reserved
>       f8000000-fbffffff : pnp 00:0a
> fec00000-fec00fff : Reserved
>   fec00000-fec003ff : IOAPIC 0
> fed00000-fed03fff : Reserved
>   fed00000-fed003ff : HPET 0
>     fed00000-fed003ff : PNP0103:00
> fed10000-fed17fff : pnp 00:0a
> fed18000-fed18fff : pnp 00:0a
> fed19000-fed19fff : pnp 00:0a
> fed1c000-fed44fff : Reserved
>   fed1c000-fed1ffff : pnp 00:0a
>     fed1f410-fed1f414 : iTCO_wdt.0.auto
>   fed20000-fed3ffff : pnp 00:0a
>   fed40000-fed44fff : pnp 00:00
>     fed40000-fed44fff : TPM
> fed45000-fed8ffff : pnp 00:0a
> fed90000-fed93fff : Reserved
>   fed90000-fed90fff : dmar0
> fee00000-fee00fff : Local APIC
>   fee00000-fee00fff : Reserved
> ff000000-ffffffff : Reserved
>   ff000000-ffffffff : INT0800:00
>     ff000000-ffffffff : pnp 00:0a
> 100000000-21dffffff : System RAM
>   1fe800000-1ff4031d0 : Kernel code
>   1ff4031d1-1ffe928ff : Kernel data
>   200119000-200361fff : Kernel bss
> 21e000000-21fffffff : RAM buffer
> ubuntu@ubuntu-HP8300:~$
> 

If this patch is not apply, error is throw by "config creation" whether intel_iommu On or Off because "reserved" regions are currently excluded from the generated config. HPET and DMAR under reserved section must be parsed by config parser.

Thanks.

HAKKI

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_466_1691676408.1556571894499--
