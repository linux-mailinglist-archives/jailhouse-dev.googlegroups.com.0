Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVHES7WQKGQEICVFMDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id E0843D7B1D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:44 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id w10sf10387917wrl.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156564; cv=pass;
        d=google.com; s=arc-20160816;
        b=h9lZElkvMpdZL7PtdlOcIj3mIC/wcoi7reKQUGVK0gBGeeoeGsLZN3k55Qi2JFroIR
         yQ/0T1KydKgHkrcsJXVVlU8Z9u2YbqClXi09AwqmWfwtZg95ykauEKxdudmZXKx3TA2y
         drw6INo/l0WPFvLGVlPC6ab6TsgtvR7qZw2eJqBoDmVC242bGRXkzhs565+aM2xE7VSF
         nw5Uj+xLaLQ6LvkEWhmcVp5xTrJ682l3IVJV17aHpRO7PqF7KVGYPmA6tPPlhi0gBzVU
         RA+jbozIjvo9FXhzB/0XW0Ghgh6A0KBJWNWFFMqGJO7kuMAWIutakqh4jrUdfFJ3iTAF
         yLmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=isU1F1+V1jPEBg4pSVf+hO3lpJTQUgszjdmL9LTKJuQ=;
        b=gOObWA2CU37VNq66YYlGzO6La9dEXD4pJIEOqlHTdFbqMT67tKp0zOjtjYdwYxW9yu
         znpP6P/mcp2W48B21Pp7tdrNnC93d4qRZEb6+PwR9Q9hyWq/bOUK0A1A/x/i3TYYhedg
         L7LMQz7i0uKOzOpTnnjdqUxpdbnUFxceC1Qy+CQ/78Lye6bBP5xmFOUjGU0MJB11Kr8F
         F71JddUJRPx1UfKx6acv54RrKQbMFnmHB8MZnhIO+ku5/KXbTGLkstFdxxQt9IdHSGFP
         OBIVGsEcqBCKsamk6hMPNPKA2Ci9anqjrbn3sbszMBmK58O/l+Alvsq++HEHLQxDTZ5P
         hEQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=isU1F1+V1jPEBg4pSVf+hO3lpJTQUgszjdmL9LTKJuQ=;
        b=ngCS3pmUdxdTzGyQIr/Hgnw5zemZwQIwBUUHG3CXSX9Nm2FEb3GKVwQJMLT53EnzJp
         cWD32kk2THBv12AQnKKRIpQr12hrWVNS1NGrnu7bsxXAmG9jNVgK21LQxMx0ryVF0qBy
         E4q1ygRUMZ1fyvSPNI0ZOdQ8uB7weWXIKpNRJ4KdGcnAbgqQa3md7KhzyarypdLS2zLV
         U4benu8G1vWk2d0jL8ZmOUAvp8iI7gjlDiw3W6yBLPY1wVaPUCxPkfOkNGp+3SiyiYk2
         uV2geD4YtZvFfjvYhptlmpsFMbyquMoswacgVT4cODAygPtW9GQgPxsVJj3t++dtf+Gi
         QLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=isU1F1+V1jPEBg4pSVf+hO3lpJTQUgszjdmL9LTKJuQ=;
        b=JRWUl2QYCLTyW0CLy+7tEUkTDgsLr3llj6KNy4CxRtqNZs7D6hsBBWdNgPQLuBehbh
         /qiBTvanyLcPEChd7jeh9vNGKDayn8YqR4ym1w1fesaKulX+CX/fUK0aGcq8RwmaqZyS
         +11AxkSSSo0IDXNY1PP910bPUFfB/gAFWN/eo+knFE3VyZtHJx0A4U6rHysgnNyNk8Ep
         LCJD2Gf2muUemNth34Lojhl4ftnMfDkVKaZL2F28jR3XqwVdWaVEh1873f3MIUlvM3kH
         QB2CcYlGhJJJW3wIpZQ77g74+G3aqTuGUVRGITfjZxaN7jqjD7orxhCq3shnqObQfH7+
         QCGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVMVKv8mMZA7Tijge0e0mjmj4DibFaBU6i5DGrFkdIlaEAfXY7l
	AU0RxXxEvor9+Qerysin9JQ=
X-Google-Smtp-Source: APXvYqzNpgc3iMoILB4kyPbeYlAb7mtslBWYnMG20C51CY3BpZnTZjRQ+J5t5/nKupCMiktqx+sdoA==
X-Received: by 2002:a1c:9cc6:: with SMTP id f189mr21522192wme.80.1571156564580;
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c772:: with SMTP id x18ls8116680wmk.1.canary-gmail; Tue,
 15 Oct 2019 09:22:44 -0700 (PDT)
X-Received: by 2002:a1c:7305:: with SMTP id d5mr19756180wmb.84.1571156564016;
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156564; cv=none;
        d=google.com; s=arc-20160816;
        b=VT8clXTo0hKth2k2nG0G8XwrOJuGR8WqWuu9519D4vJcBBv8+IVl0BseD7F+zr9Eck
         MHjOaC0I1imfrpaKQM+Qkkz4fW/yrl3pmWuJBcUHg0Nkd4AevwYwHhbJFZA1IZZF3mug
         xK3b1G7ajh6Qr6+tGpWsNpvjb+xfqR78zakYSlo5O3oh4y8LwssSZ5l2qXdLMnRmXx5t
         GroOpy4IfzD//yBcYss+3XVKWOOpxcdV1GAWk6bkHK5gZ4Yk4ZcBElHio3xZXsvu03Qh
         v97t0NcaW4pJYBF/i2QG6TpXSmPiRT4wpg2KGLTSzD0VtUH6G5N47Mw+aiSQjAdWAPs6
         6PvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=dbUocKJLNSNJyoI5HcdaXSdQcWA45D2BNE+vWNFLiRE=;
        b=N52BjwhXTGvOaKkNYCHBb5CaUlPqCDES0y/pQBPPEmPMZrT94oqNDd1HNjbjyA4h5t
         QCjABjKBn+gQ4yivUtbAwcxejs+AOzGV+Svza2bpZb03elPgtJY1JjXQJG4KUa+4j99e
         DlVFCXKuCrDJSTysBQ3mLl7RSgJ/z0s0wChd3L1zsdu7ESveR5Yc+nYNGKAllRxffKoz
         G0aeOa0HhRd2aDvqGL1d6oA1ijjfyzosCC+KKuPPEaf+q3aTkiJk433Bv/gbY2nHmrUQ
         YPYP7ml/jTHuw6pVp2+vS4q3jqFTGWvh5Ab3L5BycmYjfGlbf+qaloCRTo032g7VRwr3
         ZaJg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id o10si1786258wrm.5.2019.10.15.09.22.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11H4P4Pzy5p;
	Tue, 15 Oct 2019 18:22:43 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 03/13] pyjailhouse: sysfs_parser: minor stylistic fixups
Date: Tue, 15 Oct 2019 18:22:32 +0200
Message-Id: <20191015162242.1238940-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NAME_BODY 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SEO_TOP_RANKING 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

The sysfs_parser is written in python and not in C. Saves some
parentheses.

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index f5071ca7..98717b4b 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -125,7 +125,7 @@ def parse_iomem(pcidevices):
                 append_r = False
                 break
         # filter out the ROMs
-        if (r.start >= rom_region.start and r.stop <= rom_region.stop):
+        if r.start >= rom_region.start and r.stop <= rom_region.stop:
             add_rom_region = True
             append_r = False
         # filter out and save DMAR regions
@@ -141,7 +141,7 @@ def parse_iomem(pcidevices):
 
     # newer Linux kernels will report the first page as reserved
     # it is needed for CPU init so include it anyways
-    if (ret[0].typestr == 'System RAM' and ret[0].start == 0x1000):
+    if ret[0].typestr == 'System RAM' and ret[0].start == 0x1000:
         ret[0].start = 0
 
     return ret, dmar_regions
@@ -836,7 +836,7 @@ class IOMemRegionTree:
         kernel = [x for x in self.children if
                   x.region.typestr.startswith('Kernel ')]
 
-        if (len(kernel) == 0):
+        if len(kernel) == 0:
             return [self.region]
 
         r = self.region
@@ -847,20 +847,20 @@ class IOMemRegionTree:
 
         # align this for 16M, but only if we have enough space
         kernel_stop = (kernel_stop & ~0xFFFFFF) + 0xFFFFFF
-        if (kernel_stop > r.stop):
+        if kernel_stop > r.stop:
             kernel_stop = r.stop
 
         before_kernel = None
         after_kernel = None
 
         # before Kernel if any
-        if (r.start < kernel_start):
+        if r.start < kernel_start:
             before_kernel = MemRegion(r.start, kernel_start - 1, s)
 
         kernel_region = MemRegion(kernel_start, kernel_stop, "Kernel")
 
         # after Kernel if any
-        if (r.stop > kernel_stop):
+        if r.stop > kernel_stop:
             after_kernel = MemRegion(kernel_stop + 1, r.stop, s)
 
         return [before_kernel, kernel_region, after_kernel]
@@ -908,11 +908,11 @@ class IOMemRegionTree:
             r = tree.region
             s = r.typestr
 
-            if (s.find(name) >= 0):
+            if s.find(name) >= 0:
                 regions.append(r)
 
             # if the tree continues recurse further down ...
-            if (len(tree.children) > 0):
+            if len(tree.children) > 0:
                 regions.extend(
                     IOMemRegionTree.find_regions_by_name(tree, name))
 
@@ -931,19 +931,16 @@ class IOMemRegionTree:
             # System RAM on the first level will be added completely,
             # if they don't contain the kernel itself, if they do,
             # we split them
-            if (tree.level == 1 and s == 'System RAM'):
+            if tree.level == 1 and s == 'System RAM':
                 regions.extend(tree.regions_split_by_kernel())
                 continue
 
-            # blacklisted on all levels
-            if (
-                (s.find('PCI MMCONFIG') >= 0) or
-                (s.find('APIC') >= 0)  # covers both APIC and IOAPIC
-            ):
+            # blacklisted on all levels, covers both APIC and IOAPIC
+            if s.find('PCI MMCONFIG') >= 0 or s.find('APIC') >= 0:
                 continue
 
             # generally blacklisted, with a few exceptions
-            if (s.lower() == 'reserved'):
+            if s.lower() == 'reserved':
                 regions.extend(
                     IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
                 dmar_regions.extend(
@@ -951,7 +948,7 @@ class IOMemRegionTree:
                 continue
 
             # if the tree continues recurse further down ...
-            if (len(tree.children) > 0):
+            if len(tree.children) > 0:
                 (temp_regions, temp_dmar_regions) = \
                     IOMemRegionTree.parse_iomem_tree(tree)
                 regions.extend(temp_regions)
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-4-ralf.ramsauer%40oth-regensburg.de.
