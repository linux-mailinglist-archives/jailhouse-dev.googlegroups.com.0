Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8EE13D7FB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:51 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id ck15sf13528669edb.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170891; cv=pass;
        d=google.com; s=arc-20160816;
        b=qd+tIZsJUgHtxJ84X57wVh6x9XYsKS1TQ3XKc+O6HCK+QHUlTf74s6Xf5dTdmoA0P+
         Gxq9IQxH3ro/1EnuYECvc2K96YDMkBJUQx/J+hQih0Zpml3X/doCO3HzFJFZXPIxRP/t
         t7ARG5ubioP0hAm+5cY5++WBNyJoagHi42hKdJTPZMXNE+Q1T/2YKBiDIWzBxK+vSxoB
         Hd3Xk70dOv7miHJdViMkDTgPjis6HKHXkUIligYOF2MeMu7ixpEoLtZ9fgn68NjUKTyy
         X2Wtsihs8PDBdZ+ob2WTT9+krZhidGpQ+qDb99eRf7bm4LSUaS5IygMf/GgbmFVmc/fa
         WhDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=p03xYaN4aKXPPFtf1v5WwhlG494cbakdzaeuYMCC1Sc=;
        b=XfGemUSnl7gzUBLwDE5fPNJIik4Jfvm69CrLfrQ1GU77sNw/9X51BrB55H6WcNLCwi
         9R+Iw9bdU9KrlVndQGaNcrMdo3DK4U6sAlTNOeS1fFKMYNKVY2GWWzFTAHKsjcxUYnh0
         MqGkFkfWryjf4HJet0mlNabzbtzqbn/fFZ0I36qtg9IPjtUpbNXSYi6V6ZBleCZ11dtM
         oHaQLcdyykcwwDippQ7k1foZw9kv7GiiWsY3H/9VjSp6pTPmLt5VnJGFvb2Vq1x74ULf
         dqkNDAXG0fa2hHpeLeVVGRbsKLb8G1jaN4+E0KFTHRvY11Rt1qXBN9xuOGyK5y9Fvwol
         esQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=p03xYaN4aKXPPFtf1v5WwhlG494cbakdzaeuYMCC1Sc=;
        b=fnZ3jf5EAozU85ydVPnz52XvMdjuizJ6BSSNk3Gg29Yz3a6TmqeMxssoUKmCrdYWON
         UKVfnEcDw4z+3sNQZ+2O2lEZ88/hTV6ZRYgrS3CljYT2fulLCSb0R+aOTzMoEqRLKiEB
         SL9C6HHHF5Q8FBv99xHSYW0uqMjMZfwGWgQ2R8thMI663RraKUf8Qxeb+d2M2HOwqj9r
         V+DqruQ2NlhLcAkFNO+koW9KT9e1fBuIYpbpjNgGwq0oddnxn4XX9AZjHX2NCfpbuUzR
         XmOfmiEoUEyeEoTVXm9eW3okvLO0UJ5GKirM1WWuwHuqYTB7ay0VpOUaB7H8YsyzL+oN
         mCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=p03xYaN4aKXPPFtf1v5WwhlG494cbakdzaeuYMCC1Sc=;
        b=fVVYcVs7mAh33gNC9qUC/jMFq7NW/Mx6zqVqet5cxxoVasCNXaLKRLP3eiWxRhYCsv
         M90BwZgS/rOwT7Mhh+aF+A99IZBN6fUS/aYt75z4CKBs29FZeli9Bfxlta2GQlplxpI3
         iQAtAqfZPbbLnBOWt2c4cv8QDo+BMmFafVoOAZe+ebVLuJAxptXQTxQ5gTHKDp8/9dn/
         O3+uqTRSfJUjvjDX4oaHboKBOH7a+Cq6JTuVwhyCBCjy0fOOyKiXLK2gaaHyvdjyYDPD
         zQM1In4vvvIe5MsBLGgEM+4yiJtL3oloq24rZGt5eJyp1mxYX96L9532NqmAY4Qy9+Tl
         Upbw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXQuA7tjZfapGP4vglHlnAypfIQkyIIamSj0NYPfB733MxTAiWg
	yQtXUGS+2S3TEmH9/2qbRws=
X-Google-Smtp-Source: APXvYqxBqD2+BCGUJNGvngXTqvCt3UpJsNwGg8jSeVnGOjBExZdJ9NEGr9OJo0e9olX0yxMm4VPrdg==
X-Received: by 2002:a17:906:33db:: with SMTP id w27mr2204292eja.347.1579170891120;
        Thu, 16 Jan 2020 02:34:51 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1f97:: with SMTP id t23ls6118369ejr.11.gmail; Thu,
 16 Jan 2020 02:34:50 -0800 (PST)
X-Received: by 2002:a17:906:8511:: with SMTP id i17mr2188036ejx.267.1579170890377;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170890; cv=none;
        d=google.com; s=arc-20160816;
        b=INQpUbdZYESTJos43SO4BKcNR3vDXT0QCUY2MyRtqoOPxa6puk1DT02IjRjL/EnlYs
         tzgYNoytE0q1eUqE9WrRpft46atTcmsfrSiLydpmEy/P4Pr+8ROAd9HjnHSKJAY1fGwa
         krOTgPd1BrlMv5Y5qTUb8GbwIiKarr7CteOD1Ns9gMiMGF4TLwr4edpm0+v72vQ82KIf
         YC7fFFzZ8RVYfCqhE34qCCvdJ3fLQbtk6qQsLCcTrnfRqVxTAA/vdnEl1Qq0J+usd90g
         SeU0CwJU15e20+6SNy42HjrSarPSx63mxbwazMjKraT2BDDS9H5/H1dBmEBDC+ZOgYuE
         3k9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=3SmxKg0kmLlmjCSP2johHjex8DYgI1W2ST5vnBqY7fA=;
        b=xrClaeEiLySeMRyaCLEbIv0zFrbfjTB9NTqraCo+l6MCfL15LUSUn7a4GF/dP8m8KF
         1Ok9AlAj1T0GUOqWrXQfPWEpKOp3Y2yPniHe9ZRykfc0yk0OAPpjf+YocklDSf5MKU99
         pLis82D4dDD5Qv8mhe9c46i3oxnXQowcu1Zims0SB13SJv7Hs5bkwg/m6MekjezQHGNn
         diUKU7y+EPuCTVD+BsflKjabJhyhyQMlv7i1O8OI9I9L+N8iWZfBIKZUHEL0AkUEoBmi
         5OXpygLAIzvrO9GiXvYjLmSNj43c4kTOQZsR6+iuiHcf1atylelibp/ZQZniv/GTeQDm
         Xy/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z20si838034ejx.1.2020.01.16.02.34.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYo3c032081
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQO031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 14/18] rpi-firmware: Add recipe to bundle required binary blobs and config
Date: Thu, 16 Jan 2020 11:34:43 +0100
Message-Id: <23358cc1815fefc241f0ed266486411065d8bcb0.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
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

This pulls the needed blobs (yeah...) for the RPi 4 from the official
repo, adds a config that loads ATF prior to starting 64-bit Linux with a
Jailhouse-specific command line, and puts all that into a package for
the assembly by the wic imager.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-bsp/rpi-firmware/files/cmdline.txt          |  1 +
 recipes-bsp/rpi-firmware/files/config.txt           | 11 +++++++++++
 recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb | 18 ++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 recipes-bsp/rpi-firmware/files/cmdline.txt
 create mode 100644 recipes-bsp/rpi-firmware/files/config.txt
 create mode 100644 recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb

diff --git a/recipes-bsp/rpi-firmware/files/cmdline.txt b/recipes-bsp/rpi-firmware/files/cmdline.txt
new file mode 100644
index 0000000..2126fb6
--- /dev/null
+++ b/recipes-bsp/rpi-firmware/files/cmdline.txt
@@ -0,0 +1 @@
+console=serial0,115200 root=/dev/mmcblk0p2 rootwait mem=768M
diff --git a/recipes-bsp/rpi-firmware/files/config.txt b/recipes-bsp/rpi-firmware/files/config.txt
new file mode 100644
index 0000000..e66fa16
--- /dev/null
+++ b/recipes-bsp/rpi-firmware/files/config.txt
@@ -0,0 +1,11 @@
+dtparam=audio=on
+
+[pi4]
+dtoverlay=vc4-fkms-v3d
+max_framebuffers=2
+
+[all]
+enable_uart=1
+arm_64bit=1
+enable_gic=1
+armstub=bl31.bin
diff --git a/recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb b/recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb
new file mode 100644
index 0000000..5079d5c
--- /dev/null
+++ b/recipes-bsp/rpi-firmware/rpi-firmware_1.20190925.bb
@@ -0,0 +1,18 @@
+inherit dpkg-raw
+
+SRC_URI = " \
+    https://github.com/raspberrypi/firmware/archive/${PV}.tar.gz \
+    file://cmdline.txt \
+    file://config.txt"
+SRC_URI[sha256sum] = "b3c5c9d3cda1f77caf317b8d1f0496cd7ca791ddaeec8207a5a1940111483509"
+
+do_install() {
+    install -v -d ${D}/usr/lib/rpi-firmware/overlays
+    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/bootcode.bin ${D}/usr/lib/rpi-firmware/
+    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/LICENCE.broadcom ${D}/usr/lib/rpi-firmware/
+    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/*.dat ${D}/usr/lib/rpi-firmware/
+    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/*.dtb ${D}/usr/lib/rpi-firmware/
+    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/*.elf ${D}/usr/lib/rpi-firmware/
+    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/overlays/* ${D}/usr/lib/rpi-firmware/overlays/
+    install -v -m 644 ${WORKDIR}/*.txt ${D}/usr/lib/rpi-firmware/
+}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23358cc1815fefc241f0ed266486411065d8bcb0.1579170887.git.jan.kiszka%40siemens.com.
