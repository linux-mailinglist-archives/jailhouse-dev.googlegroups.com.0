Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQECXDVQKGQEP2RMEAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F21EA60EE
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:29 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id b14sf2436370lji.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490369; cv=pass;
        d=google.com; s=arc-20160816;
        b=tF8IpCmgYwKat61IFw6UbYYIlVC8jwVMBV4XX+4VOVeGxiHXx3pqeFMCttakb5qvPw
         9nXq5a6t+s/x3fvH4CLKaoZde5fS6ytVElwvJlboLPh15pr4ar6pVILwY0vcOlLN0oXD
         lo+YXPzvnb5dPz4VQqF2B8jyLzGtPBpt5OPWF1YDRGoXGNWhax49H+oKJOxpcLgudPvu
         1mRbUVZzoQQRABVzffjkqJTqZDswoqZ8pPgyPAVNU9CROV3xjsqkvGyOrqb5/UEkH0SC
         7iXosvCJ0Q+uUrq0Re0vAzKTb+10/2sgtJGFZN5t0TRQUKwhhqAe2HFQph3gBe1Dv36m
         7VJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=WOA9lcdGYAY2xXX6bPHtYYqY8eBBwI6mURQ2HdSBdAI=;
        b=uLTMpspB+TGJFDUkw0rGw4UvVhODYbeOtWCHvBjvJ2B+NalQV6rZrjZl2MFGe0F9ew
         tRJWaUEjOHqvFci6/JJRUgbW7dOGuTY2LNUmPuO8YGhXYMcdom+7oc0Sac8763oQyh9K
         Orl6TWpQD0dPboInb/4wb81uML97VL6XmMW9r/asDHlv0E+BWsh3IK9daAKI4/003Lrj
         Z5yHchrEfzxIuKmQXJDFjR//52eKtxIwPU4mpfpwbVBxB6pbd7x1cc69zRaldYFRLGqA
         +c8/YIVo1m4nHg62u3FWJ3wwM7KwkfwC9+XgtRZf7Lx319PcP1/b4ki5ZZWTQOmF1gAa
         BcrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WOA9lcdGYAY2xXX6bPHtYYqY8eBBwI6mURQ2HdSBdAI=;
        b=iCMe+Gh6mZCbIq9zMdxvMIMEvRYLF2KBF5k+4I0uzvSJtocld3mpeRmYKuEMDTry5b
         DZhYcTd+bMuJh9szzyPUI/ykXOPkUXyiWWwwDPC/PL0uk6rThtgOQrTPiFsZq0duNV6p
         t3SZZdJXdz6O0KwISCXro/8MVoWZrm124rntsPesId/TPwPQfnCaO3l/DqcS5FNhUB0q
         HsDDiGfyepVyTsSH+3scT3Ut/6E7LOYT+SARXLDq2gMd8UqrpILogPgByECFoWFQ5Wb8
         Xrt5T8YiwyfIYUGfuOCtCR3IJNImPuJjofvgqwKB1x8jtRqNXGT6ibYTVcKRbMi0ogzK
         /78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WOA9lcdGYAY2xXX6bPHtYYqY8eBBwI6mURQ2HdSBdAI=;
        b=lWjTxwJ0r0DOYFajXVPp7S9Fli5C6OW1lcWAoEdC+CiGcZidqDl3huDqRccnI/3FHE
         OFCfsj8ZuASQtutwR70t1qQMcZVauh2mAYPq8nyD919CbGqnbta41OhUAs1EQU49h99q
         mmTy8jtKXzj5LGD9q8BivK67tGABdwEl4/glFa1LVPa0QKvyLbbWbqYnBtTWIR8c0rIo
         sNn+/05Dq/nM/cOfXFmhHr5aXVnFPNdewSsNax1LuCm4uUxpDXJX0pqzsEJktGt9vUTt
         FoHEiPOb1Pu6DNsjRexBITE24ziEhZl9KfcEoTa+B3YbcOaL/H5OPIMt4b0gmZSUSJ7/
         tT7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXeSlbYe+8E5Pr9rEoJaLscUKYh1D8KGhI6LVo/n+bGUttBmeP+
	GdbbJfXppdueD0XUN+NK+5E=
X-Google-Smtp-Source: APXvYqzxvACsSAUSRaWMhIgzr65sRxAlE+XbI2RnKBeZWu7ENQ90olmbno3hGIJxV3+KuRZRZNd03w==
X-Received: by 2002:a2e:87d5:: with SMTP id v21mr18504703ljj.191.1567490369073;
        Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3608:: with SMTP id d8ls1750064lja.0.gmail; Mon, 02 Sep
 2019 22:59:28 -0700 (PDT)
X-Received: by 2002:a2e:b042:: with SMTP id d2mr17840503ljl.202.1567490368002;
        Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490367; cv=none;
        d=google.com; s=arc-20160816;
        b=HNoMI4n2X4DyzpvjhLbGW2LntjdXSN8R96vZce5KD1HyQIuoc+O+8VKmVQPZgKHCaw
         lF28pCirgdrTFPIfi3IMlO/aC/Y27IeJz2dEUm5FCFjSeVuAe5475zIpP8iljro7FCh0
         lzRfsqAuX5EkuJSY9zh0OVxsD1XtsyvsW94ek7HrnqHK7J+Bl+uG8PzBtRC8TkXrlQY/
         GWJkxKN6TgrStRZt9/BNIxY59nmsFkOaUdmtF8yHN0gKzQrp4lzgK/8zCV432SLx9mXS
         r+y/OYMvBQiA2uJAjfYRW+J7HUvhSFZ+JvcY8Fj6Km5pmPR/0J/U+AjB4yEsSsT1c+57
         Rk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=g2aeLQaGmnVbT5xklPsHgt4ppA/119WH6afPE8rekhQ=;
        b=hBXahCgYokROJNWAsqTTUjuf3ptdzfi1cOSM3Be8Y41C2Ve3nnscoKlTk6LErgqmqC
         zyb0DLo51vZUn5cDQCdanJEElOikdHXDk1xG/p4rxRp+sK8kBl57pLkTc9kvgg0WPjuW
         JDKAFaVkuK1GMG1T/I6o2kFz1QYUcDiIz+B6TkYVLHFDwapXyVXS6Xvj1kpe4fYwEwUJ
         5cEbZXvfhQtJeG7Yr/Mc6eBR+xm28RpCEJ/o57kBVYmb4QacPNqtki666S3WOkf0PpYC
         5WGeoVs0LHHy3BrrycdmsLSuEwdS/fE/RrkQ5WhFtmqa0Dn6/2AcIUYr3SNza/vU6nhI
         LqZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o30si469840lfi.0.2019.09.02.22.59.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x835xRPj009943
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:27 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkS010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:27 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 05/13] Add recipe for building ZynqMP PMU firmware
Date: Tue,  3 Sep 2019 07:59:17 +0200
Message-Id: <1b82afa10f1cab52959999c5fba4cf0235a5614b.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Will replace the old binary package so far used for the Ultra96.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-bsp/zynqmp-pmufw/files/debian/compat       |  1 +
 recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl | 10 ++++++++
 recipes-bsp/zynqmp-pmufw/files/debian/rules        | 24 +++++++++++++++++
 recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb    | 30 ++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 recipes-bsp/zynqmp-pmufw/files/debian/compat
 create mode 100644 recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
 create mode 100755 recipes-bsp/zynqmp-pmufw/files/debian/rules
 create mode 100644 recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb

diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/compat b/recipes-bsp/zynqmp-pmufw/files/debian/compat
new file mode 100644
index 0000000..ec63514
--- /dev/null
+++ b/recipes-bsp/zynqmp-pmufw/files/debian/compat
@@ -0,0 +1 @@
+9
diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
new file mode 100644
index 0000000..4d14702
--- /dev/null
+++ b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
@@ -0,0 +1,10 @@
+Source: ${PN}
+Section: misc
+Priority: optional
+Standards-Version: 3.9.6
+Build-Depends: crosstool-ng-microblaze:native
+Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
+
+Package: ${PN}
+Architecture: all
+Description: ${DESCRIPTION}
diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/rules b/recipes-bsp/zynqmp-pmufw/files/debian/rules
new file mode 100755
index 0000000..e86f7a3
--- /dev/null
+++ b/recipes-bsp/zynqmp-pmufw/files/debian/rules
@@ -0,0 +1,24 @@
+#!/usr/bin/make -f
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+DPKG_EXPORT_BUILDFLAGS = 1
+include /usr/share/dpkg/default.mk
+
+override_dh_auto_build:
+	$(MAKE) -C lib/sw_apps/zynqmp_pmufw/src
+
+override_dh_auto_install:
+	dh_install lib/sw_apps/zynqmp_pmufw/src/executable.elf \
+		usr/share/zynqmp-pmufw/
+
+%:
+	dh $@ --parallel
diff --git a/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
new file mode 100644
index 0000000..ff9f05e
--- /dev/null
+++ b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
@@ -0,0 +1,30 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit dpkg
+
+DESCRIPTION = "ZynqMP PMU Firmware"
+
+SRC_URI = " \
+    https://github.com/Xilinx/embeddedsw/archive/xilinx-v${PV}.tar.gz \
+    file://debian/"
+SRC_URI[sha256sum] = "0b36721d62f970b1873fd337e94ee13304500ecec1dd5dbfc4f0ed952e55cf5f"
+
+DEPENDS = "crosstool-ng-microblaze"
+
+TEMPLATE_FILES = "debian/control.tmpl"
+
+S = "${WORKDIR}/embeddedsw-xilinx-v${PV}"
+
+do_prepare_build() {
+    cp -r ${WORKDIR}/debian ${S}
+    deb_add_changelog
+}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b82afa10f1cab52959999c5fba4cf0235a5614b.1567490365.git.jan.kiszka%40siemens.com.
