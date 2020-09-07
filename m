Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUMS3D5AKGQEGFW2VZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E33125F7BF
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:20:02 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 189sf529556wme.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:20:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599474002; cv=pass;
        d=google.com; s=arc-20160816;
        b=sMFK7JGGq55oWo9B6fbjrM5cUNljYlQr4sp8RC8OfSY+dF7pPi5jsj/fnEZLEXQ16F
         D6y0iH/kvdj9tXCx78jGWT9kEbP9TMzPeqCcje/znizfgsTdL9/fQ1lCLUPreyUnlVaa
         95JgNYnZcv7L8EkpR1L3U5j3X1ymOUaR3B+zzs2q3u73DGqrHqTrOuPSHrKQjyC/vkRq
         xJkkArm2rbrENsjlwNCjwHWz35AD84oPlgI9D+5vKDeshodqPkS4r1CMumJknaGvmocn
         dRCMbDRN+MO+i3UzyhoJIuUuIjL4KAphdivtbJL216OHGfa7cpOfC+FUEtCReLQHXFvC
         pW/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Tc27KJs71uF/qLh+TEtmBRdN8NDM2sE1vBAnRENfSKs=;
        b=muoYrSI9F8nqZgEgqZR56L+XMv5T89AUcA1FsReWYjW/NMJ6QDxb/TKSrGc/RnANcX
         kK0/Xx6extpSIBUjRBdlgXSBpeII/nf1BRFyF/ZCe/PRLBlweAzjWnsnjM907OOTkjwk
         oNthxicSKoKAuo8EmezdBX9b4GF9bZ5R+76WLG48TWkfCStse6hL57zSZNcT1ZwYva+3
         m3Moz/hK2rqwv661m/0/zIyNkN5jXVEtTJL/uLICh/R1UVwTkA+NYgYheR/DXMSRMPlp
         IquexUSpL2agBtmZ5a3YPQs39oKLfaYWu59cXkJ6o3yvY/7iykxzkk3aAUD18UH05zPH
         xGew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Tc27KJs71uF/qLh+TEtmBRdN8NDM2sE1vBAnRENfSKs=;
        b=SWOrnmcLhAW2P0n83eJu83gByFc+yYTelpkLSc6ea9ot5L+mybs5S/homTk8vzxyZs
         L3QKUPTQ8gHxVFkByV9qlKHCjRcAhRPZjKRh8CWsLrPavgaAPNS2gLfQDvhxltjkoNS1
         QzYO4XJGai13ZOTF+btPrOv1FiyiPouaOStpzPPavQgmKzVcb5upxnPqXRZd12BKGgpa
         yihxsq+yb4qENnu1EZDYxq4NIW3+hfen02cFxW5AcK18fgPxo+Of+xmEnUQG+cAAb1nM
         RO2lN4mHPIaeSlLxUeagF2sUWG/spBSHv4uubUXA23cJzRxBTR6IyJGVcJlTPbvtFtDK
         XhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Tc27KJs71uF/qLh+TEtmBRdN8NDM2sE1vBAnRENfSKs=;
        b=m6tZX3vho9uwvsMZcNJ1XIqp+10l6oK/vChTxCn6B/sX1V3agh0dPXyc34O1SBTYr4
         o0j6ZalwevK6ZsnMf26kJxHaZqsvuown3tjxUp2jHyCRLBMU/BT6Z2qly26HmD/HxTpL
         paZ8sE4IEkxD8vol3MFQOy6ex5rvGVIPK/Kvxci2JZzQU0nsumS2g6pxVYRbcJhx82JU
         5i3A3YzqEVzju7UxYODq5sLB2ciH1JmGIXwd3U0tKANVbEO7KUE6HYUx4NCXx+Q6Cb7y
         dQWtPinhfMzoPDeBLjP+WVwKgrzRjRSXsUsJXRX8XTXNRaT6vDMqu0tBb3XqTdqNgrVb
         hkXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5319GpRS0ObAZZLaWgWTtUoLNimgEB6rnSSBcLVbFvTQqE9oUmF9
	7JifyXhwFB21EPUXNcCHkE8=
X-Google-Smtp-Source: ABdhPJyXtn7mNr5K0pwKF2rrt6/EA9Tp+ejU+tnLV67TxMFv4Apri/fw4pdZ3+zca0ucMrmF0ylHsg==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr20669889wmj.174.1599474001926;
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8:: with SMTP id h8ls9273831wrx.3.gmail; Mon, 07
 Sep 2020 03:20:01 -0700 (PDT)
X-Received: by 2002:adf:f24f:: with SMTP id b15mr22249356wrp.301.1599474001037;
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474001; cv=none;
        d=google.com; s=arc-20160816;
        b=OD9FdV6tigCOf94jRtiQJzeDcucgXlBYi1nA58JyFJb859H56YjrzNL58cB4iZyC06
         HFFA1rPbwu7ybcCPTe6Z9vcdHFFyyC0orvLaAYQukUWShP0ZMPbQW4pLdPKh5SrB/JIq
         WZIoQdiNtCCDF4BDk5YkvvWTA05UmA4Y2pjZiAGYXFLm4NaG0UezFGp3TdHWzTI51mbn
         dmwQwKE9RvRs0ra0l3D39HMossUSzwNDmxwLI1t52lK+7P+SKm9E/WndCZbyFRGGp39e
         MqobWjl604a4hVkylepJC/EARuEHphA76dk6rfkkXI1KKgP3ljsg5SMNB5pzNWuNNbBB
         TwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=ArENY6uPEDFI4sj4MvSXYQ0EIpoRMQ0ZLRcwfG8AVXI=;
        b=MDLoU/nTo8dRNlCTjlbpJZ0Aj+yEhIBj+9SBvoOjiV+lwjxQ1DYc6YG/QLyuQIa7A0
         dJyz2CiJR8gCa64ZENpoKXV7yGAykfPagBAcFvzf9vSmsbJZ1fO31l5Pux9a40BGX8ep
         B1cwSQkUX1w3vl9euIuLKU0s+jHk478n/EDdHS9fwFnzFFohnXQzwjjBR20XRI1AbAPK
         qKrlTbIMDgK+1ITN6XrMEWoasQQE5YSvGvEiZTYj8gAu/gUHOLhVitu2qgSYunJFHzDt
         wMtFnoYmg8ggxm+SHsY+LdPcm/HoSMIy6NVmvmFRokDra0vCLVXFAnygue+zsJsH6y8j
         qZeg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 21si488739wmj.2.2020.09.07.03.20.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 087AK0Tp014821
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:00 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087AJx2C024503
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:00 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/8] kbuild: Avoid deprecated 'always'
Date: Mon,  7 Sep 2020 12:19:52 +0200
Message-Id: <e2b94aed34874271a9ede06bf4521b4f16ea8b86.1599473999.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599473999.git.jan.kiszka@siemens.com>
References: <cover.1599473999.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Switch to 'always-y' as suggested by 5.9.

For older kernels, we need to set 'always' to 'always-y'. This has to
happen conditionally in order to avoid warnings from 5.9 onward.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Kbuild                              |  3 +++
 configs/Makefile                    |  6 ++++--
 hypervisor/Makefile                 |  6 ++++--
 hypervisor/arch/arm-common/Kbuild   |  2 ++
 hypervisor/arch/arm/Kbuild          |  2 +-
 hypervisor/arch/arm64/Kbuild        |  2 +-
 hypervisor/arch/x86/Kbuild          |  4 +++-
 inmates/lib/arm-common/Makefile.lib |  2 ++
 inmates/lib/arm/Makefile            |  2 +-
 inmates/lib/arm/Makefile.lib        |  2 +-
 inmates/lib/arm64/Makefile          |  2 +-
 inmates/lib/arm64/Makefile.lib      |  2 +-
 inmates/lib/x86/Makefile            |  2 +-
 inmates/lib/x86/Makefile.lib        |  4 +++-
 scripts/always-compat.mk            | 16 ++++++++++++++++
 tools/Makefile                      |  8 ++++----
 16 files changed, 48 insertions(+), 17 deletions(-)
 create mode 100644 scripts/always-compat.mk

diff --git a/Kbuild b/Kbuild
index 0b25e26e..1808dc77 100644
--- a/Kbuild
+++ b/Kbuild
@@ -11,6 +11,9 @@
 # the COPYING file in the top-level directory.
 #
 
+ALWAYS_COMPAT_MK := $(src)/scripts/always-compat.mk
+export ALWAYS_COMPAT_MK
+
 INC_CONFIG_H = $(src)/include/jailhouse/config.h
 export INC_CONFIG_H
 
diff --git a/configs/Makefile b/configs/Makefile
index 1e59840e..31ca15a3 100644
--- a/configs/Makefile
+++ b/configs/Makefile
@@ -10,6 +10,8 @@
 # the COPYING file in the top-level directory.
 #
 
+include $(ALWAYS_COMPAT_MK)
+
 -include $(GEN_CONFIG_MK)
 
 LINUXINCLUDE := -I$(src)/../hypervisor/arch/$(SRCARCH)/include \
@@ -25,12 +27,12 @@ OBJCOPYFLAGS := -O binary
 
 CONFIGS = $(shell cd $(src); ls $(SRCARCH)/*.c)
 
-always := $(CONFIGS:.c=.cell)
+always-y := $(CONFIGS:.c=.cell)
 
 targets += $(CONFIGS:.c=.o) $(CONFIGS:.c=.cell)
 
 DTS = $(shell cd $(src); ls $(SRCARCH)/dts/*.dts 2>/dev/null)
-always += $(DTS:.dts=.dtb)
+always-y += $(DTS:.dts=.dtb)
 targets += $(DTS:.dts=.dtb)
 
 # prevent deleting intermediate files which would cause rebuilds
diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 893ead42..b8377a33 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -16,6 +16,8 @@
 # Copyright (c) Linux kernel developers, 2014
 #
 
+include $(ALWAYS_COMPAT_MK)
+
 -include $(GEN_CONFIG_MK)
 
 LINUXINCLUDE := -I$(src)/arch/$(SRCARCH)/include \
@@ -87,12 +89,12 @@ ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
 $(obj)/arch/$(SRCARCH): $(obj)/$(ASM_DEFINES_H)
 endif
 
-always :=
+always-y :=
 
 subdir-y := arch/$(SRCARCH)
 
 define BUILD_JAILHOUSE_template
-always += jailhouse$(1).bin
+always-y += jailhouse$(1).bin
 
 $$(obj)/arch/$$(SRCARCH)/lib$(1).a: $$(obj)/arch/$$(SRCARCH)
 	@true
diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
index ab86eca6..9ddbc950 100644
--- a/hypervisor/arch/arm-common/Kbuild
+++ b/hypervisor/arch/arm-common/Kbuild
@@ -10,6 +10,8 @@
 # the COPYING file in the top-level directory.
 #
 
+include $(ALWAYS_COMPAT_MK)
+
 -include $(GEN_CONFIG_MK)
 
 ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
index 2afc09c0..3d7bd614 100644
--- a/hypervisor/arch/arm/Kbuild
+++ b/hypervisor/arch/arm/Kbuild
@@ -12,7 +12,7 @@
 
 include $(src)/../arm-common/Kbuild
 
-always := lib.a
+always-y := lib.a
 
 # units initialization order as defined by linking order:
 # irqchip (common-objs-y), <generic units>
diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index c34b0f32..6773714d 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -14,7 +14,7 @@
 
 include $(src)/../arm-common/Kbuild
 
-always := lib.a
+always-y := lib.a
 
 # units initialization order as defined by linking order:
 # irqchip (common-objs-y), <generic units>
diff --git a/hypervisor/arch/x86/Kbuild b/hypervisor/arch/x86/Kbuild
index eb1910fd..a6badcac 100644
--- a/hypervisor/arch/x86/Kbuild
+++ b/hypervisor/arch/x86/Kbuild
@@ -12,11 +12,13 @@
 # the COPYING file in the top-level directory.
 #
 
+include $(ALWAYS_COMPAT_MK)
+
 -include $(GEN_CONFIG_MK)
 
 ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
 
-always := lib-amd.a lib-intel.a
+always-y := lib-amd.a lib-intel.a
 
 common-objs-y := apic.o dbg-write.o entry.o setup.o control.o mmio.o iommu.o \
 		 paging.o pci.o i8042.o vcpu.o efifb.o ivshmem.o
diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
index c13696f3..1beb08b1 100644
--- a/inmates/lib/arm-common/Makefile.lib
+++ b/inmates/lib/arm-common/Makefile.lib
@@ -36,6 +36,8 @@
 # THE POSSIBILITY OF SUCH DAMAGE.
 #
 
+include $(ALWAYS_COMPAT_MK)
+
 objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
 objs-y += ../printk.o ../pci.o
 objs-y += printk.o gic.o mem.o pci.o timing.o setup.o uart.o
diff --git a/inmates/lib/arm/Makefile b/inmates/lib/arm/Makefile
index ac01d89e..d0d00d0d 100644
--- a/inmates/lib/arm/Makefile
+++ b/inmates/lib/arm/Makefile
@@ -39,7 +39,7 @@
 include $(INMATES_LIB)/Makefile.lib
 include $(INMATES_LIB)/../arm-common/Makefile.lib
 
-always := lib.a inmate.lds
+always-y := lib.a inmate.lds
 
 lib-y := $(common-objs-y)
 lib-y += header.o
diff --git a/inmates/lib/arm/Makefile.lib b/inmates/lib/arm/Makefile.lib
index 0976f894..723ff6aa 100644
--- a/inmates/lib/arm/Makefile.lib
+++ b/inmates/lib/arm/Makefile.lib
@@ -45,7 +45,7 @@ LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
 
 define DECLARE_TARGETS =
  _TARGETS = $(1)
- always := $$(_TARGETS)
+ always-y := $$(_TARGETS)
  # $(NAME-y) NAME-linked.o NAME.bin
  targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
             $$(_TARGETS:.bin=-linked.o) $$(_TARGETS)
diff --git a/inmates/lib/arm64/Makefile b/inmates/lib/arm64/Makefile
index 2cc0c658..6b6b83b3 100644
--- a/inmates/lib/arm64/Makefile
+++ b/inmates/lib/arm64/Makefile
@@ -39,7 +39,7 @@
 include $(INMATES_LIB)/Makefile.lib
 include $(INMATES_LIB)/../arm-common/Makefile.lib
 
-always := lib.a inmate.lds
+always-y := lib.a inmate.lds
 
 lib-y := $(common-objs-y)
 lib-y += header.o
diff --git a/inmates/lib/arm64/Makefile.lib b/inmates/lib/arm64/Makefile.lib
index 0976f894..723ff6aa 100644
--- a/inmates/lib/arm64/Makefile.lib
+++ b/inmates/lib/arm64/Makefile.lib
@@ -45,7 +45,7 @@ LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
 
 define DECLARE_TARGETS =
  _TARGETS = $(1)
- always := $$(_TARGETS)
+ always-y := $$(_TARGETS)
  # $(NAME-y) NAME-linked.o NAME.bin
  targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
             $$(_TARGETS:.bin=-linked.o) $$(_TARGETS)
diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 40d3eba2..35f04161 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -38,7 +38,7 @@
 
 include $(INMATES_LIB)/Makefile.lib
 
-always := lib.a lib32.a
+always-y := lib.a lib32.a
 
 TARGETS := cpu-features.o excp.o header-common.o irq.o ioapic.o printk.o
 TARGETS += setup.o uart.o
diff --git a/inmates/lib/x86/Makefile.lib b/inmates/lib/x86/Makefile.lib
index 6190315b..872b7ce0 100644
--- a/inmates/lib/x86/Makefile.lib
+++ b/inmates/lib/x86/Makefile.lib
@@ -36,6 +36,8 @@
 # THE POSSIBILITY OF SUCH DAMAGE.
 #
 
+include $(ALWAYS_COMPAT_MK)
+
 -include $(GEN_CONFIG_MK)
 
 KBUILD_CFLAGS += -m64 -mno-red-zone
@@ -43,7 +45,7 @@ LINUXINCLUDE += -I$(INMATES_LIB)/include
 
 define DECLARE_TARGETS =
  _TARGETS = $(1)
- always := $$(_TARGETS)
+ always-y := $$(_TARGETS)
  # $(NAME-y) NAME-linked.o NAME.bin
  targets += $$(foreach t,$$(_TARGETS:.bin=-y),$$($$t)) \
             $$(_TARGETS:.bin=-linked.o) $$(_TARGETS)
diff --git a/scripts/always-compat.mk b/scripts/always-compat.mk
new file mode 100644
index 00000000..a74f4df4
--- /dev/null
+++ b/scripts/always-compat.mk
@@ -0,0 +1,16 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#  Benjamin Block <bebl@mageta.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+ifeq ($(shell expr \( $(VERSION) \* $$((0x100)) \+ $(PATCHLEVEL) \) \< $$((0x509))),1)
+always = $(always-y)
+endif
diff --git a/tools/Makefile b/tools/Makefile
index 8b4ebf14..95b29295 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -33,14 +33,14 @@ KBUILD_CFLAGS += $(call cc-option, -fno-pie)
 KBUILD_CFLAGS += $(call cc-option, -no-pie)
 
 BINARIES := jailhouse ivshmem-demo
-always := $(BINARIES)
+always-y := $(BINARIES)
 
 HAS_PYTHON_MAKO := \
 	$(shell $(PYTHON) -c "from mako.template import Template" 2>/dev/null \
 	&& echo yes)
 
 ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
-always += jailhouse-config-collect
+always-y += jailhouse-config-collect
 HELPERS := jailhouse-config-collect
 
 else  # !HAS_PYTHON_MAKO
@@ -116,7 +116,7 @@ CFLAGS_jailhouse-gcov-extract.o	:= -I$(src)/../hypervisor/include \
 LDFLAGS_jailhouse-gcov-extract := -lgcov -fprofile-arcs
 
 targets += jailhouse-gcov-extract.o
-always += jailhouse-gcov-extract
+always-y += jailhouse-gcov-extract
 
 $(obj)/jailhouse-gcov-extract: $(obj)/jailhouse-gcov-extract.o
 	$(call if_changed,ld)
@@ -125,7 +125,7 @@ $(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse
 	$(call if_changed,gen_collect)
 
 targets += $(MAN8_PAGES)
-always +=  $(MAN8_PAGES)
+always-y +=  $(MAN8_PAGES)
 
 $(obj)/%.8: $(src)/%.8.in
 	$(call if_changed,gen_man)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e2b94aed34874271a9ede06bf4521b4f16ea8b86.1599473999.git.jan.kiszka%40siemens.com.
