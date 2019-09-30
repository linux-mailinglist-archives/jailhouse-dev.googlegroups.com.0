Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB45HZHWAKGQE5KG6WKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52BC2630
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:13:56 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id q185sf3350184ljb.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:13:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569870836; cv=pass;
        d=google.com; s=arc-20160816;
        b=lXKRaLdpJmU1uWBXCXiZnkQr1d6khi+46faXkJs/opCqqtmzOK5i7sgU0PUZJbpHe2
         yfhy+cm633IMZbTTvkDUqXbAOrBmgZMBVibK+Jey7HXTB4l0EIPpfEwWvkwSsSkyTQZH
         XzGPaiiTVphy4x04DtuOgyWA6V2Iog09lP3xovrGsDh5jlVdQLTx9yzrhO1PB8V7hh/P
         qFDDU3fJ4/YdEL7NC9jns6rUOhW/if1pzZ1OtwhIZLo6KZywCvOIha3IsaS+kjGwUOeg
         5OEhVRnU9t6Nm56O4yLpFajRoUPpHEUZahaIDGoVYKF2V1hhuo/xgaPl7xgwz0yjHI3C
         ZWjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=2qP2AxCNgp0flssRCFa3OkU6QgjVSh4Edqq8tsK8xio=;
        b=0PA0CU0P340afaJeyUu66HMv9s5TyMjfx76JV2NsTMnh3IEpkuVrvAAigNB++WiDMp
         dcbhnPXjGliihRqohjUluaxKJBBf8R6pMqi3xowdr4sC/+CWY/7Z3QsYYYxj8DYRG+5V
         X0MlLWv4K39nQS+nedwzZ/TTwimpU4lrIFTteC+0Ft1BUlxktkdwntK+5IBPu0kJvASZ
         eNiEb69PdwlC5AMsssYz/K/mw7LqWHNr7BBnZq70Ft18z6Uy5IXkGf+CiyMMW6TI+Zsf
         KS3FWfe6gqnnM3/41B72TR1OEMk97FVT6hxbMHLOzcIo/wXN4VT9QGvvFZRtkq04LZtz
         qMLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Tkhol5Hs;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2qP2AxCNgp0flssRCFa3OkU6QgjVSh4Edqq8tsK8xio=;
        b=Vg+NsO3g2F/npDcMhIlwxR0hDtSmi85BTakePMsoL/cZmkazay4p0g4PqRfBKZLhyC
         5OBXriNz9W9jWdlPthzo5GfZK5IjXtCI8BnY0xUCaPMBXRfuSrMKDoLzDnkjHQWfFpWc
         xUbN2k7xEnC5qT6Vek4G07uSuUu97yGzyWb2oDRT/y0YmZEDZL7mtpsAYY64c8JxypWN
         3D52OiYNPDmiBlVz9xrAJpvmjGac+iGYTPyeyjUy+wdhkve+3QzkI0slK6sClqo4/iss
         zBGDAWeeh7RgqBIYmclgbu9v08oI2OM1gQ9q+lKBdoKEbFdVj6GbUsYRXd/VwhVrj5yv
         XuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2qP2AxCNgp0flssRCFa3OkU6QgjVSh4Edqq8tsK8xio=;
        b=KfQYCfEOLq+BLeJ/yckRq0gcd+pq+yQN+KuKYVyQwiDIm1hceN6/cLtLCu13lT5tsg
         AS13Pi6cBzDux3PDA/hBQ5JR4XsrylxFjH2xjZ0O0nGIvmOsXkqG9LCwybhpfkJLsRE2
         GZN39vpt0MiKx3ZS0EKTkBKD0wV8MInLt8N3Un0Bla4otg5ZAg789nXr1OPQ1URH5GIb
         PvblJRFLM4xGZKr9tVE7PmPh3gif0+Q66FvIzrPLy9lVX0C3sSbPcnRgfGbuASyUx8P1
         hL+UWc5kT2BXcImQvGNm9A00rsAsecs2qFBEkKc4Bl0h/1RHnZ10iwoFe4+CUnVoo6w5
         YgUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW7Vj6XzVQYIokaK+4BLWzuutW/gfnecX8sWc9D0GU9XccN1lvG
	6sQHWDIifTCria2lHM846gk=
X-Google-Smtp-Source: APXvYqy1CaclgD6HfLVe0t2+TYHKqFwCT0nEEiOFG2pQf5Eph7qy1SjIRAIEBjwbAcpLnAE+LI3HQA==
X-Received: by 2002:a2e:141c:: with SMTP id u28mr13439127ljd.44.1569870836093;
        Mon, 30 Sep 2019 12:13:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1043:: with SMTP id x3ls1650165ljm.14.gmail; Mon,
 30 Sep 2019 12:13:55 -0700 (PDT)
X-Received: by 2002:a2e:8616:: with SMTP id a22mr7904234lji.6.1569870835537;
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569870835; cv=none;
        d=google.com; s=arc-20160816;
        b=uVKfjXWxcW8a5s0oDhLIJV/03C9qhzqBrNetkPrPjbeIdbTSm47BZrsoBrwqU+1Se6
         YTKe/yMFXR0mSpr6Sv29T4f/w5C81Q+EIY8BKKTCfcuACh6KPU5CiWKJSXEPuGLzAE0+
         Ocyq3rhSa7D21jqCNliV6xAhXRyT16bbrKO7s05l7iZxm6tiynVFw2xFRi8MUHIIJo09
         cbZt0sMMkm5R3GX8aX7Ba002XkvVrSMWWqbC9g4Vc0Rvl20QxDuPM5F19JiEi3NQoGdc
         G62PIrrZzhD+LjfjQuJd+dCTg6MP+/e69wKXgnjmXSnPu8ghx1mB9CW1X3n7UVy+ixTl
         noBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ju9pZQgOzn3nnB2MOCp6buQwEo1QGaOWTm561RQCUuw=;
        b=CKDxuxI/tCkI9GIbwyfu0VFPYGsjYN2TUGxC4DJEMByE7evz00ZO81OKYkwR+hXCvs
         14pR1+7qeFP1QrS1HlK1oLxM986orgxlzPUcruRDgXt/fkVx+JfQ7OO8ztbNLioMZmuo
         6fLMQmotMfujs0nbHrdwa8KyVAddAEVmSQ2QUSSltV2Y47K4thHGp9/nVLZvjYWkfBRV
         1ni7vHMtL+fL1hUepfA1WADq35ioQs7sngJsfDXGEsRzBuMqEzgi7Cp3A5iFEltmLF94
         +3jdH/kcGT/CJh0zoATk/WNpI2CBdRJmhNH4Sb+Q5RJk4heHgu2RUy6DHvvg9F2k1nnw
         YotQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Tkhol5Hs;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id y6si755380lji.0.2019.09.30.12.13.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46hsWk4JZYzy1p
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:13:54 +0200 (CEST)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:13:54 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <ralf.ramsauer@othr.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 04/14] pyjailhouse: sysfs_parser: minor stylistic fixups
Date: Mon, 30 Sep 2019 21:13:12 +0200
Message-ID: <20190930191323.32266-5-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Tkhol5Hs;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

The sysfs_parser is written in python and not in C. We can save some
parentheses.

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index f65eacc8..464b6a80 100644
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
@@ -835,7 +835,7 @@ class IOMemRegionTree:
         kernel = [x for x in self.children if
                   x.region.typestr.startswith('Kernel ')]
 
-        if (len(kernel) == 0):
+        if len(kernel) == 0:
             return [self.region]
 
         r = self.region
@@ -846,20 +846,20 @@ class IOMemRegionTree:
 
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
@@ -907,11 +907,11 @@ class IOMemRegionTree:
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
 
@@ -934,15 +934,12 @@ class IOMemRegionTree:
                 regions.extend(tree.regions_split_by_kernel())
                 continue
 
-            # blacklisted on all levels
-            if (
-                (s.find('PCI MMCONFIG') >= 0) or
-                (s.find('APIC') >= 0)  # covers both APIC and IOAPIC
-            ):
+            # blacklisted on all levels, covers both APIC and IOAPIC
+            if (s.find('PCI MMCONFIG') >= 0) or (s.find('APIC') >= 0):
                 continue
 
             # generally blacklisted, with a few exceptions
-            if (s.lower() == 'reserved'):
+            if s.lower() == 'reserved':
                 regions.extend(
                     IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
                 dmar_regions.extend(
@@ -950,8 +947,8 @@ class IOMemRegionTree:
                 continue
 
             # if the tree continues recurse further down ...
-            if (len(tree.children) > 0):
-                (temp_regions, temp_dmar_regions) = \
+            if len(tree.children) > 0:
+                temp_regions, temp_dmar_regions = \
                     IOMemRegionTree.parse_iomem_tree(tree)
                 regions.extend(temp_regions)
                 dmar_regions.extend(temp_dmar_regions)
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930191323.32266-5-andrej.utz%40st.oth-regensburg.de.
