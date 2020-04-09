Return-Path: <jailhouse-dev+bncBDEN32754MOBBG7PWX2AKGQEZTAKZWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6F01A1C40
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Apr 2020 09:04:59 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id s22sf1967424wmh.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Apr 2020 00:04:59 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1586329499; cv=pass;
        d=google.com; s=arc-20160816;
        b=I+tFI924i7gbvBHb2rGU7c7JxK0JTjXxkh8a8yV1Ccz5b09BjtjUXZ55fH5ydsDj3y
         7v4wxUIZWowLQXg0oPoV1QHHKLhB3Pk/+um1zka7seynK60vYzBqFoFT7zudDbiVSlmD
         F/SpCQHFPvzs5IOrdgj6fGpayf0QbeKo2Cc8othGMAnOXxdBnBJF/Ol7B3gxJJ7MLH+N
         D3JtKKmKoHFbPX3rbUxtApkM+D14pwLYsm+Ulks7hIyGBjS8IW0LyH+9RdQjnRueny31
         xcIYa2k2qiq7iNZnCzbHRNcPeMp2OqTEM/5gYqUOj3s7vBfkqQQgYLRxn9wkJ5vOnLV6
         hTsA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=VZraxDTiBvHTsik5cWdkomeAVT+BJG1ohoqi014Bu8Y=;
        b=Shy7+vYrt1UvOv/pqYI8NERKA3H4sEZ4sVh859D2KfILqw7Rznm6+5BNPAM8JcYmHj
         6UMtr+SChHV/sIEpVeEanCSp0f0m4oF58Xv9y66DaCYiCPybFSVguW0wQ9tysKrHmjQW
         Yj5nALPoTUGoALsmoC5YrYsHqaeEfNLIIgrYvcOS72vU4FTZlIUnAAxQ0wwaJu4Cy1FK
         sJD8fcWnGYszMVBuPrJOR5B6OZgAieAYrRs9pAcqJBD75qsHigulLprN5Cb3OOiG1fvr
         BTzR2FvwZ9QeEAzm3NfbUggRZpWGiYDwP6b+KNnq5Q48FeqLcC4DkqzwkOSZnCak4CuA
         Qf8A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=aWPC3g3l;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.22.57 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VZraxDTiBvHTsik5cWdkomeAVT+BJG1ohoqi014Bu8Y=;
        b=p32oye9riUyoLw0IDQwWT2H+7uchUk2Oed++zN6q3kCNM8XsgosnpsYsHzN2djbE7C
         abTFf+gzxSmXS5qhT8YQmpmet1map659ZERsVRn95MvOWEbc2Ke9ReojeIvats1Oy/b4
         u6T/lUgfFkrqNIk/HFWcXZhkdvcnXxL7RhcG4WNcnkIOvC7a4cZJGzomSX/pr3pi51UG
         g2/kDssRQ3nf/mG6dLS5kXqVCJ5PpTErno3WXd4wuQoD855ZC5nM/uw2E9RQiaDCFCFB
         iYr9TMh41JYBQ0T8MkZ+fImHhSEA+lrPQIMKRZ3Olqs+oYxgwz95QAt6FR5k/DJqqLe8
         jmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VZraxDTiBvHTsik5cWdkomeAVT+BJG1ohoqi014Bu8Y=;
        b=KaF8MAK4sq5xbPiP61EGiKh1cRzon1pnCh24v6bTVkEkqfU4I39J3ek2Q1fN0xQj0R
         9qnToHNbqGV5pJ6UCLI2Tuzmru1vnRybKsF0WNKr/PmtFX+AiwuLDbQaTKjmvxMqj85C
         nrjF5AXeFdIVDvJVeANQ8Kz+VChMJZk33ZWVFfsITacRkfdmB+1A5L8dGyG/1zAENapE
         KLBTqExPcEVpHcsulLhwA5aaq+y+JtILs/dL17UR7Rdt72ogtHagaWMPlYT7+OlzbxIh
         b82lDAc/KEjenRLx3/B1RVGv53ytEkVHMiAwWfqpyC9pEUrs12/FYdi9FJsOda4lfwgW
         VNIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZl3ox4ly2fJvB0aLtYH4E1YRJGemYmlQ/lSGKPHLTjcmZUfzUn
	75V+dGP5gPlt3lUp1ruKomc=
X-Google-Smtp-Source: APiQypIBAVq/WDQXLXiRRvnaoy4qzGWX0Wvk84y47QcZUAJUMcXlyo6GfPB4AWMaz+ZINaKMc78tgA==
X-Received: by 2002:adf:f74d:: with SMTP id z13mr7238595wrp.55.1586329499488;
        Wed, 08 Apr 2020 00:04:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:96d2:: with SMTP id y201ls5644109wmd.2.gmail; Wed, 08
 Apr 2020 00:04:58 -0700 (PDT)
X-Received: by 2002:a1c:98c3:: with SMTP id a186mr3125050wme.178.1586329498769;
        Wed, 08 Apr 2020 00:04:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586329498; cv=pass;
        d=google.com; s=arc-20160816;
        b=q3ftNC6LaqdwUQYhSYvXPUdl3VEgck6AU7+HBsQcqDIXHFmwmp/A4l5t3B6f/xp1FJ
         WG/ctWjOSUWZB6ZvW2PF1A3rI1lUFfqU+ygmd/H610JLcJ8JdcpddcnOAeXwswKJZVoD
         6herSQKqAHh/MPzZbQe+u5SUACwdtUCPcrbZxfOo/Dy8vYyMi/R+ye1JU4jSaJYAVz1q
         Mbc5csovUxbxAoEzpmML8sL5xPGk9H1fnB7oe6PFHpEc2UCecuHThPrKfzKmoIvzs9eh
         wtQG34XsdiHZtkzjVrcF5Mu1F9HEfNlQlXcq4HsAc7UbVrBagptbDxrBxlA+tkJvFS+V
         YnVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zzJMTClelj4ck9LVXUJGLHAww7sGkDuQQUoq+0eFDYA=;
        b=tqYGMDZfDUeNw0TC846iS/KNv++Dq2/kg/BATurTyMfSI/9VA+B+jOxWrfLOxAKpiy
         f1m+NY4BYGQ1zcNo242zZk87cZD67LrRi1tmp3a6OLZJiLI2OwxtGCK2JG89UmZXxmay
         UnpIH+S2GNiSlrq1kSdppWcWxGmybha6wmnhGxG5B89VBwZuM6vlcmOisfAfdTWx0TP2
         Gs53MiAlCQRmIeSBM+Il9CDXzEfen+uDBtazkKbxwgHBt4ay8xsChTBxGma1Dy1CJR5G
         F6ARfUM8ihJtWr4mquJjIVlNpfQ5hF8ejuwA8vKmeadfOb4X2PykO2QM1oGGF2E7CK75
         iGtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=aWPC3g3l;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.22.57 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com. [40.107.22.57])
        by gmr-mx.google.com with ESMTPS id v12si283381wrp.5.2020.04.08.00.04.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Apr 2020 00:04:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.22.57 as permitted sender) client-ip=40.107.22.57;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXpitQJ4dy24wq5OCg1h045ri96CjfeyMKgOILL1LKeo4WTDhd+/zRS8g+N8ciR1W9USb2XDXjfgdQKPtXQEHbG7e6c77Pypj7PVdY9S11+WKlsCQNYvm16kVSrlEdfNmRMllsaEZrz37ZjDM1f0KR3wUxxiUruREdYg44pAHWFYZ2wPbTgRdPy7EOt4BV3yjKUUF0ZLgHii0OwK4+dAUXblWUUgIoH/ztFytchinrD8LSzHNhojygGvk/Pn8d4X2eNp2kUiGvZg/KwbmY7smP3/pBwvP+sBmqut0PMD7GdY25eqTWuxCGeEmTLhBPE+CaaGqX+87xGpjUygiRf55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzJMTClelj4ck9LVXUJGLHAww7sGkDuQQUoq+0eFDYA=;
 b=I/9OHbe1G5aRQLUuVH8gZYyWA8Ntv7vK0PGhRIeSLMhLrZ/V61JfzPsHwD6rs4NYRct7PuRWJy/zQuxDnOrIiSxbu1J22zBURlJsiRcEP+M8eBtOnoM4A37/kka9/W2ms4qTTo12YIIJmX4YaoE695ZS1vws5SojeWM4kzXjVpPdNRsH7L80Ut/5m1ISbLNWvMHpFuPG1ABfoXrRxYxnpP3DvOPi7x2w1l2ufoxSw8S6o2fxUHv5newNPVd5petr+F3qvmirktmdNZaOeJNrYmFcLGX/GrvYwq9EPQu12F/NXZxQ6VBEtSWNB9v7odD0N/O3t9caO/ogTUgA7yvWgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB5866.eurprd04.prod.outlook.com (2603:10a6:10:b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Wed, 8 Apr
 2020 07:04:57 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56%7]) with mapi id 15.20.2878.018; Wed, 8 Apr 2020
 07:04:57 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 1/2] Cell configs for imx8mq EVK board.
Date: Thu,  9 Apr 2020 22:04:46 +0800
Message-Id: <20200409140447.4244-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096::11) To
 DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.3 via Frontend Transport; Wed, 8 Apr 2020 07:04:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7d038ee8-c1e2-4df8-739f-08d7db8b2576
X-MS-TrafficTypeDiagnostic: DB8PR04MB5866:|DB8PR04MB5866:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB5866A9F93EFF59EC6481CE77E2C00@DB8PR04MB5866.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(5660300002)(16526019)(30864003)(52116002)(2616005)(44832011)(6916009)(6486002)(81156014)(81166007)(8676002)(186003)(8936002)(956004)(316002)(6506007)(66946007)(66476007)(478600001)(86362001)(6512007)(26005)(4326008)(2906002)(66556008)(1076003)(36756003)(6666004)(32563001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V5JHRj1MZwyhjRTU4+JaY/orJWNQKWzQqdX/Po8za1ysbTYcl6JNGsolb9V9injVXhOca+PPBXtvZRvw1nfhfkrTgFwQASTydsSuv4/b9y0/1zm8/xC2uC+ol2zuqnvydsKzL1QczygQGq7WDZVAVsloXTCx88kYe0wOs04cRh9hQyLEc4/aHYp/weyPs83UYLsiOnF+rx9HfwD6CPXr6Mq8L1qeWWSc+I6bkAdF76miXv5y14LBy2VwsC6hJ7s287pks1ENXLicPMyPROwZj3kvGBDkBhwJZkUNkc0zpbGhBJNWI9mvpBPvGjSPyzpd1lNl+OroU2MGL/9/VVnjXhW6bRsuld5NlRRV776rDPvFFalF+0fG+zIbOAHEfPkuMb1hy9kJXZSr4EnCYCcsvZeIpqhd4tYd9bEt95NsGFwah+6p02CXqUshNIIxwq+n0/LGIzfF4aLhLb69UFx9l4JPYs1GE4f0LqTngZtHto4=
X-MS-Exchange-AntiSpam-MessageData: FgJCrE+dgZux3eDr1QLsEUW9r8Bv5qJICs9sVGakFdkjREPtL13BFXSFIGT+WvsXQfyD9yW7Zis8RWuEapYESWxz7WwqLabX4+ZGzHz0Xis1NkJxmAhbKTSKXNH020T0NYGbguWzK3HrIYeCbW1Tlw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d038ee8-c1e2-4df8-739f-08d7db8b2576
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 07:04:57.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQkBTwrbbTTJi3nrLhTZMGrwDRxA87d92S0aDZsDAsBoGQx2PDmtL6qTHuPKRK96ubWzri/Mflf/oZTZCUYhiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5866
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=aWPC3g3l;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.22.57 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8mq-inmate-demo.c |  70 +++++++++++--
 configs/arm64/imx8mq-linux-demo.c  | 158 +++++++++++++++++++++++++++++
 configs/arm64/imx8mq.c             |  93 +++++++++++++++--
 3 files changed, 307 insertions(+), 14 deletions(-)
 create mode 100644 configs/arm64/imx8mq-linux-demo.c

diff --git a/configs/arm64/imx8mq-inmate-demo.c b/configs/arm64/imx8mq-inmate-demo.c
index 8c1ad624..39b74593 100644
--- a/configs/arm64/imx8mq-inmate-demo.c
+++ b/configs/arm64/imx8mq-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * iMX8MQ target - inmate demo
  *
- * Copyright NXP 2018
+ * Copyright 2020 NXP
  *
  * Authors:
  *  Peng Fan <peng.fan@nxp.com>
@@ -16,7 +16,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -26,8 +28,9 @@ struct {
 
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = 0,
-		.num_pci_devices = 0,
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 108,
 
 		.console = {
 			.address = 0x30860000,
@@ -42,6 +45,38 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xbfd00000,
+			.virt_start = 0xbfd00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd01000,
+			.virt_start = 0xbfd01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0a000,
+			.virt_start = 0xbfd0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0c000,
+			.virt_start = 0xbfd0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0e000,
+			.virt_start = 0xbfd0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
 		/* UART1 */ {
 			.phys_start = 0x30860000,
 			.virt_start = 0x30860000,
@@ -50,7 +85,7 @@ struct {
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* RAM: Top at 4GB Space */ {
-			.phys_start = 0xffaf0000,
+			.phys_start = 0xc0000000,
 			.virt_start = 0,
 			.size = 0x00010000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
@@ -62,5 +97,28 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_COMM_REGION,
 		},
-	}
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x38800000,
+			.pin_base = 128,
+			.pin_bitmap = {
+				0x1 << (108 + 32 - 128) /* SPI 109 */
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
 };
diff --git a/configs/arm64/imx8mq-linux-demo.c b/configs/arm64/imx8mq-linux-demo.c
new file mode 100644
index 00000000..a59dd934
--- /dev/null
+++ b/configs/arm64/imx8mq-linux-demo.c
@@ -0,0 +1,158 @@
+/*
+ * iMX8MQ target - linux-demo
+ *
+ * Copyright 2018 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "linux-inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 108, /* Not include 32 base */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xbfd00000,
+			.virt_start = 0xbfd00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd01000,
+			.virt_start = 0xbfd01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0a000,
+			.virt_start = 0xbfd0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0c000,
+			.virt_start = 0xbfd0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbfd0e000,
+			.virt_start = 0xbfd0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbfe00000, 1),
+		/* UART1 earlycon */ {
+			.phys_start = 0x30860000,
+			.virt_start = 0x30860000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART2 */ {
+			.phys_start = 0x30890000,
+			.virt_start = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC1 */ {
+			.phys_start = 0x30b40000,
+			.virt_start = 0x30b40000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xbff00000,
+			.virt_start = 0,
+			.size = 0x10000, /* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3dc00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* uart2/sdhc1 */ {
+			.address = 0x38800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				(1 << (27 + 32 - 32)) | (1 << (22 + 32 - 32))
+			},
+		},
+		/* IVSHMEM */ {
+			.address = 0x38800000,
+			.pin_base = 128,
+			.pin_bitmap = {
+				0x1 << (108 + 32 - 128) /* SPI 109 */
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
index 7d113264..3292bd29 100644
--- a/configs/arm64/imx8mq.c
+++ b/configs/arm64/imx8mq.c
@@ -1,7 +1,7 @@
 /*
  * i.MX8MQ Target
  *
- * Copyright 2017 NXP
+ * Copyright 2017-2018 NXP
  *
  * Authors:
  *  Peng Fan <peng.fan@nxp.com>
@@ -18,25 +18,31 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[4];
+	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
-			.phys_start = 0xffc00000,
+			.phys_start = 0xfdc00000,
 			.size =       0x00400000,
 		},
 		.debug_console = {
 			.address = 0x30860000,
 			.size = 0x1000,
 			.type = JAILHOUSE_CON_TYPE_IMX,
-			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+			.flags = JAILHOUSE_CON_TYPE_IMX |
+				 JAILHOUSE_CON_ACCESS_MMIO |
 				 JAILHOUSE_CON_REGDIST_4,
 		},
 		.platform_info = {
+			.pci_mmconfig_base = 0xbfb00000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+
 			.arm = {
 				.gic_version = 3,
 				.gicd_base = 0x38800000,
@@ -47,9 +53,11 @@ struct {
 		.root_cell = {
 			.name = "imx8mq",
 
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.cpu_set_size = sizeof(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 51, /* Not include 32 base */
 		},
 	},
 
@@ -58,6 +66,38 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xbfd00000,
+			.virt_start = 0xbfd00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ ,
+		},
+		{
+			.phys_start = 0xbfd01000,
+			.virt_start = 0xbfd01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbfd0a000,
+			.virt_start = 0xbfd0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbfd0c000,
+			.virt_start = 0xbfd0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbfd0e000,
+			.virt_start = 0xbfd0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbfe00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0x00000000,
 			.virt_start = 0x00000000,
@@ -68,14 +108,28 @@ struct {
 		/* RAM */ {
 			.phys_start = 0x40000000,
 			.virt_start = 0x40000000,
-			.size = 0xbfb00000,
+			.size = 0x7fb00000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0xffb00000,
-			.virt_start = 0xffb00000,
+		/* Linux Loader */{
+			.phys_start = 0xbff00000,
+			.virt_start = 0xbff00000,
 			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */{
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3dc00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* OP-TEE reserved memory */{
+			.phys_start = 0xfe000000,
+			.virt_start = 0xfe000000,
+			.size = 0x2000000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
 	},
@@ -103,4 +157,27 @@ struct {
 			},
 		},
 	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 0000:00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 0000:00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
 };
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200409140447.4244-1-alice.guo%40nxp.com.
