Return-Path: <jailhouse-dev+bncBDEN32754MOBBIV56X2AKGQEKVKHVBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 384AE1B0482
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Apr 2020 10:34:43 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id f15sf5415727wrj.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Apr 2020 01:34:43 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1587371683; cv=pass;
        d=google.com; s=arc-20160816;
        b=njYaaNO+eJaeXVMUlkc+9Pmyn6bI2v7rRO+ST/3xDe2cCWGVPIPlpIk8UAVOl9+cko
         cFtRJYEdlD60NrQxLYp5eTeBiT9GWiLLiskso2cMoGJcKk6mJmZR/ukGPZjzWx9MrWy8
         CpF9Jv1kn0cy+QY+r/6PoliPyBIu7cvqnq53lLAUv6h9AtrmuOQRYGdJCChJbsjgKJBn
         HuS7ZLE0xMsjHdQFLJWGySzWZV3deKBeaPSAxe+b1eO2Cbq0fQ2udqAVNIR7cVvKZYqE
         6lFTEaWtjS+KOWiG1WbVa5oqn7MUZDhdcr41WIAbrQ7mYm1rBHFyjgsYlubpfqneHjvc
         cwWA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=homIw8h6Ds6ZgWtRPkSn7Lq9Jyq8104ktlGU1usboNI=;
        b=AZWMoY18s5etiw0Nb0rfx2KPc7jO07FMESPPI8dS7gTbbA2jCk+YxHRVm+lVbKTtwr
         fPtxbm2K3iUPGj8I4JpLff/0S75/+jgP58QX+MI2Y2bufCtrLkqdAErQ0W4w6HzgbbX/
         64T0zRSqoJHm1b1E6Y5UcMLyWH7QvFcLYH1+yQAtERBD3tS3FJkEb8YBrr3uhTC3/FYV
         EBTwo3QR2nJaw9KsXhusO2EJ6h/By0CIWwM3xxHkERAWykYqyq1QXUzYy/ZpvOKKmsT+
         bI3MG+WDKiOHKkfRW7TfPzLPfFdywrrx76yV7eFdxjZpvrz6o+RtdnXJHXPKsj+hAqYe
         DZlg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=YtuRtbHL;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.71 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=homIw8h6Ds6ZgWtRPkSn7Lq9Jyq8104ktlGU1usboNI=;
        b=Pumnt6Ha9GEnp65e2G2A832D+8y5thx6VRVQbJposV4mnzdBMp7Lsgo/4ljV3tvBz0
         psVninolqjBILnfSGj4jDhEQbSw3I192alp7uEV3WBZWyuzSzislpxW60cOz3Uq71u97
         RMNQ2AOECyYRd0K5cfw6OUZRMF7f91eYA4zzK5LxvkT/dYOSSMt0zEDv5knLwE+3IKXJ
         l5YYbuaGHjhX3S2Y85UU7jp5l8ujBnE054gYyZ7qlB0hkwdYKtJ/zjiuNyPGUwYxybgd
         JXUci9zkfSbeUXC+xJdisR+9hWjYoJwKvyZI/D7dIo71yH/xgATo1YzLBMePZu2r0jIn
         g3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=homIw8h6Ds6ZgWtRPkSn7Lq9Jyq8104ktlGU1usboNI=;
        b=q+Pjxz6ZFzHsHX5bbfOchc//xxzy5bINy7MikM9HRREU1vcIkXtKa9k6Qe+C7uwv0u
         g+nCF6LrbHmFAm5r3yLZwV1szjymwFWpCzxA1e1gyAcX9nK+e3Hv0mFtmdprYnKSv57K
         D7Q6oVHrUiArs404Y3HwUciJXoSMkzQycuBkeH6CX4LW+iD5g3QTlxENvr2ACroYLdMM
         G2XICheHt8NBBB+geWRHtTSsTVUu7vzEvxryGa/4qeunixzXVr7XMB3puEjobstDPHF6
         ck8adoZ1rUbNPYJgqmN5n7pEQe+VFtS/AcVE+P95wy3YETkOHU2sWmImAR/0Vkn/pxdU
         Y5NA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuazH9mRhRZlx+FnSLyp2JMbk1gEAnccfv2rFNTWjSGrInHJt0U8
	GNLmA5minoU1gosOmN5A9oY=
X-Google-Smtp-Source: APiQypJuPaM8pJNnNm7qFJfsrzYDLZq52VxVjiUBzTwqOgzrl1QbzON/j/crV6VpzTN4OEL0mG6djw==
X-Received: by 2002:adf:8441:: with SMTP id 59mr18313460wrf.237.1587371682821;
        Mon, 20 Apr 2020 01:34:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:668b:: with SMTP id l11ls4023827wru.0.gmail; Mon, 20 Apr
 2020 01:34:42 -0700 (PDT)
X-Received: by 2002:adf:fc11:: with SMTP id i17mr19007682wrr.152.1587371682106;
        Mon, 20 Apr 2020 01:34:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587371682; cv=pass;
        d=google.com; s=arc-20160816;
        b=izczDdeD9CO2TStR1pQpJJw+EIWCRH7C9dd/+Sm+hPVMdSLALpBsZcFHOwzZohqc2Y
         7DYKb/AJh59ypFugmpWsUpymL+jFTRBQF6VGxdNM559aVPkTU9SbjUCuZE9+rFb0rjJm
         gWhu46ayeOwJ7/4oeigtVDcJP69UUtmM30zkDwenftxRzuDklCj/5U/yUD5OT0dS3ogI
         F3sRtnfmOvxXz+jKtucNyE51qmlXBvXg1zlkUfjRirRSiTL1VW4PzCe/tk3rvXDW+Wa3
         IAVjVKcWcWzIaFnHCcaQAoB2Ux4nXydN3Z9c4M59SCE2hsQV5i+hi+7J2J9/s+3RHv6+
         h2bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=o00ap+VMG60K8fig0/Bb9vWOZvYlWcCZKkU4ZQ/8b9M=;
        b=TcLVji3ernSAnCCBdStvoSaXoVd0qkvUPw4kvbhjXNEvxaXXB4WwtmK5FS7O0rqy28
         F2dVNZpwEjx0GnCxzdkeXpjZI80yoHro9CMFgp6w70mfD0L5k9/7ioEEyKhmvHx2VuZI
         v2pM8JXjSEaxbX/AA+6KrnyORtkmy/feXOdn5/b+4+U1lEkNmtWjkFv7e+9Vx7e44xyp
         bivjj9W5a2A/NP4U+ymCwdXpk3PYQlYPElWbtIEtE5eCnS6Dq1e9wjKi4x2gooHMEV2N
         6/fnyD/kjWvaT6phOp4yIr7B5VKxA9rcD5zVQEOp65+rppLuxgEbQ+VsdUgWr9PnSBaE
         MORQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=YtuRtbHL;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.71 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70071.outbound.protection.outlook.com. [40.107.7.71])
        by gmr-mx.google.com with ESMTPS id u15si21512wru.2.2020.04.20.01.34.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Apr 2020 01:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.71 as permitted sender) client-ip=40.107.7.71;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYDCxNj3VKHCS1iCH5mbQvbohiXATkp4MPci6a1PNeSy1vNUg3j/O0AjF7xnGAd0fkBk0wAsPGm7VW8KCF1ez1gynPisXmNHfqwelkuoNqPriclP6RgondH3N096fItNgyj26IMEkIFWHSoy/rRbw166lUnmpY9NoCyJaLzwnXJN1C28vebo2fCXNguiN8hJErVBLriMIh0oFuagozKayZP2fY8NlD0cB9ec2SWCUFNqx1ch2h+0zxa3zrh0Tlt3RVJj8VulCdHvNQE31V1JPy33JjsOyImLksYCfhChG/dqjECMCUWRlg/BHNuhBAwhoMuW/jUao5KU/1ECP364lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o00ap+VMG60K8fig0/Bb9vWOZvYlWcCZKkU4ZQ/8b9M=;
 b=jEe7KrQLqfxdqypTG084xBcJmXhYy9b+6CCRGAJAu81wuw/Fzi62UHcTPTGtJDCR28mCxXHgYJ3+qsxLEFeUFpDWPs94xgRt6lEvW+Kp55jvW9MNTZAD7EprelQhGiqmLeBnKEoBzLUeAyj0qnKXXGHr1p5mYWcWapmblJlvYJq/w6ieWxlNvS0VT1Gj1aXfBAnoq4w2YFIonLcetP9HfKpQ3/wCWU0tCEHkQtzGHJ4gXgnoWoIpmRrkp49OHVjuB8kNWX90SOJ3QcwsajqROqsrJBfjZUp0n6RjjrfuvG/YZBKj3K76uyY0NKE6kSLB05HDIQMfg7XZkrR6IsYfsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB5706.eurprd04.prod.outlook.com (2603:10a6:10:a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 08:34:37 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 08:34:37 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1] configs: arm64: Add inmate device trees for all the i.MX8M family
Date: Tue, 21 Apr 2020 23:34:27 +0800
Message-Id: <20200421153427.10925-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Mon, 20 Apr 2020 08:34:36 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ff23fe3-1ed9-418f-4627-08d7e505a93f
X-MS-TrafficTypeDiagnostic: DB8PR04MB5706:|DB8PR04MB5706:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB57062BDD4CAF9A0B1F02C2F8E2D40@DB8PR04MB5706.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 03793408BA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(478600001)(26005)(36756003)(86362001)(52116002)(6506007)(2616005)(956004)(5660300002)(66556008)(66476007)(66946007)(44832011)(30864003)(6916009)(6666004)(6512007)(6486002)(316002)(4326008)(1076003)(186003)(16526019)(8936002)(8676002)(81156014)(2906002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7OUTKKXygdxrmyiDZ8pO+EkwFDlC7x5AUxIS1R5KARujnnbzRkBlOtaTiF6JhzACt0sTMRiYqJ5UUGR6q6clNoMy5Qpgz+Oo2hgKYMmDBYKtBtVD5qZetcYVoU/tRZzSX85I6FwVqrb7dGN4fM3aOMV3Hi8uR2leEyZyzfepPaUN7FKoOwCfpPnBAO24QfZerQWeO+Hk1vsd+f+xOxuhtcMXw5Nw4x0WMQK6dj6mOe4ivgM2PHFt60wVpDc1BJoY78xjgAeoY2ceTsAXMg+b8Xi0FnP5Y3zxw+DTcGEszFPgxmav/KwZppj3xdjei+vgyRcowymt1gSEiZ2ozHckj9r7SDCkkY27TAbTWUAnDU6ijlftpXiRrdPpbDROKQeSI1JAD3w11TMXEYlzWIoxIaF9+KTIQBdM5s0SWrbDhpgC59spMLComhW1HtON/iTh
X-MS-Exchange-AntiSpam-MessageData: 2kr6ClnVUukK2mqRfzVmp/4FAVyWd1VpUEX1ZY75v8mZb8GEstu+6vvIGgwFB9LKY8isxufYPFnGBXoYqL4/mxND7Y40pj8Di9wRYcrEy80+GsAYf5s1nxP8MpoROffwsOzPUpN+9ITl1/FjJt9Y3A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff23fe3-1ed9-418f-4627-08d7e505a93f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2020 08:34:37.6583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6HQbqynjQRu1QDcvjp4ivvagR/lcqkQ3iZrJ6ij/H6+luBuEhubxT4EDxoJuSVDjH/lJ45zoAoMaS5q23/AGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5706
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=YtuRtbHL;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.7.71 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

These device trees are used to boot Linux kernel in the inmate cell.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/dts/inmate-imx8mm-evk.dts      | 172 ++++++++++++++++++
 configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts | 171 ++++++++++++++++++
 configs/arm64/dts/inmate-imx8mp-evk.dts      | 162 +++++++++++++++++
 configs/arm64/dts/inmate-imx8mq-evk.dts      | 175 +++++++++++++++++++
 4 files changed, 680 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-imx8mm-evk.dts
 create mode 100644 configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
 create mode 100644 configs/arm64/dts/inmate-imx8mp-evk.dts
 create mode 100644 configs/arm64/dts/inmate-imx8mq-evk.dts

diff --git a/configs/arm64/dts/inmate-imx8mm-evk.dts b/configs/arm64/dts/inmate-imx8mm-evk.dts
new file mode 100644
index 00000000..f7c21b10
--- /dev/null
+++ b/configs/arm64/dts/inmate-imx8mm-evk.dts
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "Freescale i.MX8MM EVK";
+	compatible = "fsl,imx8mm-evk", "fsl,imx8mm";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial3 = &uart4;
+		mmc2 = &usdhc3;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		A53_2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			clock-latency = <61036>; /* two CLK32 periods */
+			next-level-cache = <&A53_L2>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+		};
+
+		A53_3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			clock-latency = <61036>; /* two CLK32 periods */
+			next-level-cache = <&A53_L2>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+		};
+
+		A53_L2: l2-cache0 {
+			compatible = "cache";
+		};
+	};
+
+	gic: interrupt-controller@38800000 {
+		compatible = "arm,gic-v3";
+		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
+		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
+		clock-frequency = <8333333>;
+	};
+
+	clk_dummy: clock@7 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+		clock-output-names = "clk_dummy";
+	};
+
+	/* The clocks are configured by 1st OS */
+	clk_200m: clock@8 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+		clock-output-names = "200m";
+	};
+	clk_266m: clock@9 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <266000000>;
+		clock-output-names = "266m";
+	};
+	clk_80m: clock@10 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <80000000>;
+		clock-output-names = "80m";
+	};
+
+	osc_24m: clock-osc-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc_24m";
+	};
+
+	pci@bb800000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 2 &gic GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 3 &gic GIC_SPI 76 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 4 &gic GIC_SPI 77 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xbb800000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x3e000000>;
+
+		aips3: bus@30800000 {
+			compatible = "fsl,aips-bus", "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x30800000 0x30800000 0x400000>,
+				 <0x8000000 0x8000000 0x10000000>;
+
+			uart4: serial@30a60000 {
+				compatible = "fsl,imx8mm-uart", "fsl,imx6q-uart";
+				reg = <0x30a60000 0x10000>;
+				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			usdhc3: mmc@30b60000 {
+				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
+				reg = <0x30b60000 0x10000>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "ipg", "ahb", "per";
+				fsl,tuning-start-tap = <20>;
+				fsl,tuning-step= <2>;
+				status = "disabled";
+			};
+		};
+	};
+};
+
+&uart4 {
+	clocks = <&osc_24m>,
+		<&osc_24m>;
+	clock-names = "ipg", "per";
+	/delete-property/ dmas;
+	/delete-property/ dmas-names;
+	status = "okay";
+};
+
+&usdhc3 {
+	clocks = <&clk_dummy>,
+		<&clk_266m>,
+		<&clk_200m>;
+	/delete-property/assigned-clocks;
+	/delete-property/assigned-clock-rates;
+	clock-names = "ipg", "ahb", "per";
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
diff --git a/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts b/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
new file mode 100644
index 00000000..74fe9d7c
--- /dev/null
+++ b/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "Freescale i.MX8MN EVK";
+	compatible = "fsl,imx8mn-evk", "fsl,imx8mm";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial3 = &uart4;
+		mmc2 = &usdhc3;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		A53_2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			clock-latency = <61036>;
+			next-level-cache = <&A53_L2>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+		};
+
+		A53_3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			clock-latency = <61036>;
+			next-level-cache = <&A53_L2>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+		};
+
+		A53_L2: l2-cache0 {
+			compatible = "cache";
+		};
+	};
+
+	osc_24m: clock-osc-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc_24m";
+	};
+
+	gic: interrupt-controller@38800000 {
+		compatible = "arm,gic-v3";
+		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
+		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
+		clock-frequency = <8333333>;
+	};
+
+	clk_dummy: clock@7 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+		clock-output-names = "clk_dummy";
+	};
+
+	/* The clocks are configured by 1st OS */
+	clk_200m: clock@8 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+		clock-output-names = "200m";
+	};
+	clk_266m: clock@9 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <266000000>;
+		clock-output-names = "266m";
+	};
+	clk_80m: clock@10 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <80000000>;
+		clock-output-names = "80m";
+	};
+
+	pci@bb800000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xbb800000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x3e000000>;
+		dma-ranges = <0x40000000 0x0 0x40000000 0xc0000000>;
+
+		aips3: bus@30800000 {
+			compatible = "fsl,imx8mq-aips-bus", "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x30800000 0x30800000 0x400000>,
+				 <0x08000000 0x08000000 0x10000000>;
+
+			uart4: serial@30a60000 {
+				compatible = "fsl,imx8mn-uart", "fsl,imx6q-uart";
+				reg = <0x30a60000 0x10000>;
+				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			usdhc3: mmc@30b60000 {
+				compatible = "fsl,imx8mn-usdhc", "fsl,imx8mm-usdhc";
+				reg = <0x30b60000 0x10000>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "ipg", "ahb", "per";
+				fsl,tuning-start-tap = <20>;
+				fsl,tuning-step= <2>;
+				bus-width = <4>;
+				status = "disabled";
+			};
+		};
+	};
+};
+
+&uart4 {
+	clocks = <&osc_24m>,
+		<&osc_24m>;
+	clock-names = "ipg", "per";
+	/delete-property/ dmas;
+	/delete-property/ dmas-names;
+	status = "okay";
+};
+
+&usdhc3 {
+	clocks = <&clk_dummy>,
+		<&clk_266m>,
+		<&clk_200m>;
+	/delete-property/assigned-clocks;
+	/delete-property/assigned-clock-rates;
+	clock-names = "ipg", "ahb", "per";
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
diff --git a/configs/arm64/dts/inmate-imx8mp-evk.dts b/configs/arm64/dts/inmate-imx8mp-evk.dts
new file mode 100644
index 00000000..2fb4bc74
--- /dev/null
+++ b/configs/arm64/dts/inmate-imx8mp-evk.dts
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "Freescale i.MX8MP EVK";
+	compatible = "fsl,imx8mp-evk", "fsl,imx8mp";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial3 = &uart4;
+		mmc2 = &usdhc3;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		A53_2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			clock-latency = <61036>; /* two CLK32 periods */
+			next-level-cache = <&A53_L2>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+		};
+
+		A53_3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			clock-latency = <61036>; /* two CLK32 periods */
+			next-level-cache = <&A53_L2>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+		};
+
+		A53_L2: l2-cache0 {
+			compatible = "cache";
+		};
+	};
+
+	gic: interrupt-controller@38800000 {
+		compatible = "arm,gic-v3";
+		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
+		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
+		clock-frequency = <8333333>;
+	};
+
+	clk_dummy: clock@7 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+		clock-output-names = "clk_dummy";
+	};
+
+	/* The clocks are configured by 1st OS */
+	clk_400m: clock@8 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+		clock-output-names = "200m";
+	};
+
+	clk_266m: clock@9 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <266000000>;
+		clock-output-names = "266m";
+	};
+
+	osc_24m: clock@1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc_24m";
+	};
+
+	pci@fd700000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 2 &gic GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 3 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 4 &gic GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xfd700000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x3e000000>;
+
+		aips3: bus@30800000 {
+			compatible = "simple-bus";
+			reg = <0x30800000 0x400000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			uart4: serial@30a60000 {
+				compatible = "fsl,imx8mp-uart", "fsl,imx6q-uart";
+				reg = <0x30a60000 0x10000>;
+				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			usdhc3: mmc@30b60000 {
+				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
+				reg = <0x30b60000 0x10000>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+				fsl,tuning-start-tap = <20>;
+				fsl,tuning-step= <2>;
+				status = "disabled";
+			};
+		};
+	};
+};
+
+&uart4 {
+	clocks = <&osc_24m>,
+		<&osc_24m>;
+	clock-names = "ipg", "per";
+	status = "okay";
+};
+
+&usdhc3 {
+	clocks = <&clk_dummy>,
+		<&clk_266m>,
+		<&clk_400m>;
+	clock-names = "ipg", "ahb", "per";
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
diff --git a/configs/arm64/dts/inmate-imx8mq-evk.dts b/configs/arm64/dts/inmate-imx8mq-evk.dts
new file mode 100644
index 00000000..8d620522
--- /dev/null
+++ b/configs/arm64/dts/inmate-imx8mq-evk.dts
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "Freescale i.MX8MQ EVK";
+	compatible = "fsl,imx8mq-evk", "fsl,imx8mq";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial1 = &uart2;
+		mmc2 = &usdhc1;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		A53_2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			clock-latency = <61036>; /* two CLK32 periods */
+			next-level-cache = <&A53_L2>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+		};
+
+		A53_3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			clock-latency = <61036>; /* two CLK32 periods */
+			next-level-cache = <&A53_L2>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+		};
+
+		A53_L2: l2-cache0 {
+			compatible = "cache";
+		};
+	};
+
+	osc_25m: clock-osc-25m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "osc_25m";
+	};
+
+	gic: interrupt-controller@38800000 {
+		compatible = "arm,gic-v3";
+		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
+		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
+		clock-frequency = <8333333>;
+	};
+
+	clk_dummy: clock@7 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+		clock-output-names = "clk_dummy";
+	};
+
+	/* The clocks are configured by 1st OS */
+	clk_400m: clock@8 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <400000000>;
+		clock-output-names = "400m";
+	};
+	clk_266m: clock@9 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <266000000>;
+		clock-output-names = "266m";
+	};
+	clk_80m: clock@10 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <80000000>;
+		clock-output-names = "80m";
+	};
+
+	pci@bfb00000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 2 &gic GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 2 &gic GIC_SPI 53 IRQ_TYPE_EDGE_RISING>,
+				<0 0 0 2 &gic GIC_SPI 54 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xbfb00000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x3e000000>;
+		dma-ranges = <0x40000000 0x0 0x40000000 0xc0000000>;
+
+		aips3: bus@30800000 {
+			compatible = "fsl,imx8mq-aips-bus", "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x30800000 0x30800000 0x400000>,
+				 <0x08000000 0x08000000 0x10000000>;
+
+			uart2: serial@30890000 {
+				compatible = "fsl,imx8mq-uart",
+						"fsl,imx6q-uart";
+				reg = <0x30890000 0x10000>;
+				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			usdhc1: mmc@30b40000 {
+				compatible = "fsl,imx8mq-usdhc",
+						"fsl,imx7d-usdhc";
+				reg = <0x30b40000 0x10000>;
+				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "ipg", "ahb", "per";
+				fsl,tuning-start-tap = <20>;
+				fsl,tuning-step = <2>;
+				status = "disabled";
+			};
+		};
+	};
+};
+
+&uart2 {
+	clocks = <&osc_25m>,
+		<&osc_25m>;
+	clock-names = "ipg", "per";
+	/delete-property/ dmas;
+	/delete-property/ dmas-names;
+	status = "okay";
+};
+
+&usdhc1 {
+	clocks = <&clk_dummy>,
+		<&clk_266m>,
+		<&clk_400m>;
+	/delete-property/assigned-clocks;
+	/delete-property/assigned-clock-rates;
+	clock-names = "ipg", "ahb", "per";
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200421153427.10925-1-alice.guo%40nxp.com.
