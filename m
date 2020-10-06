Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMXG575QKGQE2HURJRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0B2844E2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:46 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id f2sf271196wml.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958706; cv=pass;
        d=google.com; s=arc-20160816;
        b=ocGrBPyAKZ944kozIapY5eA4Mcm4MYs+poYg///8v1fmLjWGjVjyy7RG6aAi5ytDPL
         d+CprXJMy3I7/6FUMl/mqNfBUtOJXQ+JzZnjj7SLlbynKy4pPmIX+QtbslPHw4WuW9vk
         MCAUzLAhPqmpt8DyXD62tpTennvtY5tqFIZlr8WSZE+vJDPwUyyVdR7VDPIHbF9Y9KrO
         hmjulZkiz9fKkirDNHe2bx+21ORNQjb63hLV5u+eLUYdnmorkiTNszJAdi291HPXUXz5
         qqBuMRTtF0qXJ60C23F4p1Fr5RZvT4lND9P9DGYmY2Sg8AGqdJbAYnramn/NJMjjEBxY
         86Bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=LpxivKs/gI7yuZ+naN69WEDFkDCG6/sqzPOFfnvVpow=;
        b=ABdn1L630pJrx5mxv+2Mpz2G3RB9Pa/zoG8Tt3alBvxtNuzieXURKLAA+Rx5BTqWkA
         H+fadBZ2bmZL5UfXakIirITWg3YGu2m11TaDg6Z9VXGhEaiD0rcAa+BJ/J/iQrQAMvmi
         PYrf40cg1e+m3RvVfD02u5h2RWSvehiG0x3CMr9amz7yy0aaZ7VbP4JBrCCfHxvjCIZY
         1bZBHe2TaE6n3Ni3l6CzIVlGo3q8cEGxgHoCLXJyMcTLKynF7zeOkFmg1Y6jWZ7IQI2B
         G8BKmJpwAZuUiH/n1s73twZUJv9XyRdl/HI07pDkvjXzEkcBWEPjDaM4sD2Pr0jw7Fff
         c6pQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LpxivKs/gI7yuZ+naN69WEDFkDCG6/sqzPOFfnvVpow=;
        b=fGKdq1MHA28PAL/0XbuYly09F+jK3x0Zeu6ZzZQqhS7vyXPnSbCTUoO6wTBlgpTGyc
         f48TjS5KFqyA9EHfmr8mV+gXHtJ3fT/YGJv4FLgp1eNf5uWOinCqvVa7clPUq9IAN4gc
         cCb2kaevLmOQ1C82ASNYDgjRqF8M1WAly9C6+fRXOwyh2FK87hvQSQM5i0yWQkeU4gf+
         JxF6FDa3125dAA7PjQaHFkX2a4XuAk1ct4ondLjXWczHRvtgMCV7Pg+wYdk79yvMX2be
         qf7Q78M3XJF3cMa5RDPqCZccdKnEoxIQimzjdgCLpYiIK5QLO/DRMwS6ZBgoxo/Q42z8
         qMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LpxivKs/gI7yuZ+naN69WEDFkDCG6/sqzPOFfnvVpow=;
        b=IAL05+ecSYmAP2m6YjuKaZja84rvfTXejZe5+IQcWsYCtlPK+rSQV1zQ5E+PvMG9LV
         Ug0Wp3LBGlOp6AgJmNrHn82BQkfubmYi/XgZ2R3no+BcQvbvl+EoH97eQfvnIRe8qEM7
         N+T2Ps5+Cvn4SgktpbhU2VYwPhjSvEo9+tOp83PzHpXTJfWPZnsMuZozuqyh3Js4MKlf
         czySu9btSrxk/gdctaxdOoicyutSXJzvCdqfj0Im0BN2wRCW0O/6EjaZORfWHb8IbwZt
         MWyOMWaUr+xa2KirCmcLP3v/gkAnBCSFflvv0YpoXDFNkBjXydGHqp0Vm6UYntFhVuXD
         F8+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530lms6MJEWo0xQKtFHV2CrQOihEkOJ243R+J1jLN8pGpIYVgf/t
	oGZh+R/4sg90OttOOTI79uA=
X-Google-Smtp-Source: ABdhPJyQs+EmzUBjYhRUMiAwX/ktSa8I6YrWacnUSJgED4fge2vy6DSvKg+34J1m957f7rajTpDO/Q==
X-Received: by 2002:a1c:a793:: with SMTP id q141mr2591726wme.137.1601958706311;
        Mon, 05 Oct 2020 21:31:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls1243563wrm.1.gmail; Mon, 05 Oct
 2020 21:31:45 -0700 (PDT)
X-Received: by 2002:adf:eb04:: with SMTP id s4mr2769857wrn.81.1601958705121;
        Mon, 05 Oct 2020 21:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958705; cv=none;
        d=google.com; s=arc-20160816;
        b=SyGqK3/np4vjYRl+yF0R8eFIGQIA82FU9lZfuRifLotiZukVmGr3Lps56deBST5mrO
         dTboaNUkaoUvgjzdP+suij/XKcwa4LpZS93DuaiXwleOtcm8wiF/YrNfQNVnELsUF/KZ
         lAvvbsVDUmlvC6qUo7LhUW+yGhRtsrpCGkFpjdgCdGUleptWL1NnooUhLtQ3xmlbild+
         xMp2bkpP34NlG1eHgY0aKdVlEDrZR26xwj8tgGhWkJwtQkBRdrMdAD5DFB8iPu/YdNeW
         /gqLn8gHE4nFkwQb/hymsQ0A3U/bJeATAGKN6MtyKR/Mrmob8rNsl5/luTUcyPuh7jiP
         1TwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=LsnjO+znvN7VYXAdGgFM96Ak4qSsUjHg5ge5kdwRorg=;
        b=K8UJ8MO84OOc1vMBzUW/VkuX5iRNeCxMTu63Q5I8MeoIhfbRxJpYiH7BswZD1XPJXZ
         sKia/oa6f1O+bDNikDW8JLAbCRoH4zdq+0kJ9/CrhnIgxQnhITWQg/e4ks3vsSJJoIwj
         VAmaSg5j85ntDqbcq+0BJHHeEOUIdWRPOw8u4LGTITC8mPaFOOtl7Sh6g9xwAZVpk8Wn
         W4xtIzph+g8+K7i7XsQ5DgEMbYhil2sBv3FDM9i7l2c/cNO3U3qQGOw5OmLdMnhY9f1n
         EqP/8/u6WvbzOuDclNM6IujxUJRhIbQmd+pd89Kuht4txUCsqSgdkI2YfmFQ7eI+twzE
         9J+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z62si42688wmb.0.2020.10.05.21.31.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964ViDR020133
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:44 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7p008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:43 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 05/19] linux-jailhouse: Add patches for Ultra96-v2
Date: Tue,  6 Oct 2020 06:31:20 +0200
Message-Id: <2b136818b7c003cb92bab2d0e4be657ea94a7015.1601958694.git.jan.kiszka@siemens.com>
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

The SDIO-attached Microchip ATWILC3000 on the Ultra96-v2 requires a
number of tweaks to sdhci-of-arasan and the zynqmp firmware drivers that
only made it into later kernels or are not yet queued for upstream.
Those are the majority of additions. They have been cherry-picked and
adjusted where needed from linux-xlnx 2020.01.

The final patch adds the rev2 device tree which tunes to the specifics
of that board, compared to rev1. This cannot go upstream yet as wilc3000
is no official binding so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...san-Separate-out-clk-related-data-to.patch |  99 ++++++
 ...san-Add-sampling-clock-for-a-phy-to-.patch | 232 +++++++++++++
 ...03-arm64-zynqmp-Add-firmware-DT-node.patch |  37 +++
 ...zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch | 109 +++++++
 ...san-Add-support-to-set-clock-phase-d.patch | 160 +++++++++
 ...ware-xilinx-Add-SDIO-Tap-Delay-nodes.patch |  44 +++
 ...san-Add-support-for-ZynqMP-Platform-.patch | 308 ++++++++++++++++++
 ...irmware-xilinx-Add-DLL-reset-support.patch |  57 ++++
 ...san-Add-support-for-DLL-reset-for-Zy.patch |  99 ++++++
 ...p-Add-ZynqMP-SDHCI-compatible-string.patch |  52 +++
 ...san-Modified-SD-default-speed-to-19M.patch |  64 ++++
 ...support-for-Avnet-Ultra96-rev2-board.patch |  83 +++++
 recipes-kernel/linux/linux-jailhouse_5.4.inc  |  12 +
 13 files changed, 1356 insertions(+)
 create mode 100644 recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch
 create mode 100644 recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch
 create mode 100644 recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch
 create mode 100644 recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch
 create mode 100644 recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch
 create mode 100644 recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch
 create mode 100644 recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch
 create mode 100644 recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch
 create mode 100644 recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch
 create mode 100644 recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch
 create mode 100644 recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch
 create mode 100644 recipes-kernel/linux/files/0012-arm64-dts-Add-support-for-Avnet-Ultra96-rev2-board.patch

diff --git a/recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch b/recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch
new file mode 100644
index 0000000..7950e6c
--- /dev/null
+++ b/recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch
@@ -0,0 +1,99 @@
+From efed4267a13839aee9d7441b101ee5a94fe17ee9 Mon Sep 17 00:00:00 2001
+From: Manish Narani <manish.narani@xilinx.com>
+Date: Fri, 10 Jan 2020 02:17:21 -0700
+Subject: [PATCH 01/12] mmc: sdhci-of-arasan: Separate out clk related data to
+ another structure
+
+To improve the code readability, use two different structs, one for
+clock provider data and one for mmc platform data.
+
+Signed-off-by: Manish Narani <manish.narani@xilinx.com>
+Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
+Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mmc/host/sdhci-of-arasan.c?id=e1463618cd8c1c381ef343cb6efb413ae355eb07
+State: upstream (e1463618cd8c1c381ef343cb6efb413ae355eb07)
+---
+ drivers/mmc/host/sdhci-of-arasan.c | 31 ++++++++++++++++++++----------
+ 1 file changed, 21 insertions(+), 10 deletions(-)
+
+diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
+index 7023cbec4017..701b6cc0f9a3 100644
+--- a/drivers/mmc/host/sdhci-of-arasan.c
++++ b/drivers/mmc/host/sdhci-of-arasan.c
+@@ -71,14 +71,23 @@ struct sdhci_arasan_soc_ctl_map {
+ 	bool					hiword_update;
+ };
+ 
++/**
++ * struct sdhci_arasan_clk_data
++ * @sdcardclk_hw:	Struct for the clock we might provide to a PHY.
++ * @sdcardclk:		Pointer to normal 'struct clock' for sdcardclk_hw.
++ */
++struct sdhci_arasan_clk_data {
++	struct clk_hw	sdcardclk_hw;
++	struct clk      *sdcardclk;
++};
++
+ /**
+  * struct sdhci_arasan_data
+  * @host:		Pointer to the main SDHCI host structure.
+  * @clk_ahb:		Pointer to the AHB clock
+  * @phy:		Pointer to the generic phy
+  * @is_phy_on:		True if the PHY is on; false if not.
+- * @sdcardclk_hw:	Struct for the clock we might provide to a PHY.
+- * @sdcardclk:		Pointer to normal 'struct clock' for sdcardclk_hw.
++ * @clk_data:		Struct for the Arasan Controller Clock Data.
+  * @soc_ctl_base:	Pointer to regmap for syscon for soc_ctl registers.
+  * @soc_ctl_map:	Map to get offsets into soc_ctl registers.
+  */
+@@ -89,8 +98,7 @@ struct sdhci_arasan_data {
+ 	bool		is_phy_on;
+ 
+ 	bool		has_cqe;
+-	struct clk_hw	sdcardclk_hw;
+-	struct clk      *sdcardclk;
++	struct sdhci_arasan_clk_data clk_data;
+ 
+ 	struct regmap	*soc_ctl_base;
+ 	const struct sdhci_arasan_soc_ctl_map *soc_ctl_map;
+@@ -520,8 +528,10 @@ static unsigned long sdhci_arasan_sdcardclk_recalc_rate(struct clk_hw *hw,
+ 						      unsigned long parent_rate)
+ 
+ {
++	struct sdhci_arasan_clk_data *clk_data =
++		container_of(hw, struct sdhci_arasan_clk_data, sdcardclk_hw);
+ 	struct sdhci_arasan_data *sdhci_arasan =
+-		container_of(hw, struct sdhci_arasan_data, sdcardclk_hw);
++		container_of(clk_data, struct sdhci_arasan_data, clk_data);
+ 	struct sdhci_host *host = sdhci_arasan->host;
+ 
+ 	return host->mmc->actual_clock;
+@@ -633,6 +643,7 @@ static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
+ 				       struct clk *clk_xin,
+ 				       struct device *dev)
+ {
++	struct sdhci_arasan_clk_data *clk_data = &sdhci_arasan->clk_data;
+ 	struct device_node *np = dev->of_node;
+ 	struct clk_init_data sdcardclk_init;
+ 	const char *parent_clk_name;
+@@ -655,13 +666,13 @@ static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
+ 	sdcardclk_init.flags = CLK_GET_RATE_NOCACHE;
+ 	sdcardclk_init.ops = &arasan_sdcardclk_ops;
+ 
+-	sdhci_arasan->sdcardclk_hw.init = &sdcardclk_init;
+-	sdhci_arasan->sdcardclk =
+-		devm_clk_register(dev, &sdhci_arasan->sdcardclk_hw);
+-	sdhci_arasan->sdcardclk_hw.init = NULL;
++	clk_data->sdcardclk_hw.init = &sdcardclk_init;
++	clk_data->sdcardclk =
++		devm_clk_register(dev, &clk_data->sdcardclk_hw);
++	clk_data->sdcardclk_hw.init = NULL;
+ 
+ 	ret = of_clk_add_provider(np, of_clk_src_simple_get,
+-				  sdhci_arasan->sdcardclk);
++				  clk_data->sdcardclk);
+ 	if (ret)
+ 		dev_err(dev, "Failed to add clock provider\n");
+ 
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch b/recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch
new file mode 100644
index 0000000..7b9b15e
--- /dev/null
+++ b/recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch
@@ -0,0 +1,232 @@
+From b2ae7e86061f30a1325bbc20f16e24e53032ae02 Mon Sep 17 00:00:00 2001
+From: Manish Narani <manish.narani@xilinx.com>
+Date: Fri, 10 Jan 2020 02:17:23 -0700
+Subject: [PATCH 02/12] mmc: sdhci-of-arasan: Add sampling clock for a phy to
+ use
+
+There are some operations like setting the clock delays may need to have
+two clocks, one for output path and one for input path. Adding input
+path clock for some phys to use.
+
+Signed-off-by: Manish Narani <manish.narani@xilinx.com>
+Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
+Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mmc/host/sdhci-of-arasan.c?id=07a14d1df4547ebc0104331511f25e2a7f3a8858
+State: upstream (07a14d1df4547ebc0104331511f25e2a7f3a8858)
+---
+ drivers/mmc/host/sdhci-of-arasan.c | 151 +++++++++++++++++++++++++----
+ 1 file changed, 134 insertions(+), 17 deletions(-)
+
+diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
+index 701b6cc0f9a3..b75ba780f902 100644
+--- a/drivers/mmc/host/sdhci-of-arasan.c
++++ b/drivers/mmc/host/sdhci-of-arasan.c
+@@ -75,10 +75,14 @@ struct sdhci_arasan_soc_ctl_map {
+  * struct sdhci_arasan_clk_data
+  * @sdcardclk_hw:	Struct for the clock we might provide to a PHY.
+  * @sdcardclk:		Pointer to normal 'struct clock' for sdcardclk_hw.
++ * @sampleclk_hw:	Struct for the clock we might provide to a PHY.
++ * @sampleclk:		Pointer to normal 'struct clock' for sampleclk_hw.
+  */
+ struct sdhci_arasan_clk_data {
+ 	struct clk_hw	sdcardclk_hw;
+ 	struct clk      *sdcardclk;
++	struct clk_hw	sampleclk_hw;
++	struct clk      *sampleclk;
+ };
+ 
+ /**
+@@ -541,6 +545,33 @@ static const struct clk_ops arasan_sdcardclk_ops = {
+ 	.recalc_rate = sdhci_arasan_sdcardclk_recalc_rate,
+ };
+ 
++/**
++ * sdhci_arasan_sampleclk_recalc_rate - Return the sampling clock rate
++ *
++ * Return the current actual rate of the sampling clock.  This can be used
++ * to communicate with out PHY.
++ *
++ * @hw:			Pointer to the hardware clock structure.
++ * @parent_rate		The parent rate (should be rate of clk_xin).
++ * Returns the sample clock rate.
++ */
++static unsigned long sdhci_arasan_sampleclk_recalc_rate(struct clk_hw *hw,
++						      unsigned long parent_rate)
++
++{
++	struct sdhci_arasan_clk_data *clk_data =
++		container_of(hw, struct sdhci_arasan_clk_data, sampleclk_hw);
++	struct sdhci_arasan_data *sdhci_arasan =
++		container_of(clk_data, struct sdhci_arasan_data, clk_data);
++	struct sdhci_host *host = sdhci_arasan->host;
++
++	return host->mmc->actual_clock;
++}
++
++static const struct clk_ops arasan_sampleclk_ops = {
++	.recalc_rate = sdhci_arasan_sampleclk_recalc_rate,
++};
++
+ /**
+  * sdhci_arasan_update_clockmultiplier - Set corecfg_clockmultiplier
+  *
+@@ -620,28 +651,21 @@ static void sdhci_arasan_update_baseclkfreq(struct sdhci_host *host)
+ }
+ 
+ /**
+- * sdhci_arasan_register_sdclk - Register the sdclk for a PHY to use
++ * sdhci_arasan_register_sdcardclk - Register the sdcardclk for a PHY to use
+  *
+  * Some PHY devices need to know what the actual card clock is.  In order for
+  * them to find out, we'll provide a clock through the common clock framework
+  * for them to query.
+  *
+- * Note: without seriously re-architecting SDHCI's clock code and testing on
+- * all platforms, there's no way to create a totally beautiful clock here
+- * with all clock ops implemented.  Instead, we'll just create a clock that can
+- * be queried and set the CLK_GET_RATE_NOCACHE attribute to tell common clock
+- * framework that we're doing things behind its back.  This should be sufficient
+- * to create nice clean device tree bindings and later (if needed) we can try
+- * re-architecting SDHCI if we see some benefit to it.
+- *
+  * @sdhci_arasan:	Our private data structure.
+  * @clk_xin:		Pointer to the functional clock
+  * @dev:		Pointer to our struct device.
+  * Returns 0 on success and error value on error
+  */
+-static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
+-				       struct clk *clk_xin,
+-				       struct device *dev)
++static int
++sdhci_arasan_register_sdcardclk(struct sdhci_arasan_data *sdhci_arasan,
++				struct clk *clk_xin,
++				struct device *dev)
+ {
+ 	struct sdhci_arasan_clk_data *clk_data = &sdhci_arasan->clk_data;
+ 	struct device_node *np = dev->of_node;
+@@ -649,10 +673,6 @@ static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
+ 	const char *parent_clk_name;
+ 	int ret;
+ 
+-	/* Providing a clock to the PHY is optional; no error if missing */
+-	if (!of_find_property(np, "#clock-cells", NULL))
+-		return 0;
+-
+ 	ret = of_property_read_string_index(np, "clock-output-names", 0,
+ 					    &sdcardclk_init.name);
+ 	if (ret) {
+@@ -674,7 +694,56 @@ static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
+ 	ret = of_clk_add_provider(np, of_clk_src_simple_get,
+ 				  clk_data->sdcardclk);
+ 	if (ret)
+-		dev_err(dev, "Failed to add clock provider\n");
++		dev_err(dev, "Failed to add sdcard clock provider\n");
++
++	return ret;
++}
++
++/**
++ * sdhci_arasan_register_sampleclk - Register the sampleclk for a PHY to use
++ *
++ * Some PHY devices need to know what the actual card clock is.  In order for
++ * them to find out, we'll provide a clock through the common clock framework
++ * for them to query.
++ *
++ * @sdhci_arasan:	Our private data structure.
++ * @clk_xin:		Pointer to the functional clock
++ * @dev:		Pointer to our struct device.
++ * Returns 0 on success and error value on error
++ */
++static int
++sdhci_arasan_register_sampleclk(struct sdhci_arasan_data *sdhci_arasan,
++				struct clk *clk_xin,
++				struct device *dev)
++{
++	struct sdhci_arasan_clk_data *clk_data = &sdhci_arasan->clk_data;
++	struct device_node *np = dev->of_node;
++	struct clk_init_data sampleclk_init;
++	const char *parent_clk_name;
++	int ret;
++
++	ret = of_property_read_string_index(np, "clock-output-names", 1,
++					    &sampleclk_init.name);
++	if (ret) {
++		dev_err(dev, "DT has #clock-cells but no clock-output-names\n");
++		return ret;
++	}
++
++	parent_clk_name = __clk_get_name(clk_xin);
++	sampleclk_init.parent_names = &parent_clk_name;
++	sampleclk_init.num_parents = 1;
++	sampleclk_init.flags = CLK_GET_RATE_NOCACHE;
++	sampleclk_init.ops = &arasan_sampleclk_ops;
++
++	clk_data->sampleclk_hw.init = &sampleclk_init;
++	clk_data->sampleclk =
++		devm_clk_register(dev, &clk_data->sampleclk_hw);
++	clk_data->sampleclk_hw.init = NULL;
++
++	ret = of_clk_add_provider(np, of_clk_src_simple_get,
++				  clk_data->sampleclk);
++	if (ret)
++		dev_err(dev, "Failed to add sample clock provider\n");
+ 
+ 	return ret;
+ }
+@@ -697,6 +766,54 @@ static void sdhci_arasan_unregister_sdclk(struct device *dev)
+ 	of_clk_del_provider(dev->of_node);
+ }
+ 
++/**
++ * sdhci_arasan_register_sdclk - Register the sdcardclk for a PHY to use
++ *
++ * Some PHY devices need to know what the actual card clock is.  In order for
++ * them to find out, we'll provide a clock through the common clock framework
++ * for them to query.
++ *
++ * Note: without seriously re-architecting SDHCI's clock code and testing on
++ * all platforms, there's no way to create a totally beautiful clock here
++ * with all clock ops implemented.  Instead, we'll just create a clock that can
++ * be queried and set the CLK_GET_RATE_NOCACHE attribute to tell common clock
++ * framework that we're doing things behind its back.  This should be sufficient
++ * to create nice clean device tree bindings and later (if needed) we can try
++ * re-architecting SDHCI if we see some benefit to it.
++ *
++ * @sdhci_arasan:	Our private data structure.
++ * @clk_xin:		Pointer to the functional clock
++ * @dev:		Pointer to our struct device.
++ * Returns 0 on success and error value on error
++ */
++static int sdhci_arasan_register_sdclk(struct sdhci_arasan_data *sdhci_arasan,
++				       struct clk *clk_xin,
++				       struct device *dev)
++{
++	struct device_node *np = dev->of_node;
++	u32 num_clks = 0;
++	int ret;
++
++	/* Providing a clock to the PHY is optional; no error if missing */
++	if (of_property_read_u32(np, "#clock-cells", &num_clks) < 0)
++		return 0;
++
++	ret = sdhci_arasan_register_sdcardclk(sdhci_arasan, clk_xin, dev);
++	if (ret)
++		return ret;
++
++	if (num_clks) {
++		ret = sdhci_arasan_register_sampleclk(sdhci_arasan, clk_xin,
++						      dev);
++		if (ret) {
++			sdhci_arasan_unregister_sdclk(dev);
++			return ret;
++		}
++	}
++
++	return 0;
++}
++
+ static int sdhci_arasan_add_host(struct sdhci_arasan_data *sdhci_arasan)
+ {
+ 	struct sdhci_host *host = sdhci_arasan->host;
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch b/recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch
new file mode 100644
index 0000000..635b1b4
--- /dev/null
+++ b/recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch
@@ -0,0 +1,37 @@
+From 5dfbe0b3dce445b2e637dbd4a3afc6e93124d768 Mon Sep 17 00:00:00 2001
+From: Rajan Vaja <rajan.vaja@xilinx.com>
+Date: Fri, 18 Oct 2019 18:07:31 +0200
+Subject: [PATCH 03/12] arm64: zynqmp: Add firmware DT node
+
+Add firmware DT node in ZynqMP device tree. This node
+uses bindings as per new firmware interface driver.
+
+Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
+Signed-off-by: Michal Simek <michal.simek@xilinx.com>
+Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
+State: upstream (ef0d933efa8256b6ad462f60c8cdd4255ed5dc28)
+---
+ arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+index 9aa67340a4d8..9115eaebbf70 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
++++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+@@ -115,6 +115,13 @@
+ 		method = "smc";
+ 	};
+ 
++	firmware {
++		zynqmp_firmware: zynqmp-firmware {
++			compatible = "xlnx,zynqmp-firmware";
++			method = "smc";
++		};
++	};
++
+ 	timer {
+ 		compatible = "arm,armv8-timer";
+ 		interrupt-parent = <&gic>;
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch b/recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch
new file mode 100644
index 0000000..fed3518
--- /dev/null
+++ b/recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch
@@ -0,0 +1,109 @@
+From 1590acccababd46c451214554ec9458986981487 Mon Sep 17 00:00:00 2001
+From: Rajan Vaja <rajan.vaja@xilinx.com>
+Date: Mon, 23 Dec 2019 00:34:59 -0800
+Subject: [PATCH 04/12] firmware: zynqmp: Add Node IDs in xlnx-zynqmp.h
+
+Add Node IDs in xlnx-zynqmp.h, which is required for using EEMI APIs.
+
+Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
+State: pending
+---
+ include/linux/firmware/xlnx-zynqmp.h | 82 ++++++++++++++++++++++++++++
+ 1 file changed, 82 insertions(+)
+
+diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
+index 778abbbc7d94..fad681ba97d5 100644
+--- a/include/linux/firmware/xlnx-zynqmp.h
++++ b/include/linux/firmware/xlnx-zynqmp.h
+@@ -250,6 +250,88 @@ enum zynqmp_pm_request_ack {
+ 	ZYNQMP_PM_REQUEST_ACK_NON_BLOCKING,
+ };
+ 
++enum pm_node_id {
++	NODE_UNKNOWN = 0,
++	NODE_APU,
++	NODE_APU_0,
++	NODE_APU_1,
++	NODE_APU_2,
++	NODE_APU_3,
++	NODE_RPU,
++	NODE_RPU_0,
++	NODE_RPU_1,
++	NODE_PLD,
++	NODE_FPD,
++	NODE_OCM_BANK_0,
++	NODE_OCM_BANK_1,
++	NODE_OCM_BANK_2,
++	NODE_OCM_BANK_3,
++	NODE_TCM_0_A,
++	NODE_TCM_0_B,
++	NODE_TCM_1_A,
++	NODE_TCM_1_B,
++	NODE_L2,
++	NODE_GPU_PP_0,
++	NODE_GPU_PP_1,
++	NODE_USB_0,
++	NODE_USB_1,
++	NODE_TTC_0,
++	NODE_TTC_1,
++	NODE_TTC_2,
++	NODE_TTC_3,
++	NODE_SATA,
++	NODE_ETH_0,
++	NODE_ETH_1,
++	NODE_ETH_2,
++	NODE_ETH_3,
++	NODE_UART_0,
++	NODE_UART_1,
++	NODE_SPI_0,
++	NODE_SPI_1,
++	NODE_I2C_0,
++	NODE_I2C_1,
++	NODE_SD_0,
++	NODE_SD_1,
++	NODE_DP,
++	NODE_GDMA,
++	NODE_ADMA,
++	NODE_NAND,
++	NODE_QSPI,
++	NODE_GPIO,
++	NODE_CAN_0,
++	NODE_CAN_1,
++	NODE_EXTERN,
++	NODE_APLL,
++	NODE_VPLL,
++	NODE_DPLL,
++	NODE_RPLL,
++	NODE_IOPLL,
++	NODE_DDR,
++	NODE_IPI_APU,
++	NODE_IPI_RPU_0,
++	NODE_GPU,
++	NODE_PCIE,
++	NODE_PCAP,
++	NODE_RTC,
++	NODE_LPD,
++	NODE_VCU,
++	NODE_IPI_RPU_1,
++	NODE_IPI_PL_0,
++	NODE_IPI_PL_1,
++	NODE_IPI_PL_2,
++	NODE_IPI_PL_3,
++	NODE_PL,
++	NODE_GEM_TSU,
++	NODE_SWDT_0,
++	NODE_SWDT_1,
++	NODE_CSU,
++	NODE_PJTAG,
++	NODE_TRACE,
++	NODE_TESTSCAN,
++	NODE_PMU,
++	NODE_MAX,
++};
++
+ /**
+  * struct zynqmp_pm_query_data - PM query data
+  * @qid:	query ID
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch b/recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch
new file mode 100644
index 0000000..198dcb9
--- /dev/null
+++ b/recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch
@@ -0,0 +1,160 @@
+From 3dd549f60684322f64e7c8f1dc1acc63256c5b81 Mon Sep 17 00:00:00 2001
+From: Manish Narani <manish.narani@xilinx.com>
+Date: Fri, 10 Jan 2020 02:17:25 -0700
+Subject: [PATCH 05/12] mmc: sdhci-of-arasan: Add support to set clock phase
+ delays for SD
+
+Add support to read Clock Phase Delays from the DT and set it via
+clk_set_phase() API from clock framework. Some of the controllers might
+have their own handling of setting clock delays, for this keep the
+set_clk_delays as function pointer which can be assigned controller
+specific handling of the same.
+
+Signed-off-by: Manish Narani <manish.narani@xilinx.com>
+Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
+Link : https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mmc/host/sdhci-of-arasan.c?id=f3dafc374a82929c679a0e791f43cc53268af952
+State: upstream (f3dafc374a82929c679a0e791f43cc53268af952)
+---
+ drivers/mmc/host/sdhci-of-arasan.c | 92 ++++++++++++++++++++++++++++++
+ 1 file changed, 92 insertions(+)
+
+diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
+index b75ba780f902..9452ae01f6fa 100644
+--- a/drivers/mmc/host/sdhci-of-arasan.c
++++ b/drivers/mmc/host/sdhci-of-arasan.c
+@@ -77,12 +77,18 @@ struct sdhci_arasan_soc_ctl_map {
+  * @sdcardclk:		Pointer to normal 'struct clock' for sdcardclk_hw.
+  * @sampleclk_hw:	Struct for the clock we might provide to a PHY.
+  * @sampleclk:		Pointer to normal 'struct clock' for sampleclk_hw.
++ * @clk_phase_in:	Array of Input Clock Phase Delays for all speed modes
++ * @clk_phase_out:	Array of Output Clock Phase Delays for all speed modes
++ * @set_clk_delays:	Function pointer for setting Clock Delays
+  */
+ struct sdhci_arasan_clk_data {
+ 	struct clk_hw	sdcardclk_hw;
+ 	struct clk      *sdcardclk;
+ 	struct clk_hw	sampleclk_hw;
+ 	struct clk      *sampleclk;
++	int		clk_phase_in[MMC_TIMING_MMC_HS400 + 1];
++	int		clk_phase_out[MMC_TIMING_MMC_HS400 + 1];
++	void		(*set_clk_delays)(struct sdhci_host *host);
+ };
+ 
+ /**
+@@ -186,6 +192,7 @@ static void sdhci_arasan_set_clock(struct sdhci_host *host, unsigned int clock)
+ {
+ 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+ 	struct sdhci_arasan_data *sdhci_arasan = sdhci_pltfm_priv(pltfm_host);
++	struct sdhci_arasan_clk_data *clk_data = &sdhci_arasan->clk_data;
+ 	bool ctrl_phy = false;
+ 
+ 	if (!IS_ERR(sdhci_arasan->phy)) {
+@@ -227,6 +234,10 @@ static void sdhci_arasan_set_clock(struct sdhci_host *host, unsigned int clock)
+ 		sdhci_arasan->is_phy_on = false;
+ 	}
+ 
++	/* Set the Input and Output Clock Phase Delays */
++	if (clk_data->set_clk_delays)
++		clk_data->set_clk_delays(host);
++
+ 	sdhci_set_clock(host, clock);
+ 
+ 	if (sdhci_arasan->quirks & SDHCI_ARASAN_QUIRK_CLOCK_UNSTABLE)
+@@ -650,6 +661,85 @@ static void sdhci_arasan_update_baseclkfreq(struct sdhci_host *host)
+ 	sdhci_arasan_syscon_write(host, &soc_ctl_map->baseclkfreq, mhz);
+ }
+ 
++static void sdhci_arasan_set_clk_delays(struct sdhci_host *host)
++{
++	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
++	struct sdhci_arasan_data *sdhci_arasan = sdhci_pltfm_priv(pltfm_host);
++	struct sdhci_arasan_clk_data *clk_data = &sdhci_arasan->clk_data;
++
++	clk_set_phase(clk_data->sampleclk,
++		      clk_data->clk_phase_in[host->timing]);
++	clk_set_phase(clk_data->sdcardclk,
++		      clk_data->clk_phase_out[host->timing]);
++}
++
++static void arasan_dt_read_clk_phase(struct device *dev,
++				     struct sdhci_arasan_clk_data *clk_data,
++				     unsigned int timing, const char *prop)
++{
++	struct device_node *np = dev->of_node;
++
++	int clk_phase[2] = {0};
++
++	/*
++	 * Read Tap Delay values from DT, if the DT does not contain the
++	 * Tap Values then use the pre-defined values.
++	 */
++	if (of_property_read_variable_u32_array(np, prop, &clk_phase[0],
++						2, 0)) {
++		dev_dbg(dev, "Using predefined clock phase for %s = %d %d\n",
++			prop, clk_data->clk_phase_in[timing],
++			clk_data->clk_phase_out[timing]);
++		return;
++	}
++
++	/* The values read are Input and Output Clock Delays in order */
++	clk_data->clk_phase_in[timing] = clk_phase[0];
++	clk_data->clk_phase_out[timing] = clk_phase[1];
++}
++
++/**
++ * arasan_dt_parse_clk_phases - Read Clock Delay values from DT
++ *
++ * Called at initialization to parse the values of Clock Delays.
++ *
++ * @dev:		Pointer to our struct device.
++ * @clk_data:		Pointer to the Clock Data structure
++ */
++static void arasan_dt_parse_clk_phases(struct device *dev,
++				       struct sdhci_arasan_clk_data *clk_data)
++{
++	/*
++	 * This has been kept as a pointer and is assigned a function here.
++	 * So that different controller variants can assign their own handling
++	 * function.
++	 */
++	clk_data->set_clk_delays = sdhci_arasan_set_clk_delays;
++
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_LEGACY,
++				 "clk-phase-legacy");
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_MMC_HS,
++				 "clk-phase-mmc-hs");
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_SD_HS,
++				 "clk-phase-sd-hs");
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_UHS_SDR12,
++				 "clk-phase-uhs-sdr12");
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_UHS_SDR25,
++				 "clk-phase-uhs-sdr25");
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_UHS_SDR50,
++				 "clk-phase-uhs-sdr50");
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_UHS_SDR104,
++				 "clk-phase-uhs-sdr104");
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_UHS_DDR50,
++				 "clk-phase-uhs-ddr50");
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_MMC_DDR52,
++				 "clk-phase-mmc-ddr52");
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_MMC_HS200,
++				 "clk-phase-mmc-hs200");
++	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_MMC_HS400,
++				 "clk-phase-mmc-hs400");
++}
++
+ /**
+  * sdhci_arasan_register_sdcardclk - Register the sdcardclk for a PHY to use
+  *
+@@ -942,6 +1032,8 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
+ 	if (ret)
+ 		goto clk_disable_all;
+ 
++	arasan_dt_parse_clk_phases(&pdev->dev, &sdhci_arasan->clk_data);
++
+ 	ret = mmc_of_parse(host->mmc);
+ 	if (ret) {
+ 		if (ret != -EPROBE_DEFER)
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch b/recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch
new file mode 100644
index 0000000..88f4d94
--- /dev/null
+++ b/recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch
@@ -0,0 +1,44 @@
+From 6f56034f6d06881b9f016f5320a4c57129a10a75 Mon Sep 17 00:00:00 2001
+From: Manish Narani <manish.narani@xilinx.com>
+Date: Fri, 10 Jan 2020 02:17:26 -0700
+Subject: [PATCH 06/12] firmware: xilinx: Add SDIO Tap Delay nodes
+
+Add tap delay nodes for setting SDIO Tap Delays on ZynqMP platform.
+
+Signed-off-by: Manish Narani <manish.narani@xilinx.com>
+Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
+Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/firmware/xlnx-zynqmp.h?id=1ed7d5c8f82d2aebabb6fe24f436a68bdd8c1065
+State: upstream (1ed7d5c8f82d2aebabb6fe24f436a68bdd8c1065)
+---
+ include/linux/firmware/xlnx-zynqmp.h | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
+index fad681ba97d5..d30f354eed09 100644
+--- a/include/linux/firmware/xlnx-zynqmp.h
++++ b/include/linux/firmware/xlnx-zynqmp.h
+@@ -91,7 +91,8 @@ enum pm_ret_status {
+ };
+ 
+ enum pm_ioctl_id {
+-	IOCTL_SET_PLL_FRAC_MODE = 8,
++	IOCTL_SET_SD_TAPDELAY = 7,
++	IOCTL_SET_PLL_FRAC_MODE,
+ 	IOCTL_GET_PLL_FRAC_MODE,
+ 	IOCTL_SET_PLL_FRAC_DATA,
+ 	IOCTL_GET_PLL_FRAC_DATA,
+@@ -250,6 +251,11 @@ enum zynqmp_pm_request_ack {
+ 	ZYNQMP_PM_REQUEST_ACK_NON_BLOCKING,
+ };
+ 
++enum tap_delay_type {
++	PM_TAPDELAY_INPUT = 0,
++	PM_TAPDELAY_OUTPUT,
++};
++
+ enum pm_node_id {
+ 	NODE_UNKNOWN = 0,
+ 	NODE_APU,
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch b/recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch
new file mode 100644
index 0000000..988cc3d
--- /dev/null
+++ b/recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch
@@ -0,0 +1,308 @@
+From fa38046c53f1e02af90579437bd290dc5c5d8a49 Mon Sep 17 00:00:00 2001
+From: Manish Narani <manish.narani@xilinx.com>
+Date: Fri, 10 Jan 2020 02:17:28 -0700
+Subject: [PATCH 07/12] mmc: sdhci-of-arasan: Add support for ZynqMP Platform
+ Tap Delays Setup
+
+Apart from taps set by auto tuning, ZynqMP platform has feature to set
+the tap values manually. Add support to set tap delay values in HW via
+ZynqMP SoC framework.
+
+Signed-off-by: Manish Narani <manish.narani@xilinx.com>
+Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
+Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/mmc/host/sdhci-of-arasan.c?id=a5c8b2ae2e5123c8a6b291e2c56ba5c39b645a95
+State: upstream (a5c8b2ae2e5123c8a6b291e2c56ba5c39b645a95)
+---
+ drivers/mmc/host/sdhci-of-arasan.c | 206 ++++++++++++++++++++++++++++-
+ 1 file changed, 204 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
+index 9452ae01f6fa..228dbeef74a8 100644
+--- a/drivers/mmc/host/sdhci-of-arasan.c
++++ b/drivers/mmc/host/sdhci-of-arasan.c
+@@ -22,6 +22,7 @@
+ #include <linux/phy/phy.h>
+ #include <linux/regmap.h>
+ #include <linux/of.h>
++#include <linux/firmware/xlnx-zynqmp.h>
+ 
+ #include "cqhci.h"
+ #include "sdhci-pltfm.h"
+@@ -32,6 +33,10 @@
+ 
+ #define PHY_CLK_TOO_SLOW_HZ		400000
+ 
++/* Default settings for ZynqMP Clock Phases */
++#define ZYNQMP_ICLK_PHASE {0, 63, 63, 0, 63,  0,   0, 183, 54,  0, 0}
++#define ZYNQMP_OCLK_PHASE {0, 72, 60, 0, 60, 72, 135, 48, 72, 135, 0}
++
+ /*
+  * On some SoCs the syscon area has a feature where the upper 16-bits of
+  * each 32-bit register act as a write mask for the lower 16-bits.  This allows
+@@ -80,6 +85,7 @@ struct sdhci_arasan_soc_ctl_map {
+  * @clk_phase_in:	Array of Input Clock Phase Delays for all speed modes
+  * @clk_phase_out:	Array of Output Clock Phase Delays for all speed modes
+  * @set_clk_delays:	Function pointer for setting Clock Delays
++ * @clk_of_data:	Platform specific runtime clock data storage pointer
+  */
+ struct sdhci_arasan_clk_data {
+ 	struct clk_hw	sdcardclk_hw;
+@@ -89,6 +95,11 @@ struct sdhci_arasan_clk_data {
+ 	int		clk_phase_in[MMC_TIMING_MMC_HS400 + 1];
+ 	int		clk_phase_out[MMC_TIMING_MMC_HS400 + 1];
+ 	void		(*set_clk_delays)(struct sdhci_host *host);
++	void		*clk_of_data;
++};
++
++struct sdhci_arasan_zynqmp_clk_data {
++	const struct zynqmp_eemi_ops *eemi_ops;
+ };
+ 
+ /**
+@@ -525,6 +536,10 @@ static const struct of_device_id sdhci_arasan_of_match[] = {
+ 		.compatible = "arasan,sdhci-4.9a",
+ 		.data = &sdhci_arasan_data,
+ 	},
++	{
++		.compatible = "xlnx,zynqmp-8.9a",
++		.data = &sdhci_arasan_data,
++	},
+ 	{ /* sentinel */ }
+ };
+ MODULE_DEVICE_TABLE(of, sdhci_arasan_of_match);
+@@ -583,6 +598,150 @@ static const struct clk_ops arasan_sampleclk_ops = {
+ 	.recalc_rate = sdhci_arasan_sampleclk_recalc_rate,
+ };
+ 
++/**
++ * sdhci_zynqmp_sdcardclk_set_phase - Set the SD Output Clock Tap Delays
++ *
++ * Set the SD Output Clock Tap Delays for Output path
++ *
++ * @hw:			Pointer to the hardware clock structure.
++ * @degrees		The clock phase shift between 0 - 359.
++ * Return: 0 on success and error value on error
++ */
++static int sdhci_zynqmp_sdcardclk_set_phase(struct clk_hw *hw, int degrees)
++
++{
++	struct sdhci_arasan_clk_data *clk_data =
++		container_of(hw, struct sdhci_arasan_clk_data, sdcardclk_hw);
++	struct sdhci_arasan_data *sdhci_arasan =
++		container_of(clk_data, struct sdhci_arasan_data, clk_data);
++	struct sdhci_host *host = sdhci_arasan->host;
++	struct sdhci_arasan_zynqmp_clk_data *zynqmp_clk_data =
++		clk_data->clk_of_data;
++	const struct zynqmp_eemi_ops *eemi_ops = zynqmp_clk_data->eemi_ops;
++	const char *clk_name = clk_hw_get_name(hw);
++	u32 node_id = !strcmp(clk_name, "clk_out_sd0") ? NODE_SD_0 : NODE_SD_1;
++	u8 tap_delay, tap_max = 0;
++	int ret;
++
++	/*
++	 * This is applicable for SDHCI_SPEC_300 and above
++	 * ZynqMP does not set phase for <=25MHz clock.
++	 * If degrees is zero, no need to do anything.
++	 */
++	if (host->version < SDHCI_SPEC_300 ||
++	    host->timing == MMC_TIMING_LEGACY ||
++	    host->timing == MMC_TIMING_UHS_SDR12 || !degrees)
++		return 0;
++
++	switch (host->timing) {
++	case MMC_TIMING_MMC_HS:
++	case MMC_TIMING_SD_HS:
++	case MMC_TIMING_UHS_SDR25:
++	case MMC_TIMING_UHS_DDR50:
++	case MMC_TIMING_MMC_DDR52:
++		/* For 50MHz clock, 30 Taps are available */
++		tap_max = 30;
++		break;
++	case MMC_TIMING_UHS_SDR50:
++		/* For 100MHz clock, 15 Taps are available */
++		tap_max = 15;
++		break;
++	case MMC_TIMING_UHS_SDR104:
++	case MMC_TIMING_MMC_HS200:
++		/* For 200MHz clock, 8 Taps are available */
++		tap_max = 8;
++	default:
++		break;
++	}
++
++	tap_delay = (degrees * tap_max) / 360;
++
++	/* Set the Clock Phase */
++	ret = eemi_ops->ioctl(node_id, IOCTL_SET_SD_TAPDELAY,
++			      PM_TAPDELAY_OUTPUT, tap_delay, NULL);
++	if (ret)
++		pr_err("Error setting Output Tap Delay\n");
++
++	return ret;
++}
++
++static const struct clk_ops zynqmp_sdcardclk_ops = {
++	.recalc_rate = sdhci_arasan_sdcardclk_recalc_rate,
++	.set_phase = sdhci_zynqmp_sdcardclk_set_phase,
++};
++
++/**
++ * sdhci_zynqmp_sampleclk_set_phase - Set the SD Input Clock Tap Delays
++ *
++ * Set the SD Input Clock Tap Delays for Input path
++ *
++ * @hw:			Pointer to the hardware clock structure.
++ * @degrees		The clock phase shift between 0 - 359.
++ * Return: 0 on success and error value on error
++ */
++static int sdhci_zynqmp_sampleclk_set_phase(struct clk_hw *hw, int degrees)
++
++{
++	struct sdhci_arasan_clk_data *clk_data =
++		container_of(hw, struct sdhci_arasan_clk_data, sampleclk_hw);
++	struct sdhci_arasan_data *sdhci_arasan =
++		container_of(clk_data, struct sdhci_arasan_data, clk_data);
++	struct sdhci_host *host = sdhci_arasan->host;
++	struct sdhci_arasan_zynqmp_clk_data *zynqmp_clk_data =
++		clk_data->clk_of_data;
++	const struct zynqmp_eemi_ops *eemi_ops = zynqmp_clk_data->eemi_ops;
++	const char *clk_name = clk_hw_get_name(hw);
++	u32 node_id = !strcmp(clk_name, "clk_in_sd0") ? NODE_SD_0 : NODE_SD_1;
++	u8 tap_delay, tap_max = 0;
++	int ret;
++
++	/*
++	 * This is applicable for SDHCI_SPEC_300 and above
++	 * ZynqMP does not set phase for <=25MHz clock.
++	 * If degrees is zero, no need to do anything.
++	 */
++	if (host->version < SDHCI_SPEC_300 ||
++	    host->timing == MMC_TIMING_LEGACY ||
++	    host->timing == MMC_TIMING_UHS_SDR12 || !degrees)
++		return 0;
++
++	switch (host->timing) {
++	case MMC_TIMING_MMC_HS:
++	case MMC_TIMING_SD_HS:
++	case MMC_TIMING_UHS_SDR25:
++	case MMC_TIMING_UHS_DDR50:
++	case MMC_TIMING_MMC_DDR52:
++		/* For 50MHz clock, 120 Taps are available */
++		tap_max = 120;
++		break;
++	case MMC_TIMING_UHS_SDR50:
++		/* For 100MHz clock, 60 Taps are available */
++		tap_max = 60;
++		break;
++	case MMC_TIMING_UHS_SDR104:
++	case MMC_TIMING_MMC_HS200:
++		/* For 200MHz clock, 30 Taps are available */
++		tap_max = 30;
++	default:
++		break;
++	}
++
++	tap_delay = (degrees * tap_max) / 360;
++
++	/* Set the Clock Phase */
++	ret = eemi_ops->ioctl(node_id, IOCTL_SET_SD_TAPDELAY,
++			      PM_TAPDELAY_INPUT, tap_delay, NULL);
++	if (ret)
++		pr_err("Error setting Input Tap Delay\n");
++
++	return ret;
++}
++
++static const struct clk_ops zynqmp_sampleclk_ops = {
++	.recalc_rate = sdhci_arasan_sampleclk_recalc_rate,
++	.set_phase = sdhci_zynqmp_sampleclk_set_phase,
++};
++
+ /**
+  * sdhci_arasan_update_clockmultiplier - Set corecfg_clockmultiplier
+  *
+@@ -709,6 +868,10 @@ static void arasan_dt_read_clk_phase(struct device *dev,
+ static void arasan_dt_parse_clk_phases(struct device *dev,
+ 				       struct sdhci_arasan_clk_data *clk_data)
+ {
++	int *iclk_phase, *oclk_phase;
++	u32 mio_bank = 0;
++	int i;
++
+ 	/*
+ 	 * This has been kept as a pointer and is assigned a function here.
+ 	 * So that different controller variants can assign their own handling
+@@ -716,6 +879,22 @@ static void arasan_dt_parse_clk_phases(struct device *dev,
+ 	 */
+ 	clk_data->set_clk_delays = sdhci_arasan_set_clk_delays;
+ 
++	if (of_device_is_compatible(dev->of_node, "xlnx,zynqmp-8.9a")) {
++		iclk_phase = (int [MMC_TIMING_MMC_HS400 + 1]) ZYNQMP_ICLK_PHASE;
++		oclk_phase = (int [MMC_TIMING_MMC_HS400 + 1]) ZYNQMP_OCLK_PHASE;
++
++		of_property_read_u32(dev->of_node, "xlnx,mio-bank", &mio_bank);
++		if (mio_bank == 2) {
++			oclk_phase[MMC_TIMING_UHS_SDR104] = 90;
++			oclk_phase[MMC_TIMING_MMC_HS200] = 90;
++		}
++
++		for (i = 0; i <= MMC_TIMING_MMC_HS400; i++) {
++			clk_data->clk_phase_in[i] = iclk_phase[i];
++			clk_data->clk_phase_out[i] = oclk_phase[i];
++		}
++	}
++
+ 	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_LEGACY,
+ 				 "clk-phase-legacy");
+ 	arasan_dt_read_clk_phase(dev, clk_data, MMC_TIMING_MMC_HS,
+@@ -774,7 +953,10 @@ sdhci_arasan_register_sdcardclk(struct sdhci_arasan_data *sdhci_arasan,
+ 	sdcardclk_init.parent_names = &parent_clk_name;
+ 	sdcardclk_init.num_parents = 1;
+ 	sdcardclk_init.flags = CLK_GET_RATE_NOCACHE;
+-	sdcardclk_init.ops = &arasan_sdcardclk_ops;
++	if (of_device_is_compatible(np, "xlnx,zynqmp-8.9a"))
++		sdcardclk_init.ops = &zynqmp_sdcardclk_ops;
++	else
++		sdcardclk_init.ops = &arasan_sdcardclk_ops;
+ 
+ 	clk_data->sdcardclk_hw.init = &sdcardclk_init;
+ 	clk_data->sdcardclk =
+@@ -823,7 +1005,10 @@ sdhci_arasan_register_sampleclk(struct sdhci_arasan_data *sdhci_arasan,
+ 	sampleclk_init.parent_names = &parent_clk_name;
+ 	sampleclk_init.num_parents = 1;
+ 	sampleclk_init.flags = CLK_GET_RATE_NOCACHE;
+-	sampleclk_init.ops = &arasan_sampleclk_ops;
++	if (of_device_is_compatible(np, "xlnx,zynqmp-8.9a"))
++		sampleclk_init.ops = &zynqmp_sampleclk_ops;
++	else
++		sampleclk_init.ops = &arasan_sampleclk_ops;
+ 
+ 	clk_data->sampleclk_hw.init = &sampleclk_init;
+ 	clk_data->sampleclk =
+@@ -1032,6 +1217,23 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
+ 	if (ret)
+ 		goto clk_disable_all;
+ 
++	if (of_device_is_compatible(np, "xlnx,zynqmp-8.9a")) {
++		struct sdhci_arasan_zynqmp_clk_data *zynqmp_clk_data;
++		const struct zynqmp_eemi_ops *eemi_ops;
++
++		zynqmp_clk_data = devm_kzalloc(&pdev->dev,
++					       sizeof(*zynqmp_clk_data),
++					       GFP_KERNEL);
++		eemi_ops = zynqmp_pm_get_eemi_ops();
++		if (IS_ERR(eemi_ops)) {
++			ret = PTR_ERR(eemi_ops);
++			goto unreg_clk;
++		}
++
++		zynqmp_clk_data->eemi_ops = eemi_ops;
++		sdhci_arasan->clk_data.clk_of_data = zynqmp_clk_data;
++	}
++
+ 	arasan_dt_parse_clk_phases(&pdev->dev, &sdhci_arasan->clk_data);
+ 
+ 	ret = mmc_of_parse(host->mmc);
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch b/recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch
new file mode 100644
index 0000000..9755b12
--- /dev/null
+++ b/recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch
@@ -0,0 +1,57 @@
+From a4bb3bf0ca0ffc87a12e7dafd59c03ec2a919cf6 Mon Sep 17 00:00:00 2001
+From: Manish Narani <manish.narani@xilinx.com>
+Date: Fri, 10 Jan 2020 02:17:29 -0700
+Subject: [PATCH 08/12] firmware: xilinx: Add DLL reset support
+
+Add DLL reset support in ZynqMP firmware driver for SD DLL reset.
+
+Signed-off-by: Manish Narani <manish.narani@xilinx.com>
+State: pending
+---
+ drivers/firmware/xilinx/zynqmp.c     | 2 ++
+ include/linux/firmware/xlnx-zynqmp.h | 9 ++++++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
+index fd3d83745208..d41c0983e8d7 100644
+--- a/drivers/firmware/xilinx/zynqmp.c
++++ b/drivers/firmware/xilinx/zynqmp.c
+@@ -473,6 +473,8 @@ static inline int zynqmp_is_valid_ioctl(u32 ioctl_id)
+ 	case IOCTL_GET_PLL_FRAC_MODE:
+ 	case IOCTL_SET_PLL_FRAC_DATA:
+ 	case IOCTL_GET_PLL_FRAC_DATA:
++	case IOCTL_SD_DLL_RESET:
++	case IOCTL_SET_SD_TAPDELAY:
+ 		return 1;
+ 	default:
+ 		return 0;
+diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
+index d30f354eed09..b4f9adf18327 100644
+--- a/include/linux/firmware/xlnx-zynqmp.h
++++ b/include/linux/firmware/xlnx-zynqmp.h
+@@ -91,7 +91,8 @@ enum pm_ret_status {
+ };
+ 
+ enum pm_ioctl_id {
+-	IOCTL_SET_SD_TAPDELAY = 7,
++	IOCTL_SD_DLL_RESET = 6,
++	IOCTL_SET_SD_TAPDELAY,
+ 	IOCTL_SET_PLL_FRAC_MODE,
+ 	IOCTL_GET_PLL_FRAC_MODE,
+ 	IOCTL_SET_PLL_FRAC_DATA,
+@@ -256,6 +257,12 @@ enum tap_delay_type {
+ 	PM_TAPDELAY_OUTPUT,
+ };
+ 
++enum dll_reset_type {
++	PM_DLL_RESET_ASSERT,
++	PM_DLL_RESET_RELEASE,
++	PM_DLL_RESET_PULSE,
++};
++
+ enum pm_node_id {
+ 	NODE_UNKNOWN = 0,
+ 	NODE_APU,
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch b/recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch
new file mode 100644
index 0000000..1599b73
--- /dev/null
+++ b/recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch
@@ -0,0 +1,99 @@
+From 01a29e9ae1c9caa344eced880bcb6c05f2e0f918 Mon Sep 17 00:00:00 2001
+From: Manish Narani <manish.narani@xilinx.com>
+Date: Fri, 10 Jan 2020 02:17:30 -0700
+Subject: [PATCH 09/12] mmc: sdhci-of-arasan: Add support for DLL reset for
+ ZynqMP platforms
+
+The DLL resets are required while executing the auto tuning procedure in
+ZynqMP. This patch adds code to support the same.
+
+Signed-off-by: Manish Narani <manish.narani@xilinx.com>
+State: pending
+---
+ drivers/mmc/host/sdhci-of-arasan.c | 63 ++++++++++++++++++++++++++++++
+ 1 file changed, 63 insertions(+)
+
+diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
+index 228dbeef74a8..d4e1823bc10b 100644
+--- a/drivers/mmc/host/sdhci-of-arasan.c
++++ b/drivers/mmc/host/sdhci-of-arasan.c
+@@ -742,6 +742,67 @@ static const struct clk_ops zynqmp_sampleclk_ops = {
+ 	.set_phase = sdhci_zynqmp_sampleclk_set_phase,
+ };
+ 
++static void arasan_zynqmp_dll_reset(struct sdhci_host *host, u32 deviceid)
++{
++	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
++	struct sdhci_arasan_data *sdhci_arasan = sdhci_pltfm_priv(pltfm_host);
++	struct sdhci_arasan_zynqmp_clk_data *zynqmp_clk_data =
++		sdhci_arasan->clk_data.clk_of_data;
++	const struct zynqmp_eemi_ops *eemi_ops = zynqmp_clk_data->eemi_ops;
++	u16 clk;
++	unsigned long timeout;
++
++	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
++	clk &= ~(SDHCI_CLOCK_CARD_EN | SDHCI_CLOCK_INT_EN);
++	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
++
++	/* Issue DLL Reset */
++	eemi_ops->ioctl(deviceid, IOCTL_SD_DLL_RESET,
++			PM_DLL_RESET_PULSE, 0, NULL);
++
++	clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL);
++	clk |= SDHCI_CLOCK_INT_EN;
++	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
++
++	/* Wait max 20 ms */
++	timeout = 20;
++	while (!((clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL))
++				& SDHCI_CLOCK_INT_STABLE)) {
++		if (timeout == 0) {
++			dev_err(mmc_dev(host->mmc),
++				": Internal clock never stabilised.\n");
++			return;
++		}
++		timeout--;
++		mdelay(1);
++	}
++
++	clk |= SDHCI_CLOCK_CARD_EN;
++	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
++}
++
++static int arasan_zynqmp_execute_tuning(struct mmc_host *mmc, u32 opcode)
++{
++	struct sdhci_host *host = mmc_priv(mmc);
++	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
++	struct sdhci_arasan_data *sdhci_arasan = sdhci_pltfm_priv(pltfm_host);
++	struct clk_hw *hw = &sdhci_arasan->clk_data.sdcardclk_hw;
++	const char *clk_name = clk_hw_get_name(hw);
++	u32 device_id = !strcmp(clk_name, "clk_out_sd0") ? NODE_SD_0 :
++							   NODE_SD_1;
++	int err;
++
++	arasan_zynqmp_dll_reset(host, device_id);
++
++	err = sdhci_execute_tuning(mmc, opcode);
++	if (err)
++		return err;
++
++	arasan_zynqmp_dll_reset(host, device_id);
++
++	return 0;
++}
++
+ /**
+  * sdhci_arasan_update_clockmultiplier - Set corecfg_clockmultiplier
+  *
+@@ -1232,6 +1293,8 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
+ 
+ 		zynqmp_clk_data->eemi_ops = eemi_ops;
+ 		sdhci_arasan->clk_data.clk_of_data = zynqmp_clk_data;
++		host->mmc_host_ops.execute_tuning =
++			arasan_zynqmp_execute_tuning;
+ 	}
+ 
+ 	arasan_dt_parse_clk_phases(&pdev->dev, &sdhci_arasan->clk_data);
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch b/recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch
new file mode 100644
index 0000000..1ec5fb7
--- /dev/null
+++ b/recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch
@@ -0,0 +1,52 @@
+From 4f818dabce72220544f537eaaff409443b7cd16c Mon Sep 17 00:00:00 2001
+From: Manish Narani <manish.narani@xilinx.com>
+Date: Fri, 10 Jan 2020 02:17:31 -0700
+Subject: [PATCH 10/12] arm64: zynqmp: Add ZynqMP SDHCI compatible string
+
+Add the new compatible string for ZynqMP SD Host Controller for its use
+in the Arasan SDHCI driver for some of the ZynqMP specific operations.
+Add required properties for the same.
+
+Signed-off-by: Manish Narani <manish.narani@xilinx.com>
+Signed-off-by: Michal Simek <michal.simek@xilinx.com>
+Link: https://github.com/Xilinx/linux-xlnx/commit/a8fdb80f4d477a71a98cb069f4d5a42f41bbbe9c
+State: upstream (a8fdb80f4d477a71a98cb069f4d5a42f41bbbe9c)
+---
+ arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+index 9115eaebbf70..7bae80c537a5 100644
+--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
++++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+@@ -500,21 +500,25 @@
+ 		};
+ 
+ 		sdhci0: mmc@ff160000 {
+-			compatible = "arasan,sdhci-8.9a";
++			compatible = "xlnx,zynqmp-8.9a", "arasan,sdhci-8.9a";
+ 			status = "disabled";
+ 			interrupt-parent = <&gic>;
+ 			interrupts = <0 48 4>;
+ 			reg = <0x0 0xff160000 0x0 0x1000>;
+ 			clock-names = "clk_xin", "clk_ahb";
++			#clock-cells = <1>;
++			clock-output-names = "clk_out_sd0", "clk_in_sd0";
+ 		};
+ 
+ 		sdhci1: mmc@ff170000 {
+-			compatible = "arasan,sdhci-8.9a";
++			compatible = "xlnx,zynqmp-8.9a", "arasan,sdhci-8.9a";
+ 			status = "disabled";
+ 			interrupt-parent = <&gic>;
+ 			interrupts = <0 49 4>;
+ 			reg = <0x0 0xff170000 0x0 0x1000>;
+ 			clock-names = "clk_xin", "clk_ahb";
++			#clock-cells = <1>;
++			clock-output-names = "clk_out_sd1", "clk_in_sd1";
+ 		};
+ 
+ 		smmu: smmu@fd800000 {
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch b/recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch
new file mode 100644
index 0000000..29471c2
--- /dev/null
+++ b/recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch
@@ -0,0 +1,64 @@
+From 3adc5f79a53ad8fe3e7fbf22bcc9dcc78ccf2d8c Mon Sep 17 00:00:00 2001
+From: Manish Narani <manish.narani@xilinx.com>
+Date: Tue, 18 Feb 2020 04:04:48 -0700
+Subject: [PATCH 11/12] mmc: sdhci-of-arasan: Modified SD default speed to
+ 19MHz for ZynqMP
+
+SD standard speed timing was met only at 19MHz and not 25 MHz, that's
+why changing driver to 19MHz. The reason for this is when a level shifter
+is used on the board, timing was met for standard speed only at 19MHz.
+Since this level shifter is commonly required for high speed modes,
+the driver is modified to use standard speed of 19Mhz.
+
+Signed-off-by: Manish Narani <manish.narani@xilinx.com>
+State: pending
+---
+ drivers/mmc/host/sdhci-of-arasan.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
+index d4e1823bc10b..7e82a33f7031 100644
+--- a/drivers/mmc/host/sdhci-of-arasan.c
++++ b/drivers/mmc/host/sdhci-of-arasan.c
+@@ -130,6 +130,12 @@ struct sdhci_arasan_data {
+ /* Controller immediately reports SDHCI_CLOCK_INT_STABLE after enabling the
+  * internal clock even when the clock isn't stable */
+ #define SDHCI_ARASAN_QUIRK_CLOCK_UNSTABLE BIT(1)
++/*
++ * Some of the Arasan variations might not have timing requirements
++ * met at 25MHz for Default Speed mode, those controllers work at
++ * 19MHz instead
++ */
++#define SDHCI_ARASAN_QUIRK_CLOCK_25_BROKEN BIT(2)
+ };
+ 
+ struct sdhci_arasan_of_data {
+@@ -245,6 +251,16 @@ static void sdhci_arasan_set_clock(struct sdhci_host *host, unsigned int clock)
+ 		sdhci_arasan->is_phy_on = false;
+ 	}
+ 
++	if (sdhci_arasan->quirks & SDHCI_ARASAN_QUIRK_CLOCK_25_BROKEN) {
++		/*
++		 * Some of the Arasan variations might not have timing
++		 * requirements met at 25MHz for Default Speed mode,
++		 * those controllers work at 19MHz instead.
++		 */
++		if (clock == DEFAULT_SPEED_MAX_DTR)
++			clock = (DEFAULT_SPEED_MAX_DTR * 19) / 25;
++	}
++
+ 	/* Set the Input and Output Clock Phase Delays */
+ 	if (clk_data->set_clk_delays)
+ 		clk_data->set_clk_delays(host);
+@@ -1295,6 +1311,8 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
+ 		sdhci_arasan->clk_data.clk_of_data = zynqmp_clk_data;
+ 		host->mmc_host_ops.execute_tuning =
+ 			arasan_zynqmp_execute_tuning;
++
++		sdhci_arasan->quirks |= SDHCI_ARASAN_QUIRK_CLOCK_25_BROKEN;
+ 	}
+ 
+ 	arasan_dt_parse_clk_phases(&pdev->dev, &sdhci_arasan->clk_data);
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/files/0012-arm64-dts-Add-support-for-Avnet-Ultra96-rev2-board.patch b/recipes-kernel/linux/files/0012-arm64-dts-Add-support-for-Avnet-Ultra96-rev2-board.patch
new file mode 100644
index 0000000..0272def
--- /dev/null
+++ b/recipes-kernel/linux/files/0012-arm64-dts-Add-support-for-Avnet-Ultra96-rev2-board.patch
@@ -0,0 +1,83 @@
+From 380577fe56a72e5c01009730653aa3140bc5d33e Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Tue, 15 Sep 2020 23:13:55 +0200
+Subject: [PATCH 12/12] arm64: dts: Add support for Avnet Ultra96 rev2 board
+
+Import from Ultra96-PYNQ, primarily adding the wilc3000.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ arch/arm64/boot/dts/xilinx/Makefile           |  1 +
+ .../boot/dts/xilinx/avnet-ultra96-rev2.dts    | 49 +++++++++++++++++++
+ 2 files changed, 50 insertions(+)
+ create mode 100644 arch/arm64/boot/dts/xilinx/avnet-ultra96-rev2.dts
+
+diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xilinx/Makefile
+index 60f5443f3ef4..01eb8cfa99e2 100644
+--- a/arch/arm64/boot/dts/xilinx/Makefile
++++ b/arch/arm64/boot/dts/xilinx/Makefile
+@@ -1,5 +1,6 @@
+ # SPDX-License-Identifier: GPL-2.0
+ dtb-$(CONFIG_ARCH_ZYNQMP) += avnet-ultra96-rev1.dtb
++dtb-$(CONFIG_ARCH_ZYNQMP) += avnet-ultra96-rev2.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1232-revA.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1254-revA.dtb
+ dtb-$(CONFIG_ARCH_ZYNQMP) += zynqmp-zc1275-revA.dtb
+diff --git a/arch/arm64/boot/dts/xilinx/avnet-ultra96-rev2.dts b/arch/arm64/boot/dts/xilinx/avnet-ultra96-rev2.dts
+new file mode 100644
+index 000000000000..5f1a0b544fa9
+--- /dev/null
++++ b/arch/arm64/boot/dts/xilinx/avnet-ultra96-rev2.dts
+@@ -0,0 +1,49 @@
++/dts-v1/;
++
++#include "zynqmp-zcu100-revC.dts"
++
++/ {
++	model = "Avnet Ultra96 Rev2";
++	compatible = "avnet,ultra96-rev2", "avnet,ultra96-rev1",
++		     "avnet,ultra96",
++		     "xlnx,zynqmp-zcu100-revC", "xlnx,zynqmp-zcu100",
++		     "xlnx,zynqmp";
++
++	// Remove V1 Power ON/OFF controller from U96 V1 DT
++	/delete-node/ ltc2954;
++};
++
++&uart0 {
++	// Remove TI child node from U96 V1 DT
++	/delete-node/ bluetooth;
++};
++
++&sdhci1 {
++	max-frequency = <50000000>;
++	// cap-power-off-card not compatible with WILC3000
++	/delete-property/cap-power-off-card;
++	wilc_sdio@1 {
++		compatible = "microchip,wilc3000";
++		reg = <0>;
++		bus-width = <0x4>;
++		status = "okay";
++	};
++	// Remove TI child node from U96 V1 DT
++	/delete-node/ wifi@2;
++};
++
++&i2csw_4 {
++	/delete-node/ pmic@5e;
++	pmic1: pmic@43 {
++		reg = <0x43>;
++		compatible = "infineon,irps5401";
++	};
++	pmic2: pmic@44 {
++		reg = <0x44>;
++		compatible = "infineon,irps5401";
++	};
++	pmic3: pmic@45 {
++		reg = <0x45>;
++		compatible = "infineon,ir38060";
++	};
++};
+-- 
+2.26.2
+
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.inc b/recipes-kernel/linux/linux-jailhouse_5.4.inc
index a9e75a8..5b4bb19 100644
--- a/recipes-kernel/linux/linux-jailhouse_5.4.inc
+++ b/recipes-kernel/linux/linux-jailhouse_5.4.inc
@@ -19,6 +19,18 @@ SRC_URI += " \
     https://github.com/siemens/linux/archive/${SRCREV}.tar.gz;downloadfilename=linux-${SRCREV}.tar.gz \
     file://0001-ARM-dts-orange-pi-zero-Adjust-wifi-settings.patch \
     file://0001-pwrseq_simple-Workaround-for-missing-device-tree-ent.patch \
+    file://0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch \
+    file://0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch \
+    file://0003-arm64-zynqmp-Add-firmware-DT-node.patch \
+    file://0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch \
+    file://0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch \
+    file://0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch \
+    file://0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch \
+    file://0008-firmware-xilinx-Add-DLL-reset-support.patch \
+    file://0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch \
+    file://0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch \
+    file://0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch \
+    file://0012-arm64-dts-Add-support-for-Avnet-Ultra96-rev2-board.patch \
     file://${KERNEL_DEFCONFIG}"
 
 S = "${WORKDIR}/linux-${SRCREV}"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2b136818b7c003cb92bab2d0e4be657ea94a7015.1601958694.git.jan.kiszka%40siemens.com.
