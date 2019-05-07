Return-Path: <jailhouse-dev+bncBCL6VUP7RYARB3XLY3TAKGQECPIZOLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 387B11682B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 18:44:32 +0200 (CEST)
Received: by mail-ot1-x33c.google.com with SMTP id f11sf9498824otl.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=G/pRTZoaVxDiGN5H8WaQ83yvixmdS8c2E7iWsedCCaY=;
        b=RDmDEOkZc3AL3Bhm/0UoHjR4Az36uWtoVy97vUAHkAONc88NHS5UaF5C6KZBXG5a1M
         478jE80KgJSKSF8SRWL7YEsVh5y4TKakrYeO06L2BgDEpirkdxtiNl9MnP1/e7twCp+Z
         O+c7443UAKqDdQs4ptQbgh4nmNa26/+dEr/h8EeksxOGc8r+2EAnLJftv0OcTfVa4sUx
         ZLmzrT1y772AgkYDycYv2sN+a8W3joaupWuZD7taEDTGvv8Fu0ia7twFXpvGj/cKxyoo
         Vd7Sth1QwNG2To56WhhmJBaNU8lYsdVLnSS0t3+qg9NtqOJ4ds0P4RLu0NwcK9Havpli
         D7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=G/pRTZoaVxDiGN5H8WaQ83yvixmdS8c2E7iWsedCCaY=;
        b=qlRw+IhjMNRCv4OOSCek/hHdQfNEb/rnIu946F2QTiWq/oggXqWjzlnSbkFJ4tgxCb
         ydrLb5j6AbBTLCBa8hNJ/Kb2bEQ0ktC3isFN2KWDkuToEocduHwZQd4PKCo4+vULyo4T
         ntinXn+6n2fGSV5REC/qKkoOw74Ngu9ZovHs0h2tDKGMQrmckgdhmxZ5Nv22nYq5IuY8
         N+KdBcmr9eZqGdsQ6xbvrQ6h2sel800c4iRlfEWpAjjybWQYU03bDUMkcJP+qARQ0erA
         mmB5U08RfZDR5JrwCtjcuI+kR63XAFVym2+/OPtSwhiWcnXkRqSACaUZhlOqWUqLWaUw
         4Rvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXT7CW+JqT84cziDvVVJmsDKbnr3tWIjhnLcyuc6sdq3lScIZC0
	UiEkerVG8T044VdDLnq2/us=
X-Google-Smtp-Source: APXvYqxcBzT/tCEC4zKt6x+up3ukiZMMAbHVDLyhUXI7Q2+6mxTDjRypirA+KFSuSnwXN9m45LTOeA==
X-Received: by 2002:a9d:2208:: with SMTP id o8mr15388506ota.236.1557247471152;
        Tue, 07 May 2019 09:44:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:119:: with SMTP id i25ls312701otp.8.gmail; Tue, 07
 May 2019 09:44:30 -0700 (PDT)
X-Received: by 2002:a05:6830:e:: with SMTP id c14mr16112020otp.6.1557247470470;
        Tue, 07 May 2019 09:44:30 -0700 (PDT)
Date: Tue, 7 May 2019 09:44:29 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d88d8ae0-3f95-4cbb-812c-46e9d3bf1575@googlegroups.com>
In-Reply-To: <7a773b9f-976c-468f-a635-daefff7b9666@googlegroups.com>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
 <de3120a5-36a0-a681-1642-5fbabaf6b524@siemens.com>
 <6696c5ac-a0d9-4574-9eff-dd07eb08280c@googlegroups.com>
 <1dc27db0-aaf6-3107-bfea-70e2b4b75551@siemens.com>
 <7a773b9f-976c-468f-a635-daefff7b9666@googlegroups.com>
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2939_22032386.1557247469723"
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

------=_Part_2939_22032386.1557247469723
Content-Type: text/plain; charset="UTF-8"

FINAL PATCH:

It is committed for jailhouse/next branch.


From aa9e7f0e25317d2f516da68b4163f9f08fc6c76d Mon Sep 17 00:00:00 2001
From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
Date: Tue, 7 May 2019 19:37:59 +0300
Subject: [PATCHv2] Scripts: Fix for Parsing DMAR Region under Reserved Section

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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d88d8ae0-3f95-4cbb-812c-46e9d3bf1575%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2939_22032386.1557247469723--
