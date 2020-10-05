Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7D5L5QKGQE4NMQOXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 55800283029
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:56 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id g6sf3561752wrv.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876396; cv=pass;
        d=google.com; s=arc-20160816;
        b=MULYh7h/d8nmmAeV9hzKkRGWcKsOAjPJvpVXNBhJaFZKVrVI7il0xTIXZsW1cR64mV
         NJDG5dSNkj+aqJ09UUHEr/31SO8m637/+ZIHJl8qDZPRD4wEDu6PBUdPMiRX8nRzLFN2
         1+Avr8di332HCRCHBWQt514CbacOlP5MNLaae3a6U1p8I/1O9p0eXdsydjLZb9IvjHJO
         2td3sRAkdvE2c8doR9RG/PeIdpGDLQrOnG42HdNoUT1ewFsON2mxbTnQ8Vr4Lm8wVNbz
         rYMs/RVYed2Y++4K3WoNtZlIrnYdSfOt9An9NszW2Dqka/lXx1GcvMF65xfvBNwH/2Is
         kWgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=sBaq7pC4uclHs+NI/JbHG3ThwkUYmsT9HLJ/S6c1ywY=;
        b=aIFpXHA3MA5uhmwhV36KGkmQ1jmfX0sBkB0hrR+uFXttrfnP8Auk4zK5ptIcJaolZs
         LIFP4bN8FB9mBeF0YpbJHVWVT6/MQ4tnnxhYPAXhhemP3Tvj2cMg9hcLRsP7f2cY6fNb
         AOXCr+QgZHWBFNclkZC3m3VLRLI95sUsRl133T5KAvjz0FzNyEk8o5AMNxxm3xYb2Qld
         SeSAGrpZA6OkfcBZAZ2AQ3yTZdpyW5w2q4rWai4pXl4bUPmMI9OlWzCsPKXKsUETnhlH
         6jmSa3rwtKGs3gqIEceUiNsWuW6AokAR7mgeSucbf57/JiXdSpYUK5zHU+L0E2lY4Wor
         sSAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sBaq7pC4uclHs+NI/JbHG3ThwkUYmsT9HLJ/S6c1ywY=;
        b=QEWQhvFj40CIGZAe/q3WdEbhiYV+EKPRWCXdH8Ck8V2BK1BHfXXKWaR37ZSSMYsQ0x
         Bi8TXyjHOJN/FGKAghoQf+Jp5xWPY6DRPH5vHGO4HEwYlWmJdPmuWCM8H3N+thoc9xPK
         f6rHLB8BSF+KzYJdyzip0+LaDkReNiHWVUPJUcywqEpukbtgUWyVV5JormsIMvurRc9k
         jOMoakf/e+0SSnHqs2j5V64IyXXJLMHqTTXwtsU0/ijJnlqAJtmB3PKAx+zRdO2oCLRV
         xXwSJi2Pny1/GBtPuzwQSFR0SIGmCh1ckbYaueDQRVHtwz3R06FKf0SElaZbk7ZXlem5
         qb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sBaq7pC4uclHs+NI/JbHG3ThwkUYmsT9HLJ/S6c1ywY=;
        b=Me/iB6z6jmAPI4EkHgp0HqFnk9OBjFTY+j67jIBGzMEcKvYIVQLl5xAL74U4KJNuZZ
         obumZiGK3T8R9PnW8U0n5gyCG3m6MRcC7hYivJGCxe6unHGUJw0aQtO+sjURhpn/yux4
         tryHauRMaS9zp+CKjlk2y1SaM19rJ8Z83oYrAvkuwp26sHB0dAzYMRREgWfbW1Ma4jLS
         SvrZWa89dIlQ80LabQnrNUchWFm8bH8Ubfz63BVVRHqnLH9tuiRP7RhT1Lth2+ZQy8uO
         kvAlweB0c4gp7mF8byWvGmVDigb3kZFlQb6jBVPfCPT7obkj//8jHKkcqpKJVjSD1uZr
         /weg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531mUsKobnXAtCqgQR7YybB5minn/W0A8G3EbgjJKHS98CYpY7Hq
	Y33PbGbfK3Qgg3CJLXLrZ6Q=
X-Google-Smtp-Source: ABdhPJx+hFt9Xh+8oj2nDqLLVTuqQwo+L8Doo0hdQgiEs/7GlKfEQoBy6KJe6Co2/mV4qbVk7BgxUg==
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr15567805wmz.114.1601876396071;
        Sun, 04 Oct 2020 22:39:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:80cf:: with SMTP id b198ls1909943wmd.0.gmail; Sun, 04
 Oct 2020 22:39:55 -0700 (PDT)
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr15212940wmb.143.1601876395021;
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876395; cv=none;
        d=google.com; s=arc-20160816;
        b=ikWbVnok3BfaI20iQluI7nrFK6Efw8RGfR2trtKQHHt6NHR5KaYGkYwz5XDotnb76r
         u1esN7Xlaz7I6Sa6teU8tDFrnSsUic7Mu0VFCBYtyI9v71BNoPT6GlLIW4IbQvTEXsuG
         aesmQptWo6Ht7qB1RMXmGuHJGUa9bvRxZZYanJxdyBltlumPpVjGFGbYm2cnk7LxytIX
         JrhAWFvQZRvURA1qIIO46u53ofOv+PNVTjZrXJ5xMVHPpIn0o3nIegAGYOn2CKBmf+RW
         HXaDeBGCAUxDprW47FtyELMjkh5giZxxkCt+KUt71TBWyxNeo9h4ykYbccyrxWPD1/mP
         Pt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Kg5n/JzfGL0Ol1reHIhj1XDxnBNWBZ0gI3lBD+YBkEE=;
        b=z9gBTBx5lITAJq2q3cRsKXJUIk5+PH/9CjRG4LdpBJ3/Z+JSU9OYONOWmjtedQqGJ2
         QzOpOPrsZTpR2rrXHFvCtaDvAeuNjf+MfAirozKq9f8H4g1OJHG33GHBzKWQhstFnrJF
         HIKDMmdWI5B28RiXnNCv1fvC1wpIGvsxBmczgSzDk2b9XQtEq8IC0hz1EDFqVweosO8N
         slmqW1AgrvImgEsZknSS2MbMPFlTeI/7WSTFUu9UTTezCnQquYqHeVQFezYc3PPbV47V
         YXpPrcDZxzfGdcE9lkZwosP5G/MXJXiYEaZRIrYTYRv4TVQfPKBrRpA4TJ1qFccJMZJ9
         Y2gw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id f3si306959wme.3.2020.10.04.22.39.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955dss1000968
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:54 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncP025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:54 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 16/19] pine64: Convert to stand-alone TF-A recipe and update versions
Date: Mon,  5 Oct 2020 07:39:46 +0200
Message-Id: <ef8d6552bd2b92e177ce16a4d1dd403efaa07e4a.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
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

Rework the U-Boot recipe to use TF-A as a package, rather than building
it in an embedded fashion.

While at it, bump to TF-A 2.3 and U-Boot 2020.07.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../trusted-firmware-a-pine64-plus_2.3.bb     | 14 ++++++++
 recipes-bsp/u-boot/files/pine64-plus-rules    | 10 +++---
 recipes-bsp/u-boot/u-boot-2020.07.inc         | 17 ++++++++++
 .../u-boot-pine64-plus_2019.10-atf2.2.bb      | 33 -------------------
 .../u-boot/u-boot-pine64-plus_2020.07.bb      | 25 ++++++++++++++
 5 files changed, 60 insertions(+), 39 deletions(-)
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.3.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-2020.07.inc
 delete mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2020.07.bb

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.3.bb
new file mode 100644
index 0000000..9b27cab
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.3.bb
@@ -0,0 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require trusted-firmware-a_${PV}.inc
+
+TF_A_PLATFORM = "sun50i_a64"
diff --git a/recipes-bsp/u-boot/files/pine64-plus-rules b/recipes-bsp/u-boot/files/pine64-plus-rules
index f6340f7..4cd5d77 100644
--- a/recipes-bsp/u-boot/files/pine64-plus-rules
+++ b/recipes-bsp/u-boot/files/pine64-plus-rules
@@ -14,14 +14,12 @@ ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
 export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
 SET_CROSS_BUILD_TOOLS=CROSS_BUILD_TOOLS=y
 endif
-PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2)))
 
 override_dh_auto_build:
-	$(MAKE) $(PARALLEL_BUILD) -C ../arm-trusted-firmware-* PLAT=sun50i_a64 bl31
-	$(MAKE) $(PARALLEL_BUILD) $(U_BOOT_CONFIG)
-	BL31=$$(readlink -f ../arm-trusted-firmware-*/build/sun50i_a64/release/bl31.bin) \
-	$(MAKE) $(PARALLEL_BUILD) $(U_BOOT_BIN)
-	$(MAKE) $(PARALLEL_BUILD) $(SET_CROSS_BUILD_TOOLS) NO_SDL=1 envtools
+	$(MAKE) $(PARALLEL_MAKE) $(U_BOOT_CONFIG)
+	$(MAKE) $(PARALLEL_MAKE) $(U_BOOT_BIN) \
+		BL31=/usr/lib/trusted-firmware-a/pine64-plus/bl31.bin
+	$(MAKE) $(PARALLEL_MAKE) $(SET_CROSS_BUILD_TOOLS) NO_SDL=1 envtools
 
 override_dh_auto_install:
 	mv tools/env/lib.a tools/env/libubootenv.a
diff --git a/recipes-bsp/u-boot/u-boot-2020.07.inc b/recipes-bsp/u-boot/u-boot-2020.07.inc
new file mode 100644
index 0000000..acdaa8e
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-2020.07.inc
@@ -0,0 +1,17 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require recipes-bsp/u-boot/u-boot-custom.inc
+
+SRC_URI += "https://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "c1f5bf9ee6bb6e648edbf19ce2ca9452f614b08a9f886f1a566aa42e8cf05f6a"
+
+S = "${WORKDIR}/u-boot-${PV}"
diff --git a/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
deleted file mode 100644
index af911a5..0000000
--- a/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Vijai Kumar K, 2020
-#
-# Authors:
-#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-U_BOOT_PV="${@d.getVar('PV').split('-atf')[0]}"
-ATF_PV="${@d.getVar('PV').split('-atf')[1]}"
-
-require recipes-bsp/u-boot/u-boot-custom.inc
-require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
-
-SRC_URI += " \
-    https://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
-    file://pine64-plus-rules \
-    "
-SRC_URI[u-boot.sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
-
-U_BOOT_CONFIG="pine64_plus_defconfig"
-U_BOOT_BIN="u-boot-sunxi-with-spl.bin"
-
-BUILD_DEPENDS += ", libssl-dev, swig:native, python-dev:native"
-
-S = "${WORKDIR}/u-boot-${U_BOOT_PV}"
-
-do_prepare_build_append() {
-    cp ${WORKDIR}/pine64-plus-rules ${S}/debian/rules
-}
diff --git a/recipes-bsp/u-boot/u-boot-pine64-plus_2020.07.bb b/recipes-bsp/u-boot/u-boot-pine64-plus_2020.07.bb
new file mode 100644
index 0000000..b813ae8
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-pine64-plus_2020.07.bb
@@ -0,0 +1,25 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Vijai Kumar K, 2020
+#
+# Authors:
+#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require u-boot-${PV}.inc
+
+SRC_URI += "file://pine64-plus-rules"
+
+U_BOOT_CONFIG = "pine64_plus_defconfig"
+U_BOOT_BIN = "u-boot-sunxi-with-spl.bin"
+
+BUILD_DEPENDS += ", libssl-dev, swig:native, python3-dev:native, trusted-firmware-a-pine64-plus"
+DEPENDS += "trusted-firmware-a-pine64-plus"
+
+do_prepare_build_append() {
+    cp ${WORKDIR}/pine64-plus-rules ${S}/debian/rules
+}
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ef8d6552bd2b92e177ce16a4d1dd403efaa07e4a.1601876389.git.jan.kiszka%40siemens.com.
