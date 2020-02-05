Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVMG5LYQKGQEDV64SYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7E31527D1
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Feb 2020 09:56:53 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id l1sf860334wrt.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Feb 2020 00:56:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580893013; cv=pass;
        d=google.com; s=arc-20160816;
        b=KomDNnYRgmHEti899S5jefsRMtu00UlwtRhqNJp/c7LQJTmHJ0VzPhX9KVtwXcCOoZ
         FMm2bGWvEQD+VC71q8Q1JQqMTs/vdSo/9yjJgdiwnWxUAPHV7HzuQ9cSgpeZZMhGUKyZ
         hzy8OalHdrNLnvNIHupXELoQZIG52jwl/Gishk6mnFHACvlYq7ZjN+Bt9zov882VippJ
         +qj7yxKU9iKwVg+vSFdYaUHfccmJmqh0XnNyVn4ekl/ZtLGpwJlTxrB1XIZtF2BYSS5j
         6wP2wApBtyRf+UBSNZDRvGUpbu+Kb/wYMWRUsHimXHcqQb3LBH8kf9HNP1DOcnkTzu+o
         eBsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=kVCrRlZhciniyZcIylmibkU+zq4mvCkb9xvbJPg+cQQ=;
        b=xLNHr9RrAx6zpnlvwCqbyQdTL4Or3zAOqJFHTRfcNOLQycCncHpZJe4lnLfN5tMFKd
         +lZhNUjzrX6kUj5NAhQXxKlHDZtIW5fcznhh602xDW9o+EycVOfQMoxWtAWc/OEfe5EE
         2+cfpoSVLqtdHpH6J0hqBUVM6VxeqgFgTHPSdf8h+kw+RHPr2XydBtfj0H8KcX7aBVmq
         43GiSMKBGqbkydahReyOUHNJpL1e6dnCiTVjFQmRvioIJ7tUowp+UivrTcp9VG2mVdBW
         iwF66fzUR6NjiOwnl3cwQVDpDW/HIwQBLwWPQ3QY4iiMwXPz1eJzv0VuyFiNs6tOtVjR
         kOBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kVCrRlZhciniyZcIylmibkU+zq4mvCkb9xvbJPg+cQQ=;
        b=Ao7lrK71KGINQkhWogcp7C/PvV4GHEFVb2OMw5Rr9t1MOrVd2GZl14Wv9N71FEjnYX
         58voK51vjRkFQzxRiTsZJz2r6zGiz2ejBXERLu9+Wa535aNEzVqzHmn8rhngtMK8QxaL
         FGGEIWOkqPJepWMv/AaQnGEvQBCZK6fIHqohPGb50yUdQFPGWcto5nvcTMy+/bijHKGS
         kOMyVS/dZFh9cICpqg+TN9XIFc4VRWedd7w86s6r+Q2xPaRQ9Sf+1Agx/ubcHLMP+LL/
         iZqBrQ7qmSQS8lFkrWd7p27X4+C6GpXxa6zher3AHN7nGUsV3qFuIqHmZ9EheZw6TQp5
         /W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kVCrRlZhciniyZcIylmibkU+zq4mvCkb9xvbJPg+cQQ=;
        b=LfcF7z8qqDLJOhx4m0DXWjZU1xhIzEnp6r0lC8mA1gxcYGeJI2ZiaCnTxo8Pt2zgo8
         ovieHclatUZ/zCG0Jxsgi3J3T20AXz0rpmWsyYe0RggBAX0UXG1zEr7HeOmVw8TP2KZu
         Xe2rCjcDAEG3aC1RK063/afHBNmHgqRZpi5wWgVmzCVLIyZvQbpUWkY/B4uxs109dgwb
         Ixg0qJiZ/PDFBrmzv84XQyGcmnjMk5d2Pq6eUQJsQJMbt7BbMvZXd7xTrzIZW9q7qFpl
         ysVI7bCvc/gREJjZzaXtHKh0q6zpDVS7L5SPNl+y5cK0Dv1Hq2SFOb+duxm0UTbdZYF0
         iHJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUmvqVJVNMA9ZnMRqT6JQkkJarQcCJl52uvit5/TInN3SiGQCK8
	R+OUZa0TC17NwV7IUERf+d8=
X-Google-Smtp-Source: APXvYqzw4qOA/4c2bXd2kail6JqTKtEiqFPSlq0mmXhH7h5YhNOTawSr3r/LfM9uKambPQlYMsT4bA==
X-Received: by 2002:a5d:638f:: with SMTP id p15mr26577328wru.402.1580893013546;
        Wed, 05 Feb 2020 00:56:53 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fdc5:: with SMTP id i5ls502844wrs.9.gmail; Wed, 05 Feb
 2020 00:56:52 -0800 (PST)
X-Received: by 2002:adf:f802:: with SMTP id s2mr29211518wrp.201.1580893012694;
        Wed, 05 Feb 2020 00:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580893012; cv=none;
        d=google.com; s=arc-20160816;
        b=pm7ns2LOeTlvEu+uwb3o6UR7xtAszwRUhUh6thNefzUVFCf2lHSuiJP4VXUo/42Cha
         c7A3XGlI115/QFyIUfKYwNqR6vGghEp8t8SnrajoamDVgGm+byr+8xtZrCaBnlIp/pzk
         f+CDWCh9u8zUoR4hwhbb4MsKm6K12AEEEVHaN71HffJKdu7hmrT8qIbEUVauxT6HbFP4
         A1LABK6qJIh/za2LvhzyEquuDFkj6mnpNcMbwZ9pUff7yaO9HY87tT7m2CyqdOpZVjPA
         kZw9f4/Dzm7uGs3pRPEN9+Egh8mk/qcdcBrAYXF0dxzKXgx6peLjFoSpE7oLH60YlnLr
         /4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=VD4ckj/V3gL7qjKFMWOPiwQxUk5tSANQ0losP4tXAn4=;
        b=xeH98G+F1+17ywfxzpdL1UxGo2ls+GwX0/f0bOQGlDGjNy7kCPWIksradi7HB38+X0
         DVGyQ9hBlnX0YApq8XAhmge+i3HKDb6sk9hPylrgIPLLeVMy5q+RWf7PpF/s4IvSbFUe
         avXXsDU3Sss7sK7FK+NQa0ZEdPAx04OSkYqcMaurbtG/KZkor9FSCu/tUC2wNqe0+73z
         qKaNQNy9P11D8YZNnjm9SeqIVwkFm/nFdF2GSuqYytoNkwi7XDq0SLeN2pVsLie2GEjI
         8lEWimjFAU0OA13QXM1L6JhLLR5ja9q71osTRlQpOVg46vScnaWzQH1yXpwBX9yaIdbP
         72FA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id e21si351072wme.1.2020.02.05.00.56.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 00:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0158uqpk013026
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:52 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.54.219])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 0158up0l006156
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:52 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 1/7] jailhouse: Update to 0.12
Date: Wed,  5 Feb 2020 09:56:45 +0100
Message-Id: <a9a205e1c03da61fda9e6a2f362229414ab85ff8.1580893010.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

We have a new stable version, switch to it as default. As usual, this
allows to drop merged patches, and we can also remove the deviating
NUC6CAY configs for 0.11.

Unfortunately, 0.12 had a regression in some configs that affects
supported targets. So we need to add a new patch from the beginning.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf                    |    2 +-
 .../files/0001-arm-Fix-build-with-gcc-8.patch      |   56 -
 ...-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch |  170 +++
 ...1-x86-Permit-root-cell-to-enable-CR4.UMIP.patch |   28 -
 ...ic-Rework-and-fix-redir-entry-programming.patch |  115 --
 .../jailhouse/files/linux-nuc6cay-demo_0.11.c      |   94 --
 recipes-jailhouse/jailhouse/files/nuc6cay_0.11.c   | 1234 --------------------
 recipes-jailhouse/jailhouse/jailhouse.inc          |    9 +-
 recipes-jailhouse/jailhouse/jailhouse_0.11.bb      |   26 -
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb      |   16 +
 recipes-jailhouse/jailhouse/jailhouse_latest.bb    |   11 +-
 11 files changed, 195 insertions(+), 1566 deletions(-)
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-arm-Fix-build-with-gcc-8.patch
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-arm-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo_0.11.c
 delete mode 100644 recipes-jailhouse/jailhouse/files/nuc6cay_0.11.c
 delete mode 100644 recipes-jailhouse/jailhouse/jailhouse_0.11.bb
 create mode 100644 recipes-jailhouse/jailhouse/jailhouse_0.12.bb

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index 8ed65a8..887871d 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -15,7 +15,7 @@ KERNEL_NAME ?= "jailhouse"
 
 WKS_FILE = "${MACHINE}.wks"
 
-PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.9999-next"
+PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.12"
 
 USERS += "root"
 # 'root'
diff --git a/recipes-jailhouse/jailhouse/files/0001-arm-Fix-build-with-gcc-8.patch b/recipes-jailhouse/jailhouse/files/0001-arm-Fix-build-with-gcc-8.patch
deleted file mode 100644
index ade9989..0000000
--- a/recipes-jailhouse/jailhouse/files/0001-arm-Fix-build-with-gcc-8.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 9f233898917f8c1141132606f2f2c624405d8c81 Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Sat, 13 Jul 2019 12:08:40 +0200
-Subject: [PATCH] arm: Fix build with gcc-8
-
-The inline .arch_extension statements are ignored by gcc-8. We rather
-need -march=armv7ve now.
-
-To keep older gcc prior to version 5 happy, leave the inline statements
-in place. Can be removed once we require newer gcc for other reasons.
-
-Reported-by: Vitaly Andrianov <vitalya@ti.com>
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
----
- hypervisor/arch/arm/Makefile              | 2 +-
- hypervisor/arch/arm/include/asm/smc.h     | 1 +
- hypervisor/arch/arm/include/asm/sysregs.h | 1 +
- 3 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/hypervisor/arch/arm/Makefile b/hypervisor/arch/arm/Makefile
-index 2f930cf3..a170b593 100644
---- a/hypervisor/arch/arm/Makefile
-+++ b/hypervisor/arch/arm/Makefile
-@@ -12,4 +12,4 @@
- 
- LINUXINCLUDE += -I$(src)/arch/arm-common/include
- 
--KBUILD_CFLAGS += -marm
-+KBUILD_CFLAGS += -marm -march=armv7ve
-diff --git a/hypervisor/arch/arm/include/asm/smc.h b/hypervisor/arch/arm/include/asm/smc.h
-index 34944a2d..5cde3d8b 100644
---- a/hypervisor/arch/arm/include/asm/smc.h
-+++ b/hypervisor/arch/arm/include/asm/smc.h
-@@ -10,6 +10,7 @@
-  * the COPYING file in the top-level directory.
-  */
- 
-+/* for gcc < 5 */
- asm (".arch_extension sec\n");
- 
- static inline int smc(unsigned long id)
-diff --git a/hypervisor/arch/arm/include/asm/sysregs.h b/hypervisor/arch/arm/include/asm/sysregs.h
-index 76dd5b55..b7eaccf6 100644
---- a/hypervisor/arch/arm/include/asm/sysregs.h
-+++ b/hypervisor/arch/arm/include/asm/sysregs.h
-@@ -283,6 +283,7 @@
- #define arm_read_sysreg(...) _arm_read_sysreg(__VA_ARGS__)
- 
- #ifndef __ASSEMBLY__
-+/* for gcc < 5 */
- asm(".arch_extension virt\n");
- 
- #define arm_write_sysreg_32(op1, crn, crm, op2, val) \
--- 
-2.16.4
-
diff --git a/recipes-jailhouse/jailhouse/files/0001-configs-arm-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch b/recipes-jailhouse/jailhouse/files/0001-configs-arm-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch
new file mode 100644
index 0000000..2a3d8fc
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0001-configs-arm-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch
@@ -0,0 +1,170 @@
+From 7e538dd94667a1426c4a694f8bd9c6071ac41b88 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Wed, 5 Feb 2020 07:37:08 +0100
+Subject: [PATCH] configs: arm/arm64: Fix vPCI IRQ assignment of Linux configs
+
+By moving the ivshmem devices for virtual network one slot up, we also
+changed their IRQs. Adjust the irqchip configs accordingly.
+
+Fixes: 68b8ff84ae8d ("configs/arm/bananapi-linux-demo.c")
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ configs/arm/bananapi-linux-demo.c          | 2 +-
+ configs/arm/jetson-tk1-linux-demo.c        | 2 +-
+ configs/arm64/espressobin-linux-demo.c     | 2 +-
+ configs/arm64/hikey-linux-demo.c           | 2 +-
+ configs/arm64/jetson-tx1-linux-demo.c      | 2 +-
+ configs/arm64/k3-am654-idk-linux-demo.c    | 2 +-
+ configs/arm64/k3-j721e-evm-linux-demo.c    | 2 +-
+ configs/arm64/macchiatobin-linux-demo.c    | 2 +-
+ configs/arm64/ultra96-linux-demo.c         | 2 +-
+ configs/arm64/zynqmp-zcu102-linux-demo-2.c | 2 +-
+ configs/arm64/zynqmp-zcu102-linux-demo.c   | 2 +-
+ 11 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
+index 43c7ef36..9819091e 100644
+--- a/configs/arm/bananapi-linux-demo.c
++++ b/configs/arm/bananapi-linux-demo.c
+@@ -96,7 +96,7 @@ struct {
+ 			.address = 0x01c81000,
+ 			.pin_base = 32,
+ 			.pin_bitmap = {
+-				1 << (52-32), 0, 0, 1 << (155-128),
++				1 << (52-32), 0, 0, 1 << (156-128),
+ 			},
+ 		},
+ 	},
+diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
+index 13a7c00e..52e11c1e 100644
+--- a/configs/arm/jetson-tk1-linux-demo.c
++++ b/configs/arm/jetson-tk1-linux-demo.c
+@@ -99,7 +99,7 @@ struct {
+ 			.address = 0x50041000,
+ 			.pin_base = 160,
+ 			.pin_bitmap = {
+-				1 << (152+32 - 160),
++				1 << (153+32 - 160),
+ 			},
+ 		},
+ 	},
+diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
+index e94bc63f..c326b6d5 100644
+--- a/configs/arm64/espressobin-linux-demo.c
++++ b/configs/arm64/espressobin-linux-demo.c
+@@ -89,7 +89,7 @@ struct {
+ 				(1 << (43 - 32)) | (1 << (44 - 32)) | (1 << (45 - 32)),
+ 				0,
+ 				0,
+-				(1 << (140 - 128))
++				(1 << (141 - 128))
+ 			},
+ 		},
+ 	},
+diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
+index aefc429d..cb6e101c 100644
+--- a/configs/arm64/hikey-linux-demo.c
++++ b/configs/arm64/hikey-linux-demo.c
+@@ -86,7 +86,7 @@ struct {
+ 			.address = 0xf6801000,
+ 			.pin_base = 32,
+ 			.pin_bitmap = {
+-				0, 1 << (71 - 64), 0, 1 << (143 - 128)
++				0, 1 << (71 - 64), 0, 1 << (144 - 128)
+ 			},
+ 		},
+ 	},
+diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
+index a14f865b..c5f2d811 100644
+--- a/configs/arm64/jetson-tx1-linux-demo.c
++++ b/configs/arm64/jetson-tx1-linux-demo.c
+@@ -103,7 +103,7 @@ struct {
+ 			.address = 0x50041000,
+ 			.pin_base = 160,
+ 			.pin_bitmap = {
+-				1 << (152+32 - 160),
++				1 << (153+32 - 160),
+ 			},
+ 		},
+ 	},
+diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
+index 02bd2b18..d03fd4cd 100644
+--- a/configs/arm64/k3-am654-idk-linux-demo.c
++++ b/configs/arm64/k3-am654-idk-linux-demo.c
+@@ -120,7 +120,7 @@ struct {
+ 			.address = 0x01800000,
+ 			.pin_base = 160,
+ 			.pin_bitmap = {
+-			1 << (189 - 160), 0x0, 0x00, 0,
++			1 << (190 - 160), 0x0, 0x00, 0,
+ 			},
+ 		},
+ 		{
+diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
+index 9a853e9a..f494b0cb 100644
+--- a/configs/arm64/k3-j721e-evm-linux-demo.c
++++ b/configs/arm64/k3-j721e-evm-linux-demo.c
+@@ -259,7 +259,7 @@ struct {
+ 	},
+ 
+ 	.pci_devices = {
+-		/* 00:00.0 */ {
++		/* 00:01.0 */ {
+ 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+ 			.bdf = 1 << 3,
+ 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
+index f7675e8a..ad29bbd5 100644
+--- a/configs/arm64/macchiatobin-linux-demo.c
++++ b/configs/arm64/macchiatobin-linux-demo.c
+@@ -96,7 +96,7 @@ struct {
+ 			.pin_bitmap = {
+ 				(1 << (51 - 32)),
+ 				0,
+-				(1 << (112 - 96)),
++				(1 << (113 - 96)),
+ 				0
+ 			},
+ 		},
+diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
+index 7054f5f0..102fa754 100644
+--- a/configs/arm64/ultra96-linux-demo.c
++++ b/configs/arm64/ultra96-linux-demo.c
+@@ -89,7 +89,7 @@ struct {
+ 				1 << (54 - 32),
+ 				0,
+ 				0,
+-				(1 << (140 - 128)) | (1 << (142 - 128))
++				(1 << (141 - 128)) | (1 << (142 - 128))
+ 			},
+ 		},
+ 	},
+diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+index 4fbd46a8..76ed8064 100644
+--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
++++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+@@ -85,7 +85,7 @@ struct {
+ 				0,
+ 				0,
+ 				0,
+-				(1 << (145 - 128)) | (1 << (146 - 128))
++				(1 << (146 - 128)) | (1 << (147 - 128))
+ 			},
+ 		},
+ 	},
+diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
+index c944fa56..32e38089 100644
+--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
++++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
+@@ -91,7 +91,7 @@ struct {
+ 				1 << (54 - 32),
+ 				0,
+ 				0,
+-				(1 << (140 - 128)) | (1 << (142 - 128))
++				(1 << (141 - 128)) | (1 << (143 - 128))
+ 			},
+ 		},
+ 	},
+-- 
+2.16.4
+
diff --git a/recipes-jailhouse/jailhouse/files/0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch b/recipes-jailhouse/jailhouse/files/0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch
deleted file mode 100644
index faa3ff6..0000000
--- a/recipes-jailhouse/jailhouse/files/0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6820b515e9a71f5490a36d2a5041e21ab4ea1e4b Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Sun, 3 Nov 2019 11:44:24 +0100
-Subject: [PATCH] x86: Permit root cell to enable CR4.UMIP
-
-This is safe from hypervisor perspective.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
----
- hypervisor/arch/x86/include/asm/processor.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hypervisor/arch/x86/include/asm/processor.h b/hypervisor/arch/x86/include/asm/processor.h
-index d8111690..d22a60d7 100644
---- a/hypervisor/arch/x86/include/asm/processor.h
-+++ b/hypervisor/arch/x86/include/asm/processor.h
-@@ -66,7 +66,7 @@
- #define X86_CR4_VMXE					(1UL << 13)
- #define X86_CR4_OSXSAVE					(1UL << 18)
- #define X86_CR4_RESERVED				\
--	(BIT_MASK(31, 23) | (1UL << 19) | (1UL << 15) | BIT_MASK(12, 11))
-+	(BIT_MASK(31, 23) | (1UL << 19) | (1UL << 15) | (1UL << 12))
- 
- #define X86_XCR0_FP					0x00000001
- 
--- 
-2.16.4
-
diff --git a/recipes-jailhouse/jailhouse/files/0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch b/recipes-jailhouse/jailhouse/files/0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch
deleted file mode 100644
index e286e0b..0000000
--- a/recipes-jailhouse/jailhouse/files/0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From bac03e4d5f5479933f1f5d0fbbc3f7aa6c4a0570 Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Mon, 4 Nov 2019 09:10:13 +0100
-Subject: [PATCH] x86: ioapic: Rework and fix redir entry programming
-
-Currently, EOI of level-triggered IOAPIC interrupts may not work while
-the related entry is masked - at least with QEMU as machine and
-PREEMPT-RT as root cell. This is because we always overwrite trigger
-mode and vector information when masking an entry.
-
-Let's use that issue to rethink the programming pattern. The new one
-works by still avoiding to map while masked but writing the entry with
-an invalid remapping index. Furthermore, a redirection entry is only
-updated in the IOAPIC on writes to the lower 32 bits. This is to ensure
-its consistency. Writing higher bits happens first, either out of masked
-state or with the identical value.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
----
- hypervisor/arch/x86/ioapic.c | 69 +++++++++++++++++++++++---------------------
- 1 file changed, 36 insertions(+), 33 deletions(-)
-
-diff --git a/hypervisor/arch/x86/ioapic.c b/hypervisor/arch/x86/ioapic.c
-index ee3b77f3..7b243097 100644
---- a/hypervisor/arch/x86/ioapic.c
-+++ b/hypervisor/arch/x86/ioapic.c
-@@ -114,49 +114,52 @@ static int ioapic_virt_redir_write(struct cell_ioapic *ioapic,
- 	struct phys_ioapic *phys_ioapic = ioapic->phys_ioapic;
- 	struct apic_irq_message irq_msg;
- 	union ioapic_redir_entry entry;
--	int result;
-+	int result = 0xffff;
- 
- 	entry = phys_ioapic->shadow_redir_table[pin];
- 	entry.raw[reg & 1] = value;
- 	phys_ioapic->shadow_redir_table[pin] = entry;
- 
--	/* Do not map the interrupt while masked. */
--	if (entry.native.mask) {
--		/*
--		 * The mask is part of the lower 32 bits. Apply it when that
--		 * register half is written.
--		 */
--		if ((reg & 1) == 0)
--			ioapic_reg_write(phys_ioapic, reg, IOAPIC_REDIR_MASK);
--		return 0;
--	}
--
--	irq_msg = ioapic_translate_redir_entry(ioapic, pin, entry);
--
--	result = iommu_map_interrupt(ioapic->cell, (u16)ioapic->info->id, pin,
--				     irq_msg);
--	// HACK for QEMU
--	if (result == -ENOSYS) {
--		/* see regular update below, lazy version */
--		ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
--		ioapic_reg_write(phys_ioapic, reg, entry.raw[reg & 1]);
--		return 0;
-+	/*
-+	 * Do not map the interrupt while masked. It may contain invalid state.
-+	 * Rather write the invalid index 0xffff. That will not be used anyway
-+	 * while the mask is set.
-+	 */
-+	if (!entry.native.mask) {
-+		irq_msg = ioapic_translate_redir_entry(ioapic, pin, entry);
-+
-+		result = iommu_map_interrupt(ioapic->cell,
-+					     (u16)ioapic->info->id, pin,
-+					     irq_msg);
-+		// HACK for QEMU
-+		if (result == -ENOSYS) {
-+			/* see regular update below, lazy version */
-+			ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
-+			ioapic_reg_write(phys_ioapic, reg, entry.raw[reg & 1]);
-+			return 0;
-+		}
-+		if (result < 0)
-+			return result;
- 	}
--	if (result < 0)
--		return result;
--
--	entry.remap.zero = 0;
--	entry.remap.int_index15 = result >> 15;
--	entry.remap.remapped = 1;
--	entry.remap.int_index = result;
- 
- 	/*
--	 * Upper 32 bits weren't written physically if the entry was masked so
--	 * far. Write them unconditionally when setting the lower bits.
-+	 * Write all 64 bits on updates of the lower 32 bits to ensure the
-+	 * consistency of an entry.
-+	 *
-+	 * The index information in the higher bits does not change when the
-+	 * guest programs an entry, but they need to be initialized when taking
-+	 * their ownership (always out of masked state, see
-+	 * ioapic_prepare_handover).
- 	 */
--	if ((reg & 1) == 0)
-+	if ((reg & 1) == 0) {
-+		entry.remap.zero = 0;
-+		entry.remap.int_index15 = result >> 15;
-+		entry.remap.remapped = 1;
-+		entry.remap.int_index = result;
-+
- 		ioapic_reg_write(phys_ioapic, reg | 1, entry.raw[1]);
--	ioapic_reg_write(phys_ioapic, reg, entry.raw[reg & 1]);
-+		ioapic_reg_write(phys_ioapic, reg, entry.raw[0]);
-+	}
- 
- 	return 0;
- }
--- 
-2.16.4
-
diff --git a/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo_0.11.c b/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo_0.11.c
deleted file mode 100644
index f4e0f65..0000000
--- a/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo_0.11.c
+++ /dev/null
@@ -1,94 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Configuration for Linux inmate, 2 CPUs, 74 MB RAM, ~1MB shmem, serial ports
- *
- * Copyright (c) Siemens AG, 2013-2018
- *
- * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-
-#include <jailhouse/types.h>
-#include <jailhouse/cell-config.h>
-
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
-struct {
-	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[4];
-	__u8 pio_bitmap[0x2000];
-	struct jailhouse_pci_device pci_devices[1];
-} __attribute__((packed)) config = {
-	.cell = {
-		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "linux-nuc6cay-demo",
-		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
-			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
-
-		.cpu_set_size = sizeof(config.cpus),
-		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
-		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-	},
-
-	.cpus = {
-		0xc,
-	},
-
-	.mem_regions = {
-		/* low RAM */ {
-			.phys_start = 0x3a600000,
-			.virt_start = 0,
-			.size = 0x00100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
-				JAILHOUSE_MEM_LOADABLE,
-		},
-		/* communication region */ {
-			.virt_start = 0x00100000,
-			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
-		},
-		/* high RAM */ {
-			.phys_start = 0x3a700000,
-			.virt_start = 0x00200000,
-			.size = 0x4a00000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
-				JAILHOUSE_MEM_LOADABLE,
-		},
-		/* IVSHMEM shared memory region */
-		{
-			.phys_start = 0x3f100000,
-			.virt_start = 0x3f100000,
-			.size = 0xff000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
-	},
-
-	.pio_bitmap = {
-		[     0/8 ... 0xffff/8] = -1,
-	},
-
-	.pci_devices = {
-		{
-			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0x0,
-			.bdf = 0x10 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0xffffffff,
-			},
-			.num_msix_vectors = 1,
-			.shmem_region = 3,
-			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-		},
-	},
-};
diff --git a/recipes-jailhouse/jailhouse/files/nuc6cay_0.11.c b/recipes-jailhouse/jailhouse/files/nuc6cay_0.11.c
deleted file mode 100644
index 31191bb..0000000
--- a/recipes-jailhouse/jailhouse/files/nuc6cay_0.11.c
+++ /dev/null
@@ -1,1234 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Copyright (c) Siemens AG, 2014-2017
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- *
- * Alternatively, you can use or redistribute this file under the following
- * BSD license:
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- *
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
- * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
- * THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-#include <jailhouse/types.h>
-#include <jailhouse/cell-config.h>
-
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
-
-struct {
-	struct jailhouse_system header;
-	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[54];
-	struct jailhouse_irqchip irqchips[1];
-	__u8 pio_bitmap[0x2000];
-	struct jailhouse_pci_device pci_devices[21];
-	struct jailhouse_pci_capability pci_caps[53];
-} __attribute__((packed)) config = {
-	.header = {
-		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
-		.revision = JAILHOUSE_CONFIG_REVISION,
-		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
-		.hypervisor_memory = {
-			.phys_start = 0x3a000000,
-			.size = 0x600000,
-		},
-		.debug_console = {
-			.address = 0x80000000,
-			.size = 0x7f0000,
-			.type = JAILHOUSE_CON_TYPE_EFIFB,
-			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-				JAILHOUSE_CON_FB_1920x1080,
-		},
-		.platform_info = {
-			.pci_mmconfig_base = 0xe0000000,
-			.pci_mmconfig_end_bus = 0xff,
-			.x86 = {
-				.pm_timer_address = 0x408,
-				.vtd_interrupt_limit = 256,
-				.iommu_units = {
-					{
-						.base = 0xfed64000,
-						.size = 0x1000,
-					},
-					{
-						.base = 0xfed65000,
-						.size = 0x1000,
-					},
-				},
-			},
-		},
-		.root_cell = {
-			.name = "NUC6CAY",
-			.cpu_set_size = sizeof(config.cpus),
-			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-			.num_irqchips = ARRAY_SIZE(config.irqchips),
-			.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
-		},
-	},
-
-	.cpus = {
-		0xf,
-	},
-
-	.mem_regions = {
-		/* MemRegion: 00000000-0003efff : System RAM */
-		{
-			.phys_start = 0x0,
-			.virt_start = 0x0,
-			.size = 0x3f000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 00040000-0009dfff : System RAM */
-		{
-			.phys_start = 0x40000,
-			.virt_start = 0x40000,
-			.size = 0x5e000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 000f0000-0fffffff : System RAM */
-		{
-			.phys_start = 0xf0000,
-			.virt_start = 0xf0000,
-			.size = 0xff10000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 12151000-39ffffff : System RAM */
-		{
-			.phys_start = 0x12151000,
-			.virt_start = 0x12151000,
-			.size = 0x27eaf000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 3e200000-77709fff : System RAM */
-		{
-			.phys_start = 0x3e200000,
-			.virt_start = 0x3e200000,
-			.size = 0x3950a000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 7982d000-79847fff : ACPI Tables */
-		{
-			.phys_start = 0x7982d000,
-			.virt_start = 0x7982d000,
-			.size = 0x1b000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 79848000-798a7fff : ACPI Non-volatile Storage */
-		{
-			.phys_start = 0x79848000,
-			.virt_start = 0x79848000,
-			.size = 0x60000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 798a8000-79bd1fff : reserved but used */
-		{
-			.phys_start = 0x798a8000,
-			.virt_start = 0x798a8000,
-			.size = 0x32a000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 79bd2000-79c36fff : Unknown E820 type */
-		{
-			.phys_start = 0x79bd2000,
-			.virt_start = 0x79bd2000,
-			.size = 0x65000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 79c37000-79fb9fff : System RAM */
-		{
-			.phys_start = 0x79c37000,
-			.virt_start = 0x79c37000,
-			.size = 0x383000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 79fba000-79fbafff : ACPI Non-volatile Storage */
-		{
-			.phys_start = 0x79fba000,
-			.virt_start = 0x79fba000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 79fe5000-7a9defff : System RAM */
-		{
-			.phys_start = 0x79fe5000,
-			.virt_start = 0x79fe5000,
-			.size = 0x9fa000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 7a9e1000-7affffff : System RAM */
-		{
-			.phys_start = 0x7a9e1000,
-			.virt_start = 0x7a9e1000,
-			.size = 0x61f000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 80000000-8fffffff : 0000:00:02.0 */
-		{
-			.phys_start = 0x80000000,
-			.virt_start = 0x80000000,
-			.size = 0x10000000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 90000000-90ffffff : 0000:00:02.0 */
-		{
-			.phys_start = 0x90000000,
-			.virt_start = 0x90000000,
-			.size = 0x1000000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91000000-910fffff : ICH HD audio */
-		{
-			.phys_start = 0x91000000,
-			.virt_start = 0x91000000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91101000-91103fff : r8169 */
-		{
-			.phys_start = 0x91101000,
-			.virt_start = 0x91101000,
-			.size = 0x3000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91104000-91104fff : r8169 */
-		{
-			.phys_start = 0x91104000,
-			.virt_start = 0x91104000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91200000-91201fff : 0000:02:00.0 */
-		{
-			.phys_start = 0x91200000,
-			.virt_start = 0x91200000,
-			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91300000-91300fff : rtsx_pci */
-		{
-			.phys_start = 0x91300000,
-			.virt_start = 0x91300000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91400000-9140ffff : xhci-hcd */
-		{
-			.phys_start = 0x91400000,
-			.virt_start = 0x91400000,
-			.size = 0x10000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91410000-91413fff : ICH HD audio */
-		{
-			.phys_start = 0x91410000,
-			.virt_start = 0x91410000,
-			.size = 0x4000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91414000-91415fff : ahci */
-		{
-			.phys_start = 0x91414000,
-			.virt_start = 0x91414000,
-			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91416000-914160ff : 0000:00:1f.1 */
-		{
-			.phys_start = 0x91416000,
-			.virt_start = 0x91416000,
-			.size = 0x100,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91417000-91417fff : 0000:00:1a.0 */
-		{
-			.phys_start = 0x91417000,
-			.virt_start = 0x91417000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91418000-91418fff : 0000:00:1a.0 */
-		{
-			.phys_start = 0x91418000,
-			.virt_start = 0x91418000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91419000-91419fff : 0000:00:19.2 */
-		{
-			.phys_start = 0x91419000,
-			.virt_start = 0x91419000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 9141a000-9141afff : lpss_dev, lpss_priv, idma64.4 */
-		{
-			.phys_start = 0x9141a000,
-			.virt_start = 0x9141a000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 9141b000-9141bfff : 0000:00:19.1 */
-		{
-			.phys_start = 0x9141b000,
-			.virt_start = 0x9141b000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 9141c000-9141cfff : lpss_dev, lpss_priv, idma64.3 */
-		{
-			.phys_start = 0x9141c000,
-			.virt_start = 0x9141c000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 9141d000-9141dfff : 0000:00:19.0 */
-		{
-			.phys_start = 0x9141d000,
-			.virt_start = 0x9141d000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 9141e000-9141efff : lpss_dev, lpss_priv, idma64.2 */
-		{
-			.phys_start = 0x9141e000,
-			.virt_start = 0x9141e000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 9141f000-9141ffff : 0000:00:18.0 */
-		{
-			.phys_start = 0x9141f000,
-			.virt_start = 0x9141f000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91420000-91420fff : serial, lpss_priv, idma64.1 */
-		{
-			.phys_start = 0x91420000,
-			.virt_start = 0x91420000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91421000-91421fff : 0000:00:16.0 */
-		{
-			.phys_start = 0x91421000,
-			.virt_start = 0x91421000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91422000-91422fff : lpss_dev, lpss_priv, idma64.0 */
-		{
-			.phys_start = 0x91422000,
-			.virt_start = 0x91422000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91423000-914237ff : ahci */
-		{
-			.phys_start = 0x91423000,
-			.virt_start = 0x91423000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91424000-914240ff : ahci */
-		{
-			.phys_start = 0x91424000,
-			.virt_start = 0x91424000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 91427000-91427fff : mei_me */
-		{
-			.phys_start = 0x91427000,
-			.virt_start = 0x91427000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: fea00000-feafffff : pnp 00:03 */
-		{
-			.phys_start = 0xfea00000,
-			.virt_start = 0xfea00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
-		{
-			.phys_start = 0xfed00000,
-			.virt_start = 0xfed00000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: fed03000-fed03fff : pnp 00:03 */
-		{
-			.phys_start = 0xfed03000,
-			.virt_start = 0xfed03000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: fed06000-fed06fff : pnp 00:03 */
-		{
-			.phys_start = 0xfed06000,
-			.virt_start = 0xfed06000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: fed08000-fed09fff : pnp 00:03 */
-		{
-			.phys_start = 0xfed08000,
-			.virt_start = 0xfed08000,
-			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: fed1c000-fed1cfff : pnp 00:03 */
-		{
-			.phys_start = 0xfed1c000,
-			.virt_start = 0xfed1c000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: fed40000-fed44fff : MSFT0101:00 */
-		{
-			.phys_start = 0xfed40000,
-			.virt_start = 0xfed40000,
-			.size = 0x5000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: fed80000-fedbffff : pnp 00:03 */
-		{
-			.phys_start = 0xfed80000,
-			.virt_start = 0xfed80000,
-			.size = 0x40000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* MemRegion: 100000000-127dfffff : System RAM */
-		{
-			.phys_start = 0x100000000,
-			.virt_start = 0x100000000,
-			.size = 0x27e00000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 127e00000-129ffffff : Kernel */
-		{
-			.phys_start = 0x127e00000,
-			.virt_start = 0x127e00000,
-			.size = 0x2200000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 12a000000-27fffffff : System RAM */
-		{
-			.phys_start = 0x12a000000,
-			.virt_start = 0x12a000000,
-			.size = 0x156000000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 797c8000-797e7fff : ACPI DMAR RMRR */
-		/* PCI device: 00:15.0 */
-		{
-			.phys_start = 0x797c8000,
-			.virt_start = 0x797c8000,
-			.size = 0x20000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 7b800000-7fffffff : ACPI DMAR RMRR */
-		/* PCI device: 00:02.0 */
-		{
-			.phys_start = 0x7b800000,
-			.virt_start = 0x7b800000,
-			.size = 0x4800000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
-		},
-		/* MemRegion: 3a600000-3f0fffff : JAILHOUSE Inmate Memory */
-		{
-			.phys_start = 0x3a600000,
-			.virt_start = 0x3a600000,
-			.size = 0x4b00000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* IVSHMEM shared memory region */
-		{
-			.phys_start = 0x3f100000,
-			.virt_start = 0x3f100000,
-			.size = 0xff000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-	},
-
-	.irqchips = {
-		/* IOAPIC 1, GSI base 0 */
-		{
-			.address = 0xfec00000,
-			.id = 0x1faf8,
-			.pin_bitmap = {
-				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
-			},
-		},
-	},
-
-	.pio_bitmap = {
-		[     0/8 ...   0x3f/8] = -1,
-		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
-		[  0x48/8 ...   0x5f/8] = -1,
-		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI status/control */
-		[  0x68/8 ...   0x6f/8] = -1,
-		[  0x70/8 ...   0x77/8] = 0xfc, /* RTC */
-		[  0x78/8 ...  0x3af/8] = -1,
-		[ 0x3b0/8 ...  0x3df/8] = 0x00, /* VGA */
-		[ 0x3e0/8 ...  0x3ff/8] = -1,
-		[ 0x400/8 ...  0x47f/8] = 0, /* HACK: ACPI */
-		[ 0x480/8 ...  0xcff/8] = -1,
-		[ 0xd00/8 ... 0xffff/8] = 0, /* HACK: PCI bus */
-	},
-
-	.pci_devices = {
-		/* PCIDevice: 00:00.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x0,
-			.bar_mask = {
-				0x00000000, 0x00000000, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
-			.caps_start = 0,
-			.num_caps = 0,
-			.num_msi_vectors = 0,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:02.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 0,
-			.domain = 0x0,
-			.bdf = 0x10,
-			.bar_mask = {
-				0xff000000, 0xffffffff, 0xf0000000,
-				0xffffffff, 0xffffffc0, 0x00000000,
-			},
-			.caps_start = 0,
-			.num_caps = 7,
-			.num_msi_vectors = 1,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:0e.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x70,
-			.bar_mask = {
-				0xffffc000, 0xffffffff, 0x00000000,
-				0x00000000, 0xfff00000, 0xffffffff,
-			},
-			.caps_start = 7,
-			.num_caps = 5,
-			.num_msi_vectors = 1,
-			.msi_64bits = 1,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:0f.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x78,
-			.bar_mask = {
-				0xfffff000, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
-			.caps_start = 12,
-			.num_caps = 3,
-			.num_msi_vectors = 1,
-			.msi_64bits = 1,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:12.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x90,
-			.bar_mask = {
-				0xffffe000, 0xffffff00, 0xfffffff8,
-				0xfffffffc, 0xffffffe0, 0xfffff800,
-			},
-			.caps_start = 15,
-			.num_caps = 3,
-			.num_msi_vectors = 1,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:13.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x98,
-			.bar_mask = {
-				0x00000000, 0x00000000, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
-			.caps_start = 18,
-			.num_caps = 9,
-			.num_msi_vectors = 1,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:13.1 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x99,
-			.bar_mask = {
-				0x00000000, 0x00000000, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
-			.caps_start = 18,
-			.num_caps = 9,
-			.num_msi_vectors = 1,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:13.2 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x9a,
-			.bar_mask = {
-				0x00000000, 0x00000000, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
-			.caps_start = 18,
-			.num_caps = 9,
-			.num_msi_vectors = 1,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:15.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0xa8,
-			.bar_mask = {
-				0xffff0000, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
-			.caps_start = 27,
-			.num_caps = 3,
-			.num_msi_vectors = 8,
-			.msi_64bits = 1,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:16.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0xb0,
-			.bar_mask = {
-				0xfffff000, 0xffffffff, 0xfffff000,
-				0xffffffff, 0x00000000, 0x00000000,
-			},
-			.caps_start = 30,
-			.num_caps = 2,
-			.num_msi_vectors = 0,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:18.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0xc0,
-			.bar_mask = {
-				0xfffff000, 0xffffffff, 0xfffff000,
-				0xffffffff, 0x00000000, 0x00000000,
-			},
-			.caps_start = 30,
-			.num_caps = 2,
-			.num_msi_vectors = 0,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:19.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0xc8,
-			.bar_mask = {
-				0xfffff000, 0xffffffff, 0xfffff000,
-				0xffffffff, 0x00000000, 0x00000000,
-			},
-			.caps_start = 30,
-			.num_caps = 2,
-			.num_msi_vectors = 0,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:19.1 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0xc9,
-			.bar_mask = {
-				0xfffff000, 0xffffffff, 0xfffff000,
-				0xffffffff, 0x00000000, 0x00000000,
-			},
-			.caps_start = 30,
-			.num_caps = 2,
-			.num_msi_vectors = 0,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:19.2 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0xca,
-			.bar_mask = {
-				0xfffff000, 0xffffffff, 0xfffff000,
-				0xffffffff, 0x00000000, 0x00000000,
-			},
-			.caps_start = 30,
-			.num_caps = 2,
-			.num_msi_vectors = 0,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:1a.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0xd0,
-			.bar_mask = {
-				0xfffff000, 0xffffffff, 0xfffff000,
-				0xffffffff, 0x00000000, 0x00000000,
-			},
-			.caps_start = 30,
-			.num_caps = 2,
-			.num_msi_vectors = 0,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:1f.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0xf8,
-			.bar_mask = {
-				0x00000000, 0x00000000, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
-			.caps_start = 0,
-			.num_caps = 0,
-			.num_msi_vectors = 0,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 00:1f.1 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0xf9,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0x00000000,
-			},
-			.caps_start = 0,
-			.num_caps = 0,
-			.num_msi_vectors = 0,
-			.msi_64bits = 0,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 01:00.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x100,
-			.bar_mask = {
-				0xfffff000, 0x00000000, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
-			.caps_start = 32,
-			.num_caps = 5,
-			.num_msi_vectors = 1,
-			.msi_64bits = 1,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 02:00.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x200,
-			.bar_mask = {
-				0xffffe000, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
-			.caps_start = 37,
-			.num_caps = 7,
-			.num_msi_vectors = 1,
-			.msi_64bits = 1,
-			.num_msix_vectors = 0,
-			.msix_region_size = 0x0,
-			.msix_address = 0x0,
-		},
-		/* PCIDevice: 03:00.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_DEVICE,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x300,
-			.bar_mask = {
-				0xffffff00, 0x00000000, 0xfffff000,
-				0xffffffff, 0xffffc000, 0xffffffff,
-			},
-			.caps_start = 44,
-			.num_caps = 9,
-			.num_msi_vectors = 1,
-			.msi_64bits = 1,
-			.num_msix_vectors = 4,
-			.msix_region_size = 0x1000,
-			.msix_address = 0x91100000,
-		},
-		/* IVSHMEM: 00:10.0 */
-		{
-			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.iommu = 1,
-			.domain = 0x0,
-			.bdf = 0x10 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0xffffffff,
-			},
-			.num_msix_vectors = 1,
-			.shmem_region = 53,
-			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-		},
-	},
-
-	.pci_caps = {
-		/* PCIDevice: 00:02.0 */
-		{
-			.id = 0x9,
-			.start = 0x40,
-			.len = 2,
-			.flags = 0,
-		},
-		{
-			.id = 0x10,
-			.start = 0x70,
-			.len = 60,
-			.flags = 0,
-		},
-		{
-			.id = 0x5,
-			.start = 0xac,
-			.len = 10,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x1,
-			.start = 0xd0,
-			.len = 8,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x1b | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x100,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0xf | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x200,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x13 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x300,
-			.len = 4,
-			.flags = 0,
-		},
-		/* PCIDevice: 00:0e.0 */
-		{
-			.id = 0x1,
-			.start = 0x50,
-			.len = 8,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x9,
-			.start = 0x80,
-			.len = 2,
-			.flags = 0,
-		},
-		{
-			.id = 0x5,
-			.start = 0x60,
-			.len = 14,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x10,
-			.start = 0x70,
-			.len = 20,
-			.flags = 0,
-		},
-		{
-			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x100,
-			.len = 4,
-			.flags = 0,
-		},
-		/* PCIDevice: 00:0f.0 */
-		{
-			.id = 0x1,
-			.start = 0x50,
-			.len = 8,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x5,
-			.start = 0x8c,
-			.len = 14,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x9,
-			.start = 0xa4,
-			.len = 2,
-			.flags = 0,
-		},
-		/* PCIDevice: 00:12.0 */
-		{
-			.id = 0x5,
-			.start = 0x80,
-			.len = 10,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x1,
-			.start = 0x70,
-			.len = 8,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x12,
-			.start = 0xa8,
-			.len = 2,
-			.flags = 0,
-		},
-		/* PCIDevice: 00:13.0 */
-		/* PCIDevice: 00:13.1 */
-		/* PCIDevice: 00:13.2 */
-		{
-			.id = 0x10,
-			.start = 0x40,
-			.len = 60,
-			.flags = 0,
-		},
-		{
-			.id = 0x5,
-			.start = 0x80,
-			.len = 10,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0xd,
-			.start = 0x90,
-			.len = 2,
-			.flags = 0,
-		},
-		{
-			.id = 0x1,
-			.start = 0xa0,
-			.len = 8,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x100,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0xd | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x140,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x150,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x1e | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x200,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x220,
-			.len = 4,
-			.flags = 0,
-		},
-		/* PCIDevice: 00:15.0 */
-		{
-			.id = 0x1,
-			.start = 0x70,
-			.len = 8,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x5,
-			.start = 0x80,
-			.len = 14,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x9,
-			.start = 0x90,
-			.len = 2,
-			.flags = 0,
-		},
-		/* PCIDevice: 00:16.0 */
-		/* PCIDevice: 00:18.0 */
-		/* PCIDevice: 00:19.0 */
-		/* PCIDevice: 00:19.1 */
-		/* PCIDevice: 00:19.2 */
-		/* PCIDevice: 00:1a.0 */
-		{
-			.id = 0x1,
-			.start = 0x80,
-			.len = 8,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x9,
-			.start = 0x90,
-			.len = 2,
-			.flags = 0,
-		},
-		/* PCIDevice: 01:00.0 */
-		{
-			.id = 0x1,
-			.start = 0x40,
-			.len = 8,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x5,
-			.start = 0x50,
-			.len = 14,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x10,
-			.start = 0x70,
-			.len = 60,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x100,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x140,
-			.len = 4,
-			.flags = 0,
-		},
-		/* PCIDevice: 02:00.0 */
-		{
-			.id = 0x1,
-			.start = 0xc8,
-			.len = 8,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x5,
-			.start = 0xd0,
-			.len = 14,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x10,
-			.start = 0x40,
-			.len = 60,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x100,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x140,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x18 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x14c,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x1e | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x154,
-			.len = 4,
-			.flags = 0,
-		},
-		/* PCIDevice: 03:00.0 */
-		{
-			.id = 0x1,
-			.start = 0x40,
-			.len = 8,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x5,
-			.start = 0x50,
-			.len = 14,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x10,
-			.start = 0x70,
-			.len = 60,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x11,
-			.start = 0xb0,
-			.len = 12,
-			.flags = JAILHOUSE_PCICAPS_WRITE,
-		},
-		{
-			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x100,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x2 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x140,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x160,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x18 | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x170,
-			.len = 4,
-			.flags = 0,
-		},
-		{
-			.id = 0x1e | JAILHOUSE_PCI_EXT_CAP,
-			.start = 0x178,
-			.len = 4,
-			.flags = 0,
-		},
-	},
-};
diff --git a/recipes-jailhouse/jailhouse/jailhouse.inc b/recipes-jailhouse/jailhouse/jailhouse.inc
index cedd9c2..772f2e3 100644
--- a/recipes-jailhouse/jailhouse/jailhouse.inc
+++ b/recipes-jailhouse/jailhouse/jailhouse.inc
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018
+# Copyright (c) Siemens AG, 2018-2020
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,9 @@ LICENSE = "GPL-2.0 & BSD-2-clause"
 
 SRC_URI = " \
     git://github.com/siemens/jailhouse;branch=next \
-    file://debian/"
+    file://debian/ \
+    file://nuc6cay.c \
+    file://linux-nuc6cay-demo.c"
 
 TEMPLATE_FILES = "debian/control.tmpl"
 TEMPLATE_VARS += "KERNEL_NAME"
@@ -36,6 +38,9 @@ do_prepare_build() {
         echo "configs{,/*}/dts/*.dtb etc/jailhouse/dts" >> ${S}/debian/jailhouse.install
     fi
     mv ${S}/debian/jailhouse.install ${S}/debian/jailhouse-${KERNEL_NAME}.install
+
+    cp ${WORKDIR}/nuc6cay.c ${S}/configs/x86/
+    cp ${WORKDIR}/linux-nuc6cay-demo.c ${S}/configs/x86/
 }
 
 dpkg_runbuild_prepend() {
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.11.bb b/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
deleted file mode 100644
index 999ede7..0000000
--- a/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018-2019
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-require jailhouse.inc
-
-SRC_URI += " \
-    file://nuc6cay_0.11.c \
-    file://linux-nuc6cay-demo_0.11.c \
-    file://0001-arm-Fix-build-with-gcc-8.patch \
-    file://0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch \
-    file://0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch"
-
-SRCREV = "58052a7a9d1f5904d72b1637282c877172ee69f6"
-
-do_prepare_build_append() {
-    cp ${WORKDIR}/nuc6cay_0.11.c ${S}/configs/x86/nuc6cay.c
-    cp ${WORKDIR}/linux-nuc6cay-demo_0.11.c ${S}/configs/x86/linux-nuc6cay-demo.c
-}
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
new file mode 100644
index 0000000..12cee5a
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
@@ -0,0 +1,16 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2018-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require jailhouse.inc
+
+SRC_URI += "file://0001-configs-arm-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch"
+
+SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
diff --git a/recipes-jailhouse/jailhouse/jailhouse_latest.bb b/recipes-jailhouse/jailhouse/jailhouse_latest.bb
index 184a522..143fa0e 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_latest.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_latest.bb
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018
+# Copyright (c) Siemens AG, 2018-2020
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -11,18 +11,9 @@
 
 require jailhouse.inc
 
-SRC_URI += " \
-    file://nuc6cay.c \
-    file://linux-nuc6cay-demo.c"
-
 SRCREV = "next"
 PV = "0.9999-next"
 
-do_prepare_build_append() {
-    cp ${WORKDIR}/nuc6cay.c ${S}/configs/x86/
-    cp ${WORKDIR}/linux-nuc6cay-demo.c ${S}/configs/x86/
-}
-
 dpkg_runbuild_prepend() {
     bbplain $(printf "jailhouse-latest: Building revision %.12s\n" \
                      $(cat ${S}/.git/refs/heads/next))
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a9a205e1c03da61fda9e6a2f362229414ab85ff8.1580893010.git.jan.kiszka%40siemens.com.
