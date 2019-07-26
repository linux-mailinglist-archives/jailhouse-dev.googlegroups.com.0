Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBMEO5TUQKGQEU2AUXHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 474DD76A73
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 15:59:13 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id e6sf25594418wrv.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564149553; cv=pass;
        d=google.com; s=arc-20160816;
        b=oWsNjc7VlF63QxIlS8ALaiwDOuWH7ZUemtt/hkCW8uAuczaK5+/BZCfkK+eqNeQZOJ
         i3xNF3yZn/oZjh8TKq7WzGFlGK8uFHKkJyfe2IIfFyR1aMbQYT4LYtL23hLnKDwJk2jG
         jek6Fov1feYWgaIYWiemnHi6DiWYzAw138LC3yGVxeKBO2cB49rMdd7NOia56+Alzmjv
         99rZRETOfqBg73uh+mTvVFhz1/gCDNQ25Wv+Ftef65Nn7vdEsIKQaJ2V5RL29wWgeaRe
         dpdoHvd0/dTq072zxe9eDJuWzAGONGCm6sEHsnQj9JvTphKYbvNn9QWY+bk3X1sBU0oj
         fBEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=lBQ3UBJxezSlwMKVXYxpg2QdhM4xxLDfg2U1Q5dWkjA=;
        b=cYD95WjNChKvCoCoQpM/i50QmvTR8ac5KTsuLViG/HbjiG7UIkDswWOQTA6FW48uKk
         zyPu/hvmREnPb8VTMtyIpmWcSsrShrfqKj7GqJKnoqa//ydGpCJ3c2iIGk+O/8HqCiUA
         1xMqWfG3iqigizqLG6HIcDXPbk204l8YXBPUml5xxOCtDYjqkrbmGccradB5O3oshahU
         9krCuJjPY0vofSPmvyVcxBMW66p/znRIbcKULL91p9ChwM7hxRKhJDJEmbkQyZFOPkvJ
         ZUDuLRLKfyWtnwiP3eXN0bBcAD2NfrAF/reRxxleSf5wrV56IPTqegWwjsdto09hF3gc
         m6LA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lBQ3UBJxezSlwMKVXYxpg2QdhM4xxLDfg2U1Q5dWkjA=;
        b=SKEYaAZ4mlpJp7xf35PUaLnzEprI05gprvK5vvdCmqvrpekEp4TCutwotLWrsErllU
         Cw9q+FwtNNd0+xyERH0wT2CMD9yTUidRzpA5rpU+eWESkFHllX6yZ2FN/59GtWj9Kzph
         K9ocnZZdiVTwWK0okFo2ETrsHny/qgR0F+7EMMYz6asBFnffWLE15p63wmXTRm+/CS0i
         sh8ckKuMU0KQWjdWsfgSfcX0HugpZq8tHXjMWVednJZnjSYgXi8hRBOm/WpgSJP85NTu
         zqHjvv1lf1+PtGWbKt5GQnqoThq72BYQTCIq32RHM05JCUDs3njHROj0V2qpascKw8VF
         4sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lBQ3UBJxezSlwMKVXYxpg2QdhM4xxLDfg2U1Q5dWkjA=;
        b=CWlnXaSuiSjtaZ/hMr0wk+PDTi3qntK+J/98nc72mVP09xY6w/G531/fLc3U1/fk4O
         Fhzh9zUC8guAR4YpGWbYehNvJiDEqYA2bV8dZVOayEyxivTu2KH+gG5i8QZ7gsdmjdLa
         sonyMAq64l+06rQUIEp+plCKTIDC5jN5VWJuuO+cDTxXCtLUjM7F0QcDsZT5cQs22Wkk
         xUGj0QABdtVuPQR60Di07wVD6wSOninwlrMfq9heWgIRWcehxBH3IHPyEQu+pqlmSHxB
         FYnBZxxP3urh+WNYJFGq/RHCkMY8QDS1PLOsJP9rYF4KmhUbe+ThcseFsw5W2g5kU1iH
         G/pQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX7U6guoQGOCJDlx4I7awSdTvIukaNoMpajHfwSiRBbs2UQv+mz
	TcnFz2NNIJRsf9NSljbiTmM=
X-Google-Smtp-Source: APXvYqzyCQREduN5R1qqoxTCmHawwKuZTbZN+ZTuP45wv5NiEle4m/ZGgK1+/XjnyVRl3KaoydjWiw==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr69010262wru.179.1564149552943;
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c05a:: with SMTP id u26ls18885278wmc.4.canary-gmail;
 Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
X-Received: by 2002:a1c:a01a:: with SMTP id j26mr49396781wme.112.1564149552136;
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564149552; cv=none;
        d=google.com; s=arc-20160816;
        b=MNLlgHnx+RjTnpiHr0F99xDyiDkuhLusi4BP9bVzzZnZBMIsG78vLOEQ0vzi8lRkN4
         b4meWNhZhlVziCSa1JZ+g+APqkRvSBK7OhJ+Ch1cOromMUN0O9uAPNT67zlrNzrrQOPg
         YZjRAl52Op58zeWZHNvvIm3YLp349o4xDJisTJ++67iXpJhhKcR/+X9L1xOsJmzQYU+S
         hIsTwONlETWWzzwYRhhxJl7fiRrPvB/Xx3t+AhrQEcFbUBGGleI/AvC5oLL9nANWn9HR
         iHHesSgrvY4s0eM7F6SHcg8GDoDbgSkw3eBMDwhX42kAy9ZmaUYpej7iUlgmNxozCUgA
         575w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=jRdSBdCeHbhRk47o0ll1uoN8bINpcKo++XT2mBZxtzk=;
        b=MMoPoboQ+5B0PnOU9hjVvTGMi3QHBzWrs3p2r12jCstn8G23qWqhEOed0UzRlpCKUG
         TFIULwltygjI+22J8NIHfmBx83KZ1DSOFcdyMIa1F8fhP3vP7LAW15048kxBlKqC2Yey
         g4or5nlk8PGqyPmVbOJcoR5jHacLcYMztKObst1AF2LWO3cYz+xeWXNufvk2SPUBkNRF
         jzNgCPfnfDvo8BJ6AX1PCRGLSHJuOQoLuC/QKwLgFAM4Ny7GXdFko4vtL3Ad1m9CGRxL
         jWbhnv+JVv2813Ov0Y05MdmFmlp9juBckfmotgK1/HrAgGOkjQsU0uaymifXSPUFE9CT
         x43w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id o4si1953283wrp.4.2019.07.26.06.59.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45w9g34vwHzy7F;
	Fri, 26 Jul 2019 15:59:11 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 1/5] configs: arm64: don't set .pio_bitmap_size
Date: Fri, 26 Jul 2019 15:59:07 +0200
Message-Id: <20190726135911.16810-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
References: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.26.135117, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.26.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Needles to set them to zero:
  a) The compiler will do it for us
  b) ARM64 won't use it

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/arm64/amd-seattle-gic-demo.c        | 1 -
 configs/arm64/amd-seattle-uart-demo.c       | 1 -
 configs/arm64/espressobin-gic-demo.c        | 1 -
 configs/arm64/foundation-v8-gic-demo.c      | 1 -
 configs/arm64/foundation-v8-linux-demo.c    | 1 -
 configs/arm64/foundation-v8-uart-demo.c     | 1 -
 configs/arm64/hikey-gic-demo.c              | 1 -
 configs/arm64/imx8mq-gic-demo.c             | 1 -
 configs/arm64/k3-am654-gic-demo.c           | 1 -
 configs/arm64/k3-am654-uart-demo.c          | 1 -
 configs/arm64/macchiatobin-gic-demo.c       | 1 -
 configs/arm64/miriac-sbc-ls1046a-gic-demo.c | 1 -
 configs/arm64/qemu-arm64-gic-demo.c         | 1 -
 configs/arm64/ultra96-gic-demo.c            | 1 -
 configs/arm64/zynqmp-zcu102-gic-demo.c      | 1 -
 15 files changed, 15 deletions(-)

diff --git a/configs/arm64/amd-seattle-gic-demo.c b/configs/arm64/amd-seattle-gic-demo.c
index 5a4d726a..7cc871a7 100644
--- a/configs/arm64/amd-seattle-gic-demo.c
+++ b/configs/arm64/amd-seattle-gic-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/amd-seattle-uart-demo.c b/configs/arm64/amd-seattle-uart-demo.c
index bcaac58d..a0b6b551 100644
--- a/configs/arm64/amd-seattle-uart-demo.c
+++ b/configs/arm64/amd-seattle-uart-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/espressobin-gic-demo.c b/configs/arm64/espressobin-gic-demo.c
index 6de940d7..e5da1997 100644
--- a/configs/arm64/espressobin-gic-demo.c
+++ b/configs/arm64/espressobin-gic-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/foundation-v8-gic-demo.c b/configs/arm64/foundation-v8-gic-demo.c
index 8b1ff1ac..44402a18 100644
--- a/configs/arm64/foundation-v8-gic-demo.c
+++ b/configs/arm64/foundation-v8-gic-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/foundation-v8-linux-demo.c b/configs/arm64/foundation-v8-linux-demo.c
index 2a448b49..842afe9f 100644
--- a/configs/arm64/foundation-v8-linux-demo.c
+++ b/configs/arm64/foundation-v8-linux-demo.c
@@ -31,7 +31,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 1,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/foundation-v8-uart-demo.c b/configs/arm64/foundation-v8-uart-demo.c
index da919d4a..ca78270b 100644
--- a/configs/arm64/foundation-v8-uart-demo.c
+++ b/configs/arm64/foundation-v8-uart-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/hikey-gic-demo.c b/configs/arm64/hikey-gic-demo.c
index c7ddf469..48a9634f 100644
--- a/configs/arm64/hikey-gic-demo.c
+++ b/configs/arm64/hikey-gic-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/imx8mq-gic-demo.c b/configs/arm64/imx8mq-gic-demo.c
index ae1877d0..02a2b480 100644
--- a/configs/arm64/imx8mq-gic-demo.c
+++ b/configs/arm64/imx8mq-gic-demo.c
@@ -27,7 +27,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/k3-am654-gic-demo.c b/configs/arm64/k3-am654-gic-demo.c
index 556b0b4a..9ced1007 100644
--- a/configs/arm64/k3-am654-gic-demo.c
+++ b/configs/arm64/k3-am654-gic-demo.c
@@ -31,7 +31,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/k3-am654-uart-demo.c b/configs/arm64/k3-am654-uart-demo.c
index 29a022e9..28dcf86c 100644
--- a/configs/arm64/k3-am654-uart-demo.c
+++ b/configs/arm64/k3-am654-uart-demo.c
@@ -31,7 +31,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/macchiatobin-gic-demo.c b/configs/arm64/macchiatobin-gic-demo.c
index 63e1e433..2bb1d85d 100644
--- a/configs/arm64/macchiatobin-gic-demo.c
+++ b/configs/arm64/macchiatobin-gic-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c b/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
index 6a93935f..73e8e891 100644
--- a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/qemu-arm64-gic-demo.c b/configs/arm64/qemu-arm64-gic-demo.c
index 9e51e821..7752167e 100644
--- a/configs/arm64/qemu-arm64-gic-demo.c
+++ b/configs/arm64/qemu-arm64-gic-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/ultra96-gic-demo.c b/configs/arm64/ultra96-gic-demo.c
index 403c6972..23bad983 100644
--- a/configs/arm64/ultra96-gic-demo.c
+++ b/configs/arm64/ultra96-gic-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
diff --git a/configs/arm64/zynqmp-zcu102-gic-demo.c b/configs/arm64/zynqmp-zcu102-gic-demo.c
index 15767396..138b3e44 100644
--- a/configs/arm64/zynqmp-zcu102-gic-demo.c
+++ b/configs/arm64/zynqmp-zcu102-gic-demo.c
@@ -30,7 +30,6 @@ struct {
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
-		.pio_bitmap_size = 0,
 		.num_pci_devices = 0,
 
 		.console = {
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190726135911.16810-2-ralf.ramsauer%40oth-regensburg.de.
