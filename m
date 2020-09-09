Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRM34L5AKGQER3YJ7CQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 920AD262996
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Sep 2020 10:09:42 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id v128sf126701lfa.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Sep 2020 01:09:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599638982; cv=pass;
        d=google.com; s=arc-20160816;
        b=LPeYakkRU3mHtLXo5q8K1vPVeeFglKtqbbc0/DZq1o5dRXn4yKGUK4lc9qQ2b5Fjxx
         J6zFkGRJ4V7x/0d7986xGCe620mXgrjC027EBteb3Bn0uKEq57ArwT4jgyh7F9rGVu38
         QgdzJBiJnb2drM/I6ycF/1MWp1QE3EsXiSACxgpyrARI5yAB16/AqfBgvI872iL54uoW
         ndyB50Zb/JZAfdiEFqupa3qGSP192/wzInFI1a6jKfvjyEBtuBznMWHMNRtYa+ZiGA/1
         tr0xKSW9ercrI5pBrqH8zL5kRiAQgStAoetUrPycw2dz4afYQws+oz7Pq2n/HJaGJNjQ
         0pug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=6xPz/soQ8Bh+a+cMmNaEsFe5xXinZcaKIEkXa1DRIJQ=;
        b=JJpmzr+euIym0GYxmuyyCg8eIkgJYS2IdumHJDxcCphAxX5AB29dJlRbU5bCWrTFYX
         Mpq4BiIjF5CQyw0UX7Bpp7HaB49sWYYxSuwyP/YUA2t1eRimHJrtZp/MS3su8E9I/04n
         N5NHg5jcR7Detf/Eny03i51g2MeRoKesHaHs1D4kAoKfqp6VDXHq6vz+0N4FRYF1JUa7
         8jdQbji8+MR8KrQKeW67koNkAApu4hZNS5GlJDtlhIqUEJ/VpS2EKO7gdNo1mFNHCeTa
         cuXEf/1pcbes+4t/uJOV6jYu300dsAX/M4KqfyttyvTn2jB1W0A2+6w/c01mDdRxgOtN
         WshA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6xPz/soQ8Bh+a+cMmNaEsFe5xXinZcaKIEkXa1DRIJQ=;
        b=oZFmk7cdxxWmfSXFs0nLRGOeF6tTDl7m06Gig6QnGBiAuF5bYoflfqTTQnlfIvszDT
         EvwY12Dwh1lgBMa/RJVHREYST15xmECVkYsGSktxaJLrNx1J5Ib8gqx0IjXh4r9UfqrY
         bKC1TfVeQClyQRrq0Nw8qm7kqhYyl859S4VLdzrvE93XkdpzVD4OrDMivc2tazyNYDDa
         KcaEHome2sk1xBDvxxKlwFhkduknu5YjDQ0J4X5ArGQ7tRP7wpxnxC/eo/dVTB19pIC0
         n8KiaqGsg2OPSIM8WtYy/uOJdbs7Ph2iXEg6bjhzBjuwaqJFVLFOo1fm04L2FmVMP5oj
         B0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6xPz/soQ8Bh+a+cMmNaEsFe5xXinZcaKIEkXa1DRIJQ=;
        b=of06gOrBn8nIAQEqkmsHr4HmLhmXpt5cGGrAveowEIYd+7If2vXieeKutVaEi7WX1N
         kyQ0M4pim4ZTFY/I4zcXe5QNQ2Dg8Qgefi9inmkykPhyl3E6tre8q2rQZ89f+1GJxL2/
         d99+bYMa7B2oYLBeVREial8MzZRHOIzpyo84vCCXgWQhfxG3tvgXVpNxkJlKrCV0+LI8
         1gljM2KM6LudE3Mo+btk2z4t9dyJ87zv9ZDgAQi26tVYtokQYYm9d7wmHUlSujsIu29R
         Ka/2KJi5yZbCwSc2Sth7bM4qHKlimdEEj9mm84X5W96/RVV/FvbFBeABB+ocBOPtcML5
         SIcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533FLKToNoVLKbi84m/tgqNkP+r8+a22Gh+/T62HB23AC5qFxsXB
	Cm6oAFDDlJYzh1hvs+3ZMmU=
X-Google-Smtp-Source: ABdhPJwrfkAAdYTzJel+beV+TY1Igu4v5eVuxrqaE/klvcUjy1yDLav9lrDTeHxSLbVh0dd3Ot/Xkg==
X-Received: by 2002:a19:4a88:: with SMTP id x130mr1363153lfa.31.1599638982026;
        Wed, 09 Sep 2020 01:09:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:93:: with SMTP id 19ls422453ljq.4.gmail; Wed, 09
 Sep 2020 01:09:40 -0700 (PDT)
X-Received: by 2002:a2e:9ad4:: with SMTP id p20mr1278173ljj.456.1599638980055;
        Wed, 09 Sep 2020 01:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599638980; cv=none;
        d=google.com; s=arc-20160816;
        b=x+Tc0PIenf/LKHbw39Ww8UydhAffy/j0DNAHRq13lnwtuGwDyc28pMs/0NIeD9t3+1
         1U0VLlWx3KmqY8mWjRg93Hh2BcVNciummC/OcAY06wGJ/nG/BcY0qWkZkg5hbKc/K/12
         QcWi2LtAez+6Q2fP/J1KVXa68/aI3IH64vskUdEZeA2y3AFxN+0RD9801JpUtECrhJ3N
         vI9k7gfDKPK+lg2mI6vxMbfgPEs5lJKTKyIRVglsldKVQoLEmfiPcYaAyJ/nmoTRopCs
         Pzk73loX41xdn0WlMqLE2/ZZWV28M1maTWUg1PytHmYxcSA4MIvnj1j/8AG+na+iaqxJ
         8xoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=i4qTzWZY6w51jnfaJ4+1XJsIhaBK2I0+SWxTmrJk4Q8=;
        b=yEcE1Sb78vqjmiyR4iPyaR/X40wFMUQlDTgpWdB6/e+kTRJqyfSh3nClOYBZx8OR2x
         3136TBu759eA1/+86FAMJHW3+vayDiXgEZmHVBT5A0IbMak9d+11hM+ecQ4dvxNqeVDI
         5Bswm63tfM9iydv4+mqUxZ1BOL9aXIToTZeqfYK27lIdZmotPdauP6McGf6j1tHmFVjD
         hKupdJoJCgzw0GUx7zzPqO+rC6By9fVDFCOILa5P6ni11ssXZDo2tpKW8yksx/DL0DR1
         Wmqg+FCaHrHDpSGA6d+VWqEVy67cVE/C0jE79X0GQrj75YwT5hh21o3VgBRRK+tWXxjH
         1lNw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h22si58579ljh.7.2020.09.09.01.09.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2020 01:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 08989cHt015436
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 9 Sep 2020 10:09:39 +0200
Received: from [139.22.116.238] ([139.22.116.238])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08989crS008989
	for <jailhouse-dev@googlegroups.com>; Wed, 9 Sep 2020 10:09:38 +0200
Subject: [PATCH v3 1/8] kbuild: Avoid deprecated 'always'
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
References: <cover.1599473999.git.jan.kiszka@siemens.com>
 <e2b94aed34874271a9ede06bf4521b4f16ea8b86.1599473999.git.jan.kiszka@siemens.com>
 <8a7dcd47-23bb-b52d-f1a5-be3cc7464028@siemens.com>
Message-ID: <f7137421-2fe7-b274-d191-484d97ecbb91@siemens.com>
Date: Wed, 9 Sep 2020 10:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <8a7dcd47-23bb-b52d-f1a5-be3cc7464028@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Changes in v3:
 - move 'include $(ALWAYS_COMPAT_MK)' from
   inmates/lib/arm-common/Makefile.lib to {arm,arm64}/Makefile.lib -
   only the latter is consistently included

Wouldn't be surprised if I managed to leave a reason for v4 behind...

I think we should eventually migrate anything != driver to our own 
"kbuild" implementation.

 Kbuild                            |  3 +++
 configs/Makefile                  |  6 ++++--
 hypervisor/Makefile               |  6 ++++--
 hypervisor/arch/arm-common/Kbuild |  2 ++
 hypervisor/arch/arm/Kbuild        |  2 +-
 hypervisor/arch/arm64/Kbuild      |  2 +-
 hypervisor/arch/x86/Kbuild        |  4 +++-
 inmates/lib/arm/Makefile          |  2 +-
 inmates/lib/arm/Makefile.lib      |  4 +++-
 inmates/lib/arm64/Makefile        |  2 +-
 inmates/lib/arm64/Makefile.lib    |  4 +++-
 inmates/lib/x86/Makefile          |  2 +-
 inmates/lib/x86/Makefile.lib      |  4 +++-
 scripts/always-compat.mk          | 16 ++++++++++++++++
 tools/Makefile                    | 10 ++++++----
 15 files changed, 52 insertions(+), 17 deletions(-)
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
index 0976f894..2ea037cd 100644
--- a/inmates/lib/arm/Makefile.lib
+++ b/inmates/lib/arm/Makefile.lib
@@ -38,6 +38,8 @@
 # THE POSSIBILITY OF SUCH DAMAGE.
 #
 
+include $(ALWAYS_COMPAT_MK)
+
 -include $(GEN_CONFIG_MK)
 
 LINUXINCLUDE += -I$(INMATES_LIB)/include
@@ -45,7 +47,7 @@ LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
 
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
index 0976f894..2ea037cd 100644
--- a/inmates/lib/arm64/Makefile.lib
+++ b/inmates/lib/arm64/Makefile.lib
@@ -38,6 +38,8 @@
 # THE POSSIBILITY OF SUCH DAMAGE.
 #
 
+include $(ALWAYS_COMPAT_MK)
+
 -include $(GEN_CONFIG_MK)
 
 LINUXINCLUDE += -I$(INMATES_LIB)/include
@@ -45,7 +47,7 @@ LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
 
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
index 8b4ebf14..66e88fac 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -10,6 +10,8 @@
 # the COPYING file in the top-level directory.
 #
 
+include $(ALWAYS_COMPAT_MK)
+
 -include $(GEN_CONFIG_MK)
 
 # includes installation-related variables and definitions
@@ -33,14 +35,14 @@ KBUILD_CFLAGS += $(call cc-option, -fno-pie)
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
@@ -116,7 +118,7 @@ CFLAGS_jailhouse-gcov-extract.o	:= -I$(src)/../hypervisor/include \
 LDFLAGS_jailhouse-gcov-extract := -lgcov -fprofile-arcs
 
 targets += jailhouse-gcov-extract.o
-always += jailhouse-gcov-extract
+always-y += jailhouse-gcov-extract
 
 $(obj)/jailhouse-gcov-extract: $(obj)/jailhouse-gcov-extract.o
 	$(call if_changed,ld)
@@ -125,7 +127,7 @@ $(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f7137421-2fe7-b274-d191-484d97ecbb91%40siemens.com.
