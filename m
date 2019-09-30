Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBENUZHWAKGQEQ3TFMJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 24684C2648
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:40:02 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id 34sf7027928edf.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:40:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569872401; cv=pass;
        d=google.com; s=arc-20160816;
        b=sHtDEn3p8o4GVUNFQE4JE9aoRtlcfLTNAIvN79ibpWEWrS0hdkpVSw6YjcX3/XhxBK
         6wzAlvxXfsES0e4zQcScxmgVbZTE1V+nORhNMV0g00FPZotFBP5kvq+X5Q+A59+ASdST
         1FSfpQ/iA2jpBSLvvujbfIkQjLkWpjd44GvrDa5UREr1dg3og4q0A9QMR5NMxRCjXRgZ
         KeYWPL/2SLPXpgTOhpET4MmeHQFR6N8ePd8Szk+e3eEcgIvDalTUCPrmzFs6de3dtP1d
         npUYvakdGYR7q0gRf38NLGJqXPoYwpCzweZZAk3cSJK74Fc7yez4U6zuk0jnA6IvgRWS
         +rHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=dxq7KPpNpGQk3zKWHl2Br9ZAq8UVyUieX97W99/vf5E=;
        b=tm4r04hAN3xWsPSG7UPQkSmjwsWvJ2m3v3vgv75HtAoTSxmsNSnPv/7J7spmcYhYHZ
         nBvQ3Ep5Rx0rSH7OkIui0vqlQCDHTq9eVD1XAk5ywyqySVJaqrSGz3xvAo1e4Yv2fxA2
         yJcWt09xEb1/pcfobUoez/800k8HCEyHgsCyyHH1DKl2HeOtBRQijbSaQ8Ddp4VBYTjD
         RvLw5vhZzAv8aL6TebDqBrk4qXNlV+8Gx+RXXCqgBSS1W2VE7rC3fwO5E8kn8oFL81dG
         65eKMaC0njY22Z4AVXiF/qBo154atQFoOk7O9koTxEqjCFXDisiCsE+/6ljIX8LXNT81
         E2JQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=UErcnhbe;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dxq7KPpNpGQk3zKWHl2Br9ZAq8UVyUieX97W99/vf5E=;
        b=n39miVuRBmJo/XepeYqMRwnbfcZ+FvcNGYNHOOK9FhtMoGb1ZOdlMuT3lkgsjNwgcG
         kBy2bOmQXxgVQs4WupiRb9XWOnFF6yGoZ+7Z9AgXNiZU/UedavI29tKYXZqZPNAitBJf
         lf+O71PITLk35PwTeSC/k2Pqp7KHiZnSzX7F3v7sZcfwURMROh1l+o+WVjolR/BAqAz5
         l6z943jm65tDUTmIMmFE7bjyzCYsf/IIlqGt7mNaAGT+tn/sE6wrEflN2OQM7fC3ikA/
         t8wOol82V4ow4u7rBZltm4C4DwgE1vqp147K1zHwuzwO1iUNUmM/Lwls9ZFeneBM0Lo4
         jFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dxq7KPpNpGQk3zKWHl2Br9ZAq8UVyUieX97W99/vf5E=;
        b=XDdyAXGCm1h0mo9Wpc+uTdo2ZFbLz221d7xvgdL/dyBRR36YLkJcR3EmCA965jNnlq
         u0xA97fRst0CCTt0zq14460jL1fwFOBcrvB1VQ1rEI0dynBvUmASPnGmZpifVlY7nkOq
         YLWxdRQ0pkoLXRwr9oVsLGmbAPVMhwhxmCMfdcaQ7S/oLd5i0vXBd16Aj4kETlLmAB10
         FRxnBo9xYHoE698QsYJ76jLoYx/S1NxX5JKo2nfBWEGBTMzmsnHBf3SSWILyGcKNYJMs
         matXkOsJTzkNitFWUc4/ayr4vpeOuqSQYPmrcPDBOF1Avc5nxIRa3zT6cmUpBGLh6bDk
         8asw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX9n8+2ZW+x3K0QstvSiewlFd0lCOqYXcz1Q2/PBWzZpmthG7fG
	XYof2fOVEzIQCxo2dlij9GI=
X-Google-Smtp-Source: APXvYqwGhISkeVolVIJno57g92nR/1QIxIW1K4csoIiBjOrBZMVKQJQ2ff5FYvsH3uOi90L5KmoUtg==
X-Received: by 2002:a50:886d:: with SMTP id c42mr21635800edc.24.1569872401804;
        Mon, 30 Sep 2019 12:40:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:daca:: with SMTP id x10ls2450645eds.13.gmail; Mon, 30
 Sep 2019 12:40:01 -0700 (PDT)
X-Received: by 2002:a50:9250:: with SMTP id j16mr21782198eda.160.1569872401329;
        Mon, 30 Sep 2019 12:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569872401; cv=none;
        d=google.com; s=arc-20160816;
        b=uynwAjZ6gMxrxIMNLtE3hMUZnwR2wl2kK4TQ3FaLTqSaijU+QRFRvMY/7Yesoa0Jcz
         K3NGZp6N8tGW3Pk6B0wYhFkAOUo1B8haIrpAwh3FZvCa1/Qf4yYSWJqwdHhn16IT/mVR
         no8ROTKlsl+jEEcQs4Zrjje5YYcxEsI2b5foXmJfS/p5YV6sQG4fIjNepJduT3ANRmMb
         U5uF4eQMJV65txwAS0drI5I5YszHwKRyj/UQnLLHDdkGtRWZOpgQkTDX+qQIfOvXF/Kz
         b8Z1MxdLccg3c3cv2letlO+DTWoDVx+qwkzTn9TqYv0asifkHYbXOgnUGa0zORsqVfDx
         xthw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=BQc6jDzfw7qvc2cYN85Mc6kldnzzCy6FxhJjXqmiiR0=;
        b=mk89pKiuYNR+E40FgripHDm9HOK31WVwfnscUbcIbXt6C4vmyM457u2JhuU3Pvxf1v
         gM+LreSzagC6xRyQQeDUgzWTEdT+efJYrZypaEcB2UxH+1fIeN6jQPCyyvN2kz6nhzOn
         FFjCmfIHn11/S6holP4Lg8JvCd6Hvx59FfYhtJyX8AxhNrlWo94rZqSY3slPVDlSJr05
         cxjV48cwi6QPErsT4HOJjdYr0DfzysGqqMkrOGLXAeExVsQ8EUyLzU6pH1pcRi9Ur+1X
         h1cscMfb3B4a6R6IixTlcUP/hV1w7GZ7/OAyZTJHWkWZg5NpGeMCrkbR0mBg8eaknp4o
         AvAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=UErcnhbe;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id d11si586352edh.3.2019.09.30.12.40.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:40:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46ht5r6xDPzy9v
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:40:00 +0200 (CEST)
Received: from localhost.localdomain (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:40:00 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 14/14] pyjailhouse: x86: implement pio_regions generator
Date: Mon, 30 Sep 2019 21:39:52 +0200
Message-ID: <20190930193953.3002-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=UErcnhbe;
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

This replaces the old static port list with actual port regions from
'/proc/ioports'. The static regions from said list are kept and override
the data in case of region overlap to retain compability.
The generated port list is virtually identicall to the old one but eases
manual configuration.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py   | 60 +++++++++++++++++++++++++++++++++++
 tools/jailhouse-config-create | 15 ++-------
 tools/root-cell-config.c.tmpl | 11 +++----
 3 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 0dcc7475..baed6a40 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -147,6 +147,43 @@ def parse_iomem(pcidevices):
     return ret, dmar_regions
 
 
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
+    static_regions = [PortRegion(0xd00, 0xffff, 'HACK: PCI bus', True),
+                      PortRegion(0x3b0, 0x3df, 'VGA', True)]
+
+    leaves += static_regions
+
+    permitted = [
+        0x40,   # PIT
+        0x60,   # keyboard
+        0x61,   # HACK: NMI status/control
+        0x64,   # I8042
+        0x70,   # RTC
+        0x3b0,  # VGA
+    ]
+
+    for r in leaves:
+        if r.start in permitted:
+            r.permit = True
+
+    leaves.sort(key=lambda r: r.start)
+
+    return leaves, pm_timer_base
+
+
 def parse_pcidevices():
     int_src_cnt = 0
     devices = []
@@ -829,6 +866,18 @@ class MemRegion(IORegion):
         return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
 
 
+class PortRegion(IORegion):
+    def __init__(self, start, stop, typestr, permit=False):
+        super(PortRegion, self).__init__(start, stop, typestr)
+        self.permit = permit
+
+    def __str__(self):
+        return self.typestr
+
+    def size(self):
+        return super(PortRegion, self).size() + 1
+
+
 class IOAPIC:
     def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
         self.id = id
@@ -852,6 +901,17 @@ class IORegionTree:
         self.parent = None
         self.children = []
 
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
index cfa7fbad..e1888ea6 100755
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
index d884089a..0afe7e86 100644
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
@@ -154,12 +154,9 @@ struct {
 	},
 
 	.pio_regions = {
-		PIO_RANGE(0x40, 4), /* PIT */
-		PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
-		PIO_RANGE(0x64, 1), /* I8042 */
-		PIO_RANGE(0x70, 2), /* RTC */
-		PIO_RANGE(0x3b0, 0x30), /* VGA */
-		PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
+		% for r in port_regions:
+		${'' if r.permit else '/* '}PIO_RANGE(${r.start_str()}, ${r.size_str()}), /* ${str(r)} */
+		% endfor
 	},
 
 	.pci_devices = {
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930193953.3002-1-andrej.utz%40st.oth-regensburg.de.
