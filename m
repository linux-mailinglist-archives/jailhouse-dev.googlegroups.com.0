Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNXZRXVQKGQEMRVQ3EA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FA39C972
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 08:31:19 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id u5sf2431681lfu.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Aug 2019 23:31:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566801078; cv=pass;
        d=google.com; s=arc-20160816;
        b=0lIRW6ShXwNZEo0j3LmAPAOaVurs78c8Tfwd4wa6cWUE/BkIYuNmf3y5k0lmOQWHmd
         PZz//7HreAfj7rMQnfnUeKARtiQVlzhD22QjAq7Vu9cgvBjO/9+jcLSfiZenM7zEeEOR
         e4QLHusL9a7zvxr3qW6aHGvIZEeosWF8V0Z4kLw8VWIBsHNTVowV2xnlr5fPby8Ky+wJ
         FJMGj0FCHftkwDoX1moFV2evkueDDMkWI2YeTvA64ZeG6TXO1XbZYKsK5Mtd8dRnOahs
         uKvNZmohMbUbb7UuE1JjRDHRmoPB/tZTND8/MTbUWULAA9A96cwRSp/PPCaPrybZm2CA
         kNTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=taofhJDQRGED8DgxsVPi8zkIARmQbfWD+f5SgIOoLQQ=;
        b=hCQQ6xiDnczfUJ/HPL5QxcfZF7iSCKC9Qu1OeCYvT4UnSRmgrhwdVEGQh4vnFY34s2
         4Bmlkbs/gXI2gGRIgyBAZZV1vIimQDBh5y8V1QhvhXS9W33PHU9yt3YXksxxkRd614vX
         itAVKVZ6ylyYGerW79bz3XM8lxItCKiAl6Yw5UwR9/RnVD954TGAN452+I4D4vkjwFrQ
         tkS5M5I1ANB0K0HhsioHcnz3v82T4KCsZ9hTb/b9WApxoPXl3oEWbr5s7TEaJFT66XVo
         vDBMJ1Cc68OyixuFZpZ+Kp510gBKJ6wkW6piBbQAi7zUyIX45CBAC3CBOujFqcWrUQGE
         v4Hw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=taofhJDQRGED8DgxsVPi8zkIARmQbfWD+f5SgIOoLQQ=;
        b=Il25MIqSoGaaV2ue/jE6+N02ZTlwhOQxXwkz2hHRQTgZE3rAzeOC16wPPm8zCvdebV
         il840towI2CRH8mZd1Hb5K+S53GnKfW99/fFjE4Lz8hM5JSv5VKliFXGkqxl6TaYisz1
         e5iGxFNeNUcyM5ZjTjXtqBM77lssCmg3/brbM3Kp6wHUt9dOuF+bVaWIjucbhQ5sqo9u
         bcWr2EnGex9sq8UgwPxO9ErWqPilX0DbpdZL+m2p+C47G8OILlJPT5cLkHz4giPbZjQ0
         eKikcTKeKwE3s2Rz+GGddYQamJBL80YH3+5lWT9Bcz6reSDMn6hqgmMQS31AA2T4Y5wf
         LESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=taofhJDQRGED8DgxsVPi8zkIARmQbfWD+f5SgIOoLQQ=;
        b=qubYng0J1y71Zn9L5bqc7HioT8M7Z+3uDi7xB166XnhoHkzzO5cq2KSHrhob6MUaMF
         F7SzLoQlN5GvQs6UdasjbH5/e5usRMvMN9Ep2Tmvsuj6H4K6itEX3yG58VxvQX+Brz8v
         FSU0yybQyaH/aIJV+ZkSy42LiQStDaudAYrgJOu4tnlhB8OIfDLULq/PhYwzwAa1IVYd
         FsghuUISrHF40RvOa3aFXNEQR+EuRuCykZyUPV2aJ5cTwLG8JxUzbM3nAGa4rWSRyd/L
         YBcUVCA4x9m9S6SHZY/yC3LVzHDByzAYaATJGOKECG1QdEZUodBe8W4iVNpOhd7FZDfi
         Ha3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0NZxG2NjrTMWYvLUsEQqnBYneuL5rJBeSe8WMYc0r0/ePICEE
	muv41RRcNb1bp0LJ6z+nd5E=
X-Google-Smtp-Source: APXvYqzXBAXYBHIHqiSMz7FTb9PxA8eUEHbWXCwXBEaIRdn/Yv+Xh7dMi7UsCW/wC58aKhjCUCr1IQ==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr9828572ljc.105.1566801078579;
        Sun, 25 Aug 2019 23:31:18 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:50c2:: with SMTP id h2ls1400671lfm.0.gmail; Sun, 25 Aug
 2019 23:31:17 -0700 (PDT)
X-Received: by 2002:a19:740e:: with SMTP id v14mr220786lfe.7.1566801077916;
        Sun, 25 Aug 2019 23:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566801077; cv=none;
        d=google.com; s=arc-20160816;
        b=LdjUiQckEe4i7m/EO6hU3HWEB1QCExm5EJ8e0IDFyN//94ZV6WWGFzxWn3yu04vQEE
         09zUBvQlddHxg3lPHaoDciTbtufkS6vRU176WRLcnGvxD89ZS5ZM/OZMDQyx7/CnT/PO
         TmkOsruoKOGMIbiPCRNaz0gI+dP+lnu65wRyoKPuQgrSA5mQznl8bJbw9Ijceywush8h
         tLQKKv1+dQdbxc1GB2mG8EfEcz2lJ1IsIXNYD58hTTlhWanOCwHZJHO9b7QX+BmE6TC1
         SlY/zwulnbLdRI7ZbsChi0FAa16pBD8EUY6ZCBuVQib+R9ykfYB4t0VbxBpoFnvwmZ+k
         Cwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=zI9LY7/odOZK4IKI5/I2z9+7Yf5xcixkt5Gae5oNwu8=;
        b=KJaod4wtUauoeY6EtCQtjL/cEoJL3LfGtZXwsz6uIHxRtnqr+78ZAqLf+9V37fgJy7
         fLU22z7gaWjfL/z18GX5SY9bfL0YhhjPu2oJ/jz1vU+4lSW4F6/JhLOuT4SRaCe/uKUC
         650WPAU2ZRYbSgKDixixoq5zDMO3fbhL2eQDhljs6pLbQPqvpJZL5XGA8uL8Qe/SPQBb
         DpsQpUATks3LB0/QSRtn0vW1jAVCWdH5hhBeaZ2m2noLaUqRQc26TGClzvmBHbtiO8Tj
         QB7hoCCpThRfRRz2ONwG+PmMmPPmGFr5CiQ5im4V9RlVUrtwS02FNDgbXNv9+GyrY16Z
         L0Rw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id b8si462785lfp.3.2019.08.25.23.31.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Aug 2019 23:31:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x7Q6VHJQ027007
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Aug 2019 08:31:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.35.99])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7Q6VGMw024227
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Aug 2019 08:31:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 1/2] jailhouse: Account for new PIO regions in configs
Date: Mon, 26 Aug 2019 08:31:15 +0200
Message-Id: <46c084dd09d5b9a5e5cdb36c51f56fdebf038f31.1566801076.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1566801076.git.jan.kiszka@siemens.com>
References: <cover.1566801076.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1566801076.git.jan.kiszka@siemens.com>
References: <cover.1566801076.git.jan.kiszka@siemens.com>
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

Fork the NUC6CAY configs, provided one set for 0.11 compatibility and
changing the other to use jailhouse_pio instead of the PIO bitmap.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../jailhouse/files/linux-nuc6cay-demo.c           |  6 ------
 ...ux-nuc6cay-demo.c => linux-nuc6cay-demo_0.11.c} |  0
 recipes-jailhouse/jailhouse/files/nuc6cay.c        | 24 ++++++++--------------
 .../jailhouse/files/{nuc6cay.c => nuc6cay_0.11.c}  |  0
 recipes-jailhouse/jailhouse/jailhouse.inc          |  7 +------
 recipes-jailhouse/jailhouse/jailhouse_0.11.bb      |  9 ++++++++
 recipes-jailhouse/jailhouse/jailhouse_latest.bb    |  9 ++++++++
 7 files changed, 28 insertions(+), 27 deletions(-)
 copy recipes-jailhouse/jailhouse/files/{linux-nuc6cay-demo.c => linux-nuc6cay-demo_0.11.c} (100%)
 copy recipes-jailhouse/jailhouse/files/{nuc6cay.c => nuc6cay_0.11.c} (100%)

diff --git a/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c b/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c
index f4e0f65..5211f2f 100644
--- a/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c
+++ b/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c
@@ -21,7 +21,6 @@ struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[4];
-	__u8 pio_bitmap[0x2000];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -33,7 +32,6 @@ struct {
 
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 	},
 
@@ -73,10 +71,6 @@ struct {
 		},
 	},
 
-	.pio_bitmap = {
-		[     0/8 ... 0xffff/8] = -1,
-	},
-
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
diff --git a/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c b/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo_0.11.c
similarity index 100%
copy from recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c
copy to recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo_0.11.c
diff --git a/recipes-jailhouse/jailhouse/files/nuc6cay.c b/recipes-jailhouse/jailhouse/files/nuc6cay.c
index 31191bb..5b3b84e 100644
--- a/recipes-jailhouse/jailhouse/files/nuc6cay.c
+++ b/recipes-jailhouse/jailhouse/files/nuc6cay.c
@@ -43,7 +43,7 @@ struct {
 	__u64 cpus[1];
 	struct jailhouse_memory mem_regions[54];
 	struct jailhouse_irqchip irqchips[1];
-	__u8 pio_bitmap[0x2000];
+	struct jailhouse_pio pio_regions[6];
 	struct jailhouse_pci_device pci_devices[21];
 	struct jailhouse_pci_capability pci_caps[53];
 } __attribute__((packed)) config = {
@@ -85,7 +85,7 @@ struct {
 			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
-			.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
+			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
 		},
@@ -502,19 +502,13 @@ struct {
 		},
 	},
 
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
+	.pio_regions = {
+		PIO_RANGE(0x40, 0x4), /* PIT */
+		PIO_RANGE(0x60, 0x2), /* HACK: NMI status/control */
+		PIO_RANGE(0x70, 0x2), /* RTC */
+		PIO_RANGE(0x3b0, 0x8), /* VGA */
+		PIO_RANGE(0x400, 0x80), /* HACK: ACPI */
+		PIO_RANGE(0xd00, 0xf300), /* PCI devices */
 	},
 
 	.pci_devices = {
diff --git a/recipes-jailhouse/jailhouse/files/nuc6cay.c b/recipes-jailhouse/jailhouse/files/nuc6cay_0.11.c
similarity index 100%
copy from recipes-jailhouse/jailhouse/files/nuc6cay.c
copy to recipes-jailhouse/jailhouse/files/nuc6cay_0.11.c
diff --git a/recipes-jailhouse/jailhouse/jailhouse.inc b/recipes-jailhouse/jailhouse/jailhouse.inc
index 642c199..539e9d6 100644
--- a/recipes-jailhouse/jailhouse/jailhouse.inc
+++ b/recipes-jailhouse/jailhouse/jailhouse.inc
@@ -17,9 +17,7 @@ LICENSE = "GPL-2.0 & BSD-2-clause"
 
 SRC_URI = " \
     git://github.com/siemens/jailhouse;branch=next \
-    file://debian/ \
-    file://nuc6cay.c \
-    file://linux-nuc6cay-demo.c"
+    file://debian/"
 
 S = "${WORKDIR}/git"
 
@@ -36,9 +34,6 @@ do_prepare_build() {
     mv ${S}/debian/jailhouse.install ${S}/debian/jailhouse-${KERNEL_NAME}.install
     sed -e 's/@PV@/${PV}/g' -e 's/@KERNEL_NAME@/${KERNEL_NAME}/g' \
         -i ${S}/debian/changelog ${S}/debian/control
-
-    cp ${WORKDIR}/nuc6cay.c ${S}/configs/x86/
-    cp ${WORKDIR}/linux-nuc6cay-demo.c ${S}/configs/x86/
 }
 
 dpkg_runbuild_prepend() {
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.11.bb b/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
index 38a35ce..4d7aca1 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.11.bb
@@ -11,4 +11,13 @@
 
 require jailhouse.inc
 
+SRC_URI += " \
+    file://nuc6cay_0.11.c \
+    file://linux-nuc6cay-demo_0.11.c"
+
 SRCREV = "58052a7a9d1f5904d72b1637282c877172ee69f6"
+
+do_prepare_build_append() {
+    cp ${WORKDIR}/nuc6cay_0.11.c ${S}/configs/x86/nuc6cay.c
+    cp ${WORKDIR}/linux-nuc6cay-demo_0.11.c ${S}/configs/x86/linux-nuc6cay-demo.c
+}
diff --git a/recipes-jailhouse/jailhouse/jailhouse_latest.bb b/recipes-jailhouse/jailhouse/jailhouse_latest.bb
index 6e0a476..184a522 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_latest.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_latest.bb
@@ -11,9 +11,18 @@
 
 require jailhouse.inc
 
+SRC_URI += " \
+    file://nuc6cay.c \
+    file://linux-nuc6cay-demo.c"
+
 SRCREV = "next"
 PV = "0.9999-next"
 
+do_prepare_build_append() {
+    cp ${WORKDIR}/nuc6cay.c ${S}/configs/x86/
+    cp ${WORKDIR}/linux-nuc6cay-demo.c ${S}/configs/x86/
+}
+
 dpkg_runbuild_prepend() {
     bbplain $(printf "jailhouse-latest: Building revision %.12s\n" \
                      $(cat ${S}/.git/refs/heads/next))
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/46c084dd09d5b9a5e5cdb36c51f56fdebf038f31.1566801076.git.jan.kiszka%40siemens.com.
