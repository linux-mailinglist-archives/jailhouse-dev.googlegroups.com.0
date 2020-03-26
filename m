Return-Path: <jailhouse-dev+bncBDEN32754MOBBN7Q5PZQKGQEWFZRJUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB42192105
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 07:20:40 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id l3sf206010lfe.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Mar 2020 23:20:40 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1585117240; cv=pass;
        d=google.com; s=arc-20160816;
        b=O4Cnrt6O2Sx+XrRZFUkI9dUBQaWJp8eGbWwI29COCvhkVgoyDGNEm3X94JAoJSS4B6
         L1atb230Wq8i//2LTtTdO4UCcjnJ2WQMZUtLZLkAm5cqQ4vLq58bRNunSNvk38PyhTjd
         UM5hrvqPxnE5BWLF219DBjBUjtqBqiZX+mqVXPP4ewCHwjMhFAxVEsXdhAzyy7odWq3q
         5gWOyn5w8bZ713CWJdcb3nHCRjV5NJKS/CkYG4mIYABa/2Pivg26m581HMPvuuPurtJI
         QnTAtSxsftQTYNNFlqI+JmlSlvyWyzORdhz2joV+MES8ovDotM3voiP6DapIqDlkNfK+
         Tcsg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=LxKzcgssdET0T5/54yoVwZtDMUmdFsKwER9RbGjyJyE=;
        b=cyQKJYWb2csO85Jl6dcp8dG3VwIYHRw672g2sUJwTjvADb+Hos44sFdDKeVYXJa2J2
         Pog/u5E9fGOA0x0fLRcniQcu5crNcZJSsuSvrw/5xHvandOWAlpevsziopVM6I2Doap9
         tZWmYvj1HlmY2RcO2NNyJCBZOJO+EDasEkEBsRqYLhhJX1V0wibSW7wm0jAOwKctLhgr
         12FDKYW2QdjuWjaecnriFs0w5bwM49VLS1UG43aXknU4kmkDIu/ZBPnElEHD5mKAojSF
         /RcBx3bQC5bXmHdHGXaTsUzdOTKRdtnY/4I138H1JEttfAGiR1APfxRjDRrEW/pIyn7/
         2esg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=IcKKOlwY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.72 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LxKzcgssdET0T5/54yoVwZtDMUmdFsKwER9RbGjyJyE=;
        b=X/kGU9BSUDWZG+ObwUF32rl3k8328/SXiMopHxhrS0HsZmsFBuVDPOFwTcFCokCHXF
         Yl0Eu7WLQuWXKnDeiCnh7pjfsOTRxdtCDkIzpzGm07TWNBXmhhRgd3n0N7An3PI7FUM+
         cWnQpxlFvuYonmG9kQf7UR9bw0Oza8ioU7q4z6pS+t2ExJhr/DmanWxf0oc6WxTm8mHs
         MHbkL9G0wpBtfGXdWnHUBL0abt8daig7+WVfKQQ3PtWJiE9hmv2r8e2Q+MNzwP3sW7BI
         /cJaC+7lp3x+4EILw9EoNmcVYpIyv4u9TvOLMdzrpsBX6jZX2OPriG6HPizfGLR0BlbO
         68Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LxKzcgssdET0T5/54yoVwZtDMUmdFsKwER9RbGjyJyE=;
        b=KtDtVU10CFv0TSutTx+auBmn21LGxRsoABRnJg54oznZpmxpzpqRBa+siyFQ33z4Ol
         XqBqLl4+UdikO2D3AP/pg0qNWpZLFI/y4tgu71HSpj3Aqr5UTBvHmqgEgXGy+SaPEr1W
         fiGtFG5e7HaMIcVoOaGgXCjAjk5vwd5tTsul5NkbwBb5sr2MHTaVQL6nhqA6GxBAa8TY
         Yo6BwbjiswntmzFcWmrTVgSqNQz72qHvSLZNpPxWw00q/fiNk0rfhvhkWfC7DGM2KYEL
         +ci9Kd3StY+gYUHG+gao3qnOmTnrqtha8LxUR4wvPEhfO6ITRetBJ6jOR8CYuii0zy3g
         3r5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1yKy1ZQ7xy7+yEBob6eCpOOfr2guwBxKpXYo0q4GNayLlDyU2N
	qc33+ugKjGdGRygIWBcxRAQ=
X-Google-Smtp-Source: ADFU+vs3/Ni22FFjnPC3xBx1peatyKlT2jHdUTIIQ1+2Ch1VuAoEpRpp7TBJ7xhpIJsAMC+2oigXGg==
X-Received: by 2002:ac2:5999:: with SMTP id w25mr22291lfn.46.1585117240112;
        Tue, 24 Mar 2020 23:20:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8541:: with SMTP id u1ls197099ljj.10.gmail; Tue, 24 Mar
 2020 23:20:39 -0700 (PDT)
X-Received: by 2002:a2e:89c9:: with SMTP id c9mr940369ljk.181.1585117239389;
        Tue, 24 Mar 2020 23:20:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585117239; cv=pass;
        d=google.com; s=arc-20160816;
        b=hAJh/EqZCpTXZ7p46AKrj4HnHa/35at1tkO0bU44NtbiMWVSz2f4QUczysnE5fS8UB
         4aZkGGJtRwcdgdO11IhBpz/RQDdSJlwfpIltbF0yPZaAMCSVaonzdFxHKzDYCqcEjxFF
         LpXHZvR9kn10gA90Trd+ba/gZQcDovwMVSaM/MCwWilYnCHzj2yPsO1bReJo5lY2aNpQ
         T0tZ55cD7SttWZjSZrqKRgaLwq3HdEzd5M83wDqqAmzfp51fH1eQQwwBOoXJZ51HOX7l
         31tosN3Fk7ZB6b44esPDb+zUl4qMEHzlQ0vg5WFIOphjCXKYzKseCOPuvbqOk2gFbci2
         euGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=biDllrXXwZ9tBkVFZGSX81F25FfmOzvJZAst6kt6CQo=;
        b=YQ3qkuvYgoppJ512cyB1Bv1WDzBzBJDgDPsxLe0co8zykdfsO47ja158yeKiOaXozg
         Ek+koML02z54zT0TpRtsWPHeu0wcrrGxMazJjsa1jN8YcBDA/TqoQS5beFyY5Cdg5fzu
         614X/xeLGnO/cV7GNLovLjV0yWI4ugoYC08c6UqpWhMzZCLWz2+0vAtzK01068oZVl5p
         /Pv2WX8fuoQYWSSFx2SqX3H6jOi1Udm8liKsQo7J9ljjuIpHO7ZfxwusSbYwFIxXgpWO
         zrOrJCVZgy4gcHJ67RXUDBzPo3mS5AMrwla0wE2noER+YT4lwdfuWHNyuY9AaW9asHlG
         BeFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=IcKKOlwY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.72 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60072.outbound.protection.outlook.com. [40.107.6.72])
        by gmr-mx.google.com with ESMTPS id t17si676701lff.0.2020.03.24.23.20.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2020 23:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.72 as permitted sender) client-ip=40.107.6.72;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miq1u3V6oU5cdUBwyT2HB+I8vTXNAwovpD1epbbER5UxZg+TU5pwt3npJIER+txF7EB6trgpVweAnFdlToKnQeXbmg7a5FNbxUZnAgmLm0lJoYDWWu06UNMdH4vhSDmeaMcmlt62OD1BIw6JPEC1/V48ryqWveJ84bY3kUAfSjC40Nh4ir59WhMf7Gp8lzJCTWCvBLfWTdXKjxUWbImV8kQfNr09otdp6HrcyafkphkGgn3Jzr7Ta4a44tV6hZvau2IcU6lzmHbAgcyk0A9EBhIQJbvb6XEOEAhwJOXx0YDk+5UtcAOYAGAuFuSzVjgzDsPInVF2MAkClpKYzLMG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biDllrXXwZ9tBkVFZGSX81F25FfmOzvJZAst6kt6CQo=;
 b=eI4SZ3lp4D3U9NjOa+qF708j3t4LkfW3qwHBMaXLgNNqugcdFds+K9in9XwLfIQxuXZrCYFBteowtkEc1242tZuniIA5UEWf+M/GtmOuKuXXBo/sAckxSE/qcFsuAkT2s0IobHl6oB3WuxZo41i9ib+W7QHyw0dgVGGsONCuk3N/Mxy+E+viykhaGA3hAiFG3flhdWcJF5kM8FPQabzJqgugPK5Too4TXvvq57zDWI8naEN/mvzWwoUJLWxsYMEk+5A9lld2vpFv1p6V6FdFpPw5zEqODJw9bw9/5awfSjbRSLTY0s5AU1lvfKcjB58iVi/TRYiR3MJbrhn02z4JMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (52.135.61.137) by
 DB8PR04MB5707.eurprd04.prod.outlook.com (20.179.9.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Wed, 25 Mar 2020 06:20:36 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 06:20:36 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V2 1/2] Cell configs for imx8mq EVK board.
Date: Thu, 26 Mar 2020 21:20:24 +0800
Message-Id: <20200326132025.5116-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR02CA0028.apcprd02.prod.outlook.com (2603:1096:3:18::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Wed, 25 Mar 2020 06:20:34 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e499d6d-2e4f-473c-3f43-08d7d084a176
X-MS-TrafficTypeDiagnostic: DB8PR04MB5707:|DB8PR04MB5707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB5707CA058DA70B4D937347DCE2CE0@DB8PR04MB5707.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(2906002)(6506007)(6486002)(86362001)(44832011)(2616005)(956004)(16526019)(186003)(6666004)(26005)(5660300002)(66476007)(66556008)(8936002)(478600001)(52116002)(36756003)(1076003)(316002)(4326008)(6916009)(81166006)(66946007)(8676002)(30864003)(6512007)(81156014)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR04MB5707;H:DB8PR04MB7065.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gjLoG15w4VAHdnzpQnDxV1eosz6z097V9y0c4CryX4SNhMh/PERdc7QDwt6E7Vz7RubK31SLNZ72M1SfgqyXgGKHnFuq6RDzjGvj41CpcuBdpkTTwts8p1zgXX/v4kRIUuNPGb0g+SmcEw1lWoQIXvLWH9Xy5Cuo8G0AoRtkrTsRTEx+0qU93iA1bcE+TkpFMz+kfbzyHMLNaU15Hxng0D/9jzaFvpmZIDUMmP2Ct9gRRlqEZkJ5rtGrHUd6e/SWfhvjTqH8pAMGukmLykNxJd/LXRqMNc1vz/jymKBRa1aqaK5MemDgFu/rKzopwBD2y1cw9hNb1za0fkWmkxWYcJEqz3XoFcu17qu1uNTilwOhHvrJ5M9eldFgfNo2jR0AVLHUvD/a3PLMYGmdQowt823i6hUo0W4m7d3J1Krmv45hLLgzf5LGI75/oYLJ3M2VdBIZUYeVtEz+u8BBpMgCe45ATZydYX0dgYyU9G01yXg=
X-MS-Exchange-AntiSpam-MessageData: 4/nYy/Kf9IBJViRb36S4tGIvYYCznnoZC/RYqYcdXb6WOv6yvFSwNgLFgMjsGCezNFdBtUze4xbpCLyv90J5sHJ6cS983/SesrYBk01WHV8vYQ23PIPIyy1grdKfHeQj9Kb+VB9buu5p1EZYfcBUqQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e499d6d-2e4f-473c-3f43-08d7d084a176
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 06:20:36.2412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVXPA84wSpeDLUU6VJ9Yqoe9ACs0KybJKQCisoyWh8wAHQYxCkn6bN85lHreQfmE5HLT4lOQMf2DaqK2JS7VtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5707
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=IcKKOlwY;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.6.72 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
index 8c1ad624..d3c89aec 100644
--- a/configs/arm64/imx8mq-inmate-demo.c
+++ b/configs/arm64/imx8mq-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
  * iMX8MQ target - inmate demo
  *
- * Copyright NXP 2018
+ * Copyright 2018-2019 NXP
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200326132025.5116-1-alice.guo%40nxp.com.
