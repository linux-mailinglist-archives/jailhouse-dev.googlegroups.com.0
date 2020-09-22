Return-Path: <jailhouse-dev+bncBDEN32754MOBBMV3U35QKGQEORYKQUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id A13F7273B23
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Sep 2020 08:46:11 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id b20sf749278wmj.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 23:46:11 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600757171; cv=pass;
        d=google.com; s=arc-20160816;
        b=duWyaiEHMHVR1pX9oaS7VAAGIrJe8YAJQMgc2Vedpbn67in1ueBxIKAxNb+/R7+xl8
         hhWaCh4ykeN6h7iBbTdpFsSaJ5nml95tAP7bnvIp0D4CnvnoOQVg2NXl7Iwx4JIifEaC
         r+YjHpNTErh1tbUQZzuJJdp9MvCoEmx3vUDkS3lHjvzGbi29V2aYJw2AWcjx4blp44zz
         nFF+OP657neExAagCr33IW8Z3F9CeOCZ/mD0O7TvRYsukpBajuG30YJbs8U9geiqH2eY
         RrgqOwz0HzUsLwT0zmN0qQsjzb9WdzBVcyZN6S7BkysVtkxglyhJ8n/JA1CIZQU6zpDG
         ZTAQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=jMPscZhhbe75usdAPifVS5g7RKDv4XmKayoQAPyerxM=;
        b=bkb7lwdOATJovPmEp/kEYfuwOc7Xa3s9RiDR68DAyyBItSwgUIXlqc25puU7cRIj4u
         xdWVym2HneHpwqFnhpdJPrgkqB/SuyfbbHlOu/0+j7YToXKK122IubzPRWZ8h6tJMIrj
         UzSwcZ9U3A+vips6VthfBdByg4upMfLi9hf1lknFKE9wZqGYzYEZi1jXQg+DG2X5Whns
         Uu8+W2Kcs4vt8LETKIkTZy7nD3sPLKNCM+nU3zKDpVQhh3lhP7LY8Z1EptQQU9zINWxM
         WqhXdfDnRbuAOZVjHMuTB2Uq7yj9+gxaKuPfGv9p7DysNEPJTyV6u4J4gNruLyUH45Yt
         N7Qw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="E87lTAV/";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.55 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jMPscZhhbe75usdAPifVS5g7RKDv4XmKayoQAPyerxM=;
        b=fMbX7NwoJsDkpPJQ0Fp0UTlmqKDrVDcsm2EYDDOKx6F0/vKQS1x46j+mUXA2EYkPgS
         KP8ZSA9hsRfUlKgFiCMElBm9SeMe5aEin3I3jafK3SQAP3v0PnHEm7VfWVhw5mdDN4Gn
         KtWnpfLo4Xr7LSmGL+8Zdbxl1Z/dtLA4ja9h/2w0yDA/lunZGzSm1Py36Wzxf8MjVnaT
         Nv1sFkhWXB2y6ZkxKdUa1apjlY6WHD3L7dkwU8TDl3pb328tROZoPze3kaH4fycBMVvj
         uV/cz6FoCAJcQIuFJqcyUg5HfzKz9VilvtGHjCSNyxwygNIrdREFpxno6MtYv1o5rdlB
         /sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jMPscZhhbe75usdAPifVS5g7RKDv4XmKayoQAPyerxM=;
        b=RwUoJv1ydBL7w+Kr/kTIgd4kChCG0jDEKxZv0F4XvwALxjaYXYhM5y4lILMsR2HH02
         Ch+EAZdmW2ac+yEC90AnHxQ/5OQE2G5F/USHfpVubQLrmkyh38Bh1OqcceVKTSsjZ8Ra
         +0q2du18GQ/Pwy14kH/R1MyX+Jtyd+MG3mLSlSXyIWZxWTTc1WnKEMe4IrtJE1glViKI
         uSsbIjEj/31va+tT3Ay7ETa+95tPEYPEjJ1PFU0oWmhAJkB4sJbvyAxIkSY2wB36iYst
         upLskZ3xGBg9bdLFm8alE7XYi9Sid44aT0JyjBe43DKhtIxcXHDEgmrHmPX13J0l8bhV
         /pig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Bnn07mJAzAwRRf6aTGNAe5HAaPs7nFujW+lUU8/9OvlPb3+mV
	sPokDYRT2tfydxkEZV3BzRE=
X-Google-Smtp-Source: ABdhPJzlp2a1GiQ5y8KGDI2Gu1ASuz1S7vdHG7hffZ8eWn5dsE2rq+rpjNlG3aPgmA0x1TwwdZnPqw==
X-Received: by 2002:a7b:c938:: with SMTP id h24mr2934351wml.142.1600757171313;
        Mon, 21 Sep 2020 23:46:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:80d7:: with SMTP id b206ls874805wmd.1.canary-gmail; Mon,
 21 Sep 2020 23:46:10 -0700 (PDT)
X-Received: by 2002:a1c:e389:: with SMTP id a131mr2906163wmh.181.1600757170322;
        Mon, 21 Sep 2020 23:46:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600757170; cv=pass;
        d=google.com; s=arc-20160816;
        b=suT0nkXeBNGGoZCInm//+4ZhLrA2iqmNT1dV33OUKi1JWyelrMM2hF88+NnMnRko+y
         crFR2XD/uGaNEJkbsvV4Bpw6Du1GmnCx9/czAWkF5VnyleRUuPcoI/m6wD00OkLg3ybC
         95yvLCbxVDCbVE3Lw0pke5YtUNgadNgMWijuENz7bgIl7qjkIS26ASzb9PupS1SKa4tW
         H/1iPSJMISj7InmcakK7Z282mmmgzCKnX/4imbyhd6/Sxs1Fr/hPel3908RMV9ipPAbP
         8EgHk7bYBFDL5l+q8wnQ/K8220840Xyd2gNFewzfEi4eVgZC4ODtJ/41fTlSbLtuUzAq
         /6lQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lf9wrtFO/gXrCEkqsc+M6BdWVgz02DuxcyHIYp+5cfI=;
        b=MkLx7vPLUcZPbm+m6IOGBrVs/Dw81UkADjRfZ5+Myoh+Wj62BOgW7jTQ68AlEx3BzE
         EUtlfeBhFrdIz+UR4dKRzQjFJ2pCRrhhKf8V2smfTERNzMcf/rY+ea9azqKRnaPm1wtx
         4AXELKHzu7LmTX91wZawHlgGSOR8B/j/QfFQDUqeIH/iIGRZJYuSXye0tFHjczNz2j8n
         oqpeDisEUH8qVsKk4cnlordzHPVY9vtR4soZbvklkMORMCau8MwqGYLX7fBfSvCAvyjt
         GRquEdoT+eGTrNL4zEuhpqC9owy9O3R4avrJHNGlKddqXNHEYRJj/JI5Irq4rypVj312
         Vg1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="E87lTAV/";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.55 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70055.outbound.protection.outlook.com. [40.107.7.55])
        by gmr-mx.google.com with ESMTPS id k14si323535wrx.1.2020.09.21.23.46.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 23:46:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.55 as permitted sender) client-ip=40.107.7.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+Rfe2RcPwYK3ZCIr1w4DL0bkLeSnSd4UQqKxgwaujlmOCTlHbIvjggCKXXDtz6EA7MO+dty2SxCwtbRp2JbVwYT8brfg+aUVFmiu2t/sCLFYCY6yHaMduR1lDu1/dp8sZ0pv9csaOPyUk8GIyriYeF7u+FHr6CrKgen2YkWi8a5feroovEBrI0O6QWK+oIqkW11+8943L8j0uyuErXrQ3smzjV1O5kYqyjQs6dxpG5z9sW8JZDa4nswKIfjxrKmf5Hf/tA3exMx2+FXxE6y6hNNqW8s48YHhfS3zmYqLNuKyNCaQG1DckCPCmYVFyQuFUyEuFB+RvCYr+vVCI6Eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf9wrtFO/gXrCEkqsc+M6BdWVgz02DuxcyHIYp+5cfI=;
 b=cb+fgKwxX/QNpRu2RsIR8G9cvgz7ZTlwdPAg5TxXHpg3A1wrPwJgtlFsv4M+CQzDvgcaFhfnCb0gllQOyoFAxW9w/S9NfEShKz9I5Cx62WwXqTGPehWt5CxNL7PxzTqGVEi4AcsWHFjn0c42OAEpjutu8+NdDKsaF80U58CfNk/0eG6z2c1TMo32Pixmc++6f/FCt0FVOOpl51T2HUqjx8Br+NKPN+37S1QKbUKG+qf82ydUzmcWJPJlqFtWvqr1l7EtmJlmq+0pPV0//E2WYcci9DlOGlAmAHDV3uCAC3zLw/N6lfmEVhHxKR8CtYiCwPOS0HcTygPow3TtK/arlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DBAPR04MB7415.eurprd04.prod.outlook.com (2603:10a6:10:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 06:46:09 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618%9]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 06:46:09 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V5 5/5] configs: imx8qm: add configuration files
Date: Tue, 22 Sep 2020 14:45:42 +0800
Message-Id: <20200922064542.26274-5-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922064542.26274-1-alice.guo@nxp.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0223.apcprd06.prod.outlook.com
 (2603:1096:4:68::31) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR06CA0223.apcprd06.prod.outlook.com (2603:1096:4:68::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 06:46:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49bb7c27-d567-498f-64db-08d85ec32fde
X-MS-TrafficTypeDiagnostic: DBAPR04MB7415:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB74154B37129200D101AD5207E23B0@DBAPR04MB7415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /xBN2egZUnU5/m9KdN8H+xjZTwthKn+BU576R80NCQBleJklJVVO6WKz0FHmIwmp/gEDEj5hBnRdnSZV/YwvgKWmNi5f7s33+AyEL8dB8DxBtqTiMZ3L31BeyRjwEqIZj59gZ4yp/bpho4/KyIZsGinJFZxqcriFGxGH6U8rSa7RQre/ol9M7ND5Tam68gWzy5CVGOiMvMO9uFykvatzzI9JoJGItcnNagtjc/bl7NKRQnj4xigxrKGwKc/WuY7aF6Z80LEjCNs6wHBk7dGn7l7lGG15IWRhR8dQeQvnzhA4ctlu9E9sbmr/xp+RwnO8WUvSKiq7Ge07ElSEg+h/jJMEOmRn/mq1e4+9BlHTGfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(26005)(66476007)(66946007)(66556008)(6506007)(6666004)(186003)(16526019)(4326008)(52116002)(36756003)(316002)(83380400001)(2906002)(6486002)(6512007)(8676002)(2616005)(1076003)(956004)(86362001)(5660300002)(44832011)(30864003)(478600001)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: aDM8Fd0qCLQl6Pnv2IPzaTqy7S32+6Rf3CBL06XeYs9MHFcomR1y5x0ylwFbbS7H1C1/LIk4f006cJlEahEr509Za0RrJJadOMs4/2eIiUoq8vwMFKvOwnpQuw2MdxM2+vdY3U3mocPo3z6WXqAgw3teJa5ZSug57sX5df0nzLPj616mbQd5TMNwZVrVPxA0f41ttT8nD2t25bM2FmxE9mySYoAH2VW7QWDSTQnURzI4garr3wmcGzC00QjA8KvmdEYxUcFr89d3OBbuo9WKwLxwyRls72XdwQAlCLS3Vyto9UfRdF8hpPukj1wNelT3Z1ETdY6EknxtNE3MWBRSNWLuC4OpjeF6Y02++HZnNLU+y7DfXYTYtvlkKUMLVNNdfscN4y002g5gtBIzwZrVDOQgJerP+uvN918VWJonzMKppYNlvKi2YZdIV50nm48FCpAyILKaFKy80L8W/vVjcy7MazwpXnOh1xvh122lRd5zdtjiLm9t+CbbzPidY+bzNtKobNiuHDmZylVLZPsWyKiE6uaUjvZhgfbcsnzN147hco55yc1FxKsnlHt6Fd/kEE5LaQPUOa82gwLpks09qxnhwdwB9jcx8wZp7sPQQbbXaD3fDThaz3CIqFzec6UhvcMNXbDk3wGMxo56f9w3sQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bb7c27-d567-498f-64db-08d85ec32fde
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 06:46:09.0112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /M8+br0+fpA6LDI5XDFS/h9S30LU+ABFJT85gQEN9J5PxM+yaW2x3YYFbXAGHJkBg9WJ1N8Z8vg4GKI8xXWaqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7415
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="E87lTAV/";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.7.55 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Add root cell and inmate cell configuration files for imx8qm.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8qm-ivshmem-demo.c | 124 ++++++++++++++++
 configs/arm64/imx8qm-linux-demo.c   | 199 ++++++++++++++++++++++++++
 configs/arm64/imx8qm.c              | 214 ++++++++++++++++++++++++++++
 3 files changed, 537 insertions(+)
 create mode 100644 configs/arm64/imx8qm-ivshmem-demo.c
 create mode 100644 configs/arm64/imx8qm-linux-demo.c
 create mode 100644 configs/arm64/imx8qm.c

diff --git a/configs/arm64/imx8qm-ivshmem-demo.c b/configs/arm64/imx8qm-ivshmem-demo.c
new file mode 100644
index 00000000..2bfe88d5
--- /dev/null
+++ b/configs/arm64/imx8qm-ivshmem-demo.c
@@ -0,0 +1,124 @@
+/*
+ * iMX8QM target - ivshmem-demo
+ *
+ * Copyright 2020 NXP
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
+		.name = "ivshmem-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 90, /* Not include 32 base */
+
+		.console = {
+			.address = 0x5a060000,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
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
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART1 */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: from Inmate memory of imx8qm.c */ {
+			.phys_start = 0xdf700000,
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
+			.address = 0x51a00000,
+			.pin_base = 96,
+			.pin_bitmap = {
+				0x1 << (90 + 32 - 96) /* irq 122 */
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
new file mode 100644
index 00000000..f13ca7bc
--- /dev/null
+++ b/configs/arm64/imx8qm-linux-demo.c
@@ -0,0 +1,199 @@
+/*
+ * iMX8QM target - linux-demo
+ *
+ * Copyright 2020 NXP
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
+	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_irqchip irqchips[4];
+	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "imx8qm-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 124, /* Not include 32 base */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 1),
+		/* UART0 earlycon */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART2*/ {
+			.phys_start = 0x5a080000,
+			.virt_start = 0x5a080000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* UART2_LPCG*/ {
+			.phys_start = 0x5a480000,
+			.virt_start = 0x5a480000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC0 */ {
+			.phys_start = 0x5b010000,
+			.virt_start = 0x5b010000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC0_LPCG */ {
+			.phys_start = 0x5b200000,
+			.virt_start = 0x5b200000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MU2 */ {
+			.phys_start = 0x5d1d0000,
+			.virt_start = 0x5d1d0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xdf700000,
+			.virt_start = 0xdf700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Bottom at 4GB Space */ {
+			.phys_start = 0xfdb00000,
+			.virt_start = 0,
+			.size = 0x10000, /* 64KB */
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
+		/* IVSHMEM */ {
+			.address = 0x51a00000,
+			.pin_base = 128,
+			.pin_bitmap = {
+				0xf << (124 + 32 - 128)
+			},
+		},
+		/* MU2_A */ {
+			.address = 0x51a00000,
+			.pin_base = 192,
+			.pin_bitmap = {
+				(1 << (178 + 32 - 192))
+			},
+		},
+		/* sdhc1 */ {
+			.address = 0x51a00000,
+			.pin_base = 256,
+			.pin_bitmap = {
+				(1 << (232 + 32 - 256))
+			},
+		},
+		/* lpuart2 */ {
+			.address = 0x51a00000,
+			.pin_base = 352,
+			.pin_bitmap = {
+				(1 << (347 + 32 - 352))
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
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
+
+	.stream_ids = {
+		0x10,
+	},
+};
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
new file mode 100644
index 00000000..d63c73cf
--- /dev/null
+++ b/configs/arm64/imx8qm.c
@@ -0,0 +1,214 @@
+/*
+ * i.MX8QM Target
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *  Alice Guo <alice.guo@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[3];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xfdc00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_CON_TYPE_IMX_LPUART |
+				 JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+		},
+		.platform_info = {
+			/*
+			 * .pci_mmconfig_base is fixed; if you change it,
+			 * update the value in mach.h
+			 * (PCI_CFG_BASE) and regenerate the inmate library
+			 */
+			.pci_mmconfig_base = 0xfd700000,
+			.pci_mmconfig_end_bus = 0x0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
+
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_ARM_MMU500,
+					.base = 0x51400000,
+					.size = 0x40000,
+					.arm_mmu500.sid_mask = 0x7f80,
+				},
+			},
+
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x51a00000,
+				.gicr_base = 0x51b00000,
+				.maintenance_irq = 25,
+			},
+		},
+
+		.root_cell = {
+			.name = "imx8qm",
+
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			/*
+			 * vpci_irq_base not include base 32
+			 */
+			.vpci_irq_base = 53,
+		},
+	},
+
+	.cpus = {
+		0x3f,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 0),
+		/* MMIO (permissive): TODO: refine the map */ {
+			.phys_start = 0x00000000,
+			.virt_start = 0x00000000,
+			.size =	      0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* RAM */ {
+			.phys_start = 0x80200000,
+			.virt_start = 0x80200000,
+			.size = 0x5f500000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */ {
+			.phys_start = 0xdf700000,
+			.virt_start = 0xdf700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Loader */{
+			.phys_start = 0xfdb00000,
+			.virt_start = 0xfdb00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* OP-TEE reserved memory */{
+			.phys_start = 0xfe000000,
+			.virt_start = 0xfe000000,
+			.size = 0x2000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* RAM2 */ {
+			.phys_start = 0x880000000,
+			.virt_start = 0x880000000,
+			.size = 0x100000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
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
+
+	.stream_ids = {
+		0x11, 0x12, 0x13,
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200922064542.26274-5-alice.guo%40nxp.com.
