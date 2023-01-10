Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUFK66OQMGQED6YNS7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 237EF664DE3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 22:14:58 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id k1-20020a05651210c100b004cae66ea2bfsf4832016lfg.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 13:14:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673385297; cv=pass;
        d=google.com; s=arc-20160816;
        b=mzPaGoTyJIPEbheMmL5wzHb6lGF6Fm8u81fUEj2Z9JfQBOVEp65ApYlUSFYsmsp2WP
         yZpIsCZVu7az1HHBEpdKSy999HXplxwyvRWii9WLzrc/BPTwtxD0vaFrDO1ZFKupWmuA
         V2pm58HV3eiCBjVTRav2DjwcjLpfx4ISKai+/osDsBFveMU3F9CJi7fsafoXN2N+iGz2
         FAnaEXffS8l0NPqUaboHqy3jSUZ8+SMUyMbprgckxPWvVQJlrUxOLKDXZ+aQHH8jckcI
         CY8Zv/ksPe7XC7p4Ku5EVeVvIEFP1VujikMsf21pZvX+hIF+YSQhcTwM9GMtjjmTUJBr
         8Hiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=pzISEX6aac7PrYtFqgRIBWMaHLjO/PWtWXVbKqGy+KQ=;
        b=H/FiFBSxjyRzYthd37IwKremYaZEfSiOBY21KKTi8hdC3vJfRR4bLLD6NercUElwJd
         c7NowmAuyRftMXVBnC79IJDjs0CK3hGp80qtAtFulVaU/4QIXirSeDGQm+puYUKGnav+
         07eIYdL+iu99WMR/JDuBoMwCcgghutuqWkiAXfefNPVdOWSFNvhJGsk3szKHNxzjmykO
         6c3RRdvcYzRmlH7VQDqcdf89NsJiVGBQnF+qOvxt5rQi3kni7A3KTONQ9u006oNlhby4
         MvyDnHUyV9TJIvW8c3jhROOqHJsL3lqUDWSVdF2hqyjmvU/uXRxb7ksjq7ipjPeyzlY7
         jlgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=LB3y3Snc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzISEX6aac7PrYtFqgRIBWMaHLjO/PWtWXVbKqGy+KQ=;
        b=Qn2o5gxwMHPLvUxPfPAkaJYwmBRHSBkovrsUytf3Rq4HKmc5y+wYK2GpkdVmunQhza
         aJKjOjDQwrBlb6b3s/6256QXQ+E7QRxinYup/y9vfV+VpFMnYgH0D2tIIYmYoChGVAXs
         gKwe+YKqE5nuEdeoivv1KM9I+/xyswc6+odSd6N0rQdqiXtNsSW2JMVTgKHFpUVfaNSg
         dp4OE2RXl3xIShox9TsQ07pQS6ysuLxrWJr2OZWHhS/jgb7zqIYh87wOexbtMFsHPfLj
         68tQHC5v1T7hsVmrzRy9Y9UvISUjSay+OejWEeljd4W4FfD1LC/HtXEBUn/AbtbHJIxw
         2BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzISEX6aac7PrYtFqgRIBWMaHLjO/PWtWXVbKqGy+KQ=;
        b=cw7jf2s0siiQN43mqFy86/wM0nA3WR/wt6O9HD8+Pu9fPEY6igmNrAtjTMctm06dkF
         lwHaRjxRE+qlyuGiqjyvk/77Hq611Oz6aoJSf8ciIl40NskjxbxzqibLXn7nTXsyiXrF
         IkwcU15GKEgQb5py8MT1jxtErH1baIOI1AGK913Kjug4ek7MwxOaHc2xpU6Gnq9TsO2c
         2LOM/TfZEBX0cQ3VqURQGnMOjLOZ8RghUMCOEWhPae126jUBecQ+GyE5jcIIyIH3NB0z
         1gU5GQAfukDDm6poi6A/PB8HEg22f4x/duBqZhjOA6zO6Toh80bosWc6iesgHPk2ISXP
         D1Ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqoIjnT742Dfs1NXEXVqH1KB1JK3t0lLLMdnMfXfNz8QDCuvAwQ
	9gUh9aKhrqG8YVCs1pVNf2I=
X-Google-Smtp-Source: AMrXdXuXpbIG+tb9kSFYYryo9rZUUI3sDykwURa4qFh3HxguWi7iZbyl3suI/bPwgMq3tdK481FL5A==
X-Received: by 2002:a2e:bf18:0:b0:27f:bcdf:453a with SMTP id c24-20020a2ebf18000000b0027fbcdf453amr4558716ljr.116.1673385297499;
        Tue, 10 Jan 2023 13:14:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3609:0:b0:27a:3eb5:4759 with SMTP id d9-20020a2e3609000000b0027a3eb54759ls1847015lja.0.-pod-prod-gmail;
 Tue, 10 Jan 2023 13:14:55 -0800 (PST)
X-Received: by 2002:a05:651c:1609:b0:285:478a:7f2c with SMTP id f9-20020a05651c160900b00285478a7f2cmr2272083ljq.38.1673385295324;
        Tue, 10 Jan 2023 13:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673385295; cv=none;
        d=google.com; s=arc-20160816;
        b=n73Hb9wa65hJ7r5p3PdeGylCbaIUQFNUOpWl1xhmagrPWMWqEuXGxxAw5nxeYzfwnp
         vZnVW/ShSGRbJyDrD4PntoJNkhlYaY4pSXLXLx7LV/pt9FcwdrhjTzdojyk9w3OIrFz4
         OfndTcd6NZzPUaGJom8B8NB6MOUJFctzH0dDHr+5WWDCehWf90pw66likAZaxo8msDmN
         onsPUfpequ1beXZmq72/Oh+EBxLL+HzLi5Y61Q6iPKvR5p9E3hvIU0qOmXldWjMmRtbm
         J3FShM5FwFyzmyypUGLusv6JJRKU0SmgXYsXZACITt3c4AcJynXSdTBD4ypEjYEU3IFT
         aAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4uzjs+5GLT4MD/nw3ytNc85yni6uikcE3uYpaCdShWQ=;
        b=jVeI5lwusbofA1hhHA2CH4dSBtWQTriXqbheqaptC2onLm2H00LMn/Zp5NJsucf1kS
         nwihga+CNXO/5TuoyPapw4uXnqNehPyKuXjbCWh0BJPr8JQ9u0+6k2ulX2u4CVltlvli
         pf1EYP4UqnZDN7ZuF7ftckbphFtiWqdKUkoeI9hy8gQzcFI+k2K37xpeP6IRt4xiT3y+
         Kad7TqaPV2vwDR+F4d06L2VTZgRQhRAaUHpAQFYMORi5HyN3V9iMkDDmkVye5Hlm3YDq
         YIUGY2EvOxvJT9gOyik99c7xsWMJFgn9BW7rU0gelnpTsMEht9Gk37lZXZav7pXVQEiI
         UO6A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=LB3y3Snc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id bd4-20020a05651c168400b00280049699f1si136644ljb.1.2023.01.10.13.14.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 13:14:55 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Ns3VQ3nlWzySv;
	Tue, 10 Jan 2023 22:14:54 +0100 (CET)
Received: from atlantis.binary.kitchen (2001:638:a01:8013::226) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 22:14:54 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Stefan Huber
	<stefan.huber@oth-regensburg.de>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 3/3] pyjailhouse: support automatic architecture detection
Date: Tue, 10 Jan 2023 22:14:44 +0100
Message-ID: <20230110211444.9897-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110211444.9897-1-ralf.ramsauer@oth-regensburg.de>
References: <20230110211444.9897-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=LB3y3Snc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
index e60b2ce9..2a59b651 100644
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230110211444.9897-3-ralf.ramsauer%40oth-regensburg.de.
