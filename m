Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBHUV733AKGQEJOC4WLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9041F3B77
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jun 2020 15:11:59 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id m14sf8586323wrj.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jun 2020 06:11:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591708319; cv=pass;
        d=google.com; s=arc-20160816;
        b=YqRkZdsYdTUyj1jBknptKjfuyOL6E63v1elUQEIaFmYXYWWrpEl9TfahBdSmv4LG1Q
         vtmBSPloM7sDVOhwoMcLyFTv0kM7KiF8LOYeVCyUwemZBlBXGxVKP8cmgxHNw/0wa7+O
         luLFUcvka6MhgbcYl7GtkrsSgMopS5SBPOR+F3veNV8FLqNWwVWWrX9eQyKp4w4SbThO
         8IgQX5y1qHKkIBEj9pZG1q/Kq5I9TVTMv9DfL1Qd7+NAvJ281SZjisXkqdi2tu9w9PLC
         bax8hpXbzB46pQGRdbFVbTb4LKN4ZeQvTAGESXx6mpAEhJgVcdTy4sVl0HMvr5OPbvyS
         boCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=Fltehn4FHvRQ96sc95m+Q9bKSZ8kuXwGFRVhfdNz4EU=;
        b=QF52qUd6Qyeqx5PPjnFucrxjmDXIVG77izqCababN1m+uOZYC436dqHOGesA8x3C3A
         P4kHYZdMlE2rndnKjZiDvOyivpkIra5YFgGskHdZgiNvq52KsNbFf/oOFgA3aPCO4dN0
         Dc23Y/S8KAMp3qEXRi73VhoaWTu6dOIni3PYLWtp1OIqt/H4Q5rKexYdBjqCh7Epa9fc
         ljZWEHvh2YeE1t2l0GV+l126iCYWy/k1OLTuZKKzEbNCJEJNFj8ed71bsKEtHIqBljtX
         YaAn8QLT2hAE1fcgJxoJ5PtZ8UsXtRDvxir65PYPBq6MjkohpfpUGhI07eWbt79kC/pH
         nLzw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="i/vEs7zl";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Fltehn4FHvRQ96sc95m+Q9bKSZ8kuXwGFRVhfdNz4EU=;
        b=KT6Hvk4anVBmqkxeVlFBl8dB9eBRBVUJqnyEQcrTl9hJpkA/eDa8Ap6BTtKsJ8Ukrv
         a3uadfICUxkHxIhT5H0s5FbI5AIu8zA3jC3pOApVSyyrFTDPPiEMuU71fH3uT9py3CZ/
         rzQk1q/5Rv/9NVCTQAsph0UtAsMPL54imYme+wAoJfohV2mXaO5sgJ5bswhZIH6zT9Cu
         g4HIHC0cuWM+3qS0CpBXiZ7hyJ8TNtJUi1pEfvVAKrGWWt92kmORoDHfytfJXJlyTepI
         PwRYtWBfs2UkJrWp+qSttZLZnN2/K3QdLRzlZfEUTA6WB1073QENjQlzfhoEXEudgwMk
         wl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Fltehn4FHvRQ96sc95m+Q9bKSZ8kuXwGFRVhfdNz4EU=;
        b=ozbiUXNGhyJzAScFq4aeL45Lguch59JDoItoEqfqxMSK42NQihDJYaiw84KusimIw+
         YeqgaCCwuinCdFugH7UNkm9b3S7EQfoJpvZUslTuHZj/46UsVmjBVEekKfFrbsveHXL2
         4dHpHTYy/KzSbcKOw6TbjQLoz7B01qN6zuVYHv4NS7C+IgNaXq/ISo89PJALslr38ejH
         oJ1VblmRHWA8EXZtF2RzgRFGGFabcbHj+5v3CZt1ztAX/lUxcoXQOT6nRs7QzlKNQbuY
         ykhbwM7K10Rwtt0fE4rsbIt8V1jVNXRH2my43m/rDEqSd57w1f3EBvnTB5R+oN48qq4r
         46bw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+du7csVEPaJAjfupwb9ggKQWHPFNpTR4jv5FKJjqYCHNYJbbf
	ktz2iBdFp2I+0Y8A77paccs=
X-Google-Smtp-Source: ABdhPJwm02/egvzomp9as+Y6C67ALPaPaHqPcfV4A9ua/e0EdMmmtL5J60RzpUFsYm759EwkcaJ5xg==
X-Received: by 2002:adf:f0c6:: with SMTP id x6mr4684408wro.301.1591708319072;
        Tue, 09 Jun 2020 06:11:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e510:: with SMTP id j16ls3831229wrm.2.gmail; Tue, 09 Jun
 2020 06:11:58 -0700 (PDT)
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr4682259wru.117.1591708318400;
        Tue, 09 Jun 2020 06:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591708318; cv=none;
        d=google.com; s=arc-20160816;
        b=Hfp2cC9ehBu6mPJx9gdMbxSPAUUC6N86LOI2wRUl0/e5cMVchpnhO0ZF5dOZYSYzCO
         UyxWSRkcSz658j8/rrOk6+8NhH2DNPSjDwkfEKaOuu60itbKYFRUMMUSNx9T3e+5fMPu
         iCGLOAhtKPfUjvGp6y05dgJ7S+hnxQ+3ozljTP+ZYGjYdcOvJ2MejQhxg98UnMBoVOQc
         +RcgcGzlX3uU9K5XueFwFsk9GQUb2YKBE683oVfnpWUzvjOdww4+vzwqAZyOYrTLh5Sn
         4Yw5At9mXottE+tWMRzqX1Cme4yeP5w+/V+eNa3Mlj70reZmVozuckC8hvzAAP5kNVoy
         asmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=jEVsQLfm4dU3aVhZjZfzsCntWs05PSO73s1ZrdSbzWQ=;
        b=FPFOjV9uN5AQ5j/tzWGYvmtSz28ST8KKGFp3WbvXJ089M81wwgbrrpqR6YdsHqebts
         R4Ld1/2z6bl8wzCOtyd6DNUM+U9xf2Shl+t7SE1azBkBMKt6cTGOiB1cMUNhSvqoCN8U
         BHWSSXUoYeZbiEmgrR6OTPL9Uycz1yqx8V3jziNr2rV2OtmPBDd+MJkwrPIpIWiwbQ85
         FIdfWh1e+jhLqR67qJyA8I87m5VXzGiLnweP8vPaRMhJSWjkGDOZtoVsUG+QPh6xSmb4
         hTk0wLtVxCafeh8ARxbLv2l1qzAjnugg2NBANDRo5G/w0Z5oDozkAkL+8xWWCoP0LmZ7
         qlCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="i/vEs7zl";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id q72si145395wme.1.2020.06.09.06.11.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 06:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 49h9WK6YzJzxyl
	for <jailhouse-dev@googlegroups.com>; Tue,  9 Jun 2020 15:11:57 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 9 Jun 2020
 15:11:57 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 1/3] tools: jailhouse-config-create: Improve code readability in template preprocessing
Date: Tue, 9 Jun 2020 15:11:41 +0200
Message-ID: <20200609131143.2133316-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="i/vEs7zl";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Move lines with similar context together and add some comments.
This commit serves also as a preparation for the following commit.

No functional change.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 tools/jailhouse-config-create | 80 ++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 44 deletions(-)

diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 1e2df742..709cf2ef 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -240,41 +240,43 @@ if jh_enabled == '1':
           file=sys.stderr)
     sys.exit(1)
 
-IOAPIC_MAX_PINS = 120
-int_src_count = IOAPIC_MAX_PINS
-
-(pcidevices, pcicaps, cnt) = sysfs_parser.parse_pcidevices()
-
-int_src_count += cnt
-vtd_interrupt_limit = 2**math.ceil(math.log(int_src_count, 2))
-
-product = [input_readline('/sys/class/dmi/id/sys_vendor',
-                          True).rstrip(),
-           input_readline('/sys/class/dmi/id/product_name',
-                          True).rstrip()
-           ]
-
-inmatemem = kmg_multiply_str(options.mem_inmates)
-hvmem = [0, kmg_multiply_str(options.mem_hv)]
-
-(mem_regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
-ourmem = parse_kernel_cmdline()
-total = hvmem[1] + inmatemem
+# Information collection
+#########################
+debug_console = DebugConsole(options.console)
 
+# System infromation
+product = [
+    input_readline('/sys/class/dmi/id/sys_vendor', True).rstrip(),
+    input_readline('/sys/class/dmi/id/product_name', True).rstrip(),
+]
+cpu_count = count_cpus()
 mmconfig = MMConfig.parse()
 
+# Query devices
+(pci_devices, pci_caps, int_src_count) = sysfs_parser.parse_pcidevices()
+(mem_regions, dmar_regions) = sysfs_parser.parse_iomem(pci_devices)
+(port_regions, pm_timer_base) = sysfs_parser.parse_ioports()
 ioapics = sysfs_parser.parse_madt()
-
 vendor = sysfs_parser.get_cpu_vendor()
 if vendor == 'GenuineIntel':
-    (iommu_units, extra_memregs) = sysfs_parser.parse_dmar(pcidevices, ioapics,
+    (iommu_units, extra_memregs) = sysfs_parser.parse_dmar(pci_devices, ioapics,
                                                            dmar_regions)
 else:
-    (iommu_units, extra_memregs) = sysfs_parser.parse_ivrs(pcidevices, ioapics)
+    (iommu_units, extra_memregs) = sysfs_parser.parse_ivrs(pci_devices, ioapics)
 mem_regions += extra_memregs
 
-# kernel does not have memmap region, pick one
+IOAPIC_MAX_PINS = 120
+int_src_count += IOAPIC_MAX_PINS
+vtd_interrupt_limit = 2**math.ceil(math.log(int_src_count, 2))
+
+# Determine hypervisor memory
+inmatemem = kmg_multiply_str(options.mem_inmates)
+hvmem = [0, kmg_multiply_str(options.mem_hv)]
+total = hvmem[1] + inmatemem
+
+ourmem = parse_kernel_cmdline()
 if ourmem is None:
+    # kernel does not have memmap region, pick one
     ourmem = alloc_mem(mem_regions, total)
 elif (total > ourmem[1]):
     raise RuntimeError('Your memmap reservation is too small you need >="' +
@@ -282,22 +284,10 @@ elif (total > ourmem[1]):
                        '"memmap=' + hex(total) + '$' + hex(ourmem[0]) + '"')
 
 hvmem[0] = ourmem[0]
+mem_regions.append(sysfs_parser.MemRegion(ourmem[0] + hvmem[1],
+                                          ourmem[0] + hvmem[1] + inmatemem - 1,
+                                          'JAILHOUSE Inmate Memory'))
 
-inmatereg = sysfs_parser.MemRegion(ourmem[0] + hvmem[1],
-                                   ourmem[0] + hvmem[1] + inmatemem - 1,
-                                   'JAILHOUSE Inmate Memory')
-mem_regions.append(inmatereg)
-
-cpucount = count_cpus()
-
-port_regions, pm_timer_base = sysfs_parser.parse_ioports()
-
-debug_console = DebugConsole(options.console)
-
-
-f = open(options.file, 'w')
-tmpl = Template(filename=os.path.join(options.template_dir,
-                                      'root-cell-config.c.tmpl'))
 kwargs = {
     'mem_regions': mem_regions,
     'port_regions': port_regions,
@@ -305,9 +295,9 @@ kwargs = {
     'argstr': ' '.join(sys.argv),
     'hvmem': hvmem,
     'product': product,
-    'pcidevices': pcidevices,
-    'pcicaps': pcicaps,
-    'cpucount': cpucount,
+    'pcidevices': pci_devices,
+    'pcicaps': pci_caps,
+    'cpucount': cpu_count,
     'irqchips': ioapics,
     'pm_timer_base': pm_timer_base,
     'vtd_interrupt_limit': vtd_interrupt_limit,
@@ -316,6 +306,8 @@ kwargs = {
     'debug_console': debug_console,
 }
 
-f.write(tmpl.render(**kwargs))
+tmpl = Template(filename=os.path.join(options.template_dir,
+                                      'root-cell-config.c.tmpl'))
 
-f.close()
+with open(options.file, 'w') as f:
+    f.write(tmpl.render(**kwargs))
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200609131143.2133316-1-andrej.utz%40st.oth-regensburg.de.
