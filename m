Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVXES7WQKGQEWDNFSDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 595FED7B26
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:47 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id y12sf4013494ljc.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156566; cv=pass;
        d=google.com; s=arc-20160816;
        b=oeDp/cebz2gEkQ36rf2LaDDeEYZ0NNnaqllxtAyitA3PamIDSqD2EmTPCZMhjXZz7Z
         +ICoiiTEjMjslnG0be8zotm6P75uRmoTBz6OSM+HImn83XvIl5TFPYqtDEis1th78ZWK
         FhA5lYHNH3N3A0NXJ2Dxj79FntWiFV1X03jVvP8IWxCtX2vIjGtGD+18/rba6dD/47eR
         elO24oUBIHU3k5I+DFKai1rasETUTQFgv0qokTD/ZKvbCvuI0KXwnf3t7e/wXQnVFvn7
         PGPS4UspnA6FN7m/ADS08jBpAWkz9UljEzLQB0kHRy1TMAbVJU49EjeCxtbC3JvjT98S
         OwJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=G8feJbTQwHcld8hyGJR7Z/uA3Ens4ccddDkuHZyS8D4=;
        b=EpmeheYrFqt6KEwaNzJUvkd3ZTfZ3q4bIm3KHvHl8sOWgvjVw5FIVG4FRCXu7y5jgd
         JItUH+8dpRLs9VN0J4S1K9ZFQAb235j0/M/YMDUQQ1Sli9d9peCZe3i4OpXgzEZzy7c3
         e0uVGAl8koOah5XmioPRYXUB58sRByxNWD3D5xj3af8lk0HY0+k6t8UTqZeJDPw1JCyX
         PU74mXFsCN05SlFmZjL1mkzY6/GuxlVBUlT5QICYz9ASQOEtTZPr4v441lAT4vNaUONc
         ivK4CC8BKMWTsdF1rMd8fTQUOLGapGqMG/QJBMmz9xG7p+WITBKO3VlgEVQsQvQx16xR
         dknQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G8feJbTQwHcld8hyGJR7Z/uA3Ens4ccddDkuHZyS8D4=;
        b=Eb1FRgoH46mwpj973x7MXBWVc3x2QX3l8p7GyDXntP4178yvr8nfyprHxcOl9tYVRN
         h/tkN/bIeDXMrx83aEp9roAGibB8Iut+QckQr5SUvc2nlTE+ddPtAaARbcpAHBdu/Eh4
         L3IBuZG7xQgO7Q6Rx1vg1ePZ3j6w6ODrIPZcNmiBR+g12YQKVleyNt6pObWbCMEVSoSw
         39fdXun+T+Z/WThdYC7U0uqP8s9zQ1RfAFQVWgB0XJx8hZI2HEIkY+mnreJHLsjjQlN8
         mUW3HBcts1gkhZfFpL5lkyTfCVf8/58bf3vu1/vlh5Xf8usOyz2XGF0L3Y6YkF85CCiz
         gYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G8feJbTQwHcld8hyGJR7Z/uA3Ens4ccddDkuHZyS8D4=;
        b=pA638znz1mkjHUXiM1OskHFAEiYvsmVx7kfT5i6GCbnXkdNS6jQ8BDkTOIJIKLsHM7
         5vkLDq5Il+jtPifGeE6SLQgLvUY2X9sDjLbr1kc5p2g1p+OvY65SaM+xBMRpUsWh3M8F
         U46BClYPnYjuPmCPTK24CO8jq6HFI0lGRfWQhTMVjtwJT0D5mu/CwUySky7W1BeJKLIZ
         6j32lnJdDjMQH3HIc3NLj7k/rTekAEV0RpEGdVvJdyJOIdVOyDbe2gaGHBRcNemmdsGO
         rM3BzdQAToSb9qp/iakzhf2RaLSrVR8VqE5pIjdaSxcAGQ0FNl0SvmCnV9ZXZsoKW5/L
         ZQrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXJ+7bzby7f9p8T2s0uRkmyDtGOdX/fVL/XO6juVDTPJcOhYR1K
	Ng+T8NylO4vFHubq0fisJdM=
X-Google-Smtp-Source: APXvYqyNQqd9GFTH5IOYEK5EcZPj5bH6oMEO9vc0umQNtEfjY9hNXLvQC4RVPYx98O7LjERKij0rGw==
X-Received: by 2002:a2e:b819:: with SMTP id u25mr14922464ljo.223.1571156566793;
        Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:48c:: with SMTP id v12ls1692509lfq.13.gmail; Tue,
 15 Oct 2019 09:22:46 -0700 (PDT)
X-Received: by 2002:ac2:4830:: with SMTP id 16mr22795684lft.35.1571156566178;
        Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156566; cv=none;
        d=google.com; s=arc-20160816;
        b=wKKujHpURDedLctNGxIpsq9FyId+gwqEeMaAzw5GRrXAdaooPV223KeXwePqAIZ50T
         +G6zkvNTUjx6aNfWl42l0ggtFGg+J7IPqile/7V0nNt9KY3PdqGa+XAtq2zemvtsZK9q
         IpgSHhh86+i2YB3y3gw0l7ifPASW/ScwMNbA9UVK7urrQliOmdpIk3toWexf2om7NYi5
         cc1a90eXdNpET7mMgZaaKQPX9488JCGxN4txZn892qncrNrys7umkMexkSfOiz488Th9
         mpNjECd9mHDJwV01B6C4t+YVXxd+alwqifYD8D+F1Ywa85NoLdZDaMbufrUY8NB4+nFI
         xoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=mKLr8bf0yEh7EcG+rQCHyuSKYmj1LQzPf67Ztdxu1HU=;
        b=eGmI14gbdA+PKrCQJ1nNZwZLGIY5OPf9qX9xjgutxLEaChI6+WgXYP7VCx0EQLatKe
         6BakiTBSu1jGusc9EpaETnQAbclPweWrDistr193gs4780ZM5UiiE4nWRDnRx6cD2As1
         ap1Nx8N68PLQwwSEMwa6GP8a6wfQtAFP9+/1zUiwnVSWNrb4j0sSntthBGKJVLN1Tz10
         QHlYKMqrvbtaptTo2hgfnFlFUt2MfdMKL4Q4AabK2//hdHkFt8olQMKbk2u7o1LkRKlI
         4GWkcytQou2ZZwN47VdYqTEg6vBlFmT6STPQQZPgF46yxEVm4a9Rc0snDjTG9ShjqXSd
         kLcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q25si1220042ljg.5.2019.10.15.09.22.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11K35HLzy8Q;
	Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 12/13] pyjailhouse: x86: implement pio_regions generator
Date: Tue, 15 Oct 2019 18:22:41 +0200
Message-Id: <20191015162242.1238940-13-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NAME_BODY 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

From: Andrej Utz <andrej.utz@st.oth-regensburg.de>

This replaces the former static port list with actual port regions as listed in
/proc/ioports.

A whitelist selectively allows access to known ports (if present). PCI devices
above 0xcff are permitted as well.

However, not all ports that are in use are listed in ioports, so the generated
list may still ne further tuning.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
[ralf: s/permitted/whitelist/, autodetect VGA, whitelist serial,
       whitelist PCI devices, amend commit message, improve __str__ methods,
       ensure pep8 conformity]
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py   | 89 +++++++++++++++++++++++++++++++++++
 tools/jailhouse-config-create | 15 +-----
 tools/root-cell-config.c.tmpl | 12 ++---
 3 files changed, 96 insertions(+), 20 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 1d00f364..3cefc2c7 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -18,6 +18,7 @@
 # to change the generated C-code.
 
 
+import re
 import struct
 import os
 import fnmatch
@@ -25,6 +26,7 @@ import fnmatch
 from .pci_defs import PCI_CAP_ID, PCI_EXT_CAP_ID
 
 root_dir = "/"
+bdf_regex = re.compile(r'\w{4}:\w{2}:\w{2}\.\w')
 
 
 def set_root_dir(dir):
@@ -147,6 +149,65 @@ def parse_iomem(pcidevices):
     return ret, dmar_regions
 
 
+def ioports_search_pci_devices(tree):
+    ret = []
+
+    if tree.region and bdf_regex.match(tree.region.typestr):
+        ret.append(tree.region)
+    else:
+        for subtree in tree:
+            ret += ioports_search_pci_devices(subtree)
+
+    return ret
+
+
+def parse_ioports():
+    tree = IORegionTree.parse_io_file('/proc/ioports', PortRegion)
+
+    pm_timer_base = tree.find_regions_by_name('ACPI PM_TMR')
+    if len(pm_timer_base) != 1:
+        raise RuntimeError('Found %u entries for ACPI PM_TMR (expected 1)' %
+                           len(pm_timer_base))
+    pm_timer_base = pm_timer_base[0].start
+
+    leaves = tree.get_leaves()
+
+    # Never expose PCI config space ports to the user
+    leaves = list(filter(lambda p: p.start != 0xcf8, leaves))
+
+    # Drop everything above 0xd00
+    leaves = list(filter(lambda p: p.start < 0xd00, leaves))
+
+    whitelist = [
+        0x40,   # PIT
+        0x60,   # keyboard
+        0x61,   # HACK: NMI status/control
+        0x64,   # I8042
+        0x70,   # RTC
+        0x2f8,  # serial
+        0x3f8,  # serial
+    ]
+
+    pci_devices = ioports_search_pci_devices(tree)
+
+    # Drop devices below 0xd00 as leaves already contains them. Access should
+    # not be permitted by default.
+    pci_devices = list(filter(lambda p: p.start >= 0xd00, pci_devices))
+    for pci_device in pci_devices:
+        pci_device.permit = True
+
+    for r in leaves:
+        typestr = r.typestr.lower()
+        if r.start in whitelist or \
+           True in [vga in typestr for vga in ['vesa', 'vga']]:
+            r.permit = True
+
+    leaves += pci_devices
+    leaves.sort(key=lambda r: r.start)
+
+    return leaves, pm_timer_base
+
+
 def parse_pcidevices():
     int_src_cnt = 0
     devices = []
@@ -831,6 +892,19 @@ class MemRegion(IORegion):
         return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
 
 
+class PortRegion(IORegion):
+    def __init__(self, start, stop, typestr, permit=False, comments=None):
+        super(PortRegion, self).__init__(start, stop, typestr, comments)
+        self.permit = permit
+
+    def __str__(self):
+        return 'Port I/O: %04x-%04x : %s' % \
+            (self.start, self.stop, super(PortRegion, self).__str__())
+
+    def size(self):
+        return super(PortRegion, self).size() + 1
+
+
 class IOAPIC:
     def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
         self.id = id
@@ -854,6 +928,21 @@ class IORegionTree:
         self.parent = None
         self.children = []
 
+    def __iter__(self):
+        for child in self.children:
+            yield child
+
+    def get_leaves(self):
+        leaves = []
+
+        if len(self.children):
+            for child in self.children:
+                leaves.extend(child.get_leaves())
+        elif self.region is not None:
+            leaves.append(self.region)
+
+        return leaves
+
     # find specific regions in tree
     def find_regions_by_name(self, name):
         regions = []
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index c3226dde..250785af 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -162,18 +162,6 @@ def count_cpus():
             count += 1
     return count
 
-
-def parse_ioports():
-    pm_timer_base = None
-    f = sysfs_parser.input_open('/proc/ioports')
-    for line in f:
-        if line.endswith('ACPI PM_TMR\n'):
-            pm_timer_base = int(line.split('-')[0], 16)
-            break
-    f.close()
-    return pm_timer_base
-
-
 class MMConfig:
     def __init__(self, base, end_bus):
         self.base = base
@@ -302,7 +290,7 @@ mem_regions.append(inmatereg)
 
 cpucount = count_cpus()
 
-pm_timer_base = parse_ioports()
+port_regions, pm_timer_base = sysfs_parser.parse_ioports()
 
 debug_console = DebugConsole(options.console)
 
@@ -312,6 +300,7 @@ tmpl = Template(filename=os.path.join(options.template_dir,
                                       'root-cell-config.c.tmpl'))
 kwargs = {
     'mem_regions': mem_regions,
+    'port_regions': port_regions,
     'ourmem': ourmem,
     'argstr': ' '.join(sys.argv),
     'hvmem': hvmem,
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index d884089a..8f654fa7 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -47,7 +47,7 @@ struct {
 	__u64 cpus[${int((cpucount + 63) / 64)}];
 	struct jailhouse_memory mem_regions[${len(mem_regions)}];
 	struct jailhouse_irqchip irqchips[${len(irqchips)}];
-	struct jailhouse_pio pio_regions[6];
+	struct jailhouse_pio pio_regions[${len([1 for r in port_regions if r.permit])}];
 	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
 	struct jailhouse_pci_capability pci_caps[${len(pcicaps)}];
 } __attribute__((packed)) config = {
@@ -154,12 +154,10 @@ struct {
 	},
 
 	.pio_regions = {
-		PIO_RANGE(0x40, 4), /* PIT */
-		PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
-		PIO_RANGE(0x64, 1), /* I8042 */
-		PIO_RANGE(0x70, 2), /* RTC */
-		PIO_RANGE(0x3b0, 0x30), /* VGA */
-		PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
+		% for r in port_regions:
+		/* ${str(r)} */
+		${'' if r.permit else '/* '}PIO_RANGE(${r.start_str()}, ${r.size_str()}),${'' if r.permit else ' */'}
+		% endfor
 	},
 
 	.pci_devices = {
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-13-ralf.ramsauer%40oth-regensburg.de.
