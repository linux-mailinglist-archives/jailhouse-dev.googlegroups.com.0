Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBA5O62OQMGQE3WIMALY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3D66467B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 17:49:08 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id g24-20020adfa498000000b002bbeb5fc4b7sf1561248wrb.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 08:49:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673369348; cv=pass;
        d=google.com; s=arc-20160816;
        b=G58Hdgf5x0OPlugyVlTz+og1YGEho6X5zLmO4WgDN7OeiLU3zTe/oGXYyKmLG26/EK
         CqfBIKXIxjMON6zvd3AiRV01+0UvIg0/a7/n0WU8OlaXTwB2yz6tGjnJqexPGhVyNce7
         Z85k8+omYPx9qhc1c+Rdwg+34bY1bm8KO6imB0bjUVcInZcGeFb4lEn1YI9DgoOOotWI
         buDEFI5e6FPzMXXdwNCycSwJ6IZPa2Q1GfMONWcFxg+EMnJ95IyOs4F3aeCcidl3JUGm
         +2tkkjKz7ltx8cPxPMUA0das1dFetkXnDmaybA2vp/AnsJ/bdsiRU9r+HhmVezpcNP6X
         7zuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=nWXmEdt0GOPmMzUipFcaeV/GCUIM6hM7JHs2U80pNa8=;
        b=ePnOZ8QBPSj1vBzIaQuj6fodCnwKBWI/wgtgLV5WyGU5AC7kLk1X8Ro4k4+/4UhCRW
         b5nw9KHCzOWcOGXTyHJ8MelQxWZ18dcwW33CjwTt4K+NKbn4Kz7YvmIx99buK+WbEydb
         HbBHsWzfeIjycRD/EJ2CYBg0P6XsWQK/Dgi5TytP6fBB08ckOcW1Qzh6HXcp4fqMOO9r
         zaE2By1w7x0NqI9VHRBDe7EkuKIXdQjTNX2zujf0bsh1f4FZ7X8AwWy+hqZuGy3T6uZ9
         q11UiCtODj+n7w9PrSG1Tjty0NZw9ygFOu7Q9JVv1+nfh1fOyt3vrwHrGDOqpI8Hgd8D
         Tlyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=RPrmU1+V;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWXmEdt0GOPmMzUipFcaeV/GCUIM6hM7JHs2U80pNa8=;
        b=dnjMAKSDhwVi0tgSA0hqgXJFLDtx6nd+uQ5FXP26LvV4FUDCKVCxJBQlK8Q13GDKhz
         i48IoLqfbqglpsO5HIuisRjOdTZ5YcAKWKwMOBK2jSzpMxftCm2uj/1OKjF1dCG74bXo
         6IEJxt+2ynsmqHoT45lv4y1X/G/gGUM6J9oXU1DNSJH/TsUlE7Ae6Ub3NdDOqqj+zVLD
         lg6c03rTfkH9iOOWtPTJDoTF7NCdcv0Rs0ed5BM8yNVhQCFJTmCFIupPB3Csl7hT8ulA
         PPgPkRy80wNbdxCyC6qxD/sbHAsK84wZBUA/FbDrT3ji6Nfnb4jtIWTSxjesluzeWvEd
         MJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWXmEdt0GOPmMzUipFcaeV/GCUIM6hM7JHs2U80pNa8=;
        b=TMEdibUR3bI/ZM63MOrmeaKaQ0ZZ/OoaN1QhcTvjJd14wpDcXyiRBld6j+1V0MmY/O
         0dswV5oqBBQtBvEWx1FibB5QYyHX3T2Y80l1TSdqTdDJKoDN95pH53qXrzBaUuRY3zzz
         CnzejX+IQJWkKhYT3YA6maRLFfYtzQB1Ei7mo0UwD4ZTQFyp5pWfmIWX/FmZ53s4+ib3
         KevJG8uJ5Lrn0BO/JoAlZ3dgBjrQS3MXaET26SyXigoQFNesBu6bVx2XT7YQ+OVUGvdU
         FbDezeA/KYTBItK1lAp4z3xAMn2XnNixUqgxhFYje5aF3Pep1IXlRAmG4zjSONItlT5T
         HV0Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koG8NpGHosq1Ow5gQkLKaoiL68h7YL4WAOijhbW0FyKopCsbfat
	fXzxEY8nRk0NwdboVqc98IU=
X-Google-Smtp-Source: AMrXdXt6EfizdArvwsaGo2AkqeDQRy5K1F1uRPVRibkU0/97zhLTZJ9uHYMk2AI06e3ooQ8sN5N9rA==
X-Received: by 2002:adf:d0c4:0:b0:278:e254:6168 with SMTP id z4-20020adfd0c4000000b00278e2546168mr3111604wrh.450.1673369348019;
        Tue, 10 Jan 2023 08:49:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1d07:b0:3cf:9be3:73dd with SMTP id
 l7-20020a05600c1d0700b003cf9be373ddls6875881wms.3.-pod-canary-gmail; Tue, 10
 Jan 2023 08:49:06 -0800 (PST)
X-Received: by 2002:a05:600c:5121:b0:3d9:d1bc:310 with SMTP id o33-20020a05600c512100b003d9d1bc0310mr17642338wms.25.1673369346392;
        Tue, 10 Jan 2023 08:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369346; cv=none;
        d=google.com; s=arc-20160816;
        b=1Hy5RnNVVTuIwC6riV0tTa4Pw+AlpILyQQ0Zwqkv/G2VmCCLIkVrSiHiJZUUz39g+m
         s5wP9fj8vsuySe7p/5H9SOyvH3cCpas03CrnBGI+CxvQFinMrzPkBU8jnToo/1OiPcGC
         AeZvyjhHKDjWfssOBW4ZnYd3Y7RV2aB+zhwY/oTTZV3xeJdsv/43i6+5Dr+02kcondIi
         SeyOB5j7HoclqzJ6VMh7dgun0JBH1fA5YAkfo1Xb63zXaIt8RGp7wr/D+x6K5zew10US
         MHQH4pwmsTWk6IeF+VznVcF8IElQdujIjvo6qxq9HX8VcZB6n4VgsixdN7EOfoe+itX+
         3ZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TDWkk3HOuve+tYLVamX5EvTdgtV3zSZD+YHI62n9eL4=;
        b=a8jKjRg3puRKi5Lyg90e1RpoqdjarjqW/v5mCAeCc/4AirYyVygpnNj/FlJRzpLnnh
         NAaXrf9UF9Hu8ILb4XUClS/nYSZgfXB+fgoUNGQALepYEGm9oIBQg6Js4NfHupsbqCny
         01BD7lwdEAfxd1d1BwLtsWfjQgaqIon22DZmKT3E5b4coYiGaX3WJIz4+X2AkgFGU0Mo
         gQJTPqJOAvCv8xzxhwWEJ901PLK6S5FUYhFVWqf2T2vPe+St/WHOYzEa6GDGJos+IZz2
         T4L6Oa08mSKLEjzXWg6mp5wQxT4W6+19977z6eXjgDxs3hbomb2t/VoQrkFP4o6/D17m
         bvlQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=RPrmU1+V;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id ay38-20020a05600c1e2600b003c9a5e8adc5si720270wmb.1.2023.01.10.08.49.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 08:49:06 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Nrxbk0N0NzyMt;
	Tue, 10 Jan 2023 17:49:06 +0100 (CET)
Received: from atlantis.home (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 17:49:05 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Stefan Huber
	<stefan.huber@oth-regensburg.de>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 3/3] pyjailhouse: support automatic architecture detection
Date: Tue, 10 Jan 2023 17:48:51 +0100
Message-ID: <20230110164851.88918-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110164851.88918-1-ralf.ramsauer@oth-regensburg.de>
References: <20230110164851.88918-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=RPrmU1+V;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 23 ++++++++++++++++++++---
 tools/jailhouse-config-check | 30 ++++++++----------------------
 2 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 32cf96d7..797dc265 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -20,6 +20,21 @@ from .extendedenum import ExtendedEnum
 
 # Keep the whole file in sync with include/jailhouse/cell-config.h.
 _CONFIG_REVISION = 14
+JAILHOUSE_X86 = 0
+JAILHOUSE_ARM = 1
+JAILHOUSE_ARM64 = 2
+
+JAILHOUSE_ARCH_MAX = 2
+
+
+def convert_arch(arch):
+    if arch > JAILHOUSE_ARCH_MAX:
+        raise RuntimeError('Configuration has unsupported architecture')
+    return {
+        JAILHOUSE_X86: 'x86',
+        JAILHOUSE_ARM: 'arm',
+        JAILHOUSE_ARM64: 'arm64',
+    }[arch]
 
 
 def flag_str(enum_class, value, separator=' | '):
@@ -163,6 +178,7 @@ class CellConfig:
                 if revision != _CONFIG_REVISION:
                     raise RuntimeError('Configuration file revision mismatch')
             self.name = str(name.decode().strip('\0'))
+            self.arch = convert_arch(self.arch)
 
             mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
                 self.cpu_set_size
@@ -242,7 +258,7 @@ class SystemConfig:
     _ARCH_ARM_FORMAT = '=BB2xQQQQQ'
     _ARCH_X86_FORMAT = '=HBxIII28x'
 
-    def __init__(self, data, arch):
+    def __init__(self, data):
         self.data = data
 
         try:
@@ -253,6 +269,7 @@ class SystemConfig:
                 raise RuntimeError('Not a root cell configuration')
             if revision != _CONFIG_REVISION:
                 raise RuntimeError('Configuration file revision mismatch')
+            self.arch = convert_arch(self.arch)
 
             offs = struct.calcsize(self._HEADER_FORMAT)
             self.hypervisor_memory = MemRegion(self.data[offs:])
@@ -273,7 +290,7 @@ class SystemConfig:
                     self.iommus.append(iommu)
                 offs += IOMMU.SIZE
 
-            if arch in ('arm', 'arm64'):
+            if self.arch in ('arm', 'arm64'):
                 (self.arm_maintenance_irq,
                  self.arm_gic_version,
                  self.arm_gicd_base,
@@ -282,7 +299,7 @@ class SystemConfig:
                  self.arm_gicv_base,
                  self.arm_gicr_base) = \
                      struct.unpack_from(self._ARCH_ARM_FORMAT, self.data[offs:])
-            elif arch == 'x86':
+            elif self.arch == 'x86':
                 (self.x86_pm_timer_address,
                  self.x86_apic_mode,
                  self.x86_vtd_interrupt_limit,
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index d6ea7079..95de6fd4 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -37,8 +37,6 @@ class ResourceRegion(config_parser.MemRegion):
 sys.argv[0] = sys.argv[0].replace('-', ' ')
 
 parser = argparse.ArgumentParser(description='Check system and cell configurations.')
-parser.add_argument('-a', '--arch', metavar='ARCH',
-                    help='target architecture')
 parser.add_argument('syscfg', metavar='SYSCONFIG',
                     type=argparse.FileType('rb'),
                     help='system configuration file')
@@ -52,36 +50,23 @@ except IOError as e:
     print(e.strerror, file=sys.stderr)
     exit(1)
 
-arch = args.arch
-if not arch:
-    arch_str = os.uname()[4]
-    if arch_str in ('i686', 'x86_64'):
-        arch = 'x86'
-    elif arch_str == 'armv7l':
-        arch = 'arm'
-    elif arch_str == 'aarch64':
-        arch = 'arm64'
-    else:
-        arch = None
-if not arch in ('x86', 'arm', 'arm64'):
-    print('Unsupported architecture', file=sys.stderr)
-    exit(1)
-
 print("Reading configuration set:")
-
 try:
-    sysconfig = config_parser.SystemConfig(args.syscfg.read(), arch)
+    sysconfig = config_parser.SystemConfig(args.syscfg.read())
     root_cell = sysconfig.root_cell
 except RuntimeError as e:
     print(str(e) + ": " + args.syscfg.name, file=sys.stderr)
     exit(1)
 cells = [root_cell]
+print("  Architecture:  %s" % sysconfig.arch)
 print("  Root cell:     %s (%s)" % (root_cell.name, args.syscfg.name))
 
 non_root_cells = []
 for cfg in args.cellcfgs:
     try:
         cell = config_parser.CellConfig(cfg.read())
+        if cell.arch != sysconfig.arch:
+            raise RuntimeError('Cell architecture mismatch: %s' % cell.arch)
     except RuntimeError as e:
         print(str(e) + ": " + cfg.name, file=sys.stderr)
         exit(1)
@@ -162,9 +147,10 @@ if len(iommu_resources) > 0:
                     ret=1
     print("\n" if found else " None")
 
-print("Missing resource interceptions for architecture %s:" % arch, end='')
+print("Missing resource interceptions for architecture %s:" % sysconfig.arch,
+      end='')
 found=False
-if arch in ('arm', 'arm64'):
+if sysconfig.arch in ('arm', 'arm64'):
     arch_resources = []
     if sysconfig.arm_gic_version == 2:
         arch_resources.append(ResourceRegion(sysconfig.arm_gicd_base, 0x1000,
@@ -183,7 +169,7 @@ if arch in ('arm', 'arm64'):
     else:
         raise RuntimeError("Unknown GIC version: %d" %
                            sysconfig.arm_gic_version)
-elif arch == 'x86':
+elif sysconfig.arch == 'x86':
     arch_resources = [ResourceRegion(0xfee00000, 0x1000, "xAPIC")]
     for irqchip in root_cell.irqchips:
         arch_resources.append(ResourceRegion(irqchip.address, 0x1000,
-- 
2.39.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230110164851.88918-3-ralf.ramsauer%40oth-regensburg.de.
