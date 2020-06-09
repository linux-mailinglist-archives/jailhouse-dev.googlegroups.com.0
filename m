Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBHUV733AKGQEJOC4WLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4F01F3B76
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jun 2020 15:11:59 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id w4sf8619014wrl.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jun 2020 06:11:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591708319; cv=pass;
        d=google.com; s=arc-20160816;
        b=td/8G6BmX4rmxJyoeN0q2c4UZ0ShkbEmPAMDlfcIvg5xjpFSZK1Bfgv0ebEBfZuxCT
         CezdQMI8NGKiWOggZizfhILAukyT2IBWNoqxeP7BUfiuvC4stcZxEuAFqzBSBwD9Lk76
         muXA4lEpNj+5HHXI5/BrUAjXcZxK8NZson+ukBfXhDNZtrtTl5/neog+VmBFzAhLrKoz
         10DQrwe6Z8hiu6+QgUhJwqj1ML3GTxYxX3oIMOyVJKVIvr/Ecvl5VN2DQse8yEcCY9Vo
         zMbESpJ09bPRe1pQIP5xEoNWPFItZzF4aXTTdIXSYezJOY9bvMZxbM7FLxOC5IVFLGXV
         V8bQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=l6AHP5PjDV5UoocvojScsrik/faYfL6pje1IvtG0d20=;
        b=a2H+jpSLjRl/vRDeAUIQtVCHsX9qEba6dIZBDCibQXvm2ZeUtdFqd4oH/LtVHvMCzb
         8I1opgckv9mBM7WfB790gFBoOeRqlMuCzL/5HUT34cE9ps851jQG0kw61ecO26ab67zN
         lsgENSvFJR3HPf+kHB9AdSTn2J6xJWrqTi178iXhhcmh6MyThSr4rBYRspsikpA9/kEq
         Z+kyf0eOeOr3XHujCkuJYrl+mCpeJI6muZaU4lRv2xfFwNOOhCHM75p8UIhMQ18iCGgs
         5WFqBIL69DIfG+x2nlr1SdC5wKZZV2yjBv5k0g5bkEUvEoFuIdI8YdS3vlHP/6X/VNzU
         UGjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="Gj/W43tT";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l6AHP5PjDV5UoocvojScsrik/faYfL6pje1IvtG0d20=;
        b=Kxg2sggHK8kI+Cyz95RMIY028BKBlDPGCyQVaX+S5m5q7cEnhMAHmsx4aS6LzwpoOI
         Mxsz+6Qmz6xY3UnGJ1fyPcAa8u+gvEcJuoI4EkZA0Vrem0+OYR2pkYMYbiCZcpWLRwEE
         vhQiGOctWpCToKyu4O+Y4Y0Q9MIhx6bMaEwGAmDgMgUEyNXmdfaf6OgqCw12z3Y+6eUC
         rapraCUNseb6SQ3q99boU7anSzqFTVVWc30TleJ2gc6DrsEyn3njHI4kL5t6kjUaTQSD
         zGu0zHQLgbdLKtFhzNn+WJPovyW61KXJyyZ/PmVHSk04LoT6oEnc2MKx0SiNebwatM0K
         EV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l6AHP5PjDV5UoocvojScsrik/faYfL6pje1IvtG0d20=;
        b=bIebGiH40dpcFUxbwjJjryFif065W4vyq10e2GxyJEKVlf8aYFmd+t5k3XDoJYcslO
         mryHJ785lYtg0L0xPomgFSRH7cZvr4IpqZAHWd20TjFyEhrb0O18xsk4IPw4BEMaL4zM
         LX9sPpYvJC9hMOK6qK4D9t3DQ+fmlu5RRfymsfRpa1+DN7HvF/YUNoyV1Fimkx1pNDF7
         1EctaoV4d9mOG7Aw+EWkdOWGpvpJx9/c+ljtM22n82hSYUhv6Ntqi2BXmkw32i9nG7BC
         kBeN6QZir/n55aSFBO/aOIZYi0FhLU0nFEHH1Mk4js2a7SYgzbtVu+qcJivhUBXgFXQn
         mpnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530YubkGcMWdF7c2tPyBd7uuUs72FyPbjvOO8PRqNnuSSmRxVia5
	EdJZar4iJqL8Fp6OfdhqBEw=
X-Google-Smtp-Source: ABdhPJyw42KtMUZSNB6mr03kw6sNV1j2PPiTFGH5tEthYVcoDztQ/J3o/poC7maoup7y4/e1C0tPsA==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr4718047wrn.152.1591708319102;
        Tue, 09 Jun 2020 06:11:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e510:: with SMTP id j16ls3831244wrm.2.gmail; Tue, 09 Jun
 2020 06:11:58 -0700 (PDT)
X-Received: by 2002:adf:b348:: with SMTP id k8mr4829087wrd.157.1591708318562;
        Tue, 09 Jun 2020 06:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591708318; cv=none;
        d=google.com; s=arc-20160816;
        b=CtMO+Xt1XOxCZzLNJS8y3DLvvT1dXev//x1Z2gWrnsMXmNDJtNzQFwgSkUlIVYv5jL
         Kher1IlaBvFxYFl3Q4F4IqNGU4XWCnYKUgsh+y3uUUp3aJQhaQMpckkovkTC5Yp+kYdH
         8upewkluLyk/6lvIPEhZCAiPY07QAGyJj4ZlOkd2MwdxjSPJHCM8G+mZBeepSUopngdA
         ldW+K08mj6JQw0fzxf7/hmZkccC8t4y53x5j7/WOCoDyYqR6hvf5GVfa6i6BkuBSlDrn
         C3Zw5/F9Xjm2RqKzYHvtUg4VerCaPYWjJTiK37/6Wz2RBvOnVJ2KTa34TX4f0gIBUoBz
         Y7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vLccvOgffBcauqaU4T5YU09hK43GkVdqbJELTOYhPH0=;
        b=oIRh7C7DahR6zYsCn500qLmZr6I2sd2aWB3eGPsmupRNDvEdGf/I2iDO+2wUUJQhPE
         MagspzxEjczDxOwlxif9V/hpozWM+qWw6bSmwRhkVOBot0EiCzQDKN7pS/haz6HrQ/c1
         i8X7iMVNIGntzeWyjHjfQo7qEiT57vHubARQrobhfoTHpSq9KnObweZU2Xjl/izPdcm8
         4KMYTMUyU8RREinSJi4Y9jneWksuzIMe0j0HCVyEaPeFce+eK14bGaCIwOXnYo41t4gu
         UDAvghXPHf+oknCKe5nadtuw3Nyt+eGxTIsXcMLGDBvZWN7k/pnjDDMLRxjUIpr4MpqB
         XYWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="Gj/W43tT";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id o195si166845wme.0.2020.06.09.06.11.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 06:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 49h9WL1WWvzy0n
	for <jailhouse-dev@googlegroups.com>; Tue,  9 Jun 2020 15:11:58 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 9 Jun 2020
 15:11:57 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 2/3] tools: jailhouse-config-create: move PCI capability collector from sysfs_parser
Date: Tue, 9 Jun 2020 15:11:42 +0200
Message-ID: <20200609131143.2133316-2-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609131143.2133316-1-andrej.utz@st.oth-regensburg.de>
References: <20200609131143.2133316-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="Gj/W43tT";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Fixes generation of unreferenced PCI capabilities inside cell configs
on AMD systems. They occur due to removal of the IOMMU from the PCI
devices list after its capabilities have been collected.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py    | 19 +------------------
 tools/jailhouse-config-create  | 24 ++++++++++++++++++++++--
 tools/jailhouse-hardware-check |  2 +-
 3 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index e59586cd..8debf460 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -280,31 +280,14 @@ def parse_ioports():
 
 
 def parse_pcidevices():
-    int_src_cnt = 0
     devices = []
-    caps = []
     basedir = '/sys/bus/pci/devices'
     list = input_listdir(basedir, ['*/config'])
     for dir in list:
         d = PCIDevice.parse_pcidevice_sysfsdir(basedir, dir)
         if d is not None:
-            if d.caps:
-                duplicate = False
-                # look for duplicate capability patterns
-                for d2 in devices:
-                    if d2.caps == d.caps:
-                        # reused existing capability list, but record all users
-                        d2.caps[0].comments.append(str(d))
-                        d.caps_start = d2.caps_start
-                        duplicate = True
-                        break
-                if not duplicate:
-                    d.caps[0].comments.append(str(d))
-                    d.caps_start = len(caps)
-                    caps.extend(d.caps)
-            int_src_cnt += max(d.num_msi_vectors, d.num_msix_vectors)
             devices.append(d)
-    return (devices, caps, int_src_cnt)
+    return devices
 
 
 def parse_madt():
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 709cf2ef..0f75be4f 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -253,7 +253,7 @@ cpu_count = count_cpus()
 mmconfig = MMConfig.parse()
 
 # Query devices
-(pci_devices, pci_caps, int_src_count) = sysfs_parser.parse_pcidevices()
+pci_devices = sysfs_parser.parse_pcidevices()
 (mem_regions, dmar_regions) = sysfs_parser.parse_iomem(pci_devices)
 (port_regions, pm_timer_base) = sysfs_parser.parse_ioports()
 ioapics = sysfs_parser.parse_madt()
@@ -266,7 +266,27 @@ else:
 mem_regions += extra_memregs
 
 IOAPIC_MAX_PINS = 120
-int_src_count += IOAPIC_MAX_PINS
+int_src_count = IOAPIC_MAX_PINS
+
+# Collect all PCI capabilities
+pci_caps = []
+for i,d in enumerate(pci_devices):
+    if d.caps:
+        duplicate = False
+        # look for duplicate capability patterns
+        for d2 in pci_devices[:i]:
+            if d2.caps == d.caps:
+                # reused existing capability list, but record all users
+                d2.caps[0].comments.append(str(d))
+                d.caps_start = d2.caps_start
+                duplicate = True
+                break
+        if not duplicate:
+            d.caps[0].comments.append(str(d))
+            d.caps_start = len(pci_caps)
+            pci_caps.extend(d.caps)
+    int_src_count += max(d.num_msi_vectors, d.num_msix_vectors)
+
 vtd_interrupt_limit = 2**math.ceil(math.log(int_src_count, 2))
 
 # Determine hypervisor memory
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index 9e90250d..f9b2cf58 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -127,7 +127,7 @@ if os.uname()[4] not in ('x86_64', 'i686'):
 
 
 ioapics = sysfs_parser.parse_madt()
-pci_devices, _, _ = sysfs_parser.parse_pcidevices()
+pci_devices = sysfs_parser.parse_pcidevices()
 
 (cpu_vendor, cpu_features, cpu_count) = parse_cpuinfo()
 
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200609131143.2133316-2-andrej.utz%40st.oth-regensburg.de.
