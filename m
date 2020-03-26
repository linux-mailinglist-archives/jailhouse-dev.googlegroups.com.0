Return-Path: <jailhouse-dev+bncBDEN32754MOBBO7Q5PZQKGQEYZSSZLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DEE192106
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 07:20:44 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id q22sf407533lfj.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Mar 2020 23:20:44 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1585117244; cv=pass;
        d=google.com; s=arc-20160816;
        b=TL4ffyBNB9EjQ+CWov5CGl8ERbBOxbxksxwdawDyAIHsOiXTFthhvKOysfOR9jFzP9
         nV3QD5sm/P0W8qglbt0TfjBKcYeegC/qLcPJlVda+EMBoaODB9XTNUjs4OornOHTkzhv
         /7olAEtma5ef337pwp0ziJyhAFWScCquaPUrmK+f0+gUEU75L93mnaObonZJbcTUwRNv
         pQ+9Ur4CbaLCYlFeEQl967F0PqQS9hFo5CeAGN9kheQj5ehWljF4g8iggr9fxN4MRCGn
         6vVBVa/rItSCcVC1R5aOhiOggylA6dYECOJAJQwsBU7GdJsmmqCUkciZEh3kyPvjfCwZ
         /+9Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OoFfer/b2f3qVycM+OV+eXKcODubFCRa3S3ceah9Tgk=;
        b=XD/Vx9uS25t47ts4j9sqchPU38lpZhU7KUJAzNAoDRdBHqK4Pdxuouj9iPPP6TYMqt
         MZio9aQT+64670S4KxTvdNr4VBUwS0XW/idIcZBNqdnoTjlC1A2N0gu+hLibdF8oRBAj
         4wKGFnBfKcxBJCEUOrZ08fxoERVCmEcer4uJoIjLH5w+vFMpd7yLBAltYerMfEPngXVz
         2qhZ1Ovdop1faTd7QRnmRcShNHCqUBwrXvK7rhRUIjWOEHRGGX+pHnExhhh9LDC2jalE
         2fI2N9urKZzlPMKhBKrCglgmv3NzvYHX7jl7srAdG8uM87knFPQEb9/lMsP2i6m3LT6l
         yyWw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rhIhcT19;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.59 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OoFfer/b2f3qVycM+OV+eXKcODubFCRa3S3ceah9Tgk=;
        b=otA/zKANhvNZmYfdBq67ALKL2iHEVBUbFUpygHKrQW3ksBwOkwjtYyFFCwmW3fbO7s
         QL0sulwjAqyWIEfTVcFp15YC+JypgtLI6bVH4welzG1/qVydF6ckJG1XEx3vIYAde9Ka
         PECJTikwGkkIdhjFfR6q9TYb1ONTrzjlX/IA8U9TesvRsGPFKwrprl6LoEIpzdKiPFfa
         CVTeoei9ZOfFb7AVu6BwQYiDP/abA0sw6D7IKG71Ghdx9Yql7713+Tk4/65+F6A/NSJR
         waMi1ugsdhj09p2oVxpqsFnC4kYKmVLzB3Yi77a4dNBaqXVBxFS8kKn3CqPAb97C5rrV
         /lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OoFfer/b2f3qVycM+OV+eXKcODubFCRa3S3ceah9Tgk=;
        b=YVCD+GuvPgjfCsp5ecKFfGGJ+cTn8AI3yGYjVmUIiLCxLhQ1SrM+DTGkXe24LDOLZ4
         nqjNayt82UiNkNVIFr1YzgpJylZ+vt74WIgt2Wdj4tiv4aYu0K9C9V48hW8l5GcMnvIO
         dTfntyg3FwSXdhtacvxBWPjPo2yJD9yDHrzKmLV9UDB9G0HS+DaTI00rTuIqMzBhEPJL
         hH3e4fSMfNoLdFBqdKdZWXfNQVa7KeQabDoA7cu7MAeVuXBJZcJPmgZSluFhP/vT2jUg
         FXoZre6ESy3NQ7FHjy4V5nJBx6f83DZ1S+j0A/BHzHkHfXhf5fsce3zaH4yKTBzNGdQm
         j93A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Puay//Q4/21rD7ZMwp2lYvN4BidU8af4QwE9tXh25ZyoFvivfhr2
	eAeHCjTidztb8bqtUNIe3rk=
X-Google-Smtp-Source: ADFU+vu3YE2nnFeK+LM16U538VfRX/k4l69qpygw6a8Imq5z/36QPeu+0mI76A2DeSTa6LcWxL7WIw==
X-Received: by 2002:a05:651c:20d:: with SMTP id y13mr971952ljn.112.1585117243836;
        Tue, 24 Mar 2020 23:20:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:10c2:: with SMTP id k2ls117386lfg.9.gmail; Tue, 24
 Mar 2020 23:20:43 -0700 (PDT)
X-Received: by 2002:ac2:5c5d:: with SMTP id s29mr1194738lfp.129.1585117243085;
        Tue, 24 Mar 2020 23:20:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585117243; cv=pass;
        d=google.com; s=arc-20160816;
        b=QBhvZ4kzp3V9Be+F1hGEZGBKYzbcAxY1GgCIWWJdCO3q1bxRBpnsuWQahprZq4g4hD
         JuPWkK7UOXyciYcwNYdAd3zgXzQOPX6RWrI2mZAPrGGtyScXdGcN2zKVgeVAFC4Kb/D1
         E+qlRn1KPuE50Cq1M5kjhBBBf6ylM8qtkw7hdx/ZJIGT5LtXaV5ndQpM3LdXxcQXCLqb
         71Qx5Jw58MK/rLXDIO/T/PQAN0OLyXNYNKldajJT4IIH3hOIhNP7BiklrHzEfW8byD4K
         oZnT5x40/W7vR305GaemJVxrUNAavfd7R9q+M89agrJPaAKrSIgoKAk+MuFh0dPc0ERK
         3ahA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jRuFGJL9rSStM+d9hm4rhMHfEHLTLvYrOblMAOhAJoE=;
        b=MP7amNPimiHf/a3LczKGTD6bHEKXJMNXktfY6jiXSd33Us7wwAhPfPQTyBmia0xZct
         nFgiNx53R7mVv1fuNuRT+SNyGcJD7FaZ97FJ8XpYmoADsbdjLwJ9tSZFIpm5jpQeUHyh
         jk0XZbecKYFyCjzK19sr4374KugyEUdOED+VUleT+KV5dMYqdRJ7x/VpzVklaGmBmFQA
         U2b3GB8HAq8uwD//5uwoEaQWsSVRfiXsVwt/77XsA496xfLMpOyjuTwM32ucjnU+ErOg
         egJwA46UOb7z/pixBTkPNhezPkNg4BHXWdU8QkWEZW0yRlVVMZhBQ3incX013da4OoEe
         XMUg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rhIhcT19;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.59 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60059.outbound.protection.outlook.com. [40.107.6.59])
        by gmr-mx.google.com with ESMTPS id m11si1074990ljj.2.2020.03.24.23.20.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2020 23:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.6.59 as permitted sender) client-ip=40.107.6.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJpSC5brCw/LhJBKbnSFLLcdqAhTvQTSq6YI7dLzLSf1aTlfVYsDYmUSf+yEurnQWn40ABOww7/87PgbQCHDL94fnfMXCxSKFWIa55vA+Hb9Gtz4G8E9kyBGAsGkQBIURQQgZa9Cjfm4rqn8xvQ87nNRI1bfxZhvoxOMfEZ9QwfPwoice02ZJOs3XtGlCvd8TPshvUEpnk316bbA1gqs0oLMRbCGqNnq5Rp67d7JaQqJO9E/dSj9ZqnIaN3kIvv3xOh3vQCKxol0u5wpj42VGan050mFEPK1P+HeJ1Fx5RPWcTzBqBBr2nSgcYFpAK79DoztaWD2r8Nv5BeTgGTnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRuFGJL9rSStM+d9hm4rhMHfEHLTLvYrOblMAOhAJoE=;
 b=W3C6DggKvhW6bb06JhiQZabxjaDCGqBFQt1QB3594pXXLkixiUH3tCTxnsvpBANkYTZkUXf6MW8EcT16OKbnKgDsAiGCNf7PfkpZglv5/VyBruWZD6DoQ8roFjr+qln005sFqAPIpqqQQ+/bRYGc14rhduupmLZsJcMzAPjURtdI+0fOJ3Zcu3te2ijV/E7sPtg8ghEGc3qqZAHJo0W3E6xOr3UYX2pRwsxwxF+nIb7wAAN5kfkdYgk1YylTHi2nZQG42OW2cztCZy2TA23eHkFnNLSQiBc4ooniMFiJzAV0kROQqT3de1Xc5ekDbnMZNUe1VojDhC4Wr1U788N3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (52.135.61.137) by
 DB8PR04MB5707.eurprd04.prod.outlook.com (20.179.9.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Wed, 25 Mar 2020 06:20:40 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 06:20:40 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V2 2/2] Cell configs for imx8mm EVK board.
Date: Thu, 26 Mar 2020 21:20:25 +0800
Message-Id: <20200326132025.5116-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326132025.5116-1-alice.guo@nxp.com>
References: <20200326132025.5116-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR02CA0028.apcprd02.prod.outlook.com (2603:1096:3:18::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Wed, 25 Mar 2020 06:20:39 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 071bc5c9-3684-4ba3-f2b3-08d7d084a416
X-MS-TrafficTypeDiagnostic: DB8PR04MB5707:|DB8PR04MB5707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB57072E3C4A268F4CC06D1459E2CE0@DB8PR04MB5707.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(2906002)(6506007)(6486002)(86362001)(44832011)(2616005)(956004)(16526019)(186003)(6666004)(26005)(5660300002)(66476007)(66556008)(8936002)(478600001)(52116002)(36756003)(1076003)(316002)(4326008)(6916009)(81166006)(66946007)(8676002)(30864003)(6512007)(81156014)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR04MB5707;H:DB8PR04MB7065.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4MJsjg7/uj5XJFEoSr9ZpmavDzYXuUhArunnjBVc0HPprB7ucFiEMFOyzvPX5K5usF9E75xJ9wOp3HKDA9FOoq7tYi4F7GWPia+d7ADHSU01fuau4mxIZ6nRT1uRVzDMk8YbSn2EusApYCiOcmD/Ji5JxpI0ot+eCkG+NXrAuCPh1yz7hSqR0yXYW84GMHZs9UjN8OvUsCbHKHYaVgUDtjL4n+jYiPnJ5v3UofNl2s79jVUTSumulkP2QQCMjL6DPPzpW+mMsRqt46UG7WkJYkf1o32lb9Z01nR+qZJEpr1Cww3rxE4lmotF9/gfKc8M8ZLO5Og64r9VN37s2PBvyVagS08PFW83rZGVkCDx5h/L5ZYEiJ0zXTrezyTN3c8f52Uwit28v0ZvxtuIMuVwgs7y1mWhC4m4NuLto3I0r0X9DWEG+uxROi1rTCFRYJcmDDQH/o/4jJA+1Jt5a4PgG6KVP501LDLLeY350a09H/cWx+4ZSa5qwAwiW9Clq/fh
X-MS-Exchange-AntiSpam-MessageData: cd4qbfGN+i6lI14t4CJAfcmpplECZIZqGURryJUPc3QvRzjNu1shlVkjFHs8fn+nNSNcZB70e69h48r098Sdms6MBVkcP0EAJOAx9O9acgNuXfGKQOurXVRGPql4MBEY7SR/+Dpb52kt9jeZZcZdHg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071bc5c9-3684-4ba3-f2b3-08d7d084a416
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 06:20:40.5941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eX1p8O/YoJPWzC4+aEwLpoqZVPQ6+fKto+EDLkh7LqCLs2FZZOdZpgPd4MZR4RHf8sgB8x6uJ9DepkXRgQM7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5707
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=rhIhcT19;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.6.59 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
 configs/arm64/imx8mm-inmate-demo.c | 125 ++++++++++++++++++
 configs/arm64/imx8mm-linux-demo.c  | 165 +++++++++++++++++++++++
 configs/arm64/imx8mm.c             | 203 +++++++++++++++++++++++++++++
 3 files changed, 493 insertions(+)
 create mode 100644 configs/arm64/imx8mm-inmate-demo.c
 create mode 100644 configs/arm64/imx8mm-linux-demo.c
 create mode 100644 configs/arm64/imx8mm.c

diff --git a/configs/arm64/imx8mm-inmate-demo.c b/configs/arm64/imx8mm-inmate-demo.c
new file mode 100644
index 00000000..5e61d41e
--- /dev/null
+++ b/configs/arm64/imx8mm-inmate-demo.c
@@ -0,0 +1,125 @@
+/*
+ * iMX8MM target - gic-demo
+ *
+ * Copyright 2018-2019 NXP
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
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 76,
+
+		.console = {
+			.address = 0x30890000,
+			.type = JAILHOUSE_CON_TYPE_IMX,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0xbba00000,
+			.virt_start = 0xbba00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba01000,
+			.virt_start = 0xbba01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0a000,
+			.virt_start = 0xbba0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0c000,
+			.virt_start = 0xbba0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xbba0e000,
+			.virt_start = 0xbba0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART2 */ {
+			.phys_start = 0x30890000,
+			.virt_start = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: start from the bottom of inmate memory */ {
+			.phys_start = 0xb3c00000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
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
+		/* GIC */ {
+			.address = 0x38800000,
+			.pin_base = 96,
+			.pin_bitmap = {
+				0x1 << (76 + 32 - 96) /* SPI 76 */
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
+};
diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
new file mode 100644
index 00000000..2024ca79
--- /dev/null
+++ b/configs/arm64/imx8mm-linux-demo.c
@@ -0,0 +1,165 @@
+/*
+ * iMX8MM target - linux-demo
+ *
+ * Copyright 2019 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+/*
+ * Boot 2nd Linux cmdline:
+ * export PATH=$PATH:/usr/share/jailhouse/tools/
+ * jailhouse cell linux imx8mm-linux-demo.cell Image -d fsl-imx8mm-evk-inmate.dtb -c "clk_ignore_unused console=ttymxc3,115200 earlycon=ec_imx6q,0x30890000,115200  root=/dev/mmcblk2p2 rootwait rw"
+ */
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
+		.vpci_irq_base = 74, /* Not include 32 base */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xbba00000,
+			.virt_start = 0xbba00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ ,
+		},
+		{
+			.phys_start = 0xbba01000,
+			.virt_start = 0xbba01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbba0a000,
+			.virt_start = 0xbba0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbba0c000,
+			.virt_start = 0xbba0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbba0e000,
+			.virt_start = 0xbba0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 0),
+		/* UART2 earlycon */ {
+			.phys_start = 0x30890000,
+			.virt_start = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART4 */ {
+			.phys_start = 0x30a60000,
+			.virt_start = 0x30a60000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC1 */ {
+			.phys_start = 0x30b60000,
+			.virt_start = 0x30b60000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xbb700000,
+			.virt_start = 0,
+			.size = 0x10000, /* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			/*
+			 * We could not use 0x80000000 which conflicts with
+			 * COMM_REGION_BASE
+			 */
+			.phys_start = 0x93c00000,
+			.virt_start = 0x93c00000,
+			.size = 0x24000000,
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
+				(1 << (24 + 32 - 32)) | (1 << (29 + 32 - 32))
+			},
+		},
+		/* IVSHMEM */ {
+			.address = 0x38800000,
+			.pin_base = 96,
+			.pin_bitmap = {
+				0xf << (74 + 32 - 96)
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
diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
new file mode 100644
index 00000000..f6e96595
--- /dev/null
+++ b/configs/arm64/imx8mm.c
@@ -0,0 +1,203 @@
+/*
+ * i.MX8MM Target
+ *
+ * Copyright 2018 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Reservation via device tree: reg = <0x0 0xffaf0000 0x0 0x510000>
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xb7c00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x30890000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_CON_TYPE_IMX |
+				 JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+			.type = JAILHOUSE_CON_TYPE_IMX,
+		},
+		.platform_info = {
+			/*
+			 * .pci_mmconfig_base is fixed; if you change it,
+			 * update the value in mach.h
+			 * (PCI_CFG_BASE) and regenerate the inmate library
+			 */
+			.pci_mmconfig_base = 0xbb800000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
+
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x38800000,
+				.gicr_base = 0x38880000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "imx8mm",
+
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 51, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0xf,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xbba00000,
+			.virt_start = 0xbba00000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ ,
+		},
+		{
+			.phys_start = 0xbba01000,
+			.virt_start = 0xbba01000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbba0a000,
+			.virt_start = 0xbba0a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbba0c000,
+			.virt_start = 0xbba0c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbba0e000,
+			.virt_start = 0xbba0e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 0),
+		/* IO */ {
+			.phys_start = 0x00000000,
+			.virt_start = 0x00000000,
+			.size =	      0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM 00*/ {
+			.phys_start = 0x40000000,
+			.virt_start = 0x40000000,
+			.size = 0x73c00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */{
+			.phys_start = 0xb3c00000,
+			.virt_start = 0xb3c00000,
+			.size = 0x04000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM 01 */ {
+			.phys_start = 0xb8000000,
+			.virt_start = 0xb8000000,
+			.size = 0x03700000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Loader */{
+			.phys_start = 0xbb700000,
+			.virt_start = 0xbb700000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM 02 */ {
+			.phys_start = 0xbbc00000,
+			.virt_start = 0xbbc00000,
+			.size = 0x02400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* OP-TEE reserved memory */{
+			.phys_start = 0xbe000000,
+			.virt_start = 0xbe000000,
+			.size = 0x2000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x38800000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x38800000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x38800000,
+			.pin_base = 288,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
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
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200326132025.5116-2-alice.guo%40nxp.com.
