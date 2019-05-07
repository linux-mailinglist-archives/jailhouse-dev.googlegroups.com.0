Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBBP3YTTAKGQEVZBFIKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02A15ED6
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 10:10:47 +0200 (CEST)
Received: by mail-oi1-x23b.google.com with SMTP id u135sf5414111oia.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NSWDhUhfW9z0265imGwJgv/oPaPv+6yvxJPywkDYS3Q=;
        b=UIOYh2H1EZYA8N52JG1Sz3KMEIzwn2j/ImkRYoYGlE8Xv1KaNE79Uw9HSigjxvVTHX
         zfXjtERITzXLM3Ev4i8Xy6oW2jCS36jpN+YE0SIT8kn9c8a67JSZLkm/rL+delQte9xR
         JzkKvoHYxI1oHzPHC735XHF6i4y9k7sG/9DsqQlcorpHix8WYFukl1LRT5gSQXISz810
         rNOjKtYjZa53ISqrEKrunA5PYDhqF+RoZnuDhV2EfQG18NRTxvEb1gH5Z3H2JEDAKaew
         Ijji8NRGME0I/HKoPwbo5wo9tHNOt8SNpxSu0Jb/sCerYjGB3JXctJ37Q8yoDcCb+CMy
         XWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=NSWDhUhfW9z0265imGwJgv/oPaPv+6yvxJPywkDYS3Q=;
        b=FhbViNsX/CRJqnh9Ub1M+Ob9htjviDzRp5+gKqr2bOdf8ffq3caIrSIcNRrWVkm4Mx
         OrOELM2/l+DvBobBTxmPdfS7nhGr7/yJMDIA/YEKUeJikF/awxj2KXv/1kMVIqOUOQOe
         HC8Q4WKSKViwLTCZjQ5xMhAGrTzWxT2SN6gfhX6G3oVMTWINdy49s99yhdGowc/oFLxc
         Ew8//fVTNISaebY8AR6HpatdlrcwP9weHmFtbbCFRgfS4U+Rl8CIjS6Hre+N6RqVZ1bQ
         Dwe1kBif5MXTKfRCfX/mO+QHXkqoL0ud8jWg87DbiGq8Hao5mcPj9MdTbMeRjL3aAAu6
         cOZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUo+wpUVlDyRD6t3ODemcHgCdOxz7+mvy0pVKt1RpRnhxl1uNlN
	CeK8p8KHFR8kvnuGmWJ7ZXM=
X-Google-Smtp-Source: APXvYqySFnk5dcfnqPoVvAYI6nmay6/2k2qCvOgSZv9sbzRq8/F2BbN25uMEvn3+Yj5mXIWk/67xtg==
X-Received: by 2002:aca:4455:: with SMTP id r82mr1479512oia.165.1557216646106;
        Tue, 07 May 2019 01:10:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:748b:: with SMTP id t11ls2663231otk.7.gmail; Tue, 07 May
 2019 01:10:45 -0700 (PDT)
X-Received: by 2002:a9d:1428:: with SMTP id h37mr9060870oth.248.1557216645201;
        Tue, 07 May 2019 01:10:45 -0700 (PDT)
Date: Tue, 7 May 2019 01:10:44 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7a773b9f-976c-468f-a635-daefff7b9666@googlegroups.com>
In-Reply-To: <1dc27db0-aaf6-3107-bfea-70e2b4b75551@siemens.com>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
 <de3120a5-36a0-a681-1642-5fbabaf6b524@siemens.com>
 <6696c5ac-a0d9-4574-9eff-dd07eb08280c@googlegroups.com>
 <1dc27db0-aaf6-3107-bfea-70e2b4b75551@siemens.com>
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2868_1102228075.1557216644333"
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

------=_Part_2868_1102228075.1557216644333
Content-Type: text/plain; charset="UTF-8"

From 3c3df6a6a8f25997e9168a9bf201661e126e6d74 Mon Sep 17 00:00:00 2001
From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
Date: Tue, 7 May 2019 07:30:26 +0300
Subject: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved Section 
 While kernel command parameters are intel_iommu=on  intremap=on at
 some machines, cat /proc/iomem shows DMAR region under  reserved section.
 This patch must be done for config creation to complete  because of
 generating DMAR region not found error although it exist. If this  patch is
 not apply, below error is throw by "config create" command whether 
 intel_iommu On or Off because "reserved" regions are currently excluded from 
 the generated config although DMAR region exists. Thus, DMAR under reserved 
 section must be parsed by parser.

Signed-off-by: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
---
 pyjailhouse/sysfs_parser.py | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 46c95fc2..0bbd2ba9 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -94,14 +94,14 @@ def input_listdir(dir, wildcards):
 
 
 def parse_iomem(pcidevices):
-    regions = IOMemRegionTree.parse_iomem_tree(
+    dmar_regions = []
+    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(
         IOMemRegionTree.parse_iomem_file())
 
     rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region = False
 
     ret = []
-    dmar_regions = []
     for r in regions:
         append_r = True
         # filter the list for MSI-X pages
@@ -860,21 +860,21 @@ class IOMemRegionTree:
 
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
 
@@ -882,6 +882,7 @@ class IOMemRegionTree:
     @staticmethod
     def parse_iomem_tree(tree):
         regions = []
+        dmar_regions = []
 
         for tree in tree.children:
             r = tree.region
@@ -901,20 +902,23 @@ class IOMemRegionTree:
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


It is committed to jailhouse/next branch.

It is test on HP8300 machine.


Have a nice day...

HAKKI

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7a773b9f-976c-468f-a635-daefff7b9666%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2868_1102228075.1557216644333--
