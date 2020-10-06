Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQHG575QKGQEE3TGNVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9653F2844ED
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:32:01 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id y20sf420307lff.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:32:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958721; cv=pass;
        d=google.com; s=arc-20160816;
        b=CxJ7RAJ7gWzvuKlUfQ0kIcGoUeG+JN7XVjV5306xdFT+9HjHR5AFKPFYvXPggXR9gf
         zVlo5XWUN1pYburhD3bLh61zKZWf+6HLs6BvmssT61wPbBhvmj+qy8sXWFpYJXN8WKrF
         LzI32r+d/6ngaj+NUe1Hh8gq1sYuhzH60UtiHTNX+Qp5J5A4JfxzuwHRd/kC9ZfUsvTY
         LANCRc8Gy1UsKxyNqrKjU18bJhmCfEbyDwV5UDLrgQw/LCWonxOG8rHmv+Za14gka0oW
         aP8QcFspMbarJYGl15VKKISGGbMoNrkCBKhtlxIud/i8AqKc8l07Zg9corQAq6INTZxc
         Zbtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=OKLTF3p4xqA0KEYoJRtrMjiFEMuEfL7c6ZufOls8arg=;
        b=qfsAMKqvK8oh0UuPIK+wtR9SJj6KwDPLMxZh73sI/Jx6Hb4z6DWz+z1jWeOBwnH6P+
         luoPzr8PPufdHBHJ68CmrdkleVom6acxy+zmnAH4aOgExJ5hxVjEng3KJIJspq6acE65
         9GG6w2Y2cIZIjj9T+4fofb0Nn2H9TZg+wch75XXR5MIBa2W92n4UziUh3oB8RmCfk5N+
         FyPhc+fbYFWhqS9BRyo2NQCqI+LxiZny2g58XWv1OGNtkFLkHXlbwZVmjb9qNS0Y+i+/
         DWQ4JQ1hgxnN7XolTf0v5HPihabVnJVTv3cCvDWooiY+FACEJ/o0805G5//rq0XyFnf4
         67Qg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OKLTF3p4xqA0KEYoJRtrMjiFEMuEfL7c6ZufOls8arg=;
        b=XsG11a8G8F1m2K51Isrw3eskw06cMzG6ZU+86BNQUAvNfCeaqCbfyD5N6HtFMWnemf
         +E05CTS0qY5ASvbhMnzS7uS9/wW/orxmkX60MYg3IYflMoIIUAMEf5jQCvc2zPsgBCZ5
         5nx/gZgzbcnjGnD3MQVj+I02OYkL51eeC2+Kzz9A1LPeGr5uXEcFNmtwcjIx3wCXhRI+
         Y0k9z9A7qhmFaZit7hNXkQ+r0Q6j99IlK34C32a6trUewBNPzdzA1Z/pdlpQJ+50rCBy
         2QCI7309jCKa0H4oWqPLjhsl7at2AHpf5vakwT6dbga70OTwx/zDRnQp4HvfMj4cRWgo
         xwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OKLTF3p4xqA0KEYoJRtrMjiFEMuEfL7c6ZufOls8arg=;
        b=pSO586+36t+GRzTTGElN+x/SbehDj2SpdJzSnnokCmiFaKXL0FiAgBJn9kEs9uUjRP
         HVKwnV+bYuYCRQd9izGgfsjuzJyVrHvwXvruRnwG+be1sEBVnZlYl2thkCkhq8ihJ38o
         5xCUCK1UXMCCthu7osz3LxI+MHqPyFsa2X946RenGolMup1IYcfEAr0WDsm5J32Z+SJ8
         2MhOEeoRub+A1+ZySoCwNMf+HWx9G13huyNwx/OoJ93Waowj7/QO4tKLnfSOQ4EAvLDX
         pGIneqmjr5QxwpwDTARraTyjHnpNd0lkiSrJ1gMZDpQy+1A5D5etPLEr6HlSdDgDfdlu
         MtXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5325q3oPJ1an6lwrai9KzF1b8J2yc+A4xhKU2oYX79AvcxyUmaH6
	VXb2V2Gy9IUbCeLOxK/y6RI=
X-Google-Smtp-Source: ABdhPJxzT/xpHNkgHi69l/W+ujqLdnXupL6GdAUWDm9rE4Dl7dN8Fwt8G/LulWEL/zhuDCX9ZBmImA==
X-Received: by 2002:a2e:87c4:: with SMTP id v4mr1029038ljj.299.1601958721128;
        Mon, 05 Oct 2020 21:32:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1280388lfd.3.gmail; Mon, 05
 Oct 2020 21:31:59 -0700 (PDT)
X-Received: by 2002:ac2:560e:: with SMTP id v14mr866469lfd.430.1601958719889;
        Mon, 05 Oct 2020 21:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958719; cv=none;
        d=google.com; s=arc-20160816;
        b=J4YUW6DkQyG8l5VZwL9GAFGnw8cIfHwWtQH65aFsVsJt7V3mexhWsaBvjX7r2nqx7y
         MAcYtHmJb+zGV+45CWjcENDuT/onwZsFi6p3FpWXvVlPHVEYKapDXpL2LCkOjviWnkNd
         eqDktF63RVZsVmYVcgLOLquIMe/to8nm6rcaI3IkdtvEkbuXx5ySOAm13zdTipbk3to2
         xtJTG3Vgzi+jL8FcKRlHAyt6iEq4G00DVJe5XZWYZAw5Zye/72drcOsXMmPRL+EL+3zr
         8HEn5EW/lGps17b8qwWnaV5fUVKA9cFONQSzN4v3i7DT9FOhTFWI8fxJyhrMC/9ZaC9a
         ztiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=9/bpNLgELdiYMUeAE0KXh37XDuZaJ8rooqqiOFwNSkw=;
        b=Nzn4Ul+Ccm4TuadsIJPenkS/FgdZ39vMuDfSyBCYvV0ty7RLEedV7HczK/H50LsWDc
         mmpHnLinoChs3gUad3mpWqim1zb6rqbfIn0duFv9Bj8Vl6sU+gqgUqUtn7ZyAKqX1SbO
         s+OYn7GMQxV1wCrTsl/IjytlBYVihc4qLzEBCQaEtEVAAH4Ts7NVYD6QTlxO0auGFmFQ
         ngNudh2aXIq3UTKjpdof0EDuYy7vP5yYBizEybFoiTBnqCpbkkg350AltDdcQ/YSp9ux
         0Zgd2lnh5Of3aiewdkTlvGq3kY5qwoBllqnCYEkrP+GWpR0nPkK8j3jvPl5Kh+gpSb3w
         BzsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id e1si80120ljg.6.2020.10.05.21.31.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964VxAb020386
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:59 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY82008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:58 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 16/19] pine64: Convert to stand-alone TF-A recipe and update versions
Date: Tue,  6 Oct 2020 06:31:31 +0200
Message-Id: <3293d1eda0af81f5629a7069f1bf1b9bbfafc1ff.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
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

Rework the U-Boot recipe to use TF-A as a package, rather than building
it in an embedded fashion.

While at it, bump to TF-A 2.3 and U-Boot 2020.10.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../trusted-firmware-a-pine64-plus_2.3.bb     | 14 ++++++++
 recipes-bsp/u-boot/files/pine64-plus-rules    | 10 +++---
 recipes-bsp/u-boot/u-boot-2020.10.inc         | 17 ++++++++++
 .../u-boot-pine64-plus_2019.10-atf2.2.bb      | 33 -------------------
 .../u-boot/u-boot-pine64-plus_2020.10.bb      | 25 ++++++++++++++
 5 files changed, 60 insertions(+), 39 deletions(-)
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-pine64-plus_2.3.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-2020.10.inc
 delete mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
 create mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2020.10.bb

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
diff --git a/recipes-bsp/u-boot/u-boot-2020.10.inc b/recipes-bsp/u-boot/u-boot-2020.10.inc
new file mode 100644
index 0000000..99e0630
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-2020.10.inc
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
+SRC_URI[sha256sum] = "0d481bbdc05c0ee74908ec2f56a6daa53166cc6a78a0e4fac2ac5d025770a622"
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
diff --git a/recipes-bsp/u-boot/u-boot-pine64-plus_2020.10.bb b/recipes-bsp/u-boot/u-boot-pine64-plus_2020.10.bb
new file mode 100644
index 0000000..b813ae8
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-pine64-plus_2020.10.bb
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3293d1eda0af81f5629a7069f1bf1b9bbfafc1ff.1601958694.git.jan.kiszka%40siemens.com.
