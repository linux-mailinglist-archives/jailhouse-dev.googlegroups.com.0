Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4WP3P7QKGQETJHR7EQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6023A2ECE30
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Jan 2021 11:52:35 +0100 (CET)
Received: by mail-ej1-x63a.google.com with SMTP id w6sf2262580ejo.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Jan 2021 02:52:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610016755; cv=pass;
        d=google.com; s=arc-20160816;
        b=PlFV+B9a4GxpMxdzaC9gPxUILu6vgxhInDaPSk8lQmm9cvBeVa+BcWYtrdGWwMVBvF
         TEh6bMYMxXl6IsiFP7HwlLlYTR/yxDB/e15UTtm7vEWH4SjQQrxphpHaGGi83BWQ0D7b
         2xpzfMt9XOl5uVmjyejQ3+7Mp5bymVZ4YITp/KmUBnsR2XyhfLrKmR4rkx/fyZ/Ybt+L
         4vFhQn1LEF2aKoguRpTbSuCLngnE2SpfB/75NDnkrG4L0a/jp9aoYaanRRlpjcENKfLq
         2NyCMm8Yr96m8QXPAu5F5eKb2N6xLwfbPlY/OZTx6gKOAbnHF3zrpnGzr0iwSxNYcTnW
         YW2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=rlXw8A29xftweCzXqJl0pXftNWtgPv0/8JIRoXmQyUg=;
        b=gVDPeRoKkVBVMGvCS1DGHhwPrhFlbNCJqUQjRjWyALeiiKDsx9VpvirqM2GMGvfnze
         MzSjKbAUg/dxeLMppQpSDzVGcH4YbioANzsVGVKlNx/a2nSYNJteeY81BrP/Yhmm9ajr
         mP02hnHSX5gajfav6g/vV9I4bgCIqqrgVWnj0uCU31MMQMM6zF7taDZvoO9b4E+nT6QM
         VIcHjCmoI1VMhMh6rZZE5YUfetc3uNldsNb9CvuHygTjE9EJLotvCv0O+12PHU8uBP3r
         O+WjSdhKO5G/59+1I7GmOmY2B+RQf+8LA//o3S/EimeaA/rFScAN2sISC8c58Pr8toCD
         pqKA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rlXw8A29xftweCzXqJl0pXftNWtgPv0/8JIRoXmQyUg=;
        b=bmKWbiy1XEKCCx2V3ce3zXauk/3+KQLbGjhmCFxPJo1mKNr/+jUBmAnbeuQxbwwaaU
         J8SfulvttQX542K22f9LCPobp1phCaEii8B5/YIo/1jDM89NrMZOra15sXMstbAh3mum
         /kA/xRnIlI2DzVZG3H2Ry339j/tagV60bKGEl/oS/8EEKPWjKb51JlCRTCHtPkz6aOt4
         D4fObVxPgjFvbnwVprhDxyzr7IWyzpio/VbzclPxwLWGUF8US2bSW6GIWCabkStNUZNe
         uCSjE1j8ft5++qX8mm4GeU2Lon6EGhfMagCdvSHTxIYY8kMaPzC9w1aPp5LUD9FDokRY
         CSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rlXw8A29xftweCzXqJl0pXftNWtgPv0/8JIRoXmQyUg=;
        b=uUf2Vm7lddUkuVR0W7IssPNeRSOVhGss3iSiDmJKpM0EtzsaL1PeQmSf9LCXTGdgKh
         KyxTdmFe4g3XdoDz1FGwIZhyZoX8CLGz8C075zrPEQw2mbNgBAiQen7XMXc8HFNrg4pn
         jJIgzbQghxq1hPeXQrhU6uSLa7GdNf8XIOzyyLiiytA9CqXvGo8e8fVV4NnvSi1uXODz
         MoyPiJ8ENpX+lTmVW8QafF/mr98VSnADQmc5ocIKgGqyt0L+QBs93hkp9a+I8NC5h1lU
         0VJGlUk3jlc3ZSFJWZoXeI0QCP4Nb7s2l9iPVqkzkBM4AoC50M17KZK/Tb5Rv+QjIUrI
         y1AA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530oDfZS0JA95yBXbSykEBnXfMHzGP2p36F2ZPj6Tw1hyMBnpvR6
	8vOhWk+9cZdfrxtD08CvlgI=
X-Google-Smtp-Source: ABdhPJxBzApcs4bUQzEf7BXz/4PZ1pJirUY0avc4s4CNXQO1M7Nh2wxsiVJdwwbrNBY5KooSpqmX6A==
X-Received: by 2002:a17:907:1047:: with SMTP id oy7mr5974148ejb.134.1610016755161;
        Thu, 07 Jan 2021 02:52:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:360c:: with SMTP id q12ls2662645ejb.3.gmail; Thu, 07
 Jan 2021 02:52:34 -0800 (PST)
X-Received: by 2002:a17:906:890:: with SMTP id n16mr5975687eje.463.1610016754096;
        Thu, 07 Jan 2021 02:52:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610016754; cv=none;
        d=google.com; s=arc-20160816;
        b=dU1JEobTUKnYKvsPomW2rH3DDoDyPRTxSYY/aVyt5QUuZHJztkaFyLlk5nSjAFDBFl
         fZt/AGdg+mJYMKOAKv4edlcgvnYGeXU9GxCTROpWw8l+zJyPLujUDlI3/PBiG+zCpNwU
         92tjKc/qlOaMzfgoDmCkHyM77QOsi1BYKg3o50WSirGgOyE3ex5UTJw2u0rcufQ7mvht
         fA6ifcfg22mqEiSgbjKY8W+dyXP8MI1yAm7ZQKZHgFEjae7H3Voj0f+ElziLxf4syKj9
         lCqrPso2zYfhXOBtOB12LwtJ0CqJDu3T7PLOL8hNfokXlNTtGeV2dH0OUQEkqkjDS/5C
         VHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=9do0mjyudS8604XIl46mADtMBMycx9R/fwt+aZkKQKU=;
        b=u8A2kIrxZqrsQq1Lul24YqByf/bj54jLUAthHhN4RB341vv5xHTx0bZ0bmykDNpOmw
         8PxqNKTGBnW3qz78CaS3GjIB6OYi7PBJ/wET/4dO6BldETtFMe/CnlFaAcbsTDJoOmol
         EJJXmWYGA5N9dqXwJL0po7zEoWss0N91hGueecnOjsJopBb0BziWgYLx5ucFcZ2npNMC
         SfGaozr5XAv3gRw2aKNh71EdnKAa3IIx3mLoU8JU9DRG7DONOuiQCSIruTYAax9iZRU7
         slnbFQLcKQD3s1jTygek6uy6hmRaquNqzOpPU2VWxVmyNsyAdm9MEIOUalNXVF3aw4Xs
         GqaA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id j6si168089edh.0.2021.01.07.02.52.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2021 02:52:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 107AqXi0008784
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Jan 2021 11:52:33 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.120])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 107AqWdA019377
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Jan 2021 11:52:33 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/3] tools: jailhouse-config-check: Detect non-intercepted critical resources
Date: Thu,  7 Jan 2021 11:52:32 +0100
Message-Id: <659055b1171ae155e199f3b4b7547864ca1bedc6.1610016752.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1610016752.git.jan.kiszka@siemens.com>
References: <cover.1610016752.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This adds detection for missing interception of PCI mmconfig space,
IOMMUs as well as interrupt chips on ARM/ARM64 and x86. This helps to
reveal a broad range of subtle mistakes one can make in creating system
configurations.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/jailhouse-config-check | 104 ++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index c27dbb8e..5294967e 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -24,10 +24,22 @@ import sys
 sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
 import pyjailhouse.config_parser as config_parser
 
+
+class ResourceRegion(config_parser.MemRegion):
+    def __init__(self, phys_start, size, name=None):
+        self.phys_start = phys_start
+        self.virt_start = phys_start
+        self.size = size
+        self.flags = 0
+        self.name = name
+
+
 # pretend to be part of the jailhouse tool
 sys.argv[0] = sys.argv[0].replace('-', ' ')
 
 parser = argparse.ArgumentParser(description='Check system and cell configurations.')
+parser.add_argument('-a', '--arch', metavar='ARCH',
+                    help='target architecture')
 parser.add_argument('syscfg', metavar='SYSCONFIG',
                     type=argparse.FileType('rb'),
                     help='system configuration file')
@@ -41,10 +53,25 @@ except IOError as e:
     print(e.strerror, file=sys.stderr)
     exit(1)
 
+arch = args.arch
+if not arch:
+    arch_str = os.uname()[4]
+    if arch_str in ('i686', 'x86_64'):
+        arch = 'x86'
+    elif arch_str == 'armv7l':
+        arch = 'arm'
+    elif arch_str == 'aarch64':
+        arch = 'arm64'
+    else:
+        arch = None
+if not arch in ('x86', 'arm', 'arm64'):
+    print('Unsupported architecture', file=sys.stderr)
+    exit(1)
+
 print("Reading configuration set:")
 
 try:
-    sysconfig = config_parser.SystemConfig(args.syscfg.read(), None)
+    sysconfig = config_parser.SystemConfig(args.syscfg.read(), arch)
     root_cell = sysconfig.root_cell
 except RuntimeError as e:
     print(str(e) + ": " + args.syscfg.name, file=sys.stderr)
@@ -100,4 +127,79 @@ for cell in cells:
             ret=1
 print("\n" if found else " None")
 
+if sysconfig.pci_mmconfig_base > 0:
+    print("Missing PCI MMCONFIG interceptions:", end='')
+    mmcfg_size = (sysconfig.pci_mmconfig_end_bus + 1) * 256 * 4096
+    pci_mmcfg = ResourceRegion(sysconfig.pci_mmconfig_base, mmcfg_size)
+
+    for cell in cells:
+        for mem in cell.memory_regions:
+            idx = cell.memory_regions.index(mem)
+            if mem.phys_overlaps(pci_mmcfg):
+                print("\n\nIn cell '%s', region %d" %(cell.name, idx))
+                print(str(mem))
+                print("overlaps with MMCONFIG")
+                print(str(pci_mmcfg), end='')
+                found=True
+                ret=1
+    print("\n" if found else " None")
+
+iommu_resources = []
+for iommu in sysconfig.iommus:
+    iommu_resources.append(ResourceRegion(iommu.base, iommu.size, "IOMMU"))
+if len(iommu_resources) > 0:
+    print("Missing IOMMU interceptions:", end='')
+    found=False
+    for cell in cells:
+        for mem in cell.memory_regions:
+            idx = cell.memory_regions.index(mem)
+            for iommu in iommu_resources:
+                if mem.phys_overlaps(iommu):
+                    print("\n\nIn cell '%s', region %d" %(cell.name, idx))
+                    print(str(mem))
+                    print("overlaps with IOMMU")
+                    print(str(iommu), end='')
+                    found=True
+                    ret=1
+    print("\n" if found else " None")
+
+print("Missing resource interceptions for architecture %s:" % arch, end='')
+found=False
+if arch in ('arm', 'arm64'):
+    arch_resources = []
+    if sysconfig.arm_gic_version == 2:
+        arch_resources.append(ResourceRegion(sysconfig.arm_gicd_base, 0x1000,
+                                             "GICD"))
+        arch_resources.append(ResourceRegion(sysconfig.arm_gicc_base, 0x2000,
+                                             "GICC"))
+        arch_resources.append(ResourceRegion(sysconfig.arm_gich_base, 0x2000,
+                                             "GICH"))
+        arch_resources.append(ResourceRegion(sysconfig.arm_gicv_base, 0x2000,
+                                             "GICV"))
+    elif sysconfig.arm_gic_version == 3:
+        arch_resources.append(ResourceRegion(sysconfig.arm_gicd_base, 0x10000,
+                                             "GICD"))
+        arch_resources.append(ResourceRegion(sysconfig.arm_gicr_base, 0x20000,
+                                             "GICR"))
+    else:
+        raise RuntimeError("Unknown GIC version: %d" %
+                           sysconfig.arm_gic_version)
+elif arch == 'x86':
+    arch_resources = [ResourceRegion(0xfee00000, 0x1000, "xAPIC")]
+    for irqchip in root_cell.irqchips:
+        arch_resources.append(ResourceRegion(irqchip.address, 0x1000,
+                                             "IOAPIC"))
+for cell in cells:
+    for mem in cell.memory_regions:
+        idx = cell.memory_regions.index(mem)
+        for arch_resource in arch_resources:
+            if mem.phys_overlaps(arch_resource):
+                print("\n\nIn cell '%s', region %d" % (cell.name, idx))
+                print(str(mem))
+                print("overlaps with %s" % arch_resource.name)
+                print(str(arch_resource), end='')
+                found=True
+                ret=1
+print("\n" if found else " None")
+
 exit(ret)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/659055b1171ae155e199f3b4b7547864ca1bedc6.1610016752.git.jan.kiszka%40siemens.com.
