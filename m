Return-Path: <jailhouse-dev+bncBDEN32754MOBBIUG534QKGQEJSG7GIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9DD247F76
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 09:28:34 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id o10sf7888964wrs.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 00:28:34 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597735714; cv=pass;
        d=google.com; s=arc-20160816;
        b=xYAf6o6sWpKx1q2A0E1XxPJcXi38nqlxX5qxTS3EkJafdXPZBZdt2VK1Et9wTesoqk
         BfFz70uJnofFhuAxz3HtQLKl9og/yM1BCqbeGOLMkciYnN7dXy12YsayJLkWywkG3evK
         Pn8Qp/Clym8yuL8HpRYvnlM2Y6YGzl1LToIzuugfpS+IWtigGU8EQCQNuZOuFwGqYtu9
         Dx4eJ+h6UxPg39xZvBOLqLNy79eSqfnpgDXAJW/gpkg4t6BBvuQAqrbhlpSRsSvKftCm
         vxoB+qowTDerTsT/oKQ51r3qKloJfqcAvrZ7kQtg6tWmdRN4YM3FHEbD3vDOLwawWLE4
         Enyw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LsZ3gHLddSS3TEfBENtF6H+vjSusaSoM704WYMSQyBw=;
        b=IjMbEI/qTIjQW7l9yzqx+caBPdBmm5VrInWyhrdX1LPpWWoeRH2SXamy4TqF9lyUdh
         peiNzRfF3PsSMfQQRJ1F+gzfCZHmk3jg3TqaAyGF4ZvKHDTNaXQs8UEp9s/OdFt0dlTb
         X1e/rteqOz3xxTA+U3crx5H7tjvxbr7xwoawf1BLMrzO12ukOv6YrC4vs85Nq/+GRzRw
         khKAB5psaAaISET5WhKvc1Zn+WABX53Ubh2QA6uaGNTf9Mu1sipweGnipncnW5m2a1uG
         lXj/ufXhCDk0fUkEaoeNR3KCw5JGBF+w6Xotu8/c/2/fc7mY7p8bExU3x0E6+4wRxL1V
         Wdtg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Cf+ARjkR;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.73 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LsZ3gHLddSS3TEfBENtF6H+vjSusaSoM704WYMSQyBw=;
        b=dMDWF5p6J83vMyx5iHs7ZoOYIE3POuKj048mFWVAA3l7lSNtMi9aazFXS2aul+limU
         OWPwlJHY7UQyhI0BQg4J0qithKPHktqG8YDaVoNKxGdZxk1aJs0otl9opZekcWgBqlsA
         RK7GynbzM2Q8BR1Bvh14f6pk8Ah3KzSH3puJNMQAFkdKs7ABlMygw0B9g7sSs6sBrwRk
         vPV1BL90a0POxrcO2d9KinbBLIGiYzsoFjnwTvll5nHz8wwBBxYs0Z1iw1+qHPqBeBjx
         MniHs3FLEyUFLqTAeLNqdpX6ghPMmYF/dr+fBoVmT4OmcyL3/Lzy13gZkLIbHvvktxLa
         SSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LsZ3gHLddSS3TEfBENtF6H+vjSusaSoM704WYMSQyBw=;
        b=RDdsiO0s61Fz+zxS5bIvJanIGbuGkY0pAXMRqMEOipKlOmXxgCm1PLP9klebh3SyVD
         xF74P2xwh39bRukoMmDUxJWK3chBP04uPOYjwCN24W4CzKqEFVfomuvYdhAXXhfRgDnr
         pWZtfbaimiPOm52JL6x8jQeuabKk0Q0HERz5a2Io9Zj3oQTIr5WtdsB+7JY8swUzRfoM
         1Za5j8KA27KW3Xyf/kFWaP0Q+JuEUDBev9mF+iUBIP+Xf9LPpfU9idYk4okfmhfPYk/+
         F4FTuAW4bWGupMg8rQ4/L6I+v6XFQ9gLQ5zex8I73unoMUv2Olc7QDprDXH3dPP2Z3yE
         lT6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5326ZQ/hS45fJIDjr2u3pm5xk45MQtstmAzsHaXKMOI+hteBoyHH
	1WYUQB8Zx2yEIytqdfrjdQg=
X-Google-Smtp-Source: ABdhPJwWFwKOGPJFzUY9lvBzaK8ZmCWgBSLzMCpCi73/kW6dMLqGzY9Sw0Bu65NnXG8ODibuqapAKw==
X-Received: by 2002:a1c:1d91:: with SMTP id d139mr18722424wmd.144.1597735714592;
        Tue, 18 Aug 2020 00:28:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls1478955wra.3.gmail; Tue, 18 Aug
 2020 00:28:33 -0700 (PDT)
X-Received: by 2002:adf:e382:: with SMTP id e2mr19391018wrm.306.1597735713529;
        Tue, 18 Aug 2020 00:28:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597735713; cv=pass;
        d=google.com; s=arc-20160816;
        b=SdE4HbiufqPp2Pl/N5R60STbGcUUCsUVJ72s/cCATF80RRiYQJrb4R1CkptrdAtxsG
         yU2nTQKaTnkQj0rXUwTS82qfQdcptohQkuTO8haxI1GHpyuxickw5MuULSWxvhp+o/zk
         9i7yGT6Hdr8VyzX0Xs1fCGSeUmcDEY+VjfJ8zRr8uYkKbwj2Ln/fzW/oImS23QnfJbc6
         GS6+oXKCkSpX0l/OGloRTgn+/HUKh4ydrJZ6DVpTWrVpw2Wyfj7jAAsCjV9KBAfHjTrq
         lG7sr5t/a8HQSlQNO9raYomam9Asp2EZozUGA2LLOqjAa4BC1A4/DZjntftOtDGjas6W
         sxSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LS2X2zDXuuuELyJHVGEMvTGxgx0pVfXpfMtgrfoKTB0=;
        b=tMxRZ+YNfBsgNnM4/jsCpIAEhiiNNljB5IsDmZJqOQ/zhApN48jXtKlFqdTuTzFCDP
         5f41icAWXLNLxJQZxPc3T2tucfmmfTm99dg8gDSukmA7Pw+DAGM+7AwcyeViEEViJ9+b
         1PIZOEBM6ShWiRKm8Ecs/0+q6qs3O03/YDqTkwqeqx7zRs3w+ukkpVh5e1+cCNIPzAxN
         7GEW4hVEMMmbYKsRht/p3BktqWhsrnGYAVEoPbY5Y5tUKzMcDW5b+9MTEoky1CTag6k8
         2Ux/Zzqu3lXR9qESyY65bfNNRvzQ/mDaNfynmvWCqBIiVcl6XNlAhCDxwZcSzAi8rjmi
         jKcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Cf+ARjkR;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.73 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70073.outbound.protection.outlook.com. [40.107.7.73])
        by gmr-mx.google.com with ESMTPS id j16si627753wrs.5.2020.08.18.00.28.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.73 as permitted sender) client-ip=40.107.7.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EULmPH+tZQziG/QYWUcecLzkw56Y/yW75wkLa0beSDQRJoH8N4Bbhr/e217UYCWhxy2FsIMzImJFmtLW4Q+jlwW8EoRUc0+aT9D/npePoLnkKw9MzEaH9j6wfUPAqXS1+YKwjlFx03AqB6Ath6h78DuL6L7HcEB1jfYfVXwyqVCX0mtXxEL2Z3lanrCRylwqfyvmq1hYwpvJcJNO1mjgcVzl962DhUJkH3hretLYCJ+IgD0HZ71CHybTvPgYRlBvhH4hwKz0NBluf+NU9AVkW/hQSbDowXgY+LoLMdSTtwMItb60CWvR1G3Z8oclep8NX9gloAQeOmLabw4Bid7E3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LS2X2zDXuuuELyJHVGEMvTGxgx0pVfXpfMtgrfoKTB0=;
 b=gCvSLP8gchFsz2IOiiXUrd0fejbZKoe5VrvmtkH/wJc7NnR3FbNkX/9yKGf7PSflNRg/Yw4abgSd6O54+EfWDbHRPD69F5qevB/BEGcpYa00mjuBpI76b9RQmuYsqYZQEEUweajR4dnlmComJj1N0qJkpMXRE/skrVpSgPjA8vEMCfheAxpkJk8RC8ccRL8ON6w5+hMdki4uVQKvI1ATHxQO1ykvMe6tQ1M9XDK/bKZCOTUy1qkJE6d7u2rSmWjDTu2kUkCbw4GCsStrqF5Yqaq8F7NjADTSZNkhqTuKAVJg1idXxhUKLCXx5mbAR16FSVeUO1ecagwXk6sQ8I9j1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB4058.eurprd04.prod.outlook.com (2603:10a6:5:1b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Tue, 18 Aug
 2020 07:28:32 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 07:28:32 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 2/4] hypervisor: gic-v3: solve incompatibility problems in gic_v3_init()
Date: Wed, 19 Aug 2020 22:28:05 +0800
Message-Id: <20200819142807.20972-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819142807.20972-1-alice.guo@nxp.com>
References: <20200819142807.20972-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:3:2::24) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:3:2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.16 via Frontend Transport; Tue, 18 Aug 2020 07:28:30 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7714de4-83bb-43bd-181a-08d843484f67
X-MS-TrafficTypeDiagnostic: DB7PR04MB4058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4058FDE8C5628F21D9D2E3C0E25C0@DB7PR04MB4058.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BKKl/mjFD9UYZT96i2jx5X55Yt+app1mQeYRIY1lOfvIXmMxtOa6lLp3XONjZYXTXJJkkzzKV23hsLN0V6iszQwZ4PDlf1a98xfvzFB+W1s4pwzhpfabEln5n+6UBn3pC9YbsZfQ3oj32H/iuNasVJPF9uVfkUDep+EU4fzoJLja4Kpz4VzYWSrxAd1lweZ0tmQvD49bV3fCT6VL1F1b8/y9/QwWIA3g+Y7rUPCAerKFqCIKDh29C66RWChQWMWJVa13dNsy7Uw+nI5k6R8GJRPysKGqT7xXf31ALf6BLrvR2LZhpNr5p22/vqYHLYXQ7yO+6EbW219N7r68hKACnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(83380400001)(52116002)(36756003)(86362001)(956004)(2616005)(44832011)(6512007)(1076003)(316002)(8676002)(4326008)(66556008)(186003)(66476007)(5660300002)(6506007)(16526019)(2906002)(66946007)(6486002)(8936002)(26005)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XbsrnamC33IvqTAhmIK1Vq+JiLNm/I4gkGT4kWP2UHTLK8U4TgS02Pnhlk7f67BsFoPWqbO+Qpa6JPyH97VIHpaHr8pi8pPuJVMyLx+N8TGJHlX8oxTxM6+HJvZo3A1QFwgjIY6Tz9VKYAPKkfqTpsZYG42ePJzS2nh9UBeMTYHfBmPApsXQYFlUFZbuBX8r7Y6c0tSLiIOX/aQbmskleqMo6koYJ7t3geGd3qg2ECPFOXxNFAY7FtYBnL9BZ+LQOZnPVtB6garultF1Jxy4UJPHAzq5i/ijHFnvjdijSKrYUUEUqPFMaoLzAO9oek4vC41gZMth5IPkY8iYLZu/4JDsFnVOgftRDxCJ7+uIrCabYekWAgq4RjW/LJzGsimhAHoNuGb34rkUojGCX9Q+8feqV24W6KlcXppx2jZ46yPSHaVlxKCTkVxRIJT2XIEYvuNd50bb8aDEUzaHR/otVFFLlmAYhaoWxHa3AYWIJc7nWzYl/lx2xFi1drL9Z1RGoFZLS4swuJw1Y0d4YLHxPNOPwi/rJZ8XLI02bw0ZKMG9ECKC9naedtMtVDfFTnZOzsIyQFMoMqocthF9LrMaNQVUdHE1cIw3FoFlRrTVERELu+xkomKaYdgA8pRsTLgXlQaN8hPRUVXeVKwLUIzxug==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7714de4-83bb-43bd-181a-08d843484f67
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 07:28:32.5700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZBl4Y2lpFmqWtPQKNZTDqWPtfiQpFTpCiBbxJjnafma3OTMWhij3tr0x7rU9aQM5k2b9TieFDd8APh9UOuUuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4058
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Cf+ARjkR;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.7.73 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

In gicv3_cpu_init(),32-bit guests use mmio_read32() to read 64-bit
GICR_ TYPER in twice. Using mmio_read32() causes the execution of
arch_handle_dabt(), which finally calls gicv3_handle_redist_access().
Reading the higher 32 bits of GICR_TYPER uses
mmio_read32(redist_addr + GICR_TYPER + 4), so add a processing case
"GICR_TYPER + 4" in gicv3_handle_redist_access().

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm-common/gic-v3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 6a1d90f8..584c2c79 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -351,6 +351,9 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
 		if (cpu_public->cpu_id == last_gicr)
 				mmio->value |= GICR_TYPER_Last;
 		return MMIO_HANDLED;
+	case GICR_TYPER + 4:
+		mmio_perform_access(cpu_public->gicr.base, mmio);
+		return MMIO_HANDLED;
 	case GICR_IIDR:
 	case 0xffd0 ... 0xfffc: /* ID registers */
 		/*
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200819142807.20972-2-alice.guo%40nxp.com.
