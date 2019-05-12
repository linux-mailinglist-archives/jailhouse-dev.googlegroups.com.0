Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBON237TAKGQEGPY5N4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 672171AB47
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 10:45:46 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id n6sf1455244lfe.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 01:45:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557650746; cv=pass;
        d=google.com; s=arc-20160816;
        b=fdMkmB9QcY5kCdHDOB81R+M/PjwtGUxN69EXr4qTn70kw/9dK/9hI1LYtyG00qosoH
         vFUFblz8uZ2oWd0cUcWEH+fMvplN0AbJh5HnBTpk6JxlSM6EW2SPkFnembbpf5akE0Zw
         L6ya1VeUMvGWxgoVVgiOoF12onXA9eazKQ+K9rmPg5tcDoVx0jZQRIl6t1JxmcTfili2
         3dRU3YSSXp7YXdknbb0sOh93IYyzfLiG5mC2ATHU4vpr0gdTR0IqL1HH2MlcLBIUCD4x
         xedYKaGnPleBQ5trqUTmz4FYBIj6IUSpq95OVBmTALf/aIKTmgXJOSQRh/HgVVVt/tJs
         ILLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=lAA6UrufzXuGrko/y+Tct9gL6D5DdKo9N+nDcVaJGZo=;
        b=t2KBHBwmqoRRFiVNOGsNRBrF8GkF1in6VDyH1L/C7xLdueKgVCf6WkMgHWaRBC1G0Y
         1QouO1725I9WVIUXrgpE2phFC5aQ+p29aBv5xiaG+/e7fm2qIEYpAmYGGqNRpn0cQVme
         VHRDLUXAICMOe4xd+YotIXOqihXwmkI90DvWVyYMLKxM/fsLjFgKX8HyQ228GfuHwUoo
         Fd9hKEGP5xwGIctjKhJ2WtPLy6rGa6wiToBQ5IknH78KUZs7TbbMSYE3i7fgog9pXV2/
         fR63u4sYwK6PUwVVV0LoYiKkqlperptvhXCojNTfSSzce62uM4GyxN+BD8NC2lWG6At6
         0Vbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fBpsP59D;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lAA6UrufzXuGrko/y+Tct9gL6D5DdKo9N+nDcVaJGZo=;
        b=jLdK2T4VdvgkzUthcZ+c1S0LSyBz7ngXqgFpkqzO2Sn2D+ewTZKR3C0fcW5QXzH/lk
         PLaG9aAyk1CaPo8ma+Jr5igYc+9boxemg+x6IL2PHHdHoFSbkNMby7FRox/dTSs+Dh7N
         zxl0htI4S2U6MZDjzZIT+YSsHhuSe58jssiBB8zrVJZFXH3COjsmfEqd+jw5w2HdHMmh
         HCtm83VTRWrihfSsG83m3kd1okLPvnZ1ZZ3WqUssHosS08ePj2RaoiEkRwfP0KWGByuj
         EAfGcIC5SF6UgK9MpMl9xvOYPNNEvz2Di7ltrN5qB+D7/7iIDfZKpwO0vrRT1VFegToK
         lJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lAA6UrufzXuGrko/y+Tct9gL6D5DdKo9N+nDcVaJGZo=;
        b=WhLrLfdCQVPhcJdUVyo58tCCfr5W2eel3x55xw2eRJTyI75KsEQ4zwEGIGQZjXhs00
         8B5RGB/lwmaRE/9XqqlYNQLaB3ahY+Y62r1At5sFp+WJ3fBk7jBz5kgjwElfLf+ZVYf9
         07xsDwxdmXKhUqZ1tv0T8DtDh24sZGEMLhFGY3G5RlJIqj6BXCmuG14zXys6IklRL4yO
         dEqgodDI263VV/sUXaNLnMcAthFCfPAjdNRcdGzLCCzgKQ+fW0IOsOXOhwQYRsLCs7Pc
         irfixqEO2OVr8higSuFm3ScieyZgj6QxLchs9xVZhq1Hl7My46Em1mVlhrGehR/zLiwl
         qFug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXMerw2yYRU4ZU4uMFP5r0mhEOKA1p4gs28VXzYrzX09NNoTE2/
	znJuoUhtDZhnADJ9wyDTYJ8=
X-Google-Smtp-Source: APXvYqy50j3FXnOO+tVsayBZWg0R031ila3mkFnkpWcR9J20sU6ic5lyEfNiEwnhSpo37Rkx7W8btw==
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr10422783ljg.145.1557650745970;
        Sun, 12 May 2019 01:45:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9c54:: with SMTP id t20ls1024360ljj.9.gmail; Sun, 12 May
 2019 01:45:45 -0700 (PDT)
X-Received: by 2002:a2e:c41:: with SMTP id o1mr4528975ljd.23.1557650745402;
        Sun, 12 May 2019 01:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650745; cv=none;
        d=google.com; s=arc-20160816;
        b=UUNOMhbC0lpta30uGaOP4zhuQUUMM91tk3nxcVBm0phOs35uETizHye3jRSOuNUntW
         6lQ9W35HhVwrRVYggYitSBmsT0KEj27+W0boPlCzphdLE1SqWUYjnFdTP+ru7r6cuV/y
         E5PhFNVM0nMm3NGIJz2tGqPg5gYUUJiSYnBdGXhPW3SBwlHAmEi5FnU8T0pa6jo1PEa5
         U8xv21TakwbBhdqsJ4o/bqq124RZ9ltfBi6wwbzcl4YaEOEJOl6jQ0MYUhouoOfcBGf6
         TRkTGkaDoNA5IpdrXTycFxRSsB+kDVZ5VoG+9qW/+zCrsHto1WnVfES8nd6QzE9aDoHR
         i3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=yhXyN16vzkx6qul1NIDsccpib2HupblL8gav/FE2Mgs=;
        b=zNhKCveeTIChqWKVJCAbRZmm0qymiwgKMKNCkASTavY/ifzBnDLiWbBabLFfJc6wa6
         fmbKqXygA9/zSr/qgOEa1TsRNZ0EdZ/PtBfR3Ye5tPzlXbXho1xBwxOqbwsqXKVTi40Z
         GdflkhVuRrRSBC4JOIukv5F6MfYkO+IZ86X1VY2YKbZPUlVtO1pr9id7MOBaPLjoAfJ6
         4MiNVWYtdGfKNCEux0+nShKDZIU1SHD6XJCJqbwZHPO2MAfpNeGS6JyqMYkfz1AP1z+E
         AqT/BcoYtHvxelkp2wB0ZTyrttFvkmHHoR6NhvSk4IdvF9iib3EvxaL//1jcJFKslsZH
         Sdvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fBpsP59D;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id c22si1911631lfh.5.2019.05.12.01.45.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:45:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M8zRF-1hZO5720c9-00CQJ8; Sun, 12
 May 2019 10:45:44 +0200
Subject: [PATCH v4 5/6] pyjailhouse: let the generator produce speaking names
 for PCI caps
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
 <20190509165231.18572-6-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <14e75933-dbd9-5070-8b55-439978fb32b1@web.de>
Date: Sun, 12 May 2019 10:45:43 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190509165231.18572-6-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:dplGhnGTFnvFc+/29N5lNU7DNLD2TjJznB+sIprz0vtWL9YeoSh
 OOL5IzkRkEe7VNAoVzNPcMrQS6yD9tM2xzTbCjGEZnpAhujj2mNzLzbNXnGcXOoJOX3M3p2
 ywaHDF9H9hdUOsQu06ROMeBRWrf43nEJWjTc1i598NEZp2S9gtk+c2VB3x2tZezYjh21FLv
 1LkXKRe2gltMFAB3i0cIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gM6uEEh46JI=:yE6itnXR6rkQByAsC14KJD
 XSnXT4kSC5AiBlWiJ+sPgsNoxOeUSO0UUYPRG721VpBMpQb1oVWT1pW4/o8Y0yrahj8MdLOjV
 Xg1VcqPipD6t9clrpTzdECYbWC0HWcQVi8ZHybsSMK4G1erllnqp0gfbTO7JMUFjvfKJwEkhX
 kwM6up/X0l5/pTLFO7KCR93X9mY5aY4bRP67eMa6CbR+0bP/nZWoI+s7ZKSFh97lnLTfPDwi8
 eJVkO+dfLvjZ/Kc18CwtGOTO8Zrk5srhD2hbTCvpjVxxDGQprSZcvoUQ/UB1xreZpWtid56xJ
 SKtHvR/r1TA+p72wP05tn6klbWXO5F7tvHCRusdXD4jZQWL1ip8+O+N/BfjYLNmw5SXd3N3hW
 qq/QvEJgqRe9iDiv/2ta+yc0dGDPaADTNPPswpoYtp9P+XPk0L8XfdZ5LU5R1GyY6Qky7JFvL
 nntxtPjDsWtBGI4AkIvyrgf4Jz1qsW20Ozu2D4Vmf7xNM7nCBMN79ciCWytqnUIFKZBoQzW4M
 LXrX1e9D8+XK4Byvh1LdjrPqMn7ULaD/S8vc/73k7SE5hr7pkNfb9vEC6BnnCfljDTeHjWqwX
 JVkjfiVATHLiA/GJhSKBurnF2lwcE6YtubyF31AJtNNZw5I7v1AQMvX/AoKuTGQ8lFF3/7Vcs
 Gss8fnutjdYZuO9aBpPPz4w/NyR4VoXjbR19EaY63dk4CbgYb7XAYRNcthpJr0P61P+Jd6+s+
 7Qn8gzo6u47LzwnBtN+ZRQNWNhFd5RGsenJsl2GW54AwN2hDw/dX6Xi7IKOoTnKoiaRVic5bj
 Jt27hbvqayU9JbjxW6BKIw6KfvsWJ9+cAaifdNufzmDt0mjf0ot4hR+LHMlXLmqqAsMchIbHe
 ffHJTpH3MT3ObQ7eNSWTgZif7KfnDVfwLjmLGmvXDs+bk1xHxYm51jOgCKogUEyu+oprbg8hE
 K3bHF5/cyWg==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=fBpsP59D;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

Definitions on C-side are in place, so let the generator produce those
definitions.

Therefore, we autogenerate pyjailhouse/pci_defs.py.

The generator will extract PCI_CAP_IDs with grep & sed, fill the template and
print the generated python file. The Makefile will redirect the output to the
final destination.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: moved pci_defs.py generation, refactored extended caps ID string]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

I would rather go for this version unless you have concerns.

 .gitignore                    |  1 +
 Kbuild                        | 14 +++++++++++++-
 Makefile                      |  2 +-
 pyjailhouse/sysfs_parser.py   | 33 ++++++++++++++++++++------------
 scripts/gen_pci_defs.sh       | 44 +++++++++++++++++++++++++++++++++++++++++++
 tools/root-cell-config.c.tmpl |  6 +-----
 6 files changed, 81 insertions(+), 19 deletions(-)
 create mode 100755 scripts/gen_pci_defs.sh

diff --git a/.gitignore b/.gitignore
index 494b9356..c8a96df0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -19,6 +19,7 @@ include/jailhouse/config.h
 hypervisor/hypervisor.lds
 inmates/lib/arm/inmate.lds
 inmates/lib/arm64/inmate.lds
+pyjailhouse/pci_defs.py
 tools/jailhouse
 tools/jailhouse-gcov-extract
 tools/jailhouse-config-collect
diff --git a/Kbuild b/Kbuild
index 71c232d4..7cbde529 100644
--- a/Kbuild
+++ b/Kbuild
@@ -41,6 +41,16 @@ GEN_VERSION_H := $(obj)/hypervisor/include/generated/version.h
 $(GEN_VERSION_H): $(src)/Makefile FORCE
 	$(call filechk,version)

+quiet_cmd_gen_pci_defs = GEN     $@
+define cmd_gen_pci_defs
+	$^ $(src)/include/jailhouse/pci_defs.h > $@
+endef
+
+GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
+
+$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
+	$(call if_changed,gen_pci_defs)
+
 subdir-y := driver hypervisor configs inmates tools

 subdir-ccflags-y := -Werror
@@ -52,9 +62,11 @@ $(addprefix $(obj)/,$(subdir-y)): $(GEN_CONFIG_MK)

 $(obj)/driver $(obj)/hypervisor: $(GEN_VERSION_H)

+$(obj)/tools: $(GEN_PCI_DEFS_PY)
+
 endif

-clean-files := pyjailhouse/*.pyc
+clean-files := pyjailhouse/*.pyc pyjailhouse/pci_defs.py

 clean-dirs := Documentation/generated hypervisor/include/generated \
 	      pyjailhouse/__pycache__
diff --git a/Makefile b/Makefile
index 217b7c9f..74017395 100644
--- a/Makefile
+++ b/Makefile
@@ -59,4 +59,4 @@ ifeq ($(strip $(PYTHON_PIP_USABLE)), yes)
 endif

 .PHONY: modules_install install clean firmware_install modules tools docs \
-	docs_clean pyjailhouse_install
+	docs_clean
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 08c7ed77..fa32ba48 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -22,6 +22,8 @@ import struct
 import os
 import fnmatch

+from .pci_defs import PCI_CAP_ID, PCI_EXT_CAP_ID
+
 root_dir = "/"


@@ -368,7 +370,7 @@ def parse_ivrs(pcidevices, ioapics):
                 if d.bdf() == iommu_bdf:
                     # Extract MSI capability offset
                     for c in d.caps:
-                        if c.id == 0x05:
+                        if c.id == PCI_CAP_ID.MSI:
                             msi_cap_ofs = c.start
                     # We must not map IOMMU to the cells
                     del pcidevices[i]
@@ -543,8 +545,9 @@ class PCIBARs:


 class PCICapability:
-    def __init__(self, id, start, len, flags, content, msix_address):
+    def __init__(self, id, extended, start, len, flags, content, msix_address):
         self.id = id
+        self.extended = extended
         self.start = start
         self.len = len
         self.flags = flags
@@ -556,6 +559,10 @@ class PCICapability:
         return self.id == other.id and self.start == other.start and \
             self.len == other.len and self.flags == other.flags

+    def gen_id_str(self):
+        return str(self.id) + \
+            (' | JAILHOUSE_PCI_EXT_CAP' if self.extended else '')
+
     RD = '0'
     RW = 'JAILHOUSE_PCICAPS_WRITE'

@@ -580,11 +587,12 @@ class PCICapability:
             msix_address = 0
             f.seek(cap)
             (id, next) = struct.unpack('<BB', f.read(2))
-            if id == 0x01:  # Power Management
+            id = PCI_CAP_ID(id)
+            if id == PCI_CAP_ID.PM:
                 # this cap can be handed out completely
                 len = 8
                 flags = PCICapability.RW
-            elif id == 0x05:  # MSI
+            elif id == PCI_CAP_ID.MSI:
                 # access will be moderated by hypervisor
                 len = 10
                 (msgctl,) = struct.unpack('<H', f.read(2))
@@ -593,7 +601,7 @@ class PCICapability:
                 if (msgctl & (1 << 8)) != 0:  # per-vector masking support
                     len += 10
                 flags = PCICapability.RW
-            elif id == 0x10:  # Express
+            elif id == PCI_CAP_ID.EXP:
                 len = 20
                 (cap_reg,) = struct.unpack('<H', f.read(2))
                 if (cap_reg & 0xf) >= 2:  # v2 capability
@@ -601,7 +609,7 @@ class PCICapability:
                 # access side effects still need to be analyzed
                 flags = PCICapability.RD
                 has_extended_caps = True
-            elif id == 0x11:  # MSI-X
+            elif id == PCI_CAP_ID.MSIX:
                 # access will be moderated by hypervisor
                 len = 12
                 (table,) = struct.unpack('<xxI', f.read(6))
@@ -620,7 +628,7 @@ class PCICapability:
                 flags = PCICapability.RD
             f.seek(cap + 2)
             content = f.read(len - 2)
-            caps.append(PCICapability(id, cap, len, flags, content,
+            caps.append(PCICapability(id, False, cap, len, flags, content,
                                       msix_address))

         if has_extended_caps:
@@ -637,8 +645,9 @@ class PCICapability:
                           'Extended Capability ID %x' % id)
                     continue

+                id = PCI_EXT_CAP_ID(id)
                 next = version_next >> 4
-                if id == 0x0010:  # SR-IOV
+                if id == PCI_EXT_CAP_ID.SRIOV:
                     len = 64
                     # access side effects still need to be analyzed
                     flags = PCICapability.RD
@@ -648,8 +657,8 @@ class PCICapability:
                     flags = PCICapability.RD
                 f.seek(cap + 4)
                 content = f.read(len - 4)
-                id |= PCICapability.JAILHOUSE_PCI_EXT_CAP
-                caps.append(PCICapability(id, cap, len, flags, content, 0))
+                caps.append(PCICapability(id, True, cap, len, flags, content,
+                                          0))

         f.close()
         return caps
@@ -674,9 +683,9 @@ class PCIDevice:
         self.msix_region_size = 0
         self.msix_address = 0
         for c in caps:
-            if c.id in (0x05, 0x11):
+            if c.id in (PCI_CAP_ID.MSI, PCI_CAP_ID.MSIX):
                 msg_ctrl = struct.unpack('<H', c.content[:2])[0]
-                if c.id == 0x05:  # MSI
+                if c.id == PCI_CAP_ID.MSI:
                     self.num_msi_vectors = 1 << ((msg_ctrl >> 1) & 0x7)
                     self.msi_64bits = (msg_ctrl >> 7) & 1
                 else:  # MSI-X
diff --git a/scripts/gen_pci_defs.sh b/scripts/gen_pci_defs.sh
new file mode 100755
index 00000000..40fb3a72
--- /dev/null
+++ b/scripts/gen_pci_defs.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) OTH Regensburg, 2019
+#
+# Authors:
+#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+
+CELL_CONFIG_H=$1
+
+function find_defines() {
+	header=$1
+	prefix=$2
+	search="#define\s\+${prefix}\(\S*\)\s\+\(\S*\).*"
+	replace="        '\1'\t: \2,"
+
+	grep $prefix $header | sed -e "s/$search/$replace/"
+}
+
+PCI_CAP_IDS=$(find_defines $CELL_CONFIG_H PCI_CAP_ID_)
+PCI_EXT_CAP_IDS=$(find_defines $CELL_CONFIG_H PCI_EXT_CAP_ID_)
+
+cat <<END
+# This file is autogenerated. If you need to change it, edit
+# tools/gen_pci_cap_ids.py.sh instead.
+
+from .extendedenum import ExtendedEnum
+
+
+class PCI_CAP_ID(ExtendedEnum):
+    _ids = {
+${PCI_CAP_IDS}
+    }
+
+
+class PCI_EXT_CAP_ID(ExtendedEnum):
+    _ids = {
+${PCI_EXT_CAP_IDS}
+    }
+END
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index b80d7889..b6ac8637 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -196,11 +196,7 @@ struct {
 		/* ${comment} */
 		% endfor
 		{
-			% if (c.id & 0x8000) != 0:
-			.id = ${hex(c.id & 0x7fff)} | JAILHOUSE_PCI_EXT_CAP,
-			% else:
-			.id = ${hex(c.id)},
-			% endif
+			.id = ${c.gen_id_str()},
 			.start = ${hex(c.start)},
 			.len = ${c.len},
 			.flags = ${c.flags},
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/14e75933-dbd9-5070-8b55-439978fb32b1%40web.de.
For more options, visit https://groups.google.com/d/optout.
