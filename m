Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBV7ES7WQKGQETCM2AII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A481D7B27
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:47 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id t84sf3873561lff.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156567; cv=pass;
        d=google.com; s=arc-20160816;
        b=QkP+G5n+54bJiivfYf1aZGApI8wYge5KXG2inQ7YJgFCXuUzEWYDzgk3EQAHzCGAzQ
         k0oWuhrP66yVr1gOC5kRe1dkp9INzA7lgYrSoSwwhOcVOQjqEuoj8A/Zqx7fa/+jljpw
         f8b0MSe1MiUUVWMp4HwkfOJ0WJNkhfff2dIAbOnkWdq+FIG03tqSZxIoOZyd+ihO3ETs
         0Mla2Wu+2OfKu+81/EgVb6Hfa8pgXJfK43UglWOathm1EChOst/BW9wY455zPnkST2m2
         4KK8lULxfwFRByI4+cqmwSvLpIvGcx0apeafux0PINiqz5VvxOzTR0toTGyWhLc7lFHz
         xoSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LgCN8/A+7YjAFgraRPbNs8207aOovsUdGN8GmJL8A9Q=;
        b=Mjhf9odyEUUTMnifMcvSmYlZltImD2sZ7uxE7WJWxGmezHOY056Esejco2hcMmBImF
         dDyFxA6TQXTv9LEMXPhQ74qPWr8psgLpBMIxtsNAwCCcx5VzjfbVID3gWuzd9sTe5tDW
         KO699/e32uafjBS177QG724EW9IqdXz1XNOa7CF8Rq1sB3XlwTR51Nt5wEFQLFaLU8Fp
         lJGdh2gSoxp0bD44iEWrxqheQFJqchslLKJ9viv3MfHWXqy3ugXV35doaSfjIL5cKv7f
         ONYkFtacwePfpQy+5GbEmzuZMoiflhtLmwjLzQ/+z3gkTLCDXUJVutUzbHXhQayduaxa
         /5gQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LgCN8/A+7YjAFgraRPbNs8207aOovsUdGN8GmJL8A9Q=;
        b=F2GVuavc6JyfYGgB0a6+VPUtrsYWEekKxNPqPKWbFhevOJy0DAQdeG5aarpUKiVnYC
         2psp5zJtL2BYP8CCIfsjsrLHBj73n7PdfQ4GB8lfbGfav7dnDYBAJ4ecbXSokvvb6OWc
         cq6/rzheyg6SdoaPdxC5Uww7Q/cUxo2gxWdO3umfOojHrPbeQGtQc73+E9HnFCJGw1SX
         xdR41n+hxtrDuPVpXFqYizKtW5N9lX0ZPjjEeszeThyLyViVfWFmUyEWtG5g1DNqrsIV
         zXHo5/uF3BvcR8bDTLPFHlL22gDxj2TwEE1/R26sm90LfyQvmCmz6lYn1YdgQZGXbSrF
         MWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LgCN8/A+7YjAFgraRPbNs8207aOovsUdGN8GmJL8A9Q=;
        b=QB9204nSuEVcGtjrtONTFS2qzKnp2WqbxTnS5v+Cq3JZXPk3Mzg/UkWN0TfwpEN8lf
         62MwUggZS+8y625eViCfM8qm736iEya5Z/v1K7GdN8OvmJRp3cPuI8dWNY5QvmpXEarb
         FnqST0geC2frPahohR+Iu/B834VDGadFNef269x/HlB1GjFxO0oZkSUmGYicQppd+QnK
         +7NP8SsS1K6kigeAVo2nxG/1vrOtmYCmwJQ7k7jBAs5qIcael2VxHWZMnIvhCHpoeGZ9
         86vkVBtbxSDnGEhbHBeuN/0Eq3KPPAdLkGBUG53N3v8E5PClH5r4CPvhBcObHsnaVL3t
         C69Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU+glxUfJjIDxZFraL4TiQZsIhFljym9EYHPNqU4r8WXPYrIEEy
	X7KFCzEyKVU2b1qrHCrTXtg=
X-Google-Smtp-Source: APXvYqznAb1SrprfukaMDI8bLrVPJ/03uKy46VqLTFI3jLcK2rPEN42WeefbpyKv1w5fuJn9tvziCg==
X-Received: by 2002:a05:651c:150:: with SMTP id c16mr22919697ljd.89.1571156567189;
        Tue, 15 Oct 2019 09:22:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:5d57:: with SMTP id p23ls1693474lfj.4.gmail; Tue, 15 Oct
 2019 09:22:46 -0700 (PDT)
X-Received: by 2002:ac2:4578:: with SMTP id k24mr20998347lfm.84.1571156566610;
        Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156566; cv=none;
        d=google.com; s=arc-20160816;
        b=G1c+LZbeeBiOki/2gNYxI3Qv3pHPSHbRhodgSUKzTUM5CtalLDsKmFH38B1UdaSkWt
         gqhNaufIh0XAGUTakG+DiQd2iTqI7JZ/yzTrPKA1IVtVG6mnIae4xiSfk9zkNNLKl0mK
         VWlRtQEJWzIBbvP/KEgn07w05VS7a9Ooh+5E2oa+hzfc/EXwyMJ6lwstxESgpZAE2krd
         NlNIY/Ae13CE8LE6qvE0w9HrbOZhseGm49lbH7d1f63G/8KmKSVdGbFSWbx0WLQoI/sE
         a/pTkgSMnQyBOMdZZuQCljrdcicqu7Fv/c1uXHcKbsfVz6w+1hEAIavh4ec5qjfwiJC3
         h97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=FHa7rNsxH7cohjU/0tim2GzIg6a5HH1GYszTpC/IBQk=;
        b=ESGyybVpu8TgGaMsreNptOaZhNP1KT4jr9fGzKISR4LWedlT8YUrq+48KggIwYxU+x
         om58TBCbVZ8/eRctRnfdhv+I1ucRKqEvnUJ8+RP0IP8bcM1hH3CW8HZek/deaZ4hUTB1
         oRuLmC020YjAqEJ+uGGvBPVhfI3NN/yqthXJ1/Tv9Og/toOF46p2dPw/VpAlJ0RhemU1
         n2ijpa2jjJcPMLqoZEoiLnNnX1FL7q0C6jLqfsCXaPCd0aIRs+Mu5I2jCbWb521gmRT9
         nqIcrbipkahSb2aOdvFcSv0hTLqLgRZD3372MZY7zX1HoLAqUm8KlOHSkMi0uWOrG9wH
         u7ig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id z4si1387757lfe.4.2019.10.15.09.22.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11K50K0zyBN;
	Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 13/13] pyjailhouse: sysfs_parser: Remove IOMemRegionTree class
Date: Tue, 15 Oct 2019 18:22:42 +0200
Message-Id: <20191015162242.1238940-14-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NAME_BODY 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

One last housekeeping step.

Only two staticmethods were left there. Move those methods to the top of
sysfs_parser.c and remove the empty class. Even saves some lines.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 149 +++++++++++++++++-------------------
 1 file changed, 72 insertions(+), 77 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 3cefc2c7..1c662280 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -98,9 +98,80 @@ def input_listdir(dir, wildcards):
     return dirs
 
 
+def regions_split_by_kernel(tree):
+    kernel = [x for x in tree.children
+              if x.region.typestr.startswith('Kernel')]
+    if len(kernel) == 0:
+        return [tree.region]
+
+    r = tree.region
+    s = r.typestr
+
+    kernel_start = kernel[0].region.start
+    kernel_stop = kernel[len(kernel) - 1].region.stop
+
+    # align this for 16M, but only if we have enough space
+    kernel_stop = (kernel_stop & ~0xFFFFFF) + 0xFFFFFF
+    if kernel_stop > r.stop:
+        kernel_stop = r.stop
+
+    before_kernel = None
+    after_kernel = None
+
+    # before Kernel if any
+    if r.start < kernel_start:
+        before_kernel = MemRegion(r.start, kernel_start - 1, s)
+
+    kernel_region = MemRegion(kernel_start, kernel_stop, "Kernel")
+
+    # after Kernel if any
+    if r.stop > kernel_stop:
+        after_kernel = MemRegion(kernel_stop + 1, r.stop, s)
+
+    return [before_kernel, kernel_region, after_kernel]
+
+
+def parse_iomem_tree(tree):
+    regions = []
+    dmar_regions = []
+
+    for tree in tree.children:
+        r = tree.region
+        s = r.typestr
+
+        # System RAM on the first level will be added completely,
+        # if they don't contain the kernel itself, if they do,
+        # we split them
+        if tree.level == 1 and s == 'System RAM':
+            regions.extend(regions_split_by_kernel(tree))
+            continue
+
+        # blacklisted on all levels, covers both APIC and IOAPIC
+        if s.find('PCI MMCONFIG') >= 0 or s.find('APIC') >= 0:
+            continue
+
+        # generally blacklisted, with a few exceptions
+        if s.lower() == 'reserved':
+            regions.extend(tree.find_regions_by_name('HPET'))
+            dmar_regions.extend(tree.find_regions_by_name('dmar'))
+            continue
+
+        # if the tree continues recurse further down ...
+        if len(tree.children) > 0:
+            (temp_regions, temp_dmar_regions) = parse_iomem_tree(tree)
+            regions.extend(temp_regions)
+            dmar_regions.extend(temp_dmar_regions)
+            continue
+
+        # add all remaining leaves
+        regions.append(r)
+
+    return regions, dmar_regions
+
+
 def parse_iomem(pcidevices):
     tree = IORegionTree.parse_io_file('/proc/iomem', MemRegion)
-    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(tree)
+    (regions, dmar_regions) = parse_iomem_tree(tree)
 
     rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region = False
@@ -996,82 +1067,6 @@ class IORegionTree:
         return root
 
 
-class IOMemRegionTree:
-    @staticmethod
-    def regions_split_by_kernel(tree):
-        kernel = [x for x in tree.children if
-                  x.region.typestr.startswith('Kernel ')]
-
-        if len(kernel) == 0:
-            return [tree.region]
-
-        r = tree.region
-        s = r.typestr
-
-        kernel_start = kernel[0].region.start
-        kernel_stop = kernel[len(kernel) - 1].region.stop
-
-        # align this for 16M, but only if we have enough space
-        kernel_stop = (kernel_stop & ~0xFFFFFF) + 0xFFFFFF
-        if kernel_stop > r.stop:
-            kernel_stop = r.stop
-
-        before_kernel = None
-        after_kernel = None
-
-        # before Kernel if any
-        if r.start < kernel_start:
-            before_kernel = MemRegion(r.start, kernel_start - 1, s)
-
-        kernel_region = MemRegion(kernel_start, kernel_stop, "Kernel")
-
-        # after Kernel if any
-        if r.stop > kernel_stop:
-            after_kernel = MemRegion(kernel_stop + 1, r.stop, s)
-
-        return [before_kernel, kernel_region, after_kernel]
-
-    # recurse down the tree
-    @staticmethod
-    def parse_iomem_tree(tree):
-        regions = []
-        dmar_regions = []
-
-        for tree in tree.children:
-            r = tree.region
-            s = r.typestr
-
-            # System RAM on the first level will be added completely,
-            # if they don't contain the kernel itself, if they do,
-            # we split them
-            if tree.level == 1 and s == 'System RAM':
-                regions.extend(IOMemRegionTree.regions_split_by_kernel(tree))
-                continue
-
-            # blacklisted on all levels, covers both APIC and IOAPIC
-            if s.find('PCI MMCONFIG') >= 0 or s.find('APIC') >= 0:
-                continue
-
-            # generally blacklisted, with a few exceptions
-            if s.lower() == 'reserved':
-                regions.extend(tree.find_regions_by_name('HPET'))
-                dmar_regions.extend(tree.find_regions_by_name('dmar'))
-                continue
-
-            # if the tree continues recurse further down ...
-            if len(tree.children) > 0:
-                (temp_regions, temp_dmar_regions) = \
-                    IOMemRegionTree.parse_iomem_tree(tree)
-                regions.extend(temp_regions)
-                dmar_regions.extend(temp_dmar_regions)
-                continue
-
-            # add all remaining leaves
-            regions.append(r)
-
-        return regions, dmar_regions
-
-
 class IOMMUConfig:
     def __init__(self, props):
         self.type = props['type']
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-14-ralf.ramsauer%40oth-regensburg.de.
