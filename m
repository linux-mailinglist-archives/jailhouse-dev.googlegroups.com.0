Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBB5I3L5AKGQEBT2BK7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id A72BE260567
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 22:11:52 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id a81sf1826764lfd.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 13:11:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599509512; cv=pass;
        d=google.com; s=arc-20160816;
        b=I39ZjEvvHJ7yVaMRUFvMwUNerxnZel+fPCT2rNnJieISIvJT8A2bqqdkkE13WBPTHI
         /elYBiALsa1aHUkqkc/nUybhCAlRLFTDJKk2HGiLEawR65nAy3fmsZoMeHe3yRSMGMbr
         Fzk7xj1E0+0LEATH+uX7UZ3HM4MIf3RruDxJxC7U5ngUkVMS+LwdOqIiONoJJw7bknXw
         9xi4US0kMTHO9YWS3f2YC7nP27ZBw4uD23I1EmA9mnjPzlCfyl9dwOXipGKgvBxbRZuJ
         mKSEhjeTd5x8VAXpmGDDn0rF5Fzb0FKMbnyt2WIwDFmozI8epeUeSg/o7b/u5k5ezqBL
         g75g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=YdszKtPZNGrkHL0lgWYFuYFg7ppLk4CplzOmSRbCSwM=;
        b=C5y+oTPp0Px/T1+fBqUst6WH/AdQILpwsb6Ja4h9AzyEKFvmzXnONmgM5y6Jj8y/+G
         QW20BC7PJ62qskaeFrHrPS3x97Ei2l4tGv4uZZ1iaWpzx4ZHIhoplkh11ZAX1bCeREPu
         lOqrh1lzWzUoUGzy8i8ZmgiWP4PFR0Z3JECLMBJ3qVbvyc9Bz5+8tCLLJctcXTLVc32n
         Airp0FZNFulF+TnH7DLHWv4XNH2RMBbHFkBDg/BQbtrxE+PDdIB6saFN5RKjrOrJDJZH
         FJz/fkbZBBMX1q6GyrpaG7dTJUtZ8kQ7GiaiWTnwo5O4nCpa89QOOOGa3WLsT3IZRkx0
         QZpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YdszKtPZNGrkHL0lgWYFuYFg7ppLk4CplzOmSRbCSwM=;
        b=jvOiRnaul+AHrb8rSb5+a7PwlJmk+leH8tBpeknT6jdkwNo83b/2Fp+TcggPT5Kv52
         RW7HfOdTDx4AbOFlzmVU5h/iEejtXwKFe9oikhNTFOTGngBlYlBfGhALbhIkfkuEdZCu
         G4ZGalIA7v7ZA9WfZn+TWMa68HmSHrNR4IsKqO7KNSWgXodJ0m/ai+qukezcNDCVg14D
         Ulf+5NMCyURNvJK38kjiaJrulSASDyPAsFsR/Pxah/1h6RyoYnjdfHwczw/aZ5L54cMy
         Aw/ipJFe4EJnb81ggO5eBTMZy8li7rmWHTOXLdITH9ipfNrcLuCrrSe94DjTBWBZUFo8
         cJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=YdszKtPZNGrkHL0lgWYFuYFg7ppLk4CplzOmSRbCSwM=;
        b=BEAfZCamYEKfyxEXLIscUaWmNJOvq3NAY3x3dX5CTHVCyG3v0azNf5tfEMkDKSTii/
         BfJnDsU34+eWgzWoHm6+0Hb6CYwnN1oMKp2EJr1noSh9rJTaZbFVtPLQKAPxJg8bfPPW
         bsLaAEYt9X4jT2ilx7QJpFcgi/+j6lck/NlSOa9zzMa+UnyOIVB95qmZlGwfWNLJHy40
         dJz1Ztg7kLlEQ+25DEpva184zGKnb51Xe5IrYUX+Q9TJkEHjC5QAVO4i2B6fHEH5QxGA
         WXGOTouHkg6YgZX2RoSlbRGUyMWE58MH97VZdR12I21MFeVvVnk8QltgGIIxuj7hLJmO
         KUPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53219TxiwSaXD76NugUMp1fVjBFukldoQ0tAvAKL2t6yw0VJWHYx
	bb/KfkjTFtBzXG3qDwwm+1w=
X-Google-Smtp-Source: ABdhPJx1YvS8xRvpQz71LEATElQrt/splB/60Jzul9u7dju2C1FyZxenjmkPp1EzJiLcRMXvD7FSnQ==
X-Received: by 2002:a2e:9854:: with SMTP id e20mr2186429ljj.152.1599509512204;
        Mon, 07 Sep 2020 13:11:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:555:: with SMTP id q21ls768670ljp.3.gmail; Mon, 07
 Sep 2020 13:11:51 -0700 (PDT)
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr11291438lji.378.1599509511121;
        Mon, 07 Sep 2020 13:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599509511; cv=none;
        d=google.com; s=arc-20160816;
        b=WN+j56tmUU5epFLc5xs3Wnfta5cl6SbBPVt0MIhH9278z8brBDlvF9inrnYRZDpAZ/
         rcbRo6wZUrQFKXPJUKZ5U7q1mSbqrfTxPsQojAIpX2T8KVOJYax/ji9WwJGOU3CYmaw5
         HoGkHoRGVDu+ZDXbEHcNHpev3fkLtw/uQzpRpcxydZrakBXNDpsDyQkNkOhwag8+fYeb
         bUP5yrPWROX/4oEHfm7LyOZ1N+VLUkNgHPNdPeUr9yozBE0WyT+fi6w8XkcHDkTagrnL
         VQSyB/As+TUkaMg+zostkF7HBJ3elcLttk+bEyZOYEfvY7NqP99J2rnAbjJi9S9QRUDr
         QuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=W2XxIcVMpWl9reRyzf1aEQcyN19X445i2H1BfQECiRE=;
        b=YzitDdLSSHpd7TQ5sTqHk002HAdcfRt4Mr9PEm9Ew3pECFYKqZ7MwCUKnSvl8DNrmE
         oJuTblR6MXcxZep7Fmbap12BdZ+R5rGBpL1emjiqYYIUj5Vsr3wLZQOrA7bsTcEusWAy
         BeTp9WusEQ1Vw3VgQmBYfRn3VIs4XJr67R67dIodkgnCw03TNTo6pzN/Wbf3Z2mo1cdE
         WZ0/O4FSScLfG8/FnKhMFUmjIhJhI21TuqRa6p5XkIbPiOD7wNuAYVqA0iB0zn+5oqxy
         YqZtZ5smhymA14Ls1W4SZPLgFcJH55qRjNB6oiqboAG882c4AIl1LVi0rpf3LV83E+Jl
         h/lw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y75si621133lfa.3.2020.09.07.13.11.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 13:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 087KBoH0016875
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 22:11:50 +0200
Received: from [167.87.17.27] ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087KBnfp030022
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 22:11:49 +0200
Subject: [PATCH v2 1/8] kbuild: Avoid deprecated 'always'
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
References: <cover.1599473999.git.jan.kiszka@siemens.com>
 <e2b94aed34874271a9ede06bf4521b4f16ea8b86.1599473999.git.jan.kiszka@siemens.com>
Message-ID: <8a7dcd47-23bb-b52d-f1a5-be3cc7464028@siemens.com>
Date: Mon, 7 Sep 2020 22:11:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e2b94aed34874271a9ede06bf4521b4f16ea8b86.1599473999.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Changes in v2:
 - 'include $(ALWAYS_COMPAT_MK)' was missing in tools/Makefile

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
 tools/Makefile                      | 10 ++++++----
 16 files changed, 50 insertions(+), 17 deletions(-)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8a7dcd47-23bb-b52d-f1a5-be3cc7464028%40siemens.com.
