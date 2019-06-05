Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBO6W37TQKGQEYODGQZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E08836103
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jun 2019 18:18:04 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id t141sf631089wmt.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jun 2019 09:18:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559751484; cv=pass;
        d=google.com; s=arc-20160816;
        b=UEZtt420DeeKa73GEbGzIzVCZKuzQql4bt033WoYrxR1haBTcjwjKqdfvdft1Jehju
         /lIEGRoZWKUNh/9Gdn430EFtx0JDPsGPIX4i7KzyE/5ZtSZgfXzgQN6qn3GqBWIjBLib
         IxnN/fVOxENG0cNIwIMTn8NFgF/n5CKcM35LxHGP6ZZuzGyIr6X2CfhKyVCBbpJX4afB
         GnSxjuKr2KGQxhGV/reN3dl+Xm86rJzu5rTY/cfScZpowvwIy/IoSswKo+5qrxGjEF0Q
         G/TdPGN+7cfGt9b3hzslbp5PiieC85coPhcx44LAhvkWJ+lJuSqQVb+eLnMnxo5GGdEy
         lZtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=gM+m65nXsnnYnxiQDpLLIYAtmOzQi4Sh7+M4V+R9UAw=;
        b=WmdI3Ib0o0E2qE39gmrfkYUstUSyofLJ9glKoWEOVPnYx7fQ98vX57BkXAi1FgwIIp
         KG2hXrIVjW4i/fSEoLixKFFjt0GK3dOzb/TL1+pccirNzyQjhn+Iann5FRBX+GIkjfPS
         RT9yTimRyrMKzsrax98gINOhlUv/7/PMIVBurXNuoy3KjzQyVDY1UDfCAS7tDmbdOojr
         5kw6mQqyK52fqD11lxrEUsUrrSNrRKZ4AtStuNhl+qvKoFtLJR8zqNjzMoKoJgkojXor
         43TREV7QOECa8W9gEiK+uMPhUSDfOdmsvJCqRRjBqxUi87dNPr0cqM+lk4F6f2IBFmOs
         CHCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gM+m65nXsnnYnxiQDpLLIYAtmOzQi4Sh7+M4V+R9UAw=;
        b=oTzRbLTdPEsQtF83vqRMd7f0QnDZwcBYIguFUJwualD/4+QHvfgkiYohz5CkDD4HGq
         vLPQ1YlcA2QnhEGOpR/mNaZxHpYgYXCmhpg2pzrKL+afz6raJQ+HBEFJyFhk8WOGJH30
         TWcdgUBaco8pxtF5ESM/UsjJhTdCJiK1c8XrddpBv3qU/yfc5fgiEZGblWGsNUnsZDim
         Z3Q1eD+woIxUsrl1mz0kGuZ1O7FA4SKI6ErtaGvcYTs25ym200TSg3O900svCgc6FEgP
         WC5IvboGHBIuNkoFjw1kqM8uqgNG9TLZ4wRy9QH2Kdq2z+CyfBUN5yK47YV2gKyaIoUw
         IAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gM+m65nXsnnYnxiQDpLLIYAtmOzQi4Sh7+M4V+R9UAw=;
        b=FKkPesnkY6IdhqR47GhI5op8MCOqKhRpovgEWple0VzeSJwrFUwlbPUl3VC1BkiqU0
         Iqy4aib1qYJBpe6DbDmR8dfuiCWOIDtkmuumFWzgLWUXAm6Zg4gqWmmjc9VwR0LK0rQg
         WcEAI1YVSN2qb01we+aYw50lfTM+2b2sZarpK/OVFeeLsdVDB+p0U1v4bp8DIMFmTIJA
         TTDjgqzQIT41QSGi10ExKeYmwBP+yTq7bwAqqVo/N+q8Wjf8ExCQfjZEh1e1emDmoxz6
         Y/cBCdVqHGwTU7gD14a/iomOKynxWCOLVN8hE6wFjKvfr3v1m8uv+TYqfLRWQmzHkjhw
         GCNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUk3/lkVV/FrIwSH1GqBIV3B4cwf4fOUBgRow5sHdgMcMqDN+X3
	/xek3Nq0smEuXaWMtaHjJZs=
X-Google-Smtp-Source: APXvYqwdG99ThgmspYyT4mLbuDmjZi3GX48XM97hb2weJhIgwfDtL8yD83wHnml7ExX/A5i0htVd/w==
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr11299021wmm.96.1559751484044;
        Wed, 05 Jun 2019 09:18:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d05:: with SMTP id z5ls545876wrt.15.gmail; Wed, 05 Jun
 2019 09:18:03 -0700 (PDT)
X-Received: by 2002:a5d:4acf:: with SMTP id y15mr11630896wrs.32.1559751483341;
        Wed, 05 Jun 2019 09:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559751483; cv=none;
        d=google.com; s=arc-20160816;
        b=LyLetlEzRdMdEsgOgxCq2WyuUhSxpsbiykzEzrawAYOyu+3VN9yZtz5MgpisyABtT7
         wVln3ZFLnxonjlb7mw/qrEx6vyj8mkxy/bvwnA4FrkZZvGUXGy/ZoUnObUKTV2wgID18
         dxT2j8JTmv4zBVw+YFDj15YkpRUI47Yhp4TJpOaBX5pw3qIVxak+yf+zrSovMHal91Wo
         B4WTorsChAnzJKKxGBr6Yia8mGm4jpjx6tgbBGctEjcQ8JeB7x17UEZtghwcSICB4xjD
         cmjbpPg8R6KkNtIsUU3T1FJOHrx029fHN1KMcIPDsDU9qB+pA2Z/r09TYR7De/YGF1y7
         UV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=ZUrG0yuWVD4GhGe26tYEZ4SybBoGo0hqbyvGcfDqZfo=;
        b=XZHzaPaDYxlHhhjy0QCXg1XuUKi/Nb4znfRbfFuUCUJxpE4ZL5jjyHNFWz1nwdTF8k
         JgLfI3joNkt9OEXIlYXq8OD0JjMbYp+i0Dy+WkX2xiMA+P7FIiFJxLvAmXDILY3w9/ZG
         92tp6zx7zdEL2nit2JOENytsBD7H/DYZ8wqJTJujEeZcZC8/Ni9Nj9au2wm/989F0vcW
         nG7Vn2XIstXnSbA4YYx8Xo9W8Q4elkV+xYfPuc2nHls7P9aXUa6j3zOSjE812scVB7X3
         Af8NVKkm02S6jlXIzjjG3PaOb074sQ7fHtF2jO3skI7e/G3a38Uq4Rpq8gurhjDiGocV
         mKYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id j18si1091556wrc.1.2019.06.05.09.18.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 09:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from localhost.localdomain (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Jv8p3Fbtzy5p;
	Wed,  5 Jun 2019 18:18:02 +0200 (CEST)
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@web.de>
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 1/2] pyjailhouse: sysfs_parser: generalize IOMemRegion as IOMap
Date: Wed,  5 Jun 2019 18:17:44 +0200
Message-Id: <20190605161745.2389-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.5.160917, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.5.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RCVD_LOCALHOST_LOCALDOMAIN 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NAME_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of andrej.utz@st.oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Content-Type: text/plain; charset="UTF-8"
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

This refactor allows us amore flexible use of the 'iomem' file format parsing
i.e. for ioports in the following commit.

No functional change.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index fa32ba48..56265fb5 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -97,8 +97,8 @@ def input_listdir(dir, wildcards):
 
 
 def parse_iomem(pcidevices):
-    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(
-        IOMemRegionTree.parse_iomem_file())
+    (regions, dmar_regions) = IOMapTree.parse_iomem_tree(
+        IOMapTree.parse_iomap_file('/proc/iomem', MemRegion))
 
     rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region = False
@@ -785,7 +785,7 @@ class IOAPIC:
         return (self.iommu << 16) | self.bdf
 
 
-class IOMemRegionTree:
+class IOMapTree:
     def __init__(self, region, level):
         self.region = region
         self.level = level
@@ -837,22 +837,22 @@ class IOMemRegionTree:
         return [before_kernel, kernel_region, after_kernel]
 
     @staticmethod
-    def parse_iomem_line(line):
+    def parse_iomap_line(line, io_type):
         a = line.split(':', 1)
         level = int(a[0].count(' ') / 2) + 1
         region = a[0].split('-', 1)
         a[1] = a[1].strip()
-        return level, MemRegion(int(region[0], 16), int(region[1], 16), a[1])
+        return level, io_type(int(region[0], 16), int(region[1], 16), a[1])
 
     @staticmethod
-    def parse_iomem_file():
-        root = IOMemRegionTree(None, 0)
-        f = input_open('/proc/iomem')
+    def parse_iomap_file(file_path, io_type):
+        root = IOMapTree(None, 0)
+        f = input_open(file_path)
         lastlevel = 0
         lastnode = root
         for line in f:
-            (level, r) = IOMemRegionTree.parse_iomem_line(line)
-            t = IOMemRegionTree(r, level)
+            (level, r) = IOMapTree.parse_iomap_line(line, io_type)
+            t = IOMapTree(r, level)
             if (t.level > lastlevel):
                 t.parent = lastnode
             if (t.level == lastlevel):
@@ -884,8 +884,7 @@ class IOMemRegionTree:
 
             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
-                regions.extend(
-                    IOMemRegionTree.find_regions_by_name(tree, name))
+                regions.extend(IOMapTree.find_regions_by_name(tree, name))
 
         return regions
 
@@ -915,16 +914,15 @@ class IOMemRegionTree:
 
             # generally blacklisted, with a few exceptions
             if (s.lower() == 'reserved'):
-                regions.extend(
-                    IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
+                regions.extend(IOMapTree.find_regions_by_name(tree, 'HPET'))
                 dmar_regions.extend(
-                    IOMemRegionTree.find_regions_by_name(tree, 'dmar'))
+                    IOMapTree.find_regions_by_name(tree, 'dmar'))
                 continue
 
             # if the tree continues recurse further down ...
             if (len(tree.children) > 0):
                 (temp_regions, temp_dmar_regions) = \
-                    IOMemRegionTree.parse_iomem_tree(tree)
+                    IOMapTree.parse_iomem_tree(tree)
                 regions.extend(temp_regions)
                 dmar_regions.extend(temp_dmar_regions)
                 continue
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190605161745.2389-1-andrej.utz%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
