Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBM7G575QKGQEACXMFUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5632844E3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:47 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id v9sf5338742ejb.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958707; cv=pass;
        d=google.com; s=arc-20160816;
        b=ch9heN7GP5d/l7SwaG/dPPPbG1OA7PLv+e39ua6wpBNQCBNBmjjWgjhXqtJQvyIz75
         WO7ibi9zH3xlFHuwy6si5EihJ6seJZNNqYJKNrmcFA1Pwaorv9qanfzHXB8BPVNIgnUZ
         99Di9r2wAxnnmoPVylMdPsUlkj0uqKmZem0g3sOhOoJ1y0YRd44ajxFxoMYOPRnTHoKv
         yMKQYs5mbLIGBHMdXE3CZWcROKPSadRV+S2g2AcmvBluLCMehJ4GHIU7T86hk3ifgnFX
         ZAlv1QX/Lcg6sL6sTRRAvULqbXxxaSMGs6c6u614DmfM5zPAQMgBOJWTSiv8ggUOXMSw
         0VGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=sjawgDmKiVKY0njHPhXPmdu4NSgIeGzzEGDCx1GTf3Q=;
        b=xqfRbCuiA8iL6rvjKSToXR/986TPHTz6wiZyqjAa4VZvk9YeFOkIheE6lILL4U0JsS
         MJknXvTwmBtdmKGeTnuPB2Oy61cq+kj7xF1kOf1yC5uDCuQJlzpkl44auDlvzRwnMIzU
         k2cGyRXI37s2eR7bNZ+lG0MG3KZb2Nf3Xc+KygENz8yZh/owgIYld9ZxlxzuVGTUNMZu
         FVEneLHFAkpnMJ0jxo2H1TYdI/0OvdBcsWL40cEKNUH4OSO4FF56fa3PS3T0zf5JmWyW
         HzBraou1lFeFzBNxkMRzhs8GScSUgO9AJT3coz9DCzolAtSMAf4fH6/i7Q/cYI11UGib
         M7Sg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sjawgDmKiVKY0njHPhXPmdu4NSgIeGzzEGDCx1GTf3Q=;
        b=HoXae5j55ni573/T5NoCYtM5YYpCtbJy+C78ow+uU47c2NIlmzxpKq7DXVMVMgld7c
         AmsaqM8deyDb+3tYVSsYLccjYY5TMSfHnB7cZY23qmK5UdSeD5ltP55PGVqbYMAvrfFd
         CGGpQA5ZZoGfXYp/KvEDSUpAqrQQ6h8/XU/z8J6ChYxdrXBsGl4tg9nPSAYcYP4tC2IU
         8nDwLz+qZUyfpJFn/oe/Wj6SpxURop14von7q9vMvu8uXuY5Q1MpQ2aSu64SP50j20wH
         wkQxNCCHOSMp97TmJ86pUTVA+OPm/Fe1c5z/Jfo/1JaNy0du0AGu94bQsEZL/aO/iwpa
         O/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sjawgDmKiVKY0njHPhXPmdu4NSgIeGzzEGDCx1GTf3Q=;
        b=e7bX5aai8b/oRyhuxr8P6XTWpwD4grtRRB4SOMOLDb5tq+IaR+0rhngar8AzLnClU6
         l9Fx3epLZIecr0yf0bV5FCQ8z6GLfmpUDFHnfZvM1WIeeXgaBYwHDG9PIRsSL91S6X+V
         3MVb3NuZGbWEe6jSSy8Fw3s5nl5FsmkRcGtfC+Ab4gKV+Li4vgHVhHDvkKva6xP2yVVr
         s1BuIFPQ+WHCNK+Q71RcQQbRygAqTXDJZ5F/ZoQMddv8HUJqMPwECAEnj1Bf9RZWYHyQ
         MjlPdC7q5S3uc6sJ1HFKsidd28FTg7+iJYzF9rwdhxPHm7Q488Az6dUfC3kDoreXVh91
         c4OQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532LES4tEajO6TQ1GczX+7IQ6tL15R2r92pmPemoJoS8/qaon7LI
	zZ58ZzAHR32BwydkQNTjwtM=
X-Google-Smtp-Source: ABdhPJzBCGjGRgDpoy0t+MHq4TFb3ljWnfSxktwq3B4r3IngMge9gb1ZcK1bKmrZULQtO8dzxmOxoQ==
X-Received: by 2002:aa7:dcc7:: with SMTP id w7mr1476280edu.80.1601958707669;
        Mon, 05 Oct 2020 21:31:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bf49:: with SMTP id g9ls7728188edk.1.gmail; Mon, 05 Oct
 2020 21:31:46 -0700 (PDT)
X-Received: by 2002:aa7:de97:: with SMTP id j23mr3357215edv.45.1601958706607;
        Mon, 05 Oct 2020 21:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958706; cv=none;
        d=google.com; s=arc-20160816;
        b=FJddXIe85zpO5L/SYTLUZjCO+PfO/t8qhIEpjCI5oTOElYqypKGye7452wmvF+xw9a
         UFPe4xo6LqYGRJXWeQpqzQ4TrVus/fxpcLlgDlgFlHApcAsIC41NgNKZHpU/qDEYpF7z
         GnF1V53Ik2BzjfJIpo//vd271w5dOAdA84oXe+2hyzzPCFACAujAeA+ZHxXuX1vKj/95
         inX58wxgx2R3X7Y52b5OMpCsJ/QOzwpxqa5Gqcmy9r6rWASBQirr2y1gNkhfvsSB0rpf
         Hvfuh0lb9quFgG6hRG/EhsBNGmlu43DgRVZNdAlfMcbl8njBkPoSSZErLUvEMQbVKo8b
         zG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=jOq/OEtlrYC+3wxUV6lb/j0DJQXfGZi7zigpgBFVtzA=;
        b=krEffOlsdb3afs3EkceqiHYt+FMFpISWU2Bj4HUZ8Z8XY9BxipSCmtrc/s9WGFhatS
         PcHl+ZHrl85iFyeMppGnJW8kFb4uEXxDNFhrNwDI+mlNVDYKprgKo2Vo8+gEvUtRc8U2
         S6CaWyuJiJft/AG6a2Fmppz+ptHrtperbfGFtau1LISE0QuEecuTdixqME/3Dyr6kZ0W
         BAm4LYwIfyEPHrcKpOe0Zxfa4zBppevIdAS1JZnzLVNBFwu+cTKjgHL2z7Ep/5GiyJhG
         GecyUriOtjYSjYzcQw8Xw16PgXf/nS47KtXHOOnrS/yPrZGIHQalKiaAOwICaWKXFZ+6
         9qJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id lf25si32317ejb.0.2020.10.05.21.31.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964VkYa020152
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:46 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7q008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:45 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 06/19] wilc: Add out-of-tree wifi driver for Ultra96-v2
Date: Tue,  6 Oct 2020 06:31:21 +0200
Message-Id: <b293faaff3a3d2f6969d7b48013a091212a0ffc1.1601958694.git.jan.kiszka@siemens.com>
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

The v2 has a different driver than the v1, which apparently had
regulatory reasons. The big downside is that the driver is not yet
mainline. Pick up the fork that Avnet generated for the Ultra96-v2 for
now. This should be clean up later by moving to the original downstream
version or to upstream once the wilc1000 support there is expanded.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/wilc/files/debian/wilc.install |  1 +
 recipes-kernel/wilc/wilc_15.2-avnet.bb        | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-kernel/wilc/files/debian/wilc.install
 create mode 100644 recipes-kernel/wilc/wilc_15.2-avnet.bb

diff --git a/recipes-kernel/wilc/files/debian/wilc.install b/recipes-kernel/wilc/files/debian/wilc.install
new file mode 100644
index 0000000..4a5b92e
--- /dev/null
+++ b/recipes-kernel/wilc/files/debian/wilc.install
@@ -0,0 +1 @@
+../../*.bin /lib/firmware/mchp/
diff --git a/recipes-kernel/wilc/wilc_15.2-avnet.bb b/recipes-kernel/wilc/wilc_15.2-avnet.bb
new file mode 100644
index 0000000..1a1d680
--- /dev/null
+++ b/recipes-kernel/wilc/wilc_15.2-avnet.bb
@@ -0,0 +1,33 @@
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
+require recipes-kernel/linux-module/module.inc
+
+FIRMWARE_REV = "a67c351f9028c7a559330365c649a07721965cd4"
+
+SRC_URI += " \
+    git://github.com/Avnet/u96v2-wilc-driver;protocol=https;branch=v15_2 \
+    https://github.com/linux4wilc/firmware/raw/${FIRMWARE_REV}/wilc3000_wifi_firmware.bin;name=firmware \
+    file://debian/wilc.install"
+SRCREV = "01ab7484e0e6b2191c69d7ec7c6e89da5ca51f0f"
+SRC_URI[firmware.sha256sum] = "8cc0328e80d8e0e96b295777b58e7f48fea25d29808df6dd0fabd3ea283b3da1"
+
+S = "${WORKDIR}/git/wilc"
+
+AUTOLOAD = "wilc-sdio"
+
+do_prepare_build_append() {
+    mv ${S}/debian/wilc.install ${S}/debian/wilc-${KERNEL_NAME}.install
+}
+
+dpkg_runbuild_prepend() {
+    export CONFIG_WILC_SDIO=m
+}
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b293faaff3a3d2f6969d7b48013a091212a0ffc1.1601958694.git.jan.kiszka%40siemens.com.
