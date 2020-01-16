Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id C845213D7F6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:50 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id i9sf9109739wru.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170890; cv=pass;
        d=google.com; s=arc-20160816;
        b=inmrj6uP8wskkh504KKi7+w2QxMj7ofrp6pTF715WezqrohxW6DvYqriHnjXjTuaWP
         o0pO2ioZdaHpDiwGh5wV+/qhvu52qtfeTuGlJ37f3TJeF7ban+JAXgpnmiSXrn09Wl9V
         BGT7Xu4Bmtp6CZpRg1r6VnMt4WaMQdnaZAA7DYx93CgAf7cQ34ZjC2XlD+K3zrFuDVd3
         Ke3bRRwenCKOBXjLZ2Kx3ppt6ii1QUhiATFnVSUOi8+iREswlDg/rqIeyum10LxvzEXo
         9YAfJIZ4BJ0VN6O6V5O9ma2RefJATmvKuqyVPI6YdcklTXxaI3yoBbr1nKi6U0RDwfPx
         PQKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=M8NeSAfAf/8rf146s5kA5oQtrC5Ywe50uKb9o2R/47w=;
        b=uoJ4oodKHAT7wVgfmGOy/hB7+RO0kt42XaKz6BieDHRGb2EzwbjW8g21iI02ynstek
         Gc4tCtaqzhUv0HLun5AWQexW0NX4mUXOonlCXTZC5fFZlIFFvOOkwhRbOvdZkQCgRun1
         LJ/4f4rxcsEjKnVGiki3nc3O3PLmFzOKuVdPgU9Mg23hRKHjYRzpCy+Q9swXzfC2mpsB
         IoapMTGVbNhYK5rYOgVQsxH8GQ6MyxYYW0JCVeOjGiBafaqd382C4U65f/MkJLrMNgGq
         jSKghaUnE6BZwX2QcMZiVT8Vf4W8R25TIeLV9V041XK/Qm8KMieiU85pZ1MQr7pqnP90
         Zytg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=M8NeSAfAf/8rf146s5kA5oQtrC5Ywe50uKb9o2R/47w=;
        b=B4Bu/xCtgkHt8efJwESCjruPALOW4krpz2KXEE7aizYjj7jS/KNL4s9+i4pVSX66g1
         EHdDyHrrSddxO6VL3GJLLttu6s+ftrP8ImHNx5sMdugIRJwPxM8gIvu8MiPeCZTuI8OR
         tOtjn2dmzkjPR1vH8GT3/AN2fW10iSw2UIDE4dRE1WEjmpU09x0RefUI3OwYShzXI8uG
         5rYjDe0kAXy8P5oFP4mGFrVBuSISgC5gbBjhhmUFkXF+c59bq9tHrrA0g66teucWA93G
         T938jFaKX3IWwyNeqQ0tUC9KCyKL8RiikQh55eO5BSfyymyCJQe9MSkfP2MvcGJXmkH0
         lXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=M8NeSAfAf/8rf146s5kA5oQtrC5Ywe50uKb9o2R/47w=;
        b=IlBndp7TjlaCj8oZ8nd8VUl3KOISeox6UU8HnxmV1IQmX1WcePDfLxw+ftNqYDzfyK
         HJ3ZPwX+8Yw9cp0ToyeG+1wxdR6OwotQWginLGzPX+9OFdMOVpKGWT8HpaTVk2X4tHFP
         cgMbzN4YUQGDBXf7Hlr8dn/+rp6x+2SsQw4zescAmwH1JWwb/lUAmryBBMxp6BpTyNkF
         NC8YzisXLkbhOFJMmul2dj+A9MCMKM2gXuOR7krRdx+2aFga6cFWOYK3ra4vwQc1W34f
         /XGAJpimDGzx2k2LllT4R18N0w+fhWNpjavyTm//f1kkd7FxE1QU7PT3ioOHR2iWnjH/
         Dffw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXhNhXoe22J8ahGzoF5kEfRrpy1aX+PRZoakeLNsRcTqwUnzT1j
	vFOdoKQ/x6WWcT/BW4mXrIA=
X-Google-Smtp-Source: APXvYqxDN0Fqv79yjUJ1CZPZwiX/VIQaJitAEUPqOaP+t+pgHp6n1aZUeK5SKvlEGRalZqUUDkJcxw==
X-Received: by 2002:a5d:620b:: with SMTP id y11mr2511878wru.230.1579170890381;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ebc5:: with SMTP id v5ls7783639wrn.8.gmail; Thu, 16 Jan
 2020 02:34:49 -0800 (PST)
X-Received: by 2002:adf:f98c:: with SMTP id f12mr2461861wrr.138.1579170889591;
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170889; cv=none;
        d=google.com; s=arc-20160816;
        b=XaTVj50J7CAL6ZvwnUt41R59hKXG+KwSk4WGfAgzeerMMifsgp/gkvFLx1CqvgV8qJ
         wyZJSsObs+hK6Mx0GG+BQV6EzpwO9RFo91mr6ebjpT0SWyDJDlGj3ynX+6o4zrHxo+Um
         P2MJuLghglfM635718isWhnnjVTY6PDnCw8zW5WKfYP4WDihzfWihUSyqAURTkqMfvZx
         2HdEDGzOT7iBiTwvqJnbDQo4tHULsX1fkCrdW185qszDc+eYMVBdunz6dDIcHb7tbU3I
         O4HXa2ZwN06RWViT9RDXpRdEZfYWIharlbbBLNoJBGgUw9WSYGduxB7fWJlMqXHD9quB
         gQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=LTOwnWf0Be3kcPqYNTXfd6xjZF0fnkpxcqJBy3+v63I=;
        b=v58IahRdnBmTyIAr6byKwsp3NzvKH5JPMGfeRORheG/49UlMaUO2PY39OihtTN1Jsg
         M+bxtFwCOB3YOE5BIUda4+PCTW0XYGH4YfTgAiFA2ezhoIpJNjjRGMULki9wUFyMBe8C
         cGuG6Sr+LVGV6YtZP0zmxojB4DSaqEzrtg/atPP+Jmv8c8QGfq9+fTHTq7IiQ+MdgYxW
         Ow6TJym7cMO2y/oGAhnF5vEI2/yqcXv8LgBIJQ0x3RIElaoLsJxQkDIxhFJp4Xge1pns
         5vPK6EXlxJQbdc0CJTu99ngmkM7NnN1vkbhkPuJf3oNHpCPRvjYskExVEI/3N64VVbgj
         68IQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id p16si882103wre.4.2020.01.16.02.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00GAYnih029228
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQF031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 05/18] customizations: Adjust to new ARM/ARM64 demo cell naming
Date: Thu, 16 Jan 2020 11:34:34 +0100
Message-Id: <b88300cb3fc6c1e0528a9d42624bd6600574422a.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

The gic-demo config is now called inmate-demo.

This starts the conversion to upcoming Jailhouse 0.12 / current next
branch. For a couple of commits, we have to live with a non-working
state.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/customizations/files/.bash_history-espressobin   | 10 +++++-----
 recipes-core/customizations/files/.bash_history-hikey620      | 10 +++++-----
 recipes-core/customizations/files/.bash_history-macchiatobin  | 10 +++++-----
 recipes-core/customizations/files/.bash_history-orangepi-zero | 10 +++++-----
 recipes-core/customizations/files/.bash_history-qemu-arm64    | 10 +++++-----
 recipes-core/customizations/files/.bash_history-ultra96       | 10 +++++-----
 6 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/recipes-core/customizations/files/.bash_history-espressobin b/recipes-core/customizations/files/.bash_history-espressobin
index 498e866..09fdb24 100644
--- a/recipes-core/customizations/files/.bash_history-espressobin
+++ b/recipes-core/customizations/files/.bash_history-espressobin
@@ -1,10 +1,10 @@
 jailhouse enable /etc/jailhouse/espressobin.cell
 jailhouse console
-jailhouse cell create /etc/jailhouse/espressobin-gic-demo.cell
-jailhouse cell load gic-demo /usr/libexec/jailhouse/demos/gic-demo.bin
-jailhouse cell start gic-demo
-jailhouse cell stats gic-demo
-jailhouse cell destroy gic-demo
+jailhouse cell create /etc/jailhouse/espressobin-inmate-demo.cell
+jailhouse cell load inmate-demo /usr/libexec/jailhouse/demos/gic-demo.bin
+jailhouse cell start inmate-demo
+jailhouse cell stats inmate-demo
+jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/espressobin-linux-demo.cell \
                      /boot/vmlinuz* \
                      -d /etc/jailhouse/dts/inmate-espressobin.dtb \
diff --git a/recipes-core/customizations/files/.bash_history-hikey620 b/recipes-core/customizations/files/.bash_history-hikey620
index 9c07ff7..41729a9 100644
--- a/recipes-core/customizations/files/.bash_history-hikey620
+++ b/recipes-core/customizations/files/.bash_history-hikey620
@@ -1,10 +1,10 @@
 jailhouse enable /etc/jailhouse/hikey.cell
 jailhouse console
-jailhouse cell create /etc/jailhouse/hikey-gic-demo.cell
-jailhouse cell load gic-demo /usr/libexec/jailhouse/demos/gic-demo.bin
-jailhouse cell start gic-demo
-jailhouse cell stats gic-demo
-jailhouse cell destroy gic-demo
+jailhouse cell create /etc/jailhouse/hikey-inmate-demo.cell
+jailhouse cell load inmate-demo /usr/libexec/jailhouse/demos/gic-demo.bin
+jailhouse cell start inmate-demo
+jailhouse cell stats inmate-demo
+jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/hikey-linux-demo.cell \
                      /boot/vmlinuz* \
                      -d /etc/jailhouse/dts/inmate-hikey.dtb \
diff --git a/recipes-core/customizations/files/.bash_history-macchiatobin b/recipes-core/customizations/files/.bash_history-macchiatobin
index 16a0312..57a19cc 100644
--- a/recipes-core/customizations/files/.bash_history-macchiatobin
+++ b/recipes-core/customizations/files/.bash_history-macchiatobin
@@ -1,10 +1,10 @@
 jailhouse enable /etc/jailhouse/macchiatobin.cell
 jailhouse console
-jailhouse cell create /etc/jailhouse/macchiatobin-gic-demo.cell
-jailhouse cell load gic-demo /usr/libexec/jailhouse/demos/gic-demo.bin
-jailhouse cell start gic-demo
-jailhouse cell stats gic-demo
-jailhouse cell destroy gic-demo
+jailhouse cell create /etc/jailhouse/macchiatobin-inmate-demo.cell
+jailhouse cell load inmate-demo /usr/libexec/jailhouse/demos/gic-demo.bin
+jailhouse cell start inmate-demo
+jailhouse cell stats inmate-demo
+jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/macchiatobin-linux-demo.cell \
                      /boot/vmlinuz* \
                      -d /etc/jailhouse/dts/inmate-macchiatobin.dtb \
diff --git a/recipes-core/customizations/files/.bash_history-orangepi-zero b/recipes-core/customizations/files/.bash_history-orangepi-zero
index 41c5dc3..fed554a 100644
--- a/recipes-core/customizations/files/.bash_history-orangepi-zero
+++ b/recipes-core/customizations/files/.bash_history-orangepi-zero
@@ -1,12 +1,12 @@
 jailhouse enable /etc/jailhouse/orangepi0.cell
 jailhouse console
-jailhouse cell create /etc/jailhouse/orangepi0-gic-demo.cell
-jailhouse cell load orangepi0-gic-demo \
+jailhouse cell create /etc/jailhouse/orangepi0-inmate-demo.cell
+jailhouse cell load orangepi0-inmate-demo \
                     /usr/libexec/jailhouse/demos/gic-demo.bin \
                     -s "led-reg=0x1c20810 led-pin=17" -a 0x1000
-jailhouse cell start orangepi0-gic-demo
-jailhouse cell stats orangepi0-gic-demo
-jailhouse cell destroy orangepi0-gic-demo
+jailhouse cell start orangepi0-inmate-demo
+jailhouse cell stats orangepi0-inmate-demo
+jailhouse cell destroy orangepi0-inmate-demo
 jailhouse cell linux /etc/jailhouse/orangepi0-linux-demo.cell /boot/vmlinuz* \
                      -d /etc/jailhouse/dts/inmate-orangepi0.dtb \
                      -i /usr/libexec/jailhouse/demos/rootfs.cpio \
diff --git a/recipes-core/customizations/files/.bash_history-qemu-arm64 b/recipes-core/customizations/files/.bash_history-qemu-arm64
index f2e7e6c..73c5562 100644
--- a/recipes-core/customizations/files/.bash_history-qemu-arm64
+++ b/recipes-core/customizations/files/.bash_history-qemu-arm64
@@ -1,10 +1,10 @@
 jailhouse enable /etc/jailhouse/qemu-arm64.cell
 jailhouse console
-jailhouse cell create /etc/jailhouse/qemu-arm64-gic-demo.cell
-jailhouse cell load gic-demo /usr/libexec/jailhouse/demos/gic-demo.bin
-jailhouse cell start gic-demo
-jailhouse cell stats gic-demo
-jailhouse cell destroy gic-demo
+jailhouse cell create /etc/jailhouse/qemu-arm64-inmate-demo.cell
+jailhouse cell load inmate-demo /usr/libexec/jailhouse/demos/gic-demo.bin
+jailhouse cell start inmate-demo
+jailhouse cell stats inmate-demo
+jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/qemu-arm64-linux-demo.cell \
                      /boot/vmlinuz* \
                      -d /etc/jailhouse/dts/inmate-qemu-arm64.dtb \
diff --git a/recipes-core/customizations/files/.bash_history-ultra96 b/recipes-core/customizations/files/.bash_history-ultra96
index 7c3c325..f73aec1 100644
--- a/recipes-core/customizations/files/.bash_history-ultra96
+++ b/recipes-core/customizations/files/.bash_history-ultra96
@@ -1,10 +1,10 @@
 jailhouse enable /etc/jailhouse/ultra96.cell
 jailhouse console
-jailhouse cell create /etc/jailhouse/ultra96-gic-demo.cell
-jailhouse cell load gic-demo /usr/libexec/jailhouse/demos/gic-demo.bin
-jailhouse cell start gic-demo
-jailhouse cell stats gic-demo
-jailhouse cell destroy gic-demo
+jailhouse cell create /etc/jailhouse/ultra96-inmate-demo.cell
+jailhouse cell load inmate-demo /usr/libexec/jailhouse/demos/gic-demo.bin
+jailhouse cell start inmate-demo
+jailhouse cell stats inmate-demo
+jailhouse cell destroy inmate-demo
 jailhouse cell linux /etc/jailhouse/ultra96-linux-demo.cell \
                      /boot/vmlinuz* \
                      -d /etc/jailhouse/dts/inmate-zynqmp.dtb \
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b88300cb3fc6c1e0528a9d42624bd6600574422a.1579170887.git.jan.kiszka%40siemens.com.
