Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUN5T6RQMGQEMGMVOYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FDC70A0C5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:51 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 2adb3069b0e04-4f13ecb8f01sf2285886e87.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528850; cv=pass;
        d=google.com; s=arc-20160816;
        b=CzulgFl6or6UudNMiJL9T3BVa9/gjUln0RpAHlLA7xprR6+vwBd7f42dcB4W9cEioY
         6Y55j9ypHbLwhNnySqV3dgRf120VDMUfCrPZBNb/AdzguOrC9g60+DAqp6AKK0g7esrH
         uRwGiN926W4IPuyaGQomo7yfqMKE0wYUStfC55+4m6BkDdWtvQIJLTwMxmgtR53fpJ+A
         UprYiSnjrOQrZVeyVgiWf9VVr2UJJ68KRSXVTmA6IRDQt5gUCrNGqqtirjcOq7ptBXq8
         6MAYvR9/9Lsrvsza7UCx7BGAtJK9J18nfMkAUCzVPlSBqjsna+YnVf3mqAwrIE4l5kXI
         V6kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=TE+V2PV/KqUOIhOjZe70/+M9BOeVATg8agNps860MY4=;
        b=RV1OamxHrBMkS98LkiFCbzDdZ+R6OIbNjVwenZ1l+AHJub7sSaAGjSXPQ/Ls6KSItR
         mmzxyjm/472+w1Rsaoiyg0wnI4Vd2we7L2SJblI9yzBV95tMJes6hx2cxVzyyMYtB/S8
         h9sDmo8H7okPqiM9GojCUE5uWlIsaDjfvLlCRLdU+8H5PCWVsM3qYaVkbvVbgVqwLoxg
         S3rV1lvXwl7f27pxhLbhzVUcI96wcTyx+ucZd7DDAAD0R/y5b4JisHZtL9pmpyn8tuUh
         bRwacqBEZJo3U4gKdNncuK5mCcN1Ji2qUaHVDFGuF4x5kMKO8vc/zkmT5ZTV5MSUj2qr
         lJUg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528850; x=1687120850;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TE+V2PV/KqUOIhOjZe70/+M9BOeVATg8agNps860MY4=;
        b=Nzln75ppgCOJ4vxF2OhPhR8gVtwWxuXZAplrSOggxvILNKT7woZgh5WueZgSQBSo9t
         yiwzjMdHYmjh9X6sR8YhyandRTyj9a6hFOQMq/7Q5U+hNFW4MfVGnivreCQlGb7RYqEJ
         +Lfe1qppbYlsac4rFrvZlY20r/fVEhGJKknLfutCNMPPurr0VnAqdmt0EzX8NSoHbHbt
         y0JBfBqnAdqDR+fOLsUaMNLlxBjNU0RKIBJSOq8BQqL5OwjM2m3ZLFZl5j5tgvCfYwE8
         aG3eQt/0F2/3XlDGYy+P1NpUxteYy2lU1MrWMDJf3FCWFG/MuB8oHH2A2WzeMqngqoh3
         ta1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528850; x=1687120850;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TE+V2PV/KqUOIhOjZe70/+M9BOeVATg8agNps860MY4=;
        b=A2JXQHEaXoM2QD1wPH9G9jVGA3skvNXMlh69TAsJa9At691jkNrW24akWKIqH/yw9p
         DK9LhMNnx1/bth52pYBd3Ko5QjDCW3tLXnOiKAzQs/BbOA8qyWO2f+cbZ1s3ZwWMQ6M9
         ZM2o4oDRPFH6MJn3KHAgh5jbfzuOiEh54LXoxheUH7m3dGm2qS/feEbjZnS9qABOfX/O
         voQqvfMD9RaUTpl7W/5H+aBq40rlxuXcNE4qXgVaTbaCOHojZGm7t3o+z57OTVwDkmHu
         gBpaHTNWtDgUAkSPpkOm5FZhziEAyDVyYFxNAvMJDM7UOKC71C9Dg82YO8VZC8Dq/kF1
         mXbQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwMPsSjpw1urEyx1rUEiaSPUDRbDnmt2LxZauai/PT2HGt25Kwb
	6ig4sebkGEtCCzzttqA9GUI=
X-Google-Smtp-Source: ACHHUZ7CUzjzGgLcBI1sY//a6NqFRYBT/Cz0O4xkawI6K7MvkdpFr+Z37DKWnsq5bRg0huH5I1E8/Q==
X-Received: by 2002:a19:f812:0:b0:4f2:500b:627f with SMTP id a18-20020a19f812000000b004f2500b627fmr812242lff.8.1684528850310;
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a99e:0:b0:2ae:d52f:f70e with SMTP id x30-20020a2ea99e000000b002aed52ff70els792381ljq.0.-pod-prod-03-eu;
 Fri, 19 May 2023 13:40:48 -0700 (PDT)
X-Received: by 2002:a2e:7e0a:0:b0:2a9:f589:1b0 with SMTP id z10-20020a2e7e0a000000b002a9f58901b0mr1037510ljc.15.1684528848229;
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528848; cv=none;
        d=google.com; s=arc-20160816;
        b=i5oAXrBd9U725lV6QiskeQifLQ/xI7dDSz7OV9hO4kVYWFPvSt7Q5P2y/yRtfREGko
         fIlGIunHYy7Ce556OPkyJZextipsOK/vw8m+A9UPhwRFhzZZ4jIv6WEj8xBsWrTxYJ86
         XDc0LImuaRSsmxlkWMPONtUkArbqyBjxTRlzbK4sRh9vKP9MY3pDECk5EE7FcUo2y26q
         aDTl6qSYHg6M+9TtjtEEX2LOuOW4/3xJP6YDJ0iG/ejiMbP2xwjW2E3wOsQSMq9WX+0+
         5CalEL037y7tFRUWMZt/47HFDeYc3eMNxbdOGZy6bE7l1d0Lw3K/bpfd6nL4nAOQaQtD
         XoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=OzKyjEZtSvvzytNss01LOwzVhhKdSfTVP7jaTf+y72I=;
        b=of43gP97niBaGXxEC5j/QWkfApLMmSw3+huKDPGjOR+SH+TuyYbJHqZBYrBI8fk/bZ
         g3I1ajlTs3cVvHWPd/Ai4qa78VhJEmfqYspL7ckrZlkYHRzvDeISmOF+rti4uxDBlB0m
         u0QhjTxFJbtTQz+3cbsQWaP69noPiA6suSLoid9Z+pQdWW7mptnWwxMa+Uh+0kY+wipO
         iw+GxX2AkPsEKU70aGf0kMJgw2lpOuHhQ6JON7vSNjvgJUmTXVbPfAUSKKK4sQQ/kIq9
         g2pK9c2AVLyFXXQC+0vCHHXCU9zEyjwVGA2XSxtRx80EVV9/O2HHcwLtF/BAuYFX2e21
         xz9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id br34-20020a056512402200b004dc4bb412f7si9248lfb.12.2023.05.19.13.40.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdW1hZhzxr2;
	Fri, 19 May 2023 22:40:47 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 18/73] configs: arm64: Convert to new CPU configuration format
Date: Fri, 19 May 2023 22:39:38 +0200
Message-Id: <20230519204033.643200-19-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, BODY_SIZE_25K_PLUS 0, BODY_SIZE_50K_PLUS 0, BODY_SIZE_75K_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/amd-seattle-inmate-demo.c       |  8 ++-
 configs/arm64/amd-seattle-linux-demo.c        | 11 +++-
 configs/arm64/amd-seattle.c                   | 29 +++++++++-
 configs/arm64/espressobin-inmate-demo.c       | 10 ++--
 configs/arm64/espressobin-linux-demo.c        | 10 ++--
 configs/arm64/espressobin.c                   | 13 +++--
 configs/arm64/foundation-v8-inmate-demo.c     |  8 ++-
 configs/arm64/foundation-v8-linux-demo.c      | 11 +++-
 configs/arm64/foundation-v8.c                 | 17 +++++-
 configs/arm64/hikey-inmate-demo.c             | 10 ++--
 configs/arm64/hikey-linux-demo.c              | 13 +++--
 configs/arm64/hikey.c                         | 31 +++++++++--
 configs/arm64/imx8dxl-inmate-demo.c           |  8 ++-
 configs/arm64/imx8dxl.c                       | 13 +++--
 configs/arm64/imx8mm-inmate-demo.c            |  8 ++-
 configs/arm64/imx8mm-linux-demo.c             | 11 +++-
 configs/arm64/imx8mm.c                        | 19 +++++--
 configs/arm64/imx8mn-inmate-demo.c            |  8 ++-
 configs/arm64/imx8mn-linux-demo.c             | 11 +++-
 configs/arm64/imx8mn.c                        | 19 +++++--
 configs/arm64/imx8mp-inmate-demo.c            |  8 ++-
 configs/arm64/imx8mp-linux-demo.c             | 11 +++-
 configs/arm64/imx8mp.c                        | 19 +++++--
 configs/arm64/imx8mq-inmate-demo.c            |  8 ++-
 configs/arm64/imx8mq-linux-demo.c             | 11 +++-
 configs/arm64/imx8mq.c                        | 19 +++++--
 configs/arm64/imx8qm-inmate-demo.c            |  8 ++-
 configs/arm64/imx8qm-linux-demo.c             | 11 +++-
 configs/arm64/imx8qm.c                        | 25 +++++++--
 configs/arm64/jetson-tx1-inmate-demo.c        |  8 ++-
 configs/arm64/jetson-tx1-linux-demo.c         | 11 +++-
 configs/arm64/jetson-tx1.c                    | 17 +++++-
 configs/arm64/jetson-tx2-inmate-demo.c        |  8 ++-
 configs/arm64/jetson-tx2.c                    | 17 +++++-
 configs/arm64/k3-am625-sk-inmate-demo.c       |  8 ++-
 configs/arm64/k3-am625-sk-linux-demo.c        | 11 +++-
 configs/arm64/k3-am625-sk.c                   | 17 +++++-
 configs/arm64/k3-am654-idk-inmate-demo.c      |  8 ++-
 configs/arm64/k3-am654-idk-linux-demo.c       | 11 +++-
 configs/arm64/k3-am654-idk.c                  | 17 +++++-
 configs/arm64/k3-j7200-evm-inmate-demo.c      |  8 ++-
 configs/arm64/k3-j7200-evm-linux-demo.c       |  8 ++-
 configs/arm64/k3-j7200-evm.c                  | 11 +++-
 configs/arm64/k3-j721e-evm-inmate-demo.c      |  8 ++-
 configs/arm64/k3-j721e-evm-linux-demo.c       |  8 ++-
 configs/arm64/k3-j721e-evm.c                  | 11 +++-
 configs/arm64/ls1028a-rdb-inmate-demo.c       |  8 ++-
 configs/arm64/ls1028a-rdb-linux-demo.c        |  8 ++-
 configs/arm64/ls1028a-rdb.c                   | 13 +++--
 configs/arm64/ls1043a-rdb-dpaa-linux-demo.c   | 11 +++-
 configs/arm64/ls1043a-rdb-inmate-demo.c       |  8 ++-
 configs/arm64/ls1043a-rdb-linux-demo.c        | 11 +++-
 configs/arm64/ls1043a-rdb.c                   | 19 +++++--
 configs/arm64/ls1046a-rdb-inmate-demo.c       |  8 ++-
 configs/arm64/ls1046a-rdb-linux-demo.c        | 11 +++-
 configs/arm64/ls1046a-rdb.c                   | 19 +++++--
 configs/arm64/ls1088a-rdb-inmate-demo.c       |  8 ++-
 configs/arm64/ls1088a-rdb-linux-demo.c        | 11 +++-
 configs/arm64/ls1088a-rdb.c                   | 29 +++++++++-
 configs/arm64/ls2088a-rdb-inmate-demo.c       |  8 ++-
 configs/arm64/ls2088a-rdb-linux-demo.c        | 11 +++-
 configs/arm64/ls2088a-rdb.c                   | 29 +++++++++-
 configs/arm64/macchiatobin-inmate-demo.c      | 10 ++--
 configs/arm64/macchiatobin-linux-demo.c       | 13 +++--
 configs/arm64/macchiatobin.c                  | 19 +++++--
 .../arm64/miriac-sbc-ls1046a-inmate-demo.c    |  8 ++-
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c | 11 +++-
 configs/arm64/miriac-sbc-ls1046a.c            | 17 +++++-
 configs/arm64/pine64-plus-inmate-demo.c       |  8 ++-
 configs/arm64/pine64-plus-linux-demo.c        | 11 +++-
 configs/arm64/pine64-plus.c                   | 17 +++++-
 configs/arm64/qemu-arm64-inmate-demo.c        | 10 ++--
 configs/arm64/qemu-arm64-linux-demo.c         | 13 +++--
 configs/arm64/qemu-arm64-zephyr-demo.c        | 11 +++-
 configs/arm64/qemu-arm64.c                    | 55 +++++++++++++++++--
 configs/arm64/renesas-r8a774a1-inmate-demo.c  |  8 ++-
 configs/arm64/renesas-r8a774a1-linux-demo.c   | 17 +++++-
 configs/arm64/renesas-r8a774a1.c              | 23 +++++++-
 configs/arm64/rpi4-inmate-demo.c              | 10 ++--
 configs/arm64/rpi4-linux-demo.c               | 13 +++--
 configs/arm64/rpi4.c                          | 19 +++++--
 configs/arm64/ultra96-inmate-demo.c           | 10 ++--
 configs/arm64/ultra96-linux-demo.c            | 13 +++--
 configs/arm64/ultra96.c                       | 19 +++++--
 configs/arm64/zynqmp-zcu102-inmate-demo.c     | 10 ++--
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 10 ++--
 configs/arm64/zynqmp-zcu102-linux-demo.c      | 13 +++--
 configs/arm64/zynqmp-zcu102.c                 | 19 +++++--
 88 files changed, 879 insertions(+), 295 deletions(-)

diff --git a/configs/arm64/amd-seattle-inmate-demo.c b/configs/arm64/amd-seattle-inmate-demo.c
index c5b8b1f9..9b82e070 100644
--- a/configs/arm64/amd-seattle-inmate-demo.c
+++ b/configs/arm64/amd-seattle-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x10,
+		{
+			.phys_id = 0x0200,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index 7ddcaa45..8f8671a4 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -44,7 +44,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc0,
+		{
+			.phys_id = 0x0300,
+		},
+		{
+			.phys_id = 0x0301,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index 7a65d9ad..97127ff6 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[20];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[3];
@@ -53,7 +53,7 @@ struct {
 		.root_cell = {
 			.name = "amd-seattle",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -61,7 +61,30 @@ struct {
 	},
 
 	.cpus = {
-		0xff,
+		{
+			.phys_id = 0x0000,
+		},
+		{
+			.phys_id = 0x0001,
+		},
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
+		{
+			.phys_id = 0x0200,
+		},
+		{
+			.phys_id = 0x0201,
+		},
+		{
+			.phys_id = 0x0300,
+		},
+		{
+			.phys_id = 0x0301,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/espressobin-inmate-demo.c b/configs/arm64/espressobin-inmate-demo.c
index b93d8cdb..d6a19ecd 100644
--- a/configs/arm64/espressobin-inmate-demo.c
+++ b/configs/arm64/espressobin-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Marvell ESPRESSObin board:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2017
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index 3f3806ed..801917b2 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on ESPRESSObin:
  * 1 CPU, 128M RAM, serial port
  *
- * Copyright (c) Siemens AG, 2014-2017
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "ESPRESSObin-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index dc03ac80..0d7e50c6 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -3,7 +3,7 @@
  *
  * Configuration for Marvell ESPRESSObin board
  *
- * Copyright (c) Siemens AG, 2017
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -55,7 +55,7 @@ struct {
 		.root_cell = {
 			.name = "ESPRESSObin",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -65,7 +65,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/foundation-v8-inmate-demo.c b/configs/arm64/foundation-v8-inmate-demo.c
index bd4e7751..3dfaf92c 100644
--- a/configs/arm64/foundation-v8-inmate-demo.c
+++ b/configs/arm64/foundation-v8-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/foundation-v8-linux-demo.c b/configs/arm64/foundation-v8-linux-demo.c
index c101628c..25ce37c2 100644
--- a/configs/arm64/foundation-v8-linux-demo.c
+++ b/configs/arm64/foundation-v8-linux-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[3];
 	struct jailhouse_irqchip irqchips[1];
 } __attribute__((packed)) config = {
@@ -29,7 +29,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 1,
 		.num_pci_devices = 0,
@@ -43,7 +43,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc, /* 2nd and 3rd CPUs */
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	/* Physical memory map:
diff --git a/configs/arm64/foundation-v8.c b/configs/arm64/foundation-v8.c
index c32424a0..9dccda0d 100644
--- a/configs/arm64/foundation-v8.c
+++ b/configs/arm64/foundation-v8.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[9];
 	struct jailhouse_irqchip irqchips[3];
 } __attribute__((packed)) config = {
@@ -54,14 +54,25 @@ struct {
 		.root_cell = {
 			.name = "foundation-v8",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/hikey-inmate-demo.c b/configs/arm64/hikey-inmate-demo.c
index f7e62178..41d23c33 100644
--- a/configs/arm64/hikey-inmate-demo.c
+++ b/configs/arm64/hikey-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on LeMaker HiKey board, 2GiB:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x10,
+		{
+			.phys_id = 0x0100,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index d3dcd7c4..5701d6f3 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on HiKey:
  * 1 CPU, 128M RAM, serial port 3
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "hikey-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc0,
+		{
+			.phys_id = 0x0102,
+		},
+		{
+			.phys_id = 0x0103,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index 996f5340..a574778b 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -3,7 +3,7 @@
  *
  * Configuration for LeMaker HiKey board, 2 GB
  *
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -54,7 +54,7 @@ struct {
 		.root_cell = {
 			.name = "HiKey",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -64,7 +64,30 @@ struct {
 	},
 
 	.cpus = {
-		0xff,
+		{
+			.phys_id = 0x0000,
+		},
+		{
+			.phys_id = 0x0001,
+		},
+		{
+			.phys_id = 0x0002,
+		},
+		{
+			.phys_id = 0x0003,
+		},
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
+		{
+			.phys_id = 0x0102,
+		},
+		{
+			.phys_id = 0x0103,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8dxl-inmate-demo.c b/configs/arm64/imx8dxl-inmate-demo.c
index 3d2296d7..6aa1c03a 100644
--- a/configs/arm64/imx8dxl-inmate-demo.c
+++ b/configs/arm64/imx8dxl-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 #else
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 #endif
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -41,7 +41,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8dxl.c b/configs/arm64/imx8dxl.c
index 77c0b5a1..d70abadb 100644
--- a/configs/arm64/imx8dxl.c
+++ b/configs/arm64/imx8dxl.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -50,16 +50,21 @@ struct {
 		},
 		.root_cell = {
 			.name = "imx8dxl",
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 2, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mm-inmate-demo.c b/configs/arm64/imx8mm-inmate-demo.c
index ef4f187a..c81598ae 100644
--- a/configs/arm64/imx8mm-inmate-demo.c
+++ b/configs/arm64/imx8mm-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
index f3cc312c..dfb80877 100644
--- a/configs/arm64/imx8mm-linux-demo.c
+++ b/configs/arm64/imx8mm-linux-demo.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -32,7 +32,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -40,7 +40,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
index 966d94b0..096b7ab2 100644
--- a/configs/arm64/imx8mm.c
+++ b/configs/arm64/imx8mm.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -59,16 +59,27 @@ struct {
 		.root_cell = {
 			.name = "imx8mm",
 
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 51, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mn-inmate-demo.c b/configs/arm64/imx8mn-inmate-demo.c
index e3f04f07..fa65c97f 100644
--- a/configs/arm64/imx8mn-inmate-demo.c
+++ b/configs/arm64/imx8mn-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mn-linux-demo.c b/configs/arm64/imx8mn-linux-demo.c
index cdbb5481..1c0180a5 100644
--- a/configs/arm64/imx8mn-linux-demo.c
+++ b/configs/arm64/imx8mn-linux-demo.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -32,7 +32,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -40,7 +40,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mn.c b/configs/arm64/imx8mn.c
index e47e7ad1..880875db 100644
--- a/configs/arm64/imx8mn.c
+++ b/configs/arm64/imx8mn.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -54,16 +54,27 @@ struct {
 		.root_cell = {
 			.name = "imx8mm",
 
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 123, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
index e5355833..0ec8c937 100644
--- a/configs/arm64/imx8mp-inmate-demo.c
+++ b/configs/arm64/imx8mp-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
index d208714c..d822f99d 100644
--- a/configs/arm64/imx8mp-linux-demo.c
+++ b/configs/arm64/imx8mp-linux-demo.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[4];
@@ -32,7 +32,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -40,7 +40,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
index ec94fc6e..6e6983b6 100644
--- a/configs/arm64/imx8mp.c
+++ b/configs/arm64/imx8mp.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[4];
@@ -54,17 +54,28 @@ struct {
 		.root_cell = {
 			.name = "imx8mp",
 
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			/* gpt5/4/3/2 not used by root cell */
 			.vpci_irq_base = 51, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mq-inmate-demo.c b/configs/arm64/imx8mq-inmate-demo.c
index cbb3a01e..6af2d7e6 100644
--- a/configs/arm64/imx8mq-inmate-demo.c
+++ b/configs/arm64/imx8mq-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mq-linux-demo.c b/configs/arm64/imx8mq-linux-demo.c
index 04aea30d..dc4ffc6f 100644
--- a/configs/arm64/imx8mq-linux-demo.c
+++ b/configs/arm64/imx8mq-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -27,7 +27,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -35,7 +35,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
index e51683ae..27cbeba9 100644
--- a/configs/arm64/imx8mq.c
+++ b/configs/arm64/imx8mq.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -54,16 +54,27 @@ struct {
 		.root_cell = {
 			.name = "imx8mq",
 
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 51, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8qm-inmate-demo.c b/configs/arm64/imx8qm-inmate-demo.c
index effd7b80..959e458c 100644
--- a/configs/arm64/imx8qm-inmate-demo.c
+++ b/configs/arm64/imx8qm-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
index b0e8eaf5..c6ddb5ec 100644
--- a/configs/arm64/imx8qm-linux-demo.c
+++ b/configs/arm64/imx8qm-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[2];
@@ -28,7 +28,7 @@ struct {
 		.name = "imx8qm-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_stream_ids = ARRAY_SIZE(config.stream_ids),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
@@ -37,7 +37,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
index 9cb3c278..85482917 100644
--- a/configs/arm64/imx8qm.c
+++ b/configs/arm64/imx8qm.c
@@ -16,7 +16,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[6];
 	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -68,11 +68,11 @@ struct {
 		.root_cell = {
 			.name = "imx8qm",
 
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			/*
 			 * vpci_irq_base not include base 32
 			 */
@@ -81,7 +81,24 @@ struct {
 	},
 
 	.cpus = {
-		0x3f,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
+		{
+			.phys_id = 4,
+		},
+		{
+			.phys_id = 5,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/jetson-tx1-inmate-demo.c b/configs/arm64/jetson-tx1-inmate-demo.c
index 8b13148d..3ea95ae1 100644
--- a/configs/arm64/jetson-tx1-inmate-demo.c
+++ b/configs/arm64/jetson-tx1-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "jetson-tx1-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -40,7 +40,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index ec303535..9ab5f6ec 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -24,7 +24,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -37,7 +37,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -55,7 +55,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index 8d1b9cc4..f34af92b 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[46];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -58,7 +58,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "Jetson-TX1",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -68,7 +68,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 
diff --git a/configs/arm64/jetson-tx2-inmate-demo.c b/configs/arm64/jetson-tx2-inmate-demo.c
index 98d3a27d..84fef9b3 100644
--- a/configs/arm64/jetson-tx2-inmate-demo.c
+++ b/configs/arm64/jetson-tx2-inmate-demo.c
@@ -13,7 +13,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -23,7 +23,7 @@ struct {
 		.name = "jetson-tx2-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 
 		.console = {
@@ -35,7 +35,9 @@ struct {
 	},
 
 	.cpus = {
-		0x1,
+		{
+			.phys_id = 0x0101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/jetson-tx2.c b/configs/arm64/jetson-tx2.c
index c4078d90..453d543b 100644
--- a/configs/arm64/jetson-tx2.c
+++ b/configs/arm64/jetson-tx2.c
@@ -23,7 +23,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[60];
 	struct jailhouse_irqchip irqchips[3];
 } __attribute__((packed)) config = {
@@ -56,14 +56,25 @@ struct {
 		},
 		.root_cell = {
 			.name = "Jetson-TX2",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 		},
 	},
 
 	.cpus = {
-		0x39,
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
+		{
+			.phys_id = 0x0102,
+		},
+		{
+			.phys_id = 0x0103,
+		},
 	},
 
 
diff --git a/configs/arm64/k3-am625-sk-inmate-demo.c b/configs/arm64/k3-am625-sk-inmate-demo.c
index 38d146a9..dccbeac1 100644
--- a/configs/arm64/k3-am625-sk-inmate-demo.c
+++ b/configs/arm64/k3-am625-sk-inmate-demo.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -30,7 +30,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -45,7 +45,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 0x0001,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am625-sk-linux-demo.c b/configs/arm64/k3-am625-sk-linux-demo.c
index 37b42b5e..43af5d97 100644
--- a/configs/arm64/k3-am625-sk-linux-demo.c
+++ b/configs/arm64/k3-am625-sk-linux-demo.c
@@ -22,7 +22,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -34,7 +34,7 @@ struct {
 		.name = "k3-am625-sk-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -51,7 +51,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 0x0002,
+		},
+		{
+			.phys_id = 0x0003,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
index 4c77e7fe..0a7c2282 100644
--- a/configs/arm64/k3-am625-sk.c
+++ b/configs/arm64/k3-am625-sk.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[31];
 	struct jailhouse_irqchip irqchips[5];
 	struct jailhouse_pci_device pci_devices[2];
@@ -53,7 +53,7 @@ struct {
 		.root_cell = {
 			.name = "k3-am625-sk",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -62,7 +62,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0x0000,
+		},
+		{
+			.phys_id = 0x0001,
+		},
+		{
+			.phys_id = 0x0002,
+		},
+		{
+			.phys_id = 0x0003,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am654-idk-inmate-demo.c b/configs/arm64/k3-am654-idk-inmate-demo.c
index 73e4f051..20c3a19d 100644
--- a/configs/arm64/k3-am654-idk-inmate-demo.c
+++ b/configs/arm64/k3-am654-idk-inmate-demo.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -29,7 +29,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -44,7 +44,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 0x0001,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index ac7a75d0..58dee5f2 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -22,7 +22,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[19];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -34,7 +34,7 @@ struct {
 		.name = "k3-am654-idk-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -51,7 +51,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index 544ca50b..4376b49f 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[25];
 	struct jailhouse_irqchip irqchips[5];
 	struct jailhouse_pci_device pci_devices[2];
@@ -53,7 +53,7 @@ struct {
 		.root_cell = {
 			.name = "k3-am654-idk",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -62,7 +62,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0x0000,
+		},
+		{
+			.phys_id = 0x0001,
+		},
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j7200-evm-inmate-demo.c b/configs/arm64/k3-j7200-evm-inmate-demo.c
index eea1cb5a..bc312f6c 100644
--- a/configs/arm64/k3-j7200-evm-inmate-demo.c
+++ b/configs/arm64/k3-j7200-evm-inmate-demo.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -31,7 +31,7 @@ struct {
 		.name = "k3-j7200 inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 1,
 		.num_pci_devices = 1,
@@ -48,7 +48,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
index 28d6e361..7a2b082e 100644
--- a/configs/arm64/k3-j7200-evm-linux-demo.c
+++ b/configs/arm64/k3-j7200-evm-linux-demo.c
@@ -22,7 +22,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[19];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
@@ -35,7 +35,7 @@ struct {
 		.name = "k3-j7200-evm-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -52,7 +52,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
index afa54b2b..4d7b9502 100644
--- a/configs/arm64/k3-j7200-evm.c
+++ b/configs/arm64/k3-j7200-evm.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[32];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[2];
@@ -71,7 +71,7 @@ struct {
 		.root_cell = {
 			.name = "k3-j7200-evm",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -81,7 +81,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
index cf4026d9..b60ec081 100644
--- a/configs/arm64/k3-j721e-evm-inmate-demo.c
+++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -31,7 +31,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 1,
 		.num_pci_devices = 1,
@@ -48,7 +48,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index ff7b23a7..f51af1d7 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -23,7 +23,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[2];
@@ -36,7 +36,7 @@ struct {
 		.name = "k3-j721e-evm-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -53,7 +53,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 3a1c4a6d..6cfb21b9 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[40];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[2];
@@ -84,7 +84,7 @@ struct {
 		.root_cell = {
 			.name = "k3-j721e-evm",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -94,7 +94,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1028a-rdb-inmate-demo.c b/configs/arm64/ls1028a-rdb-inmate-demo.c
index 1b1bedc1..4345dfe0 100644
--- a/configs/arm64/ls1028a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1028a-rdb-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1028a-rdb-linux-demo.c b/configs/arm64/ls1028a-rdb-linux-demo.c
index c965fa4f..9c9f4e26 100644
--- a/configs/arm64/ls1028a-rdb-linux-demo.c
+++ b/configs/arm64/ls1028a-rdb-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -27,7 +27,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -35,7 +35,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1028a-rdb.c b/configs/arm64/ls1028a-rdb.c
index 2feec366..624a8d10 100644
--- a/configs/arm64/ls1028a-rdb.c
+++ b/configs/arm64/ls1028a-rdb.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[76];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -51,16 +51,21 @@ struct {
 		},
 		.root_cell = {
 			.name = "ls1028a",
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 50 - 32,
 		},
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c b/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
index 028ddf49..871854da 100644
--- a/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
+++ b/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -27,7 +27,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -35,7 +35,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1043a-rdb-inmate-demo.c b/configs/arm64/ls1043a-rdb-inmate-demo.c
index 53a65e3c..fbdaaa5d 100644
--- a/configs/arm64/ls1043a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1043a-rdb-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1043a-rdb-linux-demo.c b/configs/arm64/ls1043a-rdb-linux-demo.c
index 30be3538..34b6a620 100644
--- a/configs/arm64/ls1043a-rdb-linux-demo.c
+++ b/configs/arm64/ls1043a-rdb-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -27,7 +27,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -35,7 +35,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1043a-rdb.c b/configs/arm64/ls1043a-rdb.c
index e1d3c48e..39d7fa81 100644
--- a/configs/arm64/ls1043a-rdb.c
+++ b/configs/arm64/ls1043a-rdb.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[61];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -53,16 +53,27 @@ struct {
 		},
 		.root_cell = {
 			.name = "ls1043a",
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 67 - 32, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c b/configs/arm64/ls1046a-rdb-inmate-demo.c
index b98051da..a5108a76 100644
--- a/configs/arm64/ls1046a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c b/configs/arm64/ls1046a-rdb-linux-demo.c
index a2efa1b3..03f61b81 100644
--- a/configs/arm64/ls1046a-rdb-linux-demo.c
+++ b/configs/arm64/ls1046a-rdb-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -27,7 +27,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -35,7 +35,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1046a-rdb.c b/configs/arm64/ls1046a-rdb.c
index e104ee28..bf27df1f 100644
--- a/configs/arm64/ls1046a-rdb.c
+++ b/configs/arm64/ls1046a-rdb.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[64];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -53,16 +53,27 @@ struct {
 		},
 		.root_cell = {
 			.name = "ls1046a",
-			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.vpci_irq_base = 67 - 32, /* Not include 32 base */
 		},
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1088a-rdb-inmate-demo.c b/configs/arm64/ls1088a-rdb-inmate-demo.c
index 226ff2e8..39090261 100644
--- a/configs/arm64/ls1088a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1088a-rdb-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 0x1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1088a-rdb-linux-demo.c b/configs/arm64/ls1088a-rdb-linux-demo.c
index d98d6ca1..fd98bde8 100644
--- a/configs/arm64/ls1088a-rdb-linux-demo.c
+++ b/configs/arm64/ls1088a-rdb-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -27,7 +27,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -35,7 +35,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 0x2,
+		},
+		{
+			.phys_id = 0x3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls1088a-rdb.c b/configs/arm64/ls1088a-rdb.c
index d73703ae..e2dfc54c 100644
--- a/configs/arm64/ls1088a-rdb.c
+++ b/configs/arm64/ls1088a-rdb.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[63];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -54,8 +54,8 @@ struct {
 		},
 		.root_cell = {
 			.name = "ls1088a",
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.vpci_irq_base = 114 - 32,
@@ -63,7 +63,30 @@ struct {
 	},
 
 	.cpus = {
-		0xff,
+		{
+			.phys_id = 0x0,
+		},
+		{
+			.phys_id = 0x1,
+		},
+		{
+			.phys_id = 0x2,
+		},
+		{
+			.phys_id = 0x3,
+		},
+		{
+			.phys_id = 0x100,
+		},
+		{
+			.phys_id = 0x101,
+		},
+		{
+			.phys_id = 0x102,
+		},
+		{
+			.phys_id = 0x103,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls2088a-rdb-inmate-demo.c b/configs/arm64/ls2088a-rdb-inmate-demo.c
index bdc069ef..3234b489 100644
--- a/configs/arm64/ls2088a-rdb-inmate-demo.c
+++ b/configs/arm64/ls2088a-rdb-inmate-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -27,7 +27,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -43,7 +43,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 0x1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls2088a-rdb-linux-demo.c b/configs/arm64/ls2088a-rdb-linux-demo.c
index 2a531a48..8619a1a0 100644
--- a/configs/arm64/ls2088a-rdb-linux-demo.c
+++ b/configs/arm64/ls2088a-rdb-linux-demo.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -27,7 +27,7 @@ struct {
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -35,7 +35,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 0x100,
+		},
+		{
+			.phys_id = 0x101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ls2088a-rdb.c b/configs/arm64/ls2088a-rdb.c
index d84ba10b..58393b01 100644
--- a/configs/arm64/ls2088a-rdb.c
+++ b/configs/arm64/ls2088a-rdb.c
@@ -15,7 +15,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[8];
 	struct jailhouse_memory mem_regions[70];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -54,8 +54,8 @@ struct {
 		},
 		.root_cell = {
 			.name = "ls2088a",
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.vpci_irq_base = 160 - 32,
@@ -63,7 +63,30 @@ struct {
 	},
 
 	.cpus = {
-		0xff,
+		{
+			.phys_id = 0x0,
+		},
+		{
+			.phys_id = 0x1,
+		},
+		{
+			.phys_id = 0x100,
+		},
+		{
+			.phys_id = 0x101,
+		},
+		{
+			.phys_id = 0x200,
+		},
+		{
+			.phys_id = 0x201,
+		},
+		{
+			.phys_id = 0x300,
+		},
+		{
+			.phys_id = 0x301,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/macchiatobin-inmate-demo.c b/configs/arm64/macchiatobin-inmate-demo.c
index 92d74b98..64e0e9bb 100644
--- a/configs/arm64/macchiatobin-inmate-demo.c
+++ b/configs/arm64/macchiatobin-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Marvell MACCHIATObin board:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2017-2018
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 0x0001,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index 5ed76c91..1c3a6104 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on MACCHIATObin:
  * 2 CPUs, 128M RAM, serial port
  *
- * Copyright (c) Siemens AG, 2014-2018
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[9];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index f8e078e2..97293248 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -3,7 +3,7 @@
  *
  * Configuration for Marvell MACCHIATObin board
  *
- * Copyright (c) Siemens AG, 2017-2018
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -57,7 +57,7 @@ struct {
 		.root_cell = {
 			.name = "MACCHIATObin",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -67,7 +67,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0x0000,
+		},
+		{
+			.phys_id = 0x0001,
+		},
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c b/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
index 630eb589..c9d2bfb6 100644
--- a/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index e925797a..c2236312 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -32,7 +32,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -48,7 +48,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index fc4493e8..00d77048 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[55];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -59,7 +59,7 @@ struct {
 		.root_cell = {
 			.name = "miriac SBC-LS1046A",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -69,7 +69,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/pine64-plus-inmate-demo.c b/configs/arm64/pine64-plus-inmate-demo.c
index 7cb6fbfc..923cf5a6 100644
--- a/configs/arm64/pine64-plus-inmate-demo.c
+++ b/configs/arm64/pine64-plus-inmate-demo.c
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -29,7 +29,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
@@ -44,7 +44,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/pine64-plus-linux-demo.c b/configs/arm64/pine64-plus-linux-demo.c
index 50b75b40..e6aeb2cf 100644
--- a/configs/arm64/pine64-plus-linux-demo.c
+++ b/configs/arm64/pine64-plus-linux-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/pine64-plus.c b/configs/arm64/pine64-plus.c
index bc2f524e..f77fc192 100644
--- a/configs/arm64/pine64-plus.c
+++ b/configs/arm64/pine64-plus.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[43];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -56,7 +56,7 @@ struct {
 		.root_cell = {
 			.name = "Pine64-Plus",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
@@ -66,7 +66,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/qemu-arm64-inmate-demo.c b/configs/arm64/qemu-arm64-inmate-demo.c
index 3246c7d6..34a4efdb 100644
--- a/configs/arm64/qemu-arm64-inmate-demo.c
+++ b/configs/arm64/qemu-arm64-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on QEMU arm64 virtual target
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2017
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0b0010,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index 258b1850..1e21161f 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on QEMU arm64:
  * 2 CPUs, 128M RAM, serial port
  *
- * Copyright (c) Siemens AG, 2014-2017
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,12 @@ struct {
 	},
 
 	.cpus = {
-		0b1100,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/qemu-arm64-zephyr-demo.c b/configs/arm64/qemu-arm64-zephyr-demo.c
index a4ae1dfa..d7cf29cc 100644
--- a/configs/arm64/qemu-arm64-zephyr-demo.c
+++ b/configs/arm64/qemu-arm64-zephyr-demo.c
@@ -20,7 +20,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -33,7 +33,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -50,7 +50,12 @@ struct {
 	},
 
 	.cpus = {
-		0x3,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index e58c7db6..519115eb 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -3,7 +3,7 @@
  *
  * Configuration for QEMU arm64 virtual target, 1G RAM, 16 cores
  *
- * Copyright (c) Siemens AG, 2017
+ * Copyright (c) Siemens AG, 2017-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[16];
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -55,7 +55,7 @@ struct {
 		.root_cell = {
 			.name = "qemu-arm64",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -65,7 +65,54 @@ struct {
 	},
 
 	.cpus = {
-		0xffff,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
+		{
+			.phys_id = 4,
+		},
+		{
+			.phys_id = 5,
+		},
+		{
+			.phys_id = 6,
+		},
+		{
+			.phys_id = 7,
+		},
+		{
+			.phys_id = 8,
+		},
+		{
+			.phys_id = 9,
+		},
+		{
+			.phys_id = 10,
+		},
+		{
+			.phys_id = 11,
+		},
+		{
+			.phys_id = 12,
+		},
+		{
+			.phys_id = 13,
+		},
+		{
+			.phys_id = 14,
+		},
+		{
+			.phys_id = 15,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/renesas-r8a774a1-inmate-demo.c b/configs/arm64/renesas-r8a774a1-inmate-demo.c
index f571a587..b25bad2d 100644
--- a/configs/arm64/renesas-r8a774a1-inmate-demo.c
+++ b/configs/arm64/renesas-r8a774a1-inmate-demo.c
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -48,7 +48,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 0x0001,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/renesas-r8a774a1-linux-demo.c b/configs/arm64/renesas-r8a774a1-linux-demo.c
index bbd3ae16..9f1abce6 100644
--- a/configs/arm64/renesas-r8a774a1-linux-demo.c
+++ b/configs/arm64/renesas-r8a774a1-linux-demo.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -32,7 +32,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -49,7 +49,18 @@ struct {
 	},
 
 	.cpus = {
-		0x3c,
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
+		{
+			.phys_id = 0x0102,
+		},
+		{
+			.phys_id = 0x0103,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/renesas-r8a774a1.c b/configs/arm64/renesas-r8a774a1.c
index bbcbb6d2..69841e35 100644
--- a/configs/arm64/renesas-r8a774a1.c
+++ b/configs/arm64/renesas-r8a774a1.c
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[6];
 	struct jailhouse_memory mem_regions[157];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[2];
@@ -56,7 +56,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "Renesas HopeRun HiHope RZ/G2M",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -66,7 +66,24 @@ struct {
 	},
 
 	.cpus = {
-		0x3f,
+		{
+			.phys_id = 0x0000,
+		},
+		{
+			.phys_id = 0x0001,
+		},
+		{
+			.phys_id = 0x0100,
+		},
+		{
+			.phys_id = 0x0101,
+		},
+		{
+			.phys_id = 0x0102,
+		},
+		{
+			.phys_id = 0x0103,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/rpi4-inmate-demo.c b/configs/arm64/rpi4-inmate-demo.c
index 311c036b..5cbb495b 100644
--- a/configs/arm64/rpi4-inmate-demo.c
+++ b/configs/arm64/rpi4-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Raspberry Pi 4:
  * 1 CPU, 64K RAM, serial port 0
  *
- * Copyright (c) Siemens AG, 2020
+ * Copyright (c) Siemens AG, 2020-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0b0010,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
index d818c5c5..0078f007 100644
--- a/configs/arm64/rpi4-linux-demo.c
+++ b/configs/arm64/rpi4-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on Raspberry Pi 4:
  * 2 CPUs, 128M RAM, serial port
  *
- * Copyright (c) Siemens AG, 2014-2020
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,12 @@ struct {
 	},
 
 	.cpus = {
-		0b1100,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/rpi4.c b/configs/arm64/rpi4.c
index a41c4545..a3812afa 100644
--- a/configs/arm64/rpi4.c
+++ b/configs/arm64/rpi4.c
@@ -3,7 +3,7 @@
  *
  * Test configuration for Raspberry Pi 4 (quad-core Cortex-A72, 1GB, 2GB, 4GB or 8GB RAM)
  *
- * Copyright (c) Siemens AG, 2020
+ * Copyright (c) Siemens AG, 2020-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
@@ -57,7 +57,7 @@ struct {
 		.root_cell = {
 			.name = "Raspberry-Pi4",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -67,7 +67,18 @@ struct {
 	},
 
 	.cpus = {
-		0b1111,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ultra96-inmate-demo.c b/configs/arm64/ultra96-inmate-demo.c
index a94d03c5..b766396f 100644
--- a/configs/arm64/ultra96-inmate-demo.c
+++ b/configs/arm64/ultra96-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Avnet Ultra96 board:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2016-2020
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
@@ -30,7 +30,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,9 @@ struct {
 	},
 
 	.cpus = {
-		0b0010,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index 6b4ce7cb..b324e932 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on Avnet Ultra96 board:
  * 2 CPUs, 128M RAM, serial port 2
  *
- * Copyright (c) Siemens AG, 2014-2020
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -30,7 +30,7 @@ struct {
 		.name = "Ultra96-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,12 @@ struct {
 	},
 
 	.cpus = {
-		0b1100,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index b8829741..ea54d09f 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -3,7 +3,7 @@
  *
  * Configuration for Avnet Ultra96 board
  *
- * Copyright (c) Siemens AG, 2016-2020
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,7 +17,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -64,7 +64,7 @@ struct {
 		.root_cell = {
 			.name = "Ultra96",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -75,7 +75,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/zynqmp-zcu102-inmate-demo.c b/configs/arm64/zynqmp-zcu102-inmate-demo.c
index 9f47a402..748d7fba 100644
--- a/configs/arm64/zynqmp-zcu102-inmate-demo.c
+++ b/configs/arm64/zynqmp-zcu102-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Xilinx ZynqMP ZCU102 eval board:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[3];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -28,7 +28,7 @@ struct {
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = 0,
 		.num_pci_devices = 0,
@@ -42,7 +42,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index 3905f5bd..5943400c 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -4,7 +4,7 @@
  * Configuration for 2nd linux-demo inmate on ZynqMP ZCU102:
  * 1 CPU, 112M RAM
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[1];
 	struct jailhouse_memory mem_regions[11];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -31,7 +31,7 @@ struct {
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -47,7 +47,9 @@ struct {
 	},
 
 	.cpus = {
-		0x2,
+		{
+			.phys_id = 1,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index 1d8e00a3..b6561f1e 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on ZynqMP ZCU102:
  * 2 CPUs, 128M RAM, serial port 2
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,7 +18,7 @@
 
 struct {
 	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -30,7 +30,7 @@ struct {
 		.name = "ZynqMP-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
-		.cpu_set_size = sizeof(config.cpus),
+		.num_cpus = ARRAY_SIZE(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -46,7 +46,12 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 750c9b6d..f94a0cd6 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -3,7 +3,7 @@
  *
  * Configuration for Xilinx ZynqMP ZCU102 eval board
  *
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[1];
+	struct jailhouse_cpu cpus[4];
 	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
@@ -65,7 +65,7 @@ struct {
 		.root_cell = {
 			.name = "ZynqMP-ZCU102",
 
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
@@ -76,7 +76,18 @@ struct {
 	},
 
 	.cpus = {
-		0xf,
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
 	},
 
 	.mem_regions = {
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-19-ralf.ramsauer%40oth-regensburg.de.
