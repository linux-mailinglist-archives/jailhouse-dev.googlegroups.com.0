Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZUDUPTAKGQEDHL4VJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B610202
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 23:45:16 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id x6sf3080579wmb.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 14:45:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556660711; cv=pass;
        d=google.com; s=arc-20160816;
        b=yf00KMRVPBjdOsT5YTdkcCFwDYmQNXWqyQMJ4mT669UFNQM+aL0OUo0Q0LY8MPmCsn
         68GybiC1jMN/FJqYzD7fv6qNBV05Lt+1UrQE0gOgSF03QgMtz3jCYJVoHdFoEvOA+C6M
         0j23Oczqwp+Dq1GDkmc8nFrA+IYxXg/bT4Z49s6T+j6RWDCSys7YL0EsEyGXgyP0iaps
         YbN2IvzDMFIqiIGnQ4IXMPNhkHyTijaFIFVZaqrbXKftVhRu1x4qVs5W+aXzXK1HDmgw
         4vLkHf5BW68+ql0MAw7JFgj7Bf7nzO5Wzc3KrFptFCxJfRawrDawPx8fq9jNyi+yExKB
         f8Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=UfQDgSh0L5JRtMGsNVUNAaEUg0dyDF4UoVGzkPks5wc=;
        b=wCUcg9k7a7FSj6fX1yHk1+p1Si4Gar1NuRY2oJhPaTG3QayeVXKJFkemgN9kxTulEQ
         z+MqMcSel4tVVgTLyjLJnouSFdLxznaM5ry0gU5sN/LrBusM5trKaPdzuSBgb/iwpYet
         wBE3MiNgW9FlLX+BEQ4P5wyqogflyIBIOPoAitdkAjfpNjPDQ75NES2SrXzLxi3BhhHe
         7fcLHYCA4W8cEnRcGnLQPEigk3aYo2TJEl8DB/HKbzsrBdxmPhW9Rgmmyp+Kk8EVEYcX
         cGcs8N7+SjEbc7FB7RHVbLyhHaz9S9f4XdtfdlzDY8/XCdTMm03m66phAGEDWga22PpK
         zmEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UfQDgSh0L5JRtMGsNVUNAaEUg0dyDF4UoVGzkPks5wc=;
        b=CbSbWQaXLsFKiTeoyX4XPaLliHztgHPqQhxr95KZPkzxGLcE3WxppYYVMvuQAwVNJe
         gZpGpphh1kn7eRWyybcUmlHka2p12pP+XS0nEo/YX5OWQDse1YDtYNJ3tRV3sOK3O6SO
         ojOEu6Z7XnJez7vWKDMWdckljVQJJqt5zHtbpT3YAaiOiopnMwq4P3zdniGIq3D8mdZq
         /qRmxleZAzYm3AWDHjy7ob/Xy2B9kdQdRPrb+eTVJYvJOESb2Vao0CULN+naK/ThoPbv
         ppKfezm3dkDQYXHCmpoSd9+PaYYQr+JKGWzBRcQ3Rs0gDamwxgCqGxWWbZwAlkMISW46
         tZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UfQDgSh0L5JRtMGsNVUNAaEUg0dyDF4UoVGzkPks5wc=;
        b=lkNxHIQWce+sZUFWu9n9uPgGDyBN0ujnDQ2aOJeg2e3QKWaoUqAYDUtb1Z5jrnAQhX
         9PvCGeGxBx23U15NZB+j1MuuwKmahhUO6rFcr8Z4kzvy1+xZtUgoJBiTiB4GI0z092U7
         phnkTljFWMrosadiioQgA3KAMQKBY5aBafnkk1gWWeH/5DfFnRjEpWw2YcpsmdAGAWXW
         kwWnX5w+IysFWUFgn3KXxocXd39WAIEmhNh7Jlqn1Zr5wm3xA/mjChSFyieyRPkS5vpN
         wgL7i9ESxQ4PGigqATPr3QoTD+4pzbUga0f7oUvpWdqN3Jvo//GIiezqEYah2X0G6Khv
         iKmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXMBUM1wHhvO0MEq6ZLpGs1rxrNlL19jMX1TBcLJDhopq/Rkic5
	P1CiBM2/LzkOBdL9I2boi0Y=
X-Google-Smtp-Source: APXvYqxXyvIfJ/vz7rZw1bsZrLkGO4jMmd4AxWYzT0xEKtyUNw7MEvz6dLNkHoLlmQkhBBdJdP/oBg==
X-Received: by 2002:adf:cd90:: with SMTP id q16mr24037778wrj.75.1556660710894;
        Tue, 30 Apr 2019 14:45:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5287:: with SMTP id c7ls6989931wrv.6.gmail; Tue, 30 Apr
 2019 14:45:10 -0700 (PDT)
X-Received: by 2002:adf:c503:: with SMTP id q3mr12685839wrf.263.1556660710346;
        Tue, 30 Apr 2019 14:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556660710; cv=none;
        d=google.com; s=arc-20160816;
        b=Gij5mzFxNfTiCBvYsHruQBfK5qfzUxVi4uwOnxpHDhYy9OQMwRR7T+G0PWChlZS4PV
         FZ71bkoCwDpueX7u5iio26KSkUAI9SFR5OFOXXeCm1cJZrtDnwbpUJd7wcqugI3lSxa4
         nNZOHoyOB1kh8IRka5ORlTc0VG2QAPAujXqzhGVYq8bEoS8I5K4dzAQicJlfOxaYnG41
         B6DCK563OFWPhgiLk9zO2hwNEMwRmmU8WZ+F5+VgYB26evXSco0iDzQFLNEKqpnBl1Iq
         iLZVqfjsBjc4+FG2ISCpipZ6Y1HFyzLn9vW+jL9/pafcUGfrVZNN4M0ZRnhI9289gT/K
         SKCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=j/yRnDf9LFCS78x3lAK/xlfVrMhjRlqevFUonTZoMTI=;
        b=Hw0FxgEch6jU/QHQ/GHe1ZrOSb3vMzgY2VTyDsh1IK4xSINBi7uw8Y9NMCt/67zAUq
         tnLR0R/CeF0SdtuwwMcN/tsm14ldcPVc0DFKj7YgX3g2iKDSEfA7RVOWb0Bj/fPOaU9f
         Kc2byO7UJoohcGNe5miFhtuFydyYQ8YPNnxMMlMghVCDM9henoc2pqg5BLWOBwQllwLt
         daOinfny2TXRg2vv2toblQ/uG4V1zox7E/yj4m6R6iiy5QBQD/BQc/LywP3jyp2XTpai
         Jm9ZwnbfT55yGifbt1VkX2dUBXH+VM4PqNihkrj8Vh2V6dM7ZoMCjkfvJHUlYSc58Fi5
         EITQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id n21si126441wmh.4.2019.04.30.14.45.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 14:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44tw6s64ydzyBR;
	Tue, 30 Apr 2019 23:45:09 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 1/5] configs: define ARRAY_SIZE in cell-config.h
Date: Tue, 30 Apr 2019 23:45:00 +0200
Message-Id: <20190430214504.2153-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.4.30.213616, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.4.30.5600002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

instead of defining this useful macro in every single config file.

There's only one quirk: ARRAY_SIZE is defined for hypervisor code in util.h,
which we can't include in cell-config.h, as it's GPL-only. So we have to
duplicate the definitions, which might lead to redefinitions of the macro.
Hence, surround the macro by guards.

Also remove the macro from the root cell template.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/arm/bananapi-gic-demo.c               | 2 --
 configs/arm/bananapi-linux-demo.c             | 2 --
 configs/arm/bananapi-uart-demo.c              | 2 --
 configs/arm/bananapi.c                        | 2 --
 configs/arm/emtrion-rzg1e-linux-demo.c        | 2 --
 configs/arm/emtrion-rzg1e-uart-demo.c         | 2 --
 configs/arm/emtrion-rzg1e.c                   | 2 --
 configs/arm/emtrion-rzg1h-linux-demo.c        | 2 --
 configs/arm/emtrion-rzg1h-uart-demo.c         | 2 --
 configs/arm/emtrion-rzg1h.c                   | 2 --
 configs/arm/emtrion-rzg1m-linux-demo.c        | 2 --
 configs/arm/emtrion-rzg1m-uart-demo.c         | 2 --
 configs/arm/emtrion-rzg1m.c                   | 2 --
 configs/arm/jetson-tk1-demo.c                 | 2 --
 configs/arm/jetson-tk1-linux-demo.c           | 2 --
 configs/arm/jetson-tk1.c                      | 2 --
 configs/arm/orangepi0-gic-demo.c              | 2 --
 configs/arm/orangepi0-linux-demo.c            | 2 --
 configs/arm/orangepi0.c                       | 2 --
 configs/arm64/amd-seattle-gic-demo.c          | 2 --
 configs/arm64/amd-seattle-linux-demo.c        | 2 --
 configs/arm64/amd-seattle-uart-demo.c         | 2 --
 configs/arm64/amd-seattle.c                   | 2 --
 configs/arm64/espressobin-gic-demo.c          | 2 --
 configs/arm64/espressobin-linux-demo.c        | 2 --
 configs/arm64/espressobin.c                   | 2 --
 configs/arm64/foundation-v8-gic-demo.c        | 2 --
 configs/arm64/foundation-v8-linux-demo.c      | 2 --
 configs/arm64/foundation-v8-uart-demo.c       | 2 --
 configs/arm64/foundation-v8.c                 | 2 --
 configs/arm64/hikey-gic-demo.c                | 2 --
 configs/arm64/hikey-linux-demo.c              | 2 --
 configs/arm64/hikey.c                         | 2 --
 configs/arm64/imx8mq-gic-demo.c               | 2 --
 configs/arm64/imx8mq.c                        | 2 --
 configs/arm64/jetson-tx1-demo.c               | 2 --
 configs/arm64/jetson-tx1-linux-demo.c         | 2 --
 configs/arm64/jetson-tx1.c                    | 2 --
 configs/arm64/jetson-tx2-demo.c               | 2 --
 configs/arm64/jetson-tx2.c                    | 2 --
 configs/arm64/k3-am654-gic-demo.c             | 2 --
 configs/arm64/k3-am654-idk-linux-demo.c       | 2 --
 configs/arm64/k3-am654-idk.c                  | 2 --
 configs/arm64/k3-am654-uart-demo.c            | 2 --
 configs/arm64/macchiatobin-gic-demo.c         | 2 --
 configs/arm64/macchiatobin-linux-demo.c       | 2 --
 configs/arm64/macchiatobin.c                  | 2 --
 configs/arm64/miriac-sbc-ls1046a-gic-demo.c   | 2 --
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c | 2 --
 configs/arm64/miriac-sbc-ls1046a.c            | 2 --
 configs/arm64/qemu-arm64-gic-demo.c           | 2 --
 configs/arm64/qemu-arm64-linux-demo.c         | 2 --
 configs/arm64/qemu-arm64.c                    | 2 --
 configs/arm64/ultra96-gic-demo.c              | 2 --
 configs/arm64/ultra96-linux-demo.c            | 2 --
 configs/arm64/ultra96.c                       | 2 --
 configs/arm64/zynqmp-zcu102-gic-demo.c        | 2 --
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 2 --
 configs/arm64/zynqmp-zcu102-linux-demo.c      | 2 --
 configs/arm64/zynqmp-zcu102.c                 | 2 --
 configs/x86/apic-demo.c                       | 2 --
 configs/x86/e1000-demo.c                      | 2 --
 configs/x86/f2a88xm-hd3.c                     | 2 --
 configs/x86/imb-a180.c                        | 2 --
 configs/x86/ioapic-demo.c                     | 2 --
 configs/x86/ivshmem-demo.c                    | 2 --
 configs/x86/linux-x86-demo.c                  | 2 --
 configs/x86/pci-demo.c                        | 2 --
 configs/x86/qemu-x86.c                        | 2 --
 configs/x86/smp-demo.c                        | 2 --
 configs/x86/tiny-demo.c                       | 2 --
 hypervisor/include/jailhouse/utils.h          | 2 ++
 include/jailhouse/cell-config.h               | 4 ++++
 tools/root-cell-config.c.tmpl                 | 2 --
 74 files changed, 6 insertions(+), 144 deletions(-)

diff --git a/configs/arm/bananapi-gic-demo.c b/configs/arm/bananapi-gic-demo.c
index 757d9503..855a72a7 100644
--- a/configs/arm/bananapi-gic-demo.c
+++ b/configs/arm/bananapi-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index e9e584f2..fd1931f3 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/bananapi-uart-demo.c b/configs/arm/bananapi-uart-demo.c
index aeec6f8d..0621ca52 100644
--- a/configs/arm/bananapi-uart-demo.c
+++ b/configs/arm/bananapi-uart-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index e7e6bb1e..ffc4589c 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index ea638989..1bf08b66 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/emtrion-rzg1e-uart-demo.c b/configs/arm/emtrion-rzg1e-uart-demo.c
index a2590adb..42c74127 100644
--- a/configs/arm/emtrion-rzg1e-uart-demo.c
+++ b/configs/arm/emtrion-rzg1e-uart-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index 0a38ed8d..e3872cf2 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index 61c58666..ad2dceeb 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/emtrion-rzg1h-uart-demo.c b/configs/arm/emtrion-rzg1h-uart-demo.c
index d8076be5..f20c94cb 100644
--- a/configs/arm/emtrion-rzg1h-uart-demo.c
+++ b/configs/arm/emtrion-rzg1h-uart-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index a23e1589..03e1be5b 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index 0c3d0cfd..d8b8441a 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/emtrion-rzg1m-uart-demo.c b/configs/arm/emtrion-rzg1m-uart-demo.c
index 3a0eda5c..c89c1d82 100644
--- a/configs/arm/emtrion-rzg1m-uart-demo.c
+++ b/configs/arm/emtrion-rzg1m-uart-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index f97805f7..84d68f62 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm/jetson-tk1-demo.c b/configs/arm/jetson-tk1-demo.c
index 7562222c..57ea5a3d 100644
--- a/configs/arm/jetson-tk1-demo.c
+++ b/configs/arm/jetson-tk1-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 #ifndef CONFIG_INMATE_BASE
 #define CONFIG_INMATE_BASE 0x0
 #endif
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index 16d79774..7ee83f7a 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index 9e2e23f9..7374ef44 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -18,8 +18,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm/orangepi0-gic-demo.c b/configs/arm/orangepi0-gic-demo.c
index 45c38425..51b3bf8b 100644
--- a/configs/arm/orangepi0-gic-demo.c
+++ b/configs/arm/orangepi0-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index e7154078..49ee10e9 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index 9eca773d..e45c8d62 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/amd-seattle-gic-demo.c b/configs/arm64/amd-seattle-gic-demo.c
index d407d6e3..5a4d726a 100644
--- a/configs/arm64/amd-seattle-gic-demo.c
+++ b/configs/arm64/amd-seattle-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index 96edbc4f..5349323c 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/amd-seattle-uart-demo.c b/configs/arm64/amd-seattle-uart-demo.c
index 61073486..bcaac58d 100644
--- a/configs/arm64/amd-seattle-uart-demo.c
+++ b/configs/arm64/amd-seattle-uart-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index 911ae1da..b5cff3b3 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/espressobin-gic-demo.c b/configs/arm64/espressobin-gic-demo.c
index 452ab668..6de940d7 100644
--- a/configs/arm64/espressobin-gic-demo.c
+++ b/configs/arm64/espressobin-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index c0b09981..92da96e9 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index d620080d..a23dc24b 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -17,8 +17,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/foundation-v8-gic-demo.c b/configs/arm64/foundation-v8-gic-demo.c
index 5d69e01e..8b1ff1ac 100644
--- a/configs/arm64/foundation-v8-gic-demo.c
+++ b/configs/arm64/foundation-v8-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/foundation-v8-linux-demo.c b/configs/arm64/foundation-v8-linux-demo.c
index 86fe8ada..2a448b49 100644
--- a/configs/arm64/foundation-v8-linux-demo.c
+++ b/configs/arm64/foundation-v8-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/foundation-v8-uart-demo.c b/configs/arm64/foundation-v8-uart-demo.c
index f057fbbc..da919d4a 100644
--- a/configs/arm64/foundation-v8-uart-demo.c
+++ b/configs/arm64/foundation-v8-uart-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/foundation-v8.c b/configs/arm64/foundation-v8.c
index 5109929f..7a632491 100644
--- a/configs/arm64/foundation-v8.c
+++ b/configs/arm64/foundation-v8.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/hikey-gic-demo.c b/configs/arm64/hikey-gic-demo.c
index 908b0c71..c7ddf469 100644
--- a/configs/arm64/hikey-gic-demo.c
+++ b/configs/arm64/hikey-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index 71bc7c82..76dda9da 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index bcfbe188..7e6bb952 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/imx8mq-gic-demo.c b/configs/arm64/imx8mq-gic-demo.c
index 041751c0..ae1877d0 100644
--- a/configs/arm64/imx8mq-gic-demo.c
+++ b/configs/arm64/imx8mq-gic-demo.c
@@ -13,8 +13,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
index 95b4b363..7d113264 100644
--- a/configs/arm64/imx8mq.c
+++ b/configs/arm64/imx8mq.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/jetson-tx1-demo.c b/configs/arm64/jetson-tx1-demo.c
index 446b1a6d..b16b9ba7 100644
--- a/configs/arm64/jetson-tx1-demo.c
+++ b/configs/arm64/jetson-tx1-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index 4a643873..b8698259 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -18,8 +18,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 #ifndef CONFIG_INMATE_BASE
 #define CONFIG_INMATE_BASE 0x0
 #endif
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index d4a00daf..d1fb21b8 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -18,8 +18,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/jetson-tx2-demo.c b/configs/arm64/jetson-tx2-demo.c
index 6e09226c..d500e124 100644
--- a/configs/arm64/jetson-tx2-demo.c
+++ b/configs/arm64/jetson-tx2-demo.c
@@ -11,8 +11,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/jetson-tx2.c b/configs/arm64/jetson-tx2.c
index 814a4b08..c2e17e67 100644
--- a/configs/arm64/jetson-tx2.c
+++ b/configs/arm64/jetson-tx2.c
@@ -21,8 +21,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/k3-am654-gic-demo.c b/configs/arm64/k3-am654-gic-demo.c
index fc9deb75..556b0b4a 100644
--- a/configs/arm64/k3-am654-gic-demo.c
+++ b/configs/arm64/k3-am654-gic-demo.c
@@ -17,8 +17,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index 23824890..5eab1502 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 #ifndef CONFIG_INMATE_BASE
 #define CONFIG_INMATE_BASE 0x0000000
 #endif
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index edc31b8b..a951a461 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/k3-am654-uart-demo.c b/configs/arm64/k3-am654-uart-demo.c
index 10cc0365..29a022e9 100644
--- a/configs/arm64/k3-am654-uart-demo.c
+++ b/configs/arm64/k3-am654-uart-demo.c
@@ -17,8 +17,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/macchiatobin-gic-demo.c b/configs/arm64/macchiatobin-gic-demo.c
index 713319d2..63e1e433 100644
--- a/configs/arm64/macchiatobin-gic-demo.c
+++ b/configs/arm64/macchiatobin-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index 63fbbba7..6e18f62f 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index c0df0572..4811e8dd 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -17,8 +17,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c b/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
index 614b572e..6a93935f 100644
--- a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index 1c63ae0e..ec2531b2 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -17,8 +17,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index 9597500d..6f3ad198 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -17,8 +17,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/qemu-arm64-gic-demo.c b/configs/arm64/qemu-arm64-gic-demo.c
index 2a50ef3f..9e51e821 100644
--- a/configs/arm64/qemu-arm64-gic-demo.c
+++ b/configs/arm64/qemu-arm64-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index be88e107..ed89413b 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 0570a1dd..6eff7403 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -17,8 +17,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/ultra96-gic-demo.c b/configs/arm64/ultra96-gic-demo.c
index 12556335..403c6972 100644
--- a/configs/arm64/ultra96-gic-demo.c
+++ b/configs/arm64/ultra96-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index e6b33466..7cbfd772 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index 1fc54356..bcf08772 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/arm64/zynqmp-zcu102-gic-demo.c b/configs/arm64/zynqmp-zcu102-gic-demo.c
index 6ca18686..15767396 100644
--- a/configs/arm64/zynqmp-zcu102-gic-demo.c
+++ b/configs/arm64/zynqmp-zcu102-gic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index 2fcc86c6..02ec89e8 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index ca80535d..c30ed924 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 65515e56..9de04d6c 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -17,8 +17,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/x86/apic-demo.c b/configs/x86/apic-demo.c
index 969f9527..8840c632 100644
--- a/configs/x86/apic-demo.c
+++ b/configs/x86/apic-demo.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
index 1c602883..09ca9eac 100644
--- a/configs/x86/e1000-demo.c
+++ b/configs/x86/e1000-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index d5320d7b..e73cbb06 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -20,8 +20,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/x86/imb-a180.c b/configs/x86/imb-a180.c
index 9073a4ac..4faa0b41 100644
--- a/configs/x86/imb-a180.c
+++ b/configs/x86/imb-a180.c
@@ -19,8 +19,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/x86/ioapic-demo.c b/configs/x86/ioapic-demo.c
index 8b47a335..30e0ac98 100644
--- a/configs/x86/ioapic-demo.c
+++ b/configs/x86/ioapic-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index 501d722f..b3a12a9d 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index af8c6da4..c8f18701 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
index c5719459..0b8c1aad 100644
--- a/configs/x86/pci-demo.c
+++ b/configs/x86/pci-demo.c
@@ -16,8 +16,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 68b8f18d..4d671cb2 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -19,8 +19,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
diff --git a/configs/x86/smp-demo.c b/configs/x86/smp-demo.c
index a9625353..d175c618 100644
--- a/configs/x86/smp-demo.c
+++ b/configs/x86/smp-demo.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/configs/x86/tiny-demo.c b/configs/x86/tiny-demo.c
index 426333f6..493059ae 100644
--- a/configs/x86/tiny-demo.c
+++ b/configs/x86/tiny-demo.c
@@ -15,8 +15,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
-
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
diff --git a/hypervisor/include/jailhouse/utils.h b/hypervisor/include/jailhouse/utils.h
index eae0f390..6f6e8371 100644
--- a/hypervisor/include/jailhouse/utils.h
+++ b/hypervisor/include/jailhouse/utils.h
@@ -12,7 +12,9 @@
  * Partly derived from Linux kernel code.
  */
 
+#ifndef ARRAY_SIZE
 #define ARRAY_SIZE(array)	(sizeof(array) / sizeof((array)[0]))
+#endif
 
 /* sizeof() for a structure/union field */
 #define FIELD_SIZEOF(type, fld)	(sizeof(((type *)0)->fld))
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 66e13c3d..63eb5fa5 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -41,6 +41,10 @@
 
 #include <jailhouse/console.h>
 
+#ifndef ARRAY_SIZE
+#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
+#endif
+
 /*
  * Incremented on any layout or semantic change of system or cell config.
  * Also update HEADER_REVISION in tools.
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index 5a8e1412..b80d7889 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -42,8 +42,6 @@
 #include <jailhouse/types.h>
 #include <jailhouse/cell-config.h>
 
-#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
-
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[${int((cpucount + 63) / 64)}];
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
