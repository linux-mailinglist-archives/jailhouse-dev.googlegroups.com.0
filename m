Return-Path: <jailhouse-dev+bncBDEN32754MOBB5NBRH3AKGQE2MRZ47I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 4606C1D7382
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 11:10:14 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id 30sf5360928wrq.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 02:10:14 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1589793014; cv=pass;
        d=google.com; s=arc-20160816;
        b=rGUNUn4RA2rElYnspUY28pAeUusp9E6VEge6oow960ec+K2rpuYscICbQBk5GHk+AG
         1VroytMfgSvDn0tTSWyh+Y+WPbXfdavZJCi8vHsb30vLjVtFgMeKcp+Lk61bowfUMQlI
         LdcR/Lgg+4EiaZ5PnQwP7w67/ZVx8itl5xqAUGcJfSOXZI3Zux10FrP5sLBWu3+9vgo1
         HK7fZfqjidMdva7Ck2Whpr/tQRQ5b/fRpPf7ZZMeiHPlwJabtQd8aFgI9AIPI7+N2/BY
         cgM/1hC02GOJVqUYC9DEKhhxvrPCBoSNkxlKgpoL+lIDpB67JfPrB93Zd8DyfAML26u7
         LqAg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=lJ5QMI7GAUVZQKadTHMDdH/ih8PutKsKQEVDE7ZsTuA=;
        b=tuqbue/3OvSm+BSoFrsZufVIzfDQuRe1Ggc+4i3mBCW26umiQy6nXm5VAj3AFNnakf
         Y7qBz8Cn4nLIE5tGPK8Q2jubmyrGeceKFDeWs79GQ4Mvqor3Ffq4Bi7tHws0+RQEkHN9
         DiH3nYfSFMJp5NxWT3O/SqEMZXmP85kccV8hiks+o3Tt2Vamcc7P9EwQuVpz4izLzCaE
         MDReQQC2Fv4P3POW63zzekamot1CwctHMoK4Xr8eXY6XNB2Jfj9C3YM2zNBJkDMDu5GC
         thFsuwZXCB2h5ilFvlfPZPYo/RRFlgspTrC8/3KG4/38K3V+YwN38AUPSjwKlERKIgE+
         Rz0w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Q8bI0+ua;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.74 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lJ5QMI7GAUVZQKadTHMDdH/ih8PutKsKQEVDE7ZsTuA=;
        b=CPjhjj2r/I53u8P3pqdOvwGplJUyjv38ACXy1T9aBEmkKUc3PP4/vPmrI1nR0EOGgj
         oOADXaRqpri3EVcPDMvagnbZV0hsISCoVJ7nEMszW3+UfQSQUd4FRDTnkGywvpnlL0qd
         ifkGuBMMHA4E4awo638oOq+PbDL8nUz181qyfombR7drJDYTmjAab9AakE2wizU6jGu6
         uk6lkWteCnpuPDxl2qv2Vxj9iOuexkRt6G+zoehiY8h+Bh6t3a9WuV3fc3GVnV2h/e0W
         vlv+ITYw1nT2idEgwFF0rKLfQZEBKPIHBw72tSJ9psCGd/H21O49p6tLbgHHt/vyJLve
         h0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lJ5QMI7GAUVZQKadTHMDdH/ih8PutKsKQEVDE7ZsTuA=;
        b=o/lvhS/FGtZbd32EY0J9m0v7UDBVS+3Y6eUyHdzA3tcp+7zdvDB63JJkqYDmTmyDFv
         +BHxp9yE8+9v7UIhcMSr3P6uv2BV0fw6iZlTMISZ7KWn+efhexXgcH7w5BswTXGanXu+
         GaAmomD57Bd6XmUEbYhDWV8x3ZG0rFbyxo4J010Kz3fWGHt4gm+xfW/hpMYPwEyunyJj
         ltLc+pZotL3xlTNurhChBiyBG2znYAE2LGR2ES9gQ40AbexWlOGM/vM+Dk11182YT6Zz
         vZPOnjh3UkWGQtxRu/EP26oTvdNe52hbp/mSQ59thz5WTbpffGlFyhG4QVSjSM+FbZik
         J3mQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530bw03zohtD4lwt9/yuKKq0l+nOzHyvYbW1CjCR9eQF8bZ930li
	vV1Ov1xLBLhDUyIeP8slaW0=
X-Google-Smtp-Source: ABdhPJyTioJ5NXd7r67GrafjQqdwCe4Nr2NtNNzxt92VAABOZksgT6esRUoXYk4UtscMPu7Gd3FE+w==
X-Received: by 2002:adf:afe9:: with SMTP id y41mr20180463wrd.56.1589793013928;
        Mon, 18 May 2020 02:10:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fac9:: with SMTP id a9ls3855309wrs.2.gmail; Mon, 18 May
 2020 02:10:13 -0700 (PDT)
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr19870055wro.201.1589793013244;
        Mon, 18 May 2020 02:10:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589793013; cv=pass;
        d=google.com; s=arc-20160816;
        b=KPm8CDRtjAhqv4+OfeRjGToutd+RAfl0/kmKggCphXnLm3vg7YoZJh/VKh7FfVC6Hg
         0mUSFOlmjfVmfrnl4Y/KdGbLl+IIaiYI9fAueP07ZH6OaSzW7tA/Y/MurOg4ktUmIPVK
         1ZAW+zI+c800Eem1IS8WlmDxTwmdieds94HnRAVFTVC3xMrGfQDUA/2sOBteVOGIrL0y
         NQQjDfDoXkexqa3OG0FlpacPFhZR5fG/y93E1qqL7bfFXGpiUDzZ8gifwqIHvx9lSRCx
         Z+CZ3hZsIFg6vTh2eGaI8exgrWignYdBdskbJEEFz54uqmEUnXBbG3sQG3ARqHvQrqA9
         pFUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gWibqmiVP8p1Q8HUwKznMHyHZxk4mph9pq+0bzblOhA=;
        b=hhLlIdG4JklqI3b5zpXZjMHmk1qAS3/fO+V6GhqsE1gXGORozpTCrhCrwC5jnZ6q2z
         rhrJENSRdd/6KmYiRnvktdEuq6uf5QrcdxnORj03Q1brXLBlRavGPcuP8O8LYQTSEW6i
         XHoRF10wqr04HIS83NvSgHJuqDBdaj2iY8HqvClxUkAFOFmQmNAe4IAwREs5XFeTBSvO
         l0B+TNWRrOXhtNhVy9cHg9E4cCOrlPBKWz6qp7smdy0ndzeddiDWMQRSpsxgIRqzLlI5
         NDH+rS2hdAU1aghDj3JL5hWHbsh7bJH6NkZxSH/sLCb4j7jNFL48X6VAfJmfT+p2NgpS
         HH8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Q8bI0+ua;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.74 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50074.outbound.protection.outlook.com. [40.107.5.74])
        by gmr-mx.google.com with ESMTPS id r3si220854wmg.1.2020.05.18.02.10.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2020 02:10:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.74 as permitted sender) client-ip=40.107.5.74;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW6r0G1251CetUQFpda8HWW/zAcDdRLpj0kSo+UaAIXJeRxl5g0SadzwFukr/N/lq04LtQF8TtFRf4EiYh5LLwEWCmU3U1YulpNgWycZpnKlX62Or8ebxPzvyAbxGZK5vFKwq3tHaSqcW8L5Xo/Vmr5Us9cLgqdittEPtLEScak2hInRcO/Wm+lcveTNVZSy9ZYgb3ZYklW1oueSeNCm6pLV+OR+BUJkyne0CwpEv+NIPMuJgdiBrIp+y/QS4WhevjEWtZsTWOfBWBdTO1PNCbV2Odo1nlgCkfO05klWFQJqzKmfX50Ua5iCFyhlzUehLHl11XWPq1ay6R8aHYl+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWibqmiVP8p1Q8HUwKznMHyHZxk4mph9pq+0bzblOhA=;
 b=ei5LUzleDV6lTU3BiIdrFY84C8dLCxd2qBb0EQs0TQnCnO4/7W112ofqgX64CSzN6pTt3enFUQXQBjPpHcdygTbDQsny53ID1xCrMo/yRcA7sAvciEvbPpMQ+MJWXDwA3fHRq6xE9gkc/0jGAjj/RHBSNZ3tMLK0LoJra/ZjJvBEN5EjmKnba2G7eZ/kzmKXtxFGSsPICXIXftHE4GDYrSavJPmYXt+aWL8x0HR5lIjB78R9h3IUM0vSdtcwOETsK1HQDSmiiW9RYxsMGNX49061as6ZuRgcWs9ccWTwWOwXELZObWRzepd2pZSHEj1AKr5LUTRimSkZRacLDf0M2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB6634.eurprd04.prod.outlook.com (2603:10a6:10:10e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Mon, 18 May
 2020 09:10:11 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::780f:6f6c:db24:2418]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::780f:6f6c:db24:2418%8]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 09:10:11 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1 2/2] arm64: imx8qxp-mek support
Date: Wed, 20 May 2020 00:10:14 +0800
Message-Id: <20200519161014.20147-2-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519161014.20147-1-alice.guo@nxp.com>
References: <20200519161014.20147-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0100.apcprd02.prod.outlook.com
 (2603:1096:4:92::16) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR02CA0100.apcprd02.prod.outlook.com (2603:1096:4:92::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend Transport; Mon, 18 May 2020 09:10:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0b9cbd0-a631-4b70-b18f-08d7fb0b44eb
X-MS-TrafficTypeDiagnostic: DB8PR04MB6634:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB66343859851293945EEC7EDEE2B80@DB8PR04MB6634.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Y8Xtcv9fjf6Luefw9yhppUC2H/YUu4KcVLcZaQZ82WKGzn0dwgu0CzfgQvoadLgeMAVkQDJXuo+iE35GKgESJFSv7IPHyh1CIXrzt1gZ3nOgLMRT5W2FLZq24cu/f+DbbeYoJ/DB1Yc/RHHcw5RjpiczlQUWmd65xIKXL7PnoDD+2JdWNwiTqR/foSmaAZQomcVXuUvZdFAmD0HF7XGX5Qnv5fFwbbGbcqfwUmLZZsdejICzlSvPHkpSThkry6ksbIxpaDw6FP57NuGDzeRxq2/MIO6x14prVi4tAE8Wqh/ZuyKcCEiPtJ0gjyOU0tPEEtGcWV9SP0AGD7M95VXcTQ5iOaMnwed4brWB9EbtOv1rmFTvyRKLTd45Xonirqf9oq07VOzmRRa32Co6DNOh8X9lHHUGGvErbrQcF4y/VuGhIdpFWz2GO+4ob54IKzvcZhqmPb1VuYgcrBj4QrrnEO7Ijq4ATPwa0mcKXWF0Q0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(8676002)(478600001)(2906002)(6486002)(956004)(30864003)(36756003)(44832011)(2616005)(8936002)(6506007)(16526019)(6916009)(66476007)(26005)(4326008)(5660300002)(66556008)(66946007)(6512007)(52116002)(1076003)(86362001)(186003)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: TYukWGzXPh8oYzMllLC0zLo3rH3X8vs+6ez3GC1kAQu0Ohe6BQQlOGRO1FP8LHmNfpJySb/05UgGHA5/GXM4+DAzwbk9fiB/JNvNFmM1kK5Vl1JsSCmMYM1P5CGGx+6pzmPnLO3klE4IzRbfvCHDvOXpo0j1H9U4x4lGuO/tMKID4tC1Dn/gbwqY9pR2OwaTma6X/Cg17HhI2hTkxwP++CQy6z2oAEWwr/gHgtPigAhdirDMO5PBMJoKnVwEL5KY9mIwr4/rd60KTPt0Q8PYGui4kzmzroEPi3QGdg6wAUo9h8BDlIeNX6Onwd89kHFEwrTChcBFX/vFR1O2l3RHx2+bZ3N0AauhuBnCOHOHkLL1YffjJxom60/TB9Ic6zhGw3i0AqhbsTrsHu7hyOX8yTON2+x5+xUNtC8/r+rkPvP99w7i8zyGSDCb1eUcBDEii+Z7VqisQ56fQT9On2RSKbIJq7vzA10wTirwrsHrVzY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b9cbd0-a631-4b70-b18f-08d7fb0b44eb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 09:10:11.8451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxAJcpbqqS3te5Weol4698WwzobK89p+6zBOodNrvMCnnNmHJEp0KXNUXgJBpi1HctalPOybQcUnBqrbsdkaEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6634
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Q8bI0+ua;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.5.74 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

From: Peng Fan <peng.fan@nxp.com>

Dual linux command as below:

jailhouse cell linux imx8qxp-linux-demo.cell Image -d
imx8qxp-mek-inmate.dtb -c "clk_ignore_unused console=ttyLP2,115200
earlycon=lpuart32,mmio32,0x5a060010,115200 cma=32MB
root=/dev/mmcblk0p2 rootwait rw"

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8qxp-inmate-demo.c | 125 ++++++++++++++++++
 configs/arm64/imx8qxp-linux-demo.c  | 193 +++++++++++++++++++++++++++
 configs/arm64/imx8qxp.c             | 194 ++++++++++++++++++++++++++++
 3 files changed, 512 insertions(+)
 create mode 100644 configs/arm64/imx8qxp-inmate-demo.c
 create mode 100644 configs/arm64/imx8qxp-linux-demo.c
 create mode 100644 configs/arm64/imx8qxp.c

diff --git a/configs/arm64/imx8qxp-inmate-demo.c b/configs/arm64/imx8qxp-inmate-demo.c
new file mode 100644
index 00000000..718235f1
--- /dev/null
+++ b/configs/arm64/imx8qxp-inmate-demo.c
@@ -0,0 +1,125 @@
+/*
+ * iMX8QXP target - ivshmem-demo
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
+		/* IVSHMEM shared memory regions (demo) */
+		{
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
+		/* RAM: from Inmate memory of imx8qxp.c */ {
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
+		{
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
diff --git a/configs/arm64/imx8qxp-linux-demo.c b/configs/arm64/imx8qxp-linux-demo.c
new file mode 100644
index 00000000..53389f0f
--- /dev/null
+++ b/configs/arm64/imx8qxp-linux-demo.c
@@ -0,0 +1,193 @@
+/*
+ * iMX8QXP target - linux-demo
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
+		.vpci_irq_base = 90, /* Not include 32 base */
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
+		/* RAM: Top at 4GB Space */ {
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
+			.pin_base = 96,
+			.pin_bitmap = {
+				0xf << (90 + 32 - 96)
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
+		/* uart2 */ {
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
+};
diff --git a/configs/arm64/imx8qxp.c b/configs/arm64/imx8qxp.c
new file mode 100644
index 00000000..35f66e62
--- /dev/null
+++ b/configs/arm64/imx8qxp.c
@@ -0,0 +1,194 @@
+/*
+ * i.MX8QXP Target
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
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
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
+			.pci_mmconfig_base = 0xfd700000,
+			.pci_mmconfig_end_bus = 0x0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
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
+			.name = "imx8qxp",
+
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			/*
+			 * 118/119 is not used by others, vpci_irq_base not
+			 * include base 32
+			 */
+			.vpci_irq_base = 86,
+		},
+	},
+
+	.cpus = {
+		0xf,
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
+		/* Inmate memory */{
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
+			.size = 0x40000000,
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
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200519161014.20147-2-alice.guo%40nxp.com.
