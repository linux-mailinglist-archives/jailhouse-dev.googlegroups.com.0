Return-Path: <jailhouse-dev+bncBDEN32754MOBBIXPWX2AKGQEHOUVK6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A71A1C41
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Apr 2020 09:05:06 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id n127sf1976469wme.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Apr 2020 00:05:06 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1586329506; cv=pass;
        d=google.com; s=arc-20160816;
        b=voZm5ycAv4MeAoxYx3PrG5DeoLNTbZeWzqs+RJLxsAIzJSWdDaUP7c2ofkpCOdoGcv
         VV9GckVc4zwf4QGV7TBU9DmFeejEA4v3olVgQ/M2oXKwKtG2sJdF+Os25k6b7xGSamL0
         xyp1dAKRMoimM/m/P+5U9N3hZ1sD9+5zKzEnN493yo4wZjDshN+LLyHbkgYR8QwzUzq2
         GcpTezP00f6gXXXVEzWnyILfHNq7X2x1LjfXDpNrnYOPX4TiozENnMqIu8sCQfG/mJku
         3rJmocqTHeA0yyTREyUE84BS5mZ5S67udzPIF/yjaQQqbhLMpGiyHQ1TflYQSKgX4MQG
         Z4ag==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=4Zm9TU0wINSu9x7U5iR9SmuDXZzkG5jt99I5o/G3Fw8=;
        b=O4avxVFhM8EEXxA2r/AyffUcflAUJoJrEqO+H3iBmvpoSL2tEnvV1NbCdtcj7/VL5O
         36q8haN2XjUym11ELam0i9DuUBlvaAxBGd/MPBxKzhVRLeKDyXupAYPdRaoKLI2drlTa
         F/Nn6Uvbi39lBz7mXEzbaT4PhW4E/l32mQphQf9FaIwcVHdgeB73u7ltl/DES3b8UuYV
         TEDr0Y9rr0NnCZDwsKoHFQZ1SrcYvodBNQSgFDKuEEnaVaT6SM/StkK5a9/9ZVCa0eL9
         EtmjKV1Tkj7S+jp9ouZJroJI6wAzjQlU2fdEmDd41B5YM0TuKtI6O5/SI0lOoFbNzwa7
         epMw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Xi5dEvDO;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:7e1b::617 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Zm9TU0wINSu9x7U5iR9SmuDXZzkG5jt99I5o/G3Fw8=;
        b=X4BMg8Jh5+vvYub5aw+EXyJzPYk1O1+LtoQpQx0NU0H6g/Ta/YGCg1Ede11djm46dr
         o8EGRtLF7PyIHSKuZZRysUmCj6javx9DRoPVF0lVAz6pjx/N0GrU3u6nPgM2BqfrVSDP
         Bs8uwaW/wq59/66gLQNb7I2pGbvtXz3tk3Ga9Kvaufm+QLwUhY8JaTggTKCFNiubxBR/
         sQ417nOCOTulyb4s3X4P3yBCdEQkL1UZNSasxHXkGuEJIsolZ05j8bVh1eQg5iFtsKVf
         cCNnShw8iKIP8ElJrRzCXUdWRY0b5Ao7bWdpqtHehpi1N5L73JQrXE9c+X6tStkVh732
         LnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Zm9TU0wINSu9x7U5iR9SmuDXZzkG5jt99I5o/G3Fw8=;
        b=jTTfyWayvqXvmN5r0v3UoJNJ4WZArGtWYJlOyEGpgLCmym5FWS9O8sNf5NvYnP/Jgd
         T+/LFaE2SkqzXggtmc4PtcvgiaHyqO6H91nj9wmdmcreTeJu3xYKfcTOfALFzbRyCOv2
         fn310OIPcVfUcABgNrDv+WC9NfWiaGDUx+S8SjhAsi+W0bTKlqptw6S3uLGEuAwXfheo
         A++1wcXpz7YzcTgQcXpjG3nhdeWwh7s2bRdhp3xwy0xU0LD2gAdHneohFLRqKmsUd82P
         AsrrppHGLFArCujfBR6Psd5fA8PpcfFnhSLGPPBBQJrN+C7mtFtgN7Ledky9EfuPdSEE
         f+iQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubuC3eKZu6uX2exJxl4PjsaDGf05Faj4ki2p2KQfwisiuFoTrNm
	6wcdfPqVy7drOvc2N+U+P+o=
X-Google-Smtp-Source: APiQypJhE5Damh6G9Y9nkddTZ4z3dH1ne2B8svL/UUBGk5dlb037adReTLmgy3W8c7oFSas//xB//w==
X-Received: by 2002:a05:6000:10d1:: with SMTP id b17mr7127462wrx.360.1586329506639;
        Wed, 08 Apr 2020 00:05:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4101:: with SMTP id j1ls5155970wmi.2.canary-gmail;
 Wed, 08 Apr 2020 00:05:06 -0700 (PDT)
X-Received: by 2002:a1c:3d85:: with SMTP id k127mr3209416wma.48.1586329506046;
        Wed, 08 Apr 2020 00:05:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586329506; cv=pass;
        d=google.com; s=arc-20160816;
        b=d/cTfXrisIJ1bSfI1ZddnWjV5HDnwlYDz72mYZw7CB/5lyZey7zJNfhJW2/1EnDRkJ
         QtFC1SWfpV+K6mfUUj2IWad2BgrLY0Ioh9ilY9ZoiH46HXle9m11ljtdDAPQVA5UzwgT
         FNvAc09NtRYIa06ZgER8ubdHVdNVDyjCL0DGtcrQWvnDHNrVotLzMUJTboE7eMyi+DZ5
         E64b0EEbejfuEcveH04OtQCsPAcnk9TOoHP1cgBa06z+Ij4wj9WTfxtFJpj1YXBuP1K7
         JcfbkRAVsWDQ76123i8X8GBKTXCOdZIVtyaZY2v/MRWYjHRDKpNrmdwLlZHmqw2NJeML
         6puw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v8MBhKYrDcfl5Ff2G328KLT320yBHQYxVETv0pku4H0=;
        b=X5qGLOHOnZwcNiYEcKKTLTlut0S59ZjiSVOrs1hZ0JYFfLuflCBy+aD4v/gv403Ki8
         aWL5z9fU9a8iNNXmCDstAXeobiLEIb90dsjCvITWDVE+JI8NLBdn6ofGtWIsm0zNvSXs
         EjffXN5mkuGZE92UHNMgSXQh7kXGLh90dtUCbzcYH9ml4VXHo/vn58mNDLY50MjKoO3P
         7/+rOYh890Plf8wY/IBRTGtDnIx/mnBTuE+KG1TT2Qncp1ATNhjmBF+ZG+e05WPQKbPu
         Gy50zBxP8jjKBtZLluqaU1RAZzrGbUcUGxZ70q/sXIRKJqbNQgvb2igbDa4n+eunaVxo
         tW+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Xi5dEvDO;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:7e1b::617 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20617.outbound.protection.outlook.com. [2a01:111:f400:7e1b::617])
        by gmr-mx.google.com with ESMTPS id o125si292828wme.4.2020.04.08.00.05.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Apr 2020 00:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:7e1b::617 as permitted sender) client-ip=2a01:111:f400:7e1b::617;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KalvUJ7mWWs9vK0KdE8hx7GX2S17x/MaQq23Cxl0R7q1KMRz4fVkSbfd0t4/t+NpXGAswtq8AAdNP4xljv4kzBnTtlOHsOBdvrrqdkM1kPauozlzM9ks38dZinb8g429L7S8IQ+xpej2bxqI3r8BuNvzKUxbhnOYSq3jdCHQJdB/CCWbX9KRiklkCV4S3CkJaHE4QquFeYDOdfjPVUzuSnhajIJ3Lv2SpNLnlJcKgMFFRj6WBLtLFa3cSTkMjnsLwqjsAzpXoJPjPSIDpzszKKadYWpifr07I9QqpdfVXNSbJBOGk619GIQ1D2FUZFe8619/VRqldDYVwmMpGOurNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8MBhKYrDcfl5Ff2G328KLT320yBHQYxVETv0pku4H0=;
 b=f2dwiCakUgoZ6YsIV4i73YJAhFUFDaTUOQ0tyvHrC4b1btj+enHQc80mGM0R2qbEn8cii9Hzj3GOu9yg8Ef8EbWDpTTOS9RqssVUvSWylH/drw6/acQFSG2d0gYXAoIrt8P9kCK2IKxifgsdB5yJMrPBMCUgNxCcvGZU/TlQuNVX5+qs5BPFe0PEUhqmSR6jMQyh4Htpzuvn3DXP5xxYwAEazP/G8Ea2eMgjuFcTreaZ1+Y48x3/RZ9LnDu1CAFTaLFhNSOf78ZVaOWU6TVyOZiMjYQPfxS9Gu3TATGDPW2w6r6415O5wOXfnVEAl01ukxoYpMOHSSkk9tHXtrWD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB5866.eurprd04.prod.outlook.com (2603:10a6:10:b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Wed, 8 Apr
 2020 07:05:04 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::55c:405c:271a:4c56%7]) with mapi id 15.20.2878.018; Wed, 8 Apr 2020
 07:05:02 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 2/2] Cell configs for imx8mm EVK board.
Date: Thu,  9 Apr 2020 22:04:47 +0800
Message-Id: <20200409140447.4244-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200409140447.4244-1-alice.guo@nxp.com>
References: <20200409140447.4244-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096::11) To
 DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.3 via Frontend Transport; Wed, 8 Apr 2020 07:05:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3400ec8f-7587-4389-ff58-08d7db8b287d
X-MS-TrafficTypeDiagnostic: DB8PR04MB5866:|DB8PR04MB5866:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB586693246E6015D7B6406CEAE2C00@DB8PR04MB5866.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(5660300002)(16526019)(30864003)(52116002)(2616005)(44832011)(6916009)(6486002)(81156014)(81166007)(8676002)(186003)(8936002)(956004)(316002)(6506007)(66946007)(66476007)(478600001)(86362001)(6512007)(26005)(4326008)(2906002)(66556008)(1076003)(36756003)(6666004)(32563001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Us3VEx1JZ6PvEvK8mtmP3J4KPjSMbDLdAqLm0boTGqber3XZ+ATFdII2gqVeilSSwlQCDIFuHR1fG/JXKsf66tGf79HiOoAyANeEua31CS4zmpQO+ct/Y4KCEN7OLzSxM5C27Ufx/TEYBBv6ozyG3uv69W/EP+1+A5JRy7t6tEghtLfu5Is/Qv6epmGArQvtdS0lAUg3Gr7m6EOJ+A9msR3KfNCJkf8Zz67cpJtp9tTct7foDBtEY/H2DKZEMYvXQtzjqWR8IUKGenDAYlFLEWI2F4SKNr4YKlT2pR3rL386YlwoFioV/dWK1ysxRTUUzVIUaUGWzQoSEtzJl9TCLBlsGrGKgKM3jJrgSx+sSUwf4hT5s+Z1eZ9Nje2lR7kThvHHL6synyWs0HcezJRnW/Z42vXNYN0Tfbynw1fBMwGVh7eAPzrQV7DHnruMe1PbBDx7pdyEioGusZyY3olSK7KYTsrpzYclVWOYPXx6wsXnhFihZlXlv3q/jHkv7YJ
X-MS-Exchange-AntiSpam-MessageData: qQcwCEOd2oin7o5txtuB/iAWpqo4uj90rlcMSVrPIYtp3fzBjCYIrQ7V7TwHxFCl9Zn27HSgXGgwV2dUP1X+wKGGHsS34g/Anuzthhv3So/m2P5Y66BF+ujXbBAgr4w0F8k8mEQg/zT1bSVHQkxC9g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3400ec8f-7587-4389-ff58-08d7db8b287d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 07:05:02.5056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Q8tO3oA0bIY9jV/FM4tXe4AOwXvzRH0TDuHz7YuZkDO+AlTGTEwWlYK1aEPEsTAMWinEgac7c8JeLkYNXf0zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5866
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Xi5dEvDO;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 2a01:111:f400:7e1b::617 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
index 00000000..5791b945
--- /dev/null
+++ b/configs/arm64/imx8mm-inmate-demo.c
@@ -0,0 +1,125 @@
+/*
+ * iMX8MM target - gic-demo
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
index 00000000..a3e85c0a
--- /dev/null
+++ b/configs/arm64/imx8mm-linux-demo.c
@@ -0,0 +1,165 @@
+/*
+ * iMX8MM target - linux-demo
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
index 00000000..88365919
--- /dev/null
+++ b/configs/arm64/imx8mm.c
@@ -0,0 +1,203 @@
+/*
+ * i.MX8MM Target
+ *
+ * Copyright 2020 NXP
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200409140447.4244-2-alice.guo%40nxp.com.
