Return-Path: <jailhouse-dev+bncBCL6VUP7RYARB44UYLTAKGQEDBVYYQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A915467
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 21:26:45 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id 7sf8028860otj.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zK3Xe8V6HczhNXigSHGajg7sA5pUi6P0f4avRmGGxlY=;
        b=fg3+7f7FL1W80Q9tDrsc1/jtC8G55Ho0pSf34hd0nV7lGhY+D09aNyO0NimShDct89
         5G6pC7zfOm2MOA2zy9zy51fm/3wu6UgrQHZ4hlusgvBktXrfaFPRQyQxcTeED7GXHmdb
         lbqynate1nPFwT8DZ79/Dscefmg1/RuMhjJP/yp7AARLxYbdh97eTO0o09KJVWSY9GWf
         sKyAjx+GgYt+H9MpxtPcUA7/FE9UXWgcceTsSspqdB4V7PpvvKMiNRKFq3XEZDMi5fQe
         itTxaRRLQTaSm4r6GZ9CGk4KQhy2horI0AVs5akmcq9jy9DGSas6vA+rzQ9e9punpZjo
         n4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zK3Xe8V6HczhNXigSHGajg7sA5pUi6P0f4avRmGGxlY=;
        b=FgmpCFb5tzuCuK5sOpE9mujn5PfnoH5lWWC3367eav3X466Glzl3nOxcw3MWYy3EnF
         68xnVMGxmKizhdB8uqx1Tf7QZ0F+awZOrukPo3FzF7Rq1GUAxStEIJrJULtylTT1LUXJ
         zM5XDTJ3w68WzCWwkhG5dH0bIOhyZwsldeUTY53LCJfXxMm+UcB86fCU4aEUTrqvHKrh
         l7RFPTgy/SXEjeKVC2MI2e0Q/XXj+rQZ/edTPg2231+Co0XwCkTN+gqZ2F1xU47RLP4F
         /zldTIMU65unsAwcVWyDFPu2jbcq8h66N6Hsz7bJD7JJuaj6vsa3mo/DNf1nXE5WleBz
         aFjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUsxuv0pwnER1PK/QppTkN1sHazruTPAA4kTTcFu3VOnG/+s41C
	VgPAac+o8jksJxjOOJ6kACs=
X-Google-Smtp-Source: APXvYqzSk6EGRqsEsrjanxnIZh/GRedGOB3mHuhrptpFEp/CysompMFcbyVtadwCQchNO4aCfdfNTg==
X-Received: by 2002:aca:43d5:: with SMTP id q204mr2355596oia.100.1557170803951;
        Mon, 06 May 2019 12:26:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:14cf:: with SMTP id t15ls2326812otq.4.gmail; Mon,
 06 May 2019 12:26:43 -0700 (PDT)
X-Received: by 2002:a05:6830:2054:: with SMTP id f20mr1904379otp.288.1557170803269;
        Mon, 06 May 2019 12:26:43 -0700 (PDT)
Date: Mon, 6 May 2019 12:26:42 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <668d10f2-2880-4edb-8050-1dae941693bb@googlegroups.com>
In-Reply-To: <8a5e41f1-5533-42de-89a3-9ac5437751e5@googlegroups.com>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
 <20190506104344.33303fdc@md1za8fc.ad001.siemens.net>
 <8a5e41f1-5533-42de-89a3-9ac5437751e5@googlegroups.com>
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1395_124866948.1557170802562"
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

------=_Part_1395_124866948.1557170802562
Content-Type: text/plain; charset="UTF-8"

Hi Henning,

I have write new patch but I have not test it more. But it is more suitable for your advices.


diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 46c95fc2..985c1129 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -22,6 +22,7 @@ import struct
 import os
 import fnmatch
 
+# root_dir = "/home/ubuntu/repos/siemens/jailhouse/data/"
 root_dir = "/"
 
 def set_root_dir(dir):
@@ -58,6 +59,7 @@ inputs['files_intel'].add('/sys/firmware/acpi/tables/DMAR')
 inputs['files_amd'].add('/sys/firmware/acpi/tables/IVRS')
 
 
+
 def check_input_listed(name, optional=False):
     set = inputs['files_opt']
     if optional is False:
@@ -94,14 +96,15 @@ def input_listdir(dir, wildcards):
 
 
 def parse_iomem(pcidevices):
-    regions = IOMemRegionTree.parse_iomem_tree(
+    dmar_regions = []
+    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(
         IOMemRegionTree.parse_iomem_file())
 
     rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region = False
 
     ret = []
-    dmar_regions = []
+    
     for r in regions:
         append_r = True
         # filter the list for MSI-X pages
@@ -249,9 +252,14 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
                     if d.iommu is None:
                         d.iommu = len(units) - 1
             offset += 16 - offset
+            print('DRHD: struct_len: %d offset: %2d -> flags: %d segment: %d base: 0x%x ' % (struct_len, offset, flags, segment, base))
+
             while offset < struct_len:
                 (scope_type, scope_len, id, bus, dev, fn) =\
                     parse_dmar_devscope(f)
+
+                print('DevScope: offset: %2d ->  scope_type: %d scope_len: %d id: %d bus: %d dev: %d fn: %d' % (offset, scope_type, scope_len, id, bus, dev, fn))
+
                 # PCI Endpoint Device
                 if scope_type == 1:
                     assert not (flags & 1)
@@ -290,11 +298,15 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
             offset += 8 - offset
             (base, limit) = struct.unpack('<QQ', f.read(16))
             offset += 16
+            print('RMRR: struct_len: %d offset: %2d ->  base: 0x%x limit: %d ' % (struct_len, offset, base, limit))
 
             comments = []
             while offset < struct_len:
                 (scope_type, scope_len, id, bus, dev, fn) =\
                     parse_dmar_devscope(f)
+                
+                print('DevScope: offset: %2d ->  scope_type: %d scope_len: %d id: %d bus: %d dev: %d fn: %d' % (offset, scope_type, scope_len, id, bus, dev, fn))
+
                 if scope_type == 1:
                     comments.append('PCI device: %02x:%02x.%x' %
                                     (bus, dev, fn))
@@ -860,21 +872,21 @@ class IOMemRegionTree:
 
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
 
@@ -882,6 +894,7 @@ class IOMemRegionTree:
     @staticmethod
     def parse_iomem_tree(tree):
         regions = []
+        dmar_regions = []
 
         for tree in tree.children:
             r = tree.region
@@ -901,20 +914,23 @@ class IOMemRegionTree:
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
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1395_124866948.1557170802562--
