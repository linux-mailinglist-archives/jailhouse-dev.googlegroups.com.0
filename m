Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB4UGWDUAKGQE2TK4OUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id D31A94DD2F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 00:06:42 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id v125sf609129wmf.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Jun 2019 15:06:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561068402; cv=pass;
        d=google.com; s=arc-20160816;
        b=yW4MmuLcvUlVes5xFjx3m6D/46mxhptBMaiQKIhTOVNoKZF7wl7LRIRHrrVMUiSxjW
         3I75OX9ER9WWfUB4ZSVB5qwYIWdnaOQNUKKtvt3p68yg68rRbaKDYE84ppcGJ+mQfFGj
         bm2ZD9KIeAoIp/IY4tUeIewFMHq+jl97tQOqCvpWKhgFQbOyVlKNfMh9VUni1bOdTqsN
         IyFejfY08oatOrG4FL3tyBJv2A3Sx3oRCg6Q3YhrUcCBysi0MZVzB7h5BscPVS8/t/HK
         C3rTdz9coHe1r0laWybp+O05iwbrvzOW6m2nZv8G6QEinBGIMtbpyeNaQLBQO3OlBi0/
         LFYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=4t6223rSYtmrFe7ZYPuXlHFrFedVupSykyqaiGLymUE=;
        b=kDRB0DfoXi2fXGBdzXAepMkHROyMoBC/J1Bxog+gjXWjVMNbZf7sjUApu3xLk2ql7x
         m15PzfItU0CAUPNv7Ef07+zIyMtXqAk1Ox7VtK48K4wKzXeYT13hJCMyuqIIns67GCkt
         iB3fr1Ik/cHHH/LV76cNYfJzAZQwJMeojfb559ta1MtiwY0yR4xJ55hZf9sjbtPHpAVY
         uru0udoBLZjSqXFFES4oLmuksI4iOkXFrYzqrq0mrJq1NWCS8iRD6fNLHd24u7qqXlJy
         Lt0GcfInKP8WphRQYDR0PsCqjBg1Y4yOXOVyhwjEFmnQ91VQu1WaSmDh/3JrT7orFVhC
         GU4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=a6bEo+PE;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4t6223rSYtmrFe7ZYPuXlHFrFedVupSykyqaiGLymUE=;
        b=WITXEsWcaab8y96UiaA04heP+i2UMLcGzzJYW5ppw8m/5qVvGfT5xYdKToL/WNkQUq
         lgcoGAMXl4rZKuu9iUnT/sE8LL/AqZrZA44fIkjVbO4nn5IkIR3gFpXO8NB1u1qV0YM3
         sPcVFHFRsuIqf0UIhTEXOXOEIoS6Hz2QL85LcFnH0nLgwPFa3NMJfaG2+49ddvE370BM
         hc4UF2voypzUUdDuo9UZ1JTEbn2k/ErJmmlGcaEnmp3iUvcc17fd4oYheM+DKLPiyfIC
         5Rv2cOvh54vflkM9RsYNLYHnbb6J+d0HbIDiWJFCy9J19gD8/n8BzQ74pUqbz+aYdEUK
         KHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4t6223rSYtmrFe7ZYPuXlHFrFedVupSykyqaiGLymUE=;
        b=CinruVTi9hdBMsKWvwaSEmcYaiQzC2CnjSIfaCgPbJT/A3yaRXb4UxF+cSvDMDYDAX
         s750WfdkZo01Fg39upF6WF9r4us0bSiW5xx6MA9EgecIvrRtH7vVaUZ+4xD7u1bLu6xL
         6VJwNx7eYujr+yOTliXkTf4S+dNeQKuxi5R21z6J+IqVALFbJB0xziNzQgxs5rMcIyGX
         tCNjlo6p3+WYWr++QZXPerSVSahf14KVZ2LnDKHT3hyfGq3raIC8haIoAFvoQB9wX0Xa
         SHL0UxLne09mrGCMKHAe2aE/Z7DnqdijXC5wQjL9oO4AePIlgLqW6wc/CYy2TA7e0WKB
         0Yzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXaa/sb2OqiPevDBUH/GxfVz4AUNLl36yfZqyq7im2RNvWRew+J
	ztBLG2WQPqN/NBXDxEvl3A0=
X-Google-Smtp-Source: APXvYqzKAmz6Jwtkukvr/AiOcg83tkZfCdh2slOmSW6OAwuxXcb4OeZXsKBJOwEzpHm9WPNj/EhlbQ==
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr28498082wrw.352.1561068402519;
        Thu, 20 Jun 2019 15:06:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a1cc:: with SMTP id v12ls1679915wrv.1.gmail; Thu, 20 Jun
 2019 15:06:41 -0700 (PDT)
X-Received: by 2002:adf:efc8:: with SMTP id i8mr16894110wrp.220.1561068401831;
        Thu, 20 Jun 2019 15:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561068401; cv=none;
        d=google.com; s=arc-20160816;
        b=Hmr3w/HH/LGA2Tvh+5fK/uQ3CqzuflhFk/xp+7WiIdTTKsrIqJNAoEwt3k/+N0pePl
         TmWSZliW3eAlc7x/WN/arbIDD7Ynb2l+bO6cecg80a8mZKJXMnAdEYyoyASdbQf05rSU
         UgjNK+9Td0kw2P7RfOa4lxC63hHnjcvdcleExrQpYpAM7BS8TFuIYnvIBkFavieTs7Np
         YPzamC6BrOiJFYNF5zL3J6uYwuJkO4jf8H/r/X72jwOll0KT0EfZbMbGOdv8uccC+wbc
         2zZ6OiE7ZzW41+q0tFgiqiURTms1pjmsqfQeYWVdxFaHggWx8iv3EXygRXOYFXYOFXwb
         4i4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eRJ2WI+4FGPwml2mPkIk5OwguAX/Lq97MLzWk8mRkKY=;
        b=A1pdoa/2Kl9Xzd6+eDbRwSPkAtvcYNQWFxri4lagyp2Q/2Sr0ijs3LZkzHt+t6Y9rO
         DYni2n21LFufpBZupriG5ADNzloJw80obql9JBKI/J0Jhy7Q00RavI1cYaAZ+GFNwMR7
         bRHsCgOrS+TT6bzGYNH2MkaQmQ9gm+ge2SZ52INUfwQfma1xgjYsON/ucdyeHAHGmiJg
         gR352j1xGBYOEW+8uEKW0tnOfU/z5yXNZEX2VkD8mlYOYPhjUaifLRQy0i8e+r95TjMD
         aLdVP5g21teqJGiunGx+d5C3C4cUFwTyHbDq1dP6tbEnRO3xgNupyg3cAMmDTSc6JFLO
         hniA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=a6bEo+PE;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id u20si476396wmj.4.2019.06.20.15.06.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 15:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45VGB938tFzyD0;
	Fri, 21 Jun 2019 00:06:41 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 21 Jun
 2019 00:06:41 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@web.de>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 2/2] pyjailhouse: x86: implement pio_bitmap generator
Date: Fri, 21 Jun 2019 00:06:14 +0200
Message-ID: <20190620220614.23450-2-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190620220614.23450-1-andrej.utz@st.oth-regensburg.de>
References: <20190620220614.23450-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=a6bEo+PE;
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
 pyjailhouse/sysfs_parser.py   | 150 ++++++++++++++++++++++++++++++++++
 tools/jailhouse-config-create |  26 ++----
 tools/root-cell-config.c.tmpl |  31 ++++---
 3 files changed, 176 insertions(+), 31 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index d612c6d3..ce490236 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -141,6 +141,52 @@ def parse_iomem(pcidevices):
 
     return ret, dmar_regions
 
+def parse_ioports():
+    regions = IOMapTree.parse_ioports_tree(
+        IOMapTree.parse_iomap_file('/proc/ioports', PortRegion))
+
+    tmp = [
+        # static regions
+        PortRegion(0x0, 0x3f, ''),
+        PortRegion(0x40, 0x43, 'PIT', allowed=True),
+        PortRegion(0x60, 0x61, 'NMI', allowed=True, comments=["HACK!"]), # NMI status/control
+        PortRegion(0x64, 0x64, 'NMI', allowed=True, comments=["HACK!"]), # ditto
+        PortRegion(0x70, 0x71, 'RTC', allowed=True),
+        PortRegion(0x3b0, 0x3df, 'VGA', allowed=True),
+        PortRegion(0xd00, 0xffff, 'PCI bus', allowed=True),
+    ]
+
+    pm_timer_base = None
+    for r in regions:
+        if r.typestr == 'ACPI PM_TMR':
+            pm_timer_base = r.start
+
+        tmp.append(r)
+
+    tmp.sort(key=lambda r: r.start)
+    ret = [ tmp[0] ]
+
+    # adjust overlapping regions
+    for r in tmp[1:]:
+        prev = ret[-1]
+
+        # combine multiple regions under the same bit mask
+        if prev.aligned_stop() >= r.aligned_start():
+            if r.stop > prev.stop:
+                n = prev
+                while n.neighbor != None:
+                    n = n.neighbor
+                n.neighbor = r
+            continue
+
+        # forbid access to unrecognized regions
+        if prev.aligned_stop() - r.aligned_start() > 0:
+            ret.append(
+                PortRegion(prev.aligned_stop() + 1, r.aligned_start() - 1, ''))
+
+        ret.append(r)
+
+    return (ret, pm_timer_base)
 
 def parse_pcidevices():
     int_src_cnt = 0
@@ -772,6 +818,85 @@ class MemRegion:
         return 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE'
 
 
+class PortRegion:
+    def __init__(self, start, stop, typestr, comments=None, allowed=False):
+        self.start = start
+        self.stop = stop
+        self.typestr = typestr or ''
+        self.comments = comments or []
+        self.allowed = allowed
+        self.neighbor = None
+
+    def __str__(self):
+        # as in MemRegion this method is purely for C comment generation
+
+        # remove consecutive duplicates
+        neighbor = self.neighbor
+        stop = self.stop
+        ns = ''
+        while neighbor:
+            if self.typestr != neighbor.typestr \
+            or self.comments != neighbor.comments:
+                ns += ', ' + str(neighbor)
+                break
+
+            stop = neighbor.stop
+            neighbor = neighbor.neighbor
+
+        s = ''
+        # pretty print single ports
+        if self.start == stop:
+            s += '%5s' % ''
+        else:
+            s += '%04x-' % self.start
+
+        s += '%04x' % stop
+
+
+        if self.typestr:
+            s += ' : ' + self.typestr
+
+        if self.comments:
+            s += ' (' + ', '.join(c for c in self.comments) + ')'
+
+        s += ns
+        return s
+
+    # used in root-cell-config.c.tmpl
+    def is_combined(self):
+        neighbor = self.neighbor
+        while neighbor:
+            if self.typestr != neighbor.typestr:
+                return True
+
+            neighbor = neighbor.neighbor
+
+        return False
+
+    def size(self):
+        return self.stop - self.start
+
+    def aligned_start(self):
+        return self.start - self.start % 8
+
+    def aligned_stop(self):
+        return self.stop + (7 - self.stop % 8)
+
+    def bits(self):
+        # in this method: 0 = disallowed,
+        # in config: 0 = allowed
+        if self.allowed:
+            bits = ((1 << (self.size() + 1)) - 1) << \
+                (self.start - self.aligned_start())
+        else:
+            bits = 0
+
+        if self.neighbor:
+            bits |= ~self.neighbor.bits()
+
+        return ~bits & 0xFF
+
+
 class IOAPIC:
     def __init__(self, id, address, gsi_base, iommu=0, bdf=0):
         self.id = id
@@ -935,6 +1060,31 @@ class IOMapTree:
 
         return regions, dmar_regions
 
+    # recurse down the tree
+    @staticmethod
+    def parse_ioports_tree(tree):
+        regions = []
+
+        for tree in tree.children:
+            r = tree.region
+            s = r.typestr
+
+            if len(tree.children) > 0:
+                regions.extend(IOMapTree.parse_ioports_tree(tree))
+                continue
+
+            # split in byte sized regions
+            while r.size() > 8:
+                # byte-align r.stop
+                sub = PortRegion(r.start, r.start + 7 - r.start % 8, r.typestr)
+                regions.append(sub)
+                r.start = sub.stop + 1
+
+            # add all remaining leaves
+            regions.append(r)
+
+        return regions
+
 
 class IOMMUConfig:
     def __init__(self, props):
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 55601a6d..d154ec44 100755
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
@@ -269,7 +257,7 @@ product = [input_readline('/sys/class/dmi/id/sys_vendor',
 inmatemem = kmg_multiply_str(options.mem_inmates)
 hvmem = [0, kmg_multiply_str(options.mem_hv)]
 
-(regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
+(mem_regions, dmar_regions) = sysfs_parser.parse_iomem(pcidevices)
 ourmem = parse_kernel_cmdline()
 total = hvmem[1] + inmatemem
 
@@ -283,11 +271,11 @@ if vendor == 'GenuineIntel':
                                                            dmar_regions)
 else:
     (iommu_units, extra_memregs) = sysfs_parser.parse_ivrs(pcidevices, ioapics)
-regions += extra_memregs
+mem_regions += extra_memregs
 
 # kernel does not have memmap region, pick one
 if ourmem is None:
-    ourmem = alloc_mem(regions, total)
+    ourmem = alloc_mem(mem_regions, total)
 elif (total > ourmem[1]):
     raise RuntimeError('Your memmap reservation is too small you need >="' +
                        hex(total) + '". Hint: your kernel cmd line needs '
@@ -298,20 +286,20 @@ hvmem[0] = ourmem[0]
 inmatereg = sysfs_parser.MemRegion(ourmem[0] + hvmem[1],
                                    ourmem[0] + hvmem[1] + inmatemem - 1,
                                    'JAILHOUSE Inmate Memory')
-regions.append(inmatereg)
+mem_regions.append(inmatereg)
 
 cpucount = count_cpus()
 
-pm_timer_base = parse_ioports()
+(port_regions, pm_timer_base) = sysfs_parser.parse_ioports()
 
 debug_console = DebugConsole(options.console)
 
-
 f = open(options.file, 'w')
 tmpl = Template(filename=os.path.join(options.template_dir,
                                       'root-cell-config.c.tmpl'))
 kwargs = {
-    'regions': regions,
+    'mem_regions': mem_regions,
+    'port_regions': port_regions,
     'ourmem': ourmem,
     'argstr': ' '.join(sys.argv),
     'hvmem': hvmem,
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index b6ac8637..9f65a72a 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -45,7 +45,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[${int((cpucount + 63) / 64)}];
-	struct jailhouse_memory mem_regions[${len(regions)}];
+	struct jailhouse_memory mem_regions[${len(mem_regions)}];
 	struct jailhouse_irqchip irqchips[${len(irqchips)}];
 	__u8 pio_bitmap[0x2000];
 	struct jailhouse_pci_device pci_devices[${len(pcidevices)}];
@@ -125,7 +125,7 @@ struct {
 	},
 
 	.mem_regions = {
-		% for r in regions:
+		% for r in mem_regions:
 		/* ${str(r)} */
 		% for c in r.comments:
 		/* ${c} */
@@ -153,18 +153,25 @@ struct {
 	},
 
 	.pio_bitmap = {
-		[     0/8 ...   0x3f/8] = -1,
-		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
-		[  0x48/8 ...   0x5f/8] = -1,
-		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI status/control */
-		[  0x68/8 ...   0x6f/8] = -1,
-		[  0x70/8 ...   0x77/8] = 0xfc, /* RTC */
-		[  0x78/8 ...  0x3af/8] = -1,
-		[ 0x3b0/8 ...  0x3df/8] = 0x00, /* VGA */
-		[ 0x3e0/8 ...  0xcff/8] = -1,
-		[ 0xd00/8 ... 0xffff/8] = 0, /* HACK: PCI bus */
+		% for r in port_regions:
+		% if r.is_combined():
+
+		% for c in str(r).split(', '):
+		/* ${c} */
+		% endfor
+		% endif
+		[${
+			'%6s' % hex(r.aligned_start())}/8 ... ${
+			'%6s' % hex(r.aligned_stop())}/8] = ${
+			'%4s' % ('0' if r.bits() == 0 else \
+					'-1' if r.bits() == 0xff else \
+					hex(r.bits()))}, ${
+			('/* %s */' % str(r)) if not r.is_combined() else '\n' 
+		}
+		% endfor
 	},
 
+
 	.pci_devices = {
 		% for d in pcidevices:
 		/* ${str(d)} */
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190620220614.23450-2-andrej.utz%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
