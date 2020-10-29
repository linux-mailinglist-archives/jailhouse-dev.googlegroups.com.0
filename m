Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6OJ5H6AKGQEKT7O4HA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C3529E399
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 07:45:14 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id 31sf854174wrg.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 23:45:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603953913; cv=pass;
        d=google.com; s=arc-20160816;
        b=ss3sY5CTmlvFlu4JNZ7MKJmcofycGXSvbwsK1vQn0OIfE1HtKIrNBqQLpRuRs11v+r
         I5ySHdgRmHbViMUykrQQ9RuPKZIsS8yAhvA2tpiW1XupOl3mx2ufd4lW80q4lpuTsko6
         th8WGuf3NHRKeZku0KFpyo+v/J8osanQfbY7r10fCNt5M2fHi+E9JnmuVsWflxkmkmrI
         nrN35AuPQYROTW/yTl1TYXGsAMEpW3LQ1fjhoLvDoDc614dqWLln/0hI4UxHAv8PjqDx
         l6GjdHKx5Oe19D8/jFZrNkP8okfOUpEkKij7PAlkseTEuA/7caSrX6WOWKVzWe3XMjwM
         qZEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=KjsIKafgkLfdBx5aIeHz0a4sJQnhnVY1Y8RSXinOJT4=;
        b=zijQpBfoNXSN9U/jaoGDD4iHeFNTxS2E6LsDvvggjJmno68YPtERu6/YrO96V510kN
         3NlTrNy9PPxJQrvNx0JHgCrwgihihU+aZ//0pXDJp53frYuI3P3A+c8WwE9E79Bjp9ba
         cXySyS1x/pd+NOx+S8wIPF8BfRdW5WUBcQVmdJmOYC+ZpRaZsA7368FZA/yrr0tFfN5p
         voBYGkuqNXpP8fpsadnBlA6QqmHGalOWj6Lmjca8+Ggdsrpr+AzCkB1mfmu9eqeD9Ug6
         x/slVwGDrPTomFj/+Z2HI+uJOEQOEdOM+sCraYouHpBHG8fusyUELI7dWwBpiSJ4dS6G
         br2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KjsIKafgkLfdBx5aIeHz0a4sJQnhnVY1Y8RSXinOJT4=;
        b=CyB2CRW+c+NcGn67OFpSP7ik8MiAWE0Mx/K/V/hoI8vL6cR10JK09iSVgdzQYlSjM2
         J+J0wVsSmckYWV22i8hccQNqv8grAg+JqCxF879Wrcd6PgCS+BVq/3JZnlDflhX6JmJY
         WVSyT81SIGFJkACYHMySH5o2LJrGZ7gHVAUaJg5hsXVh/tTU9WC1tTneKu526lI7lYVi
         g9Z4SnKIipSw5H9UNUpG7HA6ZO4lksmYJ0R//tOdC1p+sZ5v8YIJO/BXdSvD2z/y0L+s
         2V4GV/njw3hJAqDKZ8xg65JbdxLKSAvolCjvF3moFUl9DSjAKaeo/LCopozJUHOdRizx
         jzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KjsIKafgkLfdBx5aIeHz0a4sJQnhnVY1Y8RSXinOJT4=;
        b=IuRhaEXDau16XZ73O8xeEa7kcMLk/8tDGvlhb4tVeGEQYrWiM5IAC2YhxaxIYReOqw
         fkHH1Ldie50o7nh7n+qGXiLIpdZvmFyQrnSqN6lXGQS9ZhDhM4DI/UF+dht548kuHQlx
         8zdPNja5X6q4+gJCyKvKMr6QnfzL/hWuZjFBqlS+PNgPCOOTp33XM1k1qD4elPgeg8Yy
         NbOoy8rxxUT+Xb7rctDDHEYph5djIeACBACT3cWiBDHIktCSyyKMEhVuGhLeV+bS1ZpR
         xGgorP57gMY5n2RKQY3dl3c9jQcP2G03Lo9WbuRf17KlQGYuJbpPOCECmVFbASfnENf6
         6aKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5336AOVgAzGWSKDC/kemxz2su4HsiL1TWtFZI6jf7ZAIM2HrJnDf
	gFwmo4nnt+2r9GeYd5tzx2o=
X-Google-Smtp-Source: ABdhPJy0SbySoSGtID+bTBsgEb2zxVTB/8rlCC1ZvIpB0kDtYydpFeD2PrYmMuLdtHdFlhW4pKKaUg==
X-Received: by 2002:a1c:6843:: with SMTP id d64mr2677756wmc.131.1603953913749;
        Wed, 28 Oct 2020 23:45:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f7c4:: with SMTP id a4ls1689751wrq.1.gmail; Wed, 28 Oct
 2020 23:45:12 -0700 (PDT)
X-Received: by 2002:adf:8544:: with SMTP id 62mr3207689wrh.18.1603953912648;
        Wed, 28 Oct 2020 23:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603953912; cv=none;
        d=google.com; s=arc-20160816;
        b=pOpZdU+D6WsrzHloyZdX9Aox0Rif7HDp05lsXhoqi+WyQlDIxsR/A9TTKohzqyEL8e
         50kjtWtN1Xy8xnVp/nk3r67JoauvWIYJwDDrVjLZrfvpoY3BxXlC6wO1nZN1d9eSD7sD
         Tr8RdiQ48rQIdip9CVXeCptInbw4HH9fzawV3NP8FUE0qUJW439H3odtkmZLx3qe+GaZ
         eRGwGxKdS7VDDaXt/eGu0eF+O26LXHTOK0zFYWWa7B20TNCx+fxaQYtCOqXDSiR040++
         Lpjn0ifyiMFWmbeG2WkxzKSnbwwhDPa1HghOwACGZEmNoGdhT7G4NGIV31WfsnQoAYRI
         77zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=elfmWyQp/yvgmZGd/+qe67jO/ktUEtO8wIQjAi2v6pE=;
        b=xbXYsSVwmT5qrpqaQfQxxf909NLsrLXlvIE2puNdYHGxlVZdsjBOln8CSqU/cdmKP9
         DorWAZdLmXwIXuix1uFZheJAqAeRl7mA/q0pPnEfp4HyF4V/ygky98CGP4eBChn51Hsa
         TfyzWAeyzHmX0H1WdHLVggKyAfaVoL7ooV7FKLB/nSgr41QqZzN/34hXZcHWqxKWPUTC
         dRSZviV/JaTwjdnQUwSYJEhiRvf/SSvVRZFM3JSHZpPhCbK9K22Y2y6QtfSStoi5gOW5
         RxovpeUML8tonNczq63VrwjnvL/VK7osPV3FzfmXY2Id+zqLXrD/1mcORgLGIXLTYxAT
         EIew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id n19si29667wmk.1.2020.10.28.23.45.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 23:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09T6jCci021729
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 29 Oct 2020 07:45:12 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09T6j5wT023506
	for <jailhouse-dev@googlegroups.com>; Thu, 29 Oct 2020 07:45:10 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [jh-images][PATCH] customizations: Resolve the securetty issue
 generically
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <6d96ab6e-d12e-2dbb-beb2-e0cbfb17547c@siemens.com>
Date: Thu, 29 Oct 2020 07:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

In bullseye, this file is gone, and simply removing it from the target
image helps to deal with missing ttys for all targets.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/customizations/customizations.bb       |  5 +----
 .../files/{postinst-common => postinst}             |  5 ++++-
 .../customizations/files/postinst-espressobin       | 13 -------------
 recipes-core/customizations/files/postinst-hikey620 |  1 -
 recipes-core/customizations/files/postinst-ipc127e  |  1 -
 .../customizations/files/postinst-macchiatobin      |  1 -
 recipes-core/customizations/files/postinst-nuc6cay  |  1 -
 .../customizations/files/postinst-orangepi-zero     |  1 -
 .../customizations/files/postinst-pine64-plus       |  1 -
 .../customizations/files/postinst-qemu-amd64        |  1 -
 .../customizations/files/postinst-qemu-arm64        |  1 -
 recipes-core/customizations/files/postinst-rpi4     |  1 -
 .../customizations/files/postinst-ultra96-v1        | 12 ------------
 .../customizations/files/postinst-ultra96-v2        |  1 -
 14 files changed, 5 insertions(+), 40 deletions(-)
 rename recipes-core/customizations/files/{postinst-common => postinst} (82%)
 delete mode 100644 recipes-core/customizations/files/postinst-espressobin
 delete mode 100644 recipes-core/customizations/files/postinst-hikey620
 delete mode 100644 recipes-core/customizations/files/postinst-ipc127e
 delete mode 100644 recipes-core/customizations/files/postinst-macchiatobin
 delete mode 100644 recipes-core/customizations/files/postinst-nuc6cay
 delete mode 100644 recipes-core/customizations/files/postinst-orangepi-zero
 delete mode 100644 recipes-core/customizations/files/postinst-pine64-plus
 delete mode 100644 recipes-core/customizations/files/postinst-qemu-amd64
 delete mode 100644 recipes-core/customizations/files/postinst-qemu-arm64
 delete mode 100644 recipes-core/customizations/files/postinst-rpi4
 delete mode 100644 recipes-core/customizations/files/postinst-ultra96-v1
 delete mode 120000 recipes-core/customizations/files/postinst-ultra96-v2

diff --git a/recipes-core/customizations/customizations.bb b/recipes-core/customizations/customizations.bb
index 313c6d2..f71a078 100644
--- a/recipes-core/customizations/customizations.bb
+++ b/recipes-core/customizations/customizations.bb
@@ -19,8 +19,7 @@ include local.inc
 DESCRIPTION = "demo image customizations"
 
 SRC_URI = " \
-    file://postinst-common \
-    file://postinst-${MACHINE} \
+    file://postinst \
     file://.bash_history-${MACHINE} \
     file://e1000e-intx.conf \
     file://ethernet \
@@ -50,6 +49,4 @@ do_install() {
 
 	install -v -d -m 700 ${D}/root/.ssh
 	install -v -m 644 ${WORKDIR}/known_hosts ${D}/root/.ssh/
-
-	cat ${WORKDIR}/postinst-common ${WORKDIR}/postinst-${MACHINE} > ${WORKDIR}/postinst
 }
diff --git a/recipes-core/customizations/files/postinst-common b/recipes-core/customizations/files/postinst
similarity index 82%
rename from recipes-core/customizations/files/postinst-common
rename to recipes-core/customizations/files/postinst
index 18b9568..cbf451f 100644
--- a/recipes-core/customizations/files/postinst-common
+++ b/recipes-core/customizations/files/postinst
@@ -2,7 +2,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2018
+# Copyright (c) Siemens AG, 2018-2020
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -23,3 +23,6 @@ sed -i ':restart /\\$/N;s/\\\n[ ]*//;t restart' /root/.bash_history
 echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
 
 echo "demo" > /etc/hostname
+
+# this helps with ttys not know to this file (removed upstream with bullseye)
+rm -f /etc/securetty
diff --git a/recipes-core/customizations/files/postinst-espressobin b/recipes-core/customizations/files/postinst-espressobin
deleted file mode 100644
index 4b446a2..0000000
--- a/recipes-core/customizations/files/postinst-espressobin
+++ /dev/null
@@ -1,13 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-# workaround for Debian Bug#879903
-echo "ttyMV0" >> /etc/securetty
diff --git a/recipes-core/customizations/files/postinst-hikey620 b/recipes-core/customizations/files/postinst-hikey620
deleted file mode 100644
index 2dde661..0000000
--- a/recipes-core/customizations/files/postinst-hikey620
+++ /dev/null
@@ -1 +0,0 @@
-# Nothing to do
diff --git a/recipes-core/customizations/files/postinst-ipc127e b/recipes-core/customizations/files/postinst-ipc127e
deleted file mode 100644
index 2dde661..0000000
--- a/recipes-core/customizations/files/postinst-ipc127e
+++ /dev/null
@@ -1 +0,0 @@
-# Nothing to do
diff --git a/recipes-core/customizations/files/postinst-macchiatobin b/recipes-core/customizations/files/postinst-macchiatobin
deleted file mode 100644
index 2dde661..0000000
--- a/recipes-core/customizations/files/postinst-macchiatobin
+++ /dev/null
@@ -1 +0,0 @@
-# Nothing to do
diff --git a/recipes-core/customizations/files/postinst-nuc6cay b/recipes-core/customizations/files/postinst-nuc6cay
deleted file mode 100644
index 2dde661..0000000
--- a/recipes-core/customizations/files/postinst-nuc6cay
+++ /dev/null
@@ -1 +0,0 @@
-# Nothing to do
diff --git a/recipes-core/customizations/files/postinst-orangepi-zero b/recipes-core/customizations/files/postinst-orangepi-zero
deleted file mode 100644
index 2dde661..0000000
--- a/recipes-core/customizations/files/postinst-orangepi-zero
+++ /dev/null
@@ -1 +0,0 @@
-# Nothing to do
diff --git a/recipes-core/customizations/files/postinst-pine64-plus b/recipes-core/customizations/files/postinst-pine64-plus
deleted file mode 100644
index 2dde661..0000000
--- a/recipes-core/customizations/files/postinst-pine64-plus
+++ /dev/null
@@ -1 +0,0 @@
-# Nothing to do
diff --git a/recipes-core/customizations/files/postinst-qemu-amd64 b/recipes-core/customizations/files/postinst-qemu-amd64
deleted file mode 100644
index 2dde661..0000000
--- a/recipes-core/customizations/files/postinst-qemu-amd64
+++ /dev/null
@@ -1 +0,0 @@
-# Nothing to do
diff --git a/recipes-core/customizations/files/postinst-qemu-arm64 b/recipes-core/customizations/files/postinst-qemu-arm64
deleted file mode 100644
index 2dde661..0000000
--- a/recipes-core/customizations/files/postinst-qemu-arm64
+++ /dev/null
@@ -1 +0,0 @@
-# Nothing to do
diff --git a/recipes-core/customizations/files/postinst-rpi4 b/recipes-core/customizations/files/postinst-rpi4
deleted file mode 100644
index 2dde661..0000000
--- a/recipes-core/customizations/files/postinst-rpi4
+++ /dev/null
@@ -1 +0,0 @@
-# Nothing to do
diff --git a/recipes-core/customizations/files/postinst-ultra96-v1 b/recipes-core/customizations/files/postinst-ultra96-v1
deleted file mode 100644
index b23b885..0000000
--- a/recipes-core/customizations/files/postinst-ultra96-v1
+++ /dev/null
@@ -1,12 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-echo "ttyPS0" >> /etc/securetty
diff --git a/recipes-core/customizations/files/postinst-ultra96-v2 b/recipes-core/customizations/files/postinst-ultra96-v2
deleted file mode 120000
index 1bc8b3c..0000000
--- a/recipes-core/customizations/files/postinst-ultra96-v2
+++ /dev/null
@@ -1 +0,0 @@
-postinst-ultra96-v1
\ No newline at end of file
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6d96ab6e-d12e-2dbb-beb2-e0cbfb17547c%40siemens.com.
