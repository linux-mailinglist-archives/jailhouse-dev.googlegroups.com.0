Return-Path: <jailhouse-dev+bncBAABBDX2Y77AKGQENOTOSSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1692D5886
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 11:48:47 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id b8sf1778150wrv.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 02:48:47 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607597326; cv=pass;
        d=google.com; s=arc-20160816;
        b=afyTaIlqBrcRwpd/Wkxo8sr79PtNrZ8vZnYDOe93uq5pkIQH8Wy95I6vxCkywUjxzy
         48eOryU3e93i5/blE3ydNeEwPWGG8MFMi6awViLznFGRdXGHP2m3YML1vdP9DX2ClQE+
         UWqGeEsIRjKaNfWQkmqI878Axr0tH3glfO+xjyxDgAh6gQqbkv1NcewmFoIyiLW/RdCi
         Txi0vZYiGXL47Q3c7Id3DOPNA+b+y2Lq5Y57GZjR80CCeiiTJagDJ0NTtryCewGDLkA5
         xIa5VmG4c/GD4ireW2pSUYSxfRDEnWY6ZuQxOacouNtn3TREOWflR2hOgKkhpPybYTOU
         sQLA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=K0/aQ8f0SB/cc9A3TzqkZlPUBZIQaUKOOQqL3s4bne8=;
        b=QY5PFZ6ezgEF/VmkKd91mzhMzwPoKx+WqX/I/68PRJWH/qw/PGH1bTj7tED2WUSsQz
         iHJ//yxqF1VZsYFjbnbLPknZS34bxD0jVRf75KBcP9MVo1vZKuK2B57GFluizGWz3kH9
         KCwcfg/PcNm/2bz926q2HE/R95qdnTKMRD/fI9nGBR8fADbebKBL4U14XH7Z5a40E5u7
         6TM89efyGly6makzJq0UlgeBw3u6DAzk1+gGBvdsu+UOgHx8KfllsMHQ+zerCz2ObbX9
         uyojS+Rm/kFyjJWMZHrnl0Ty/O2vhhdO25upBACabGDYInzkQsKGEBFZ9v0rRcmwhFrh
         vmcg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="T+n/ZKOD";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.21.68 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=K0/aQ8f0SB/cc9A3TzqkZlPUBZIQaUKOOQqL3s4bne8=;
        b=Qm/QenCQSv2eQo/XoydNQAGOGuarVkUBOqmts2tgxlZgClkPg7m0+7T2P24vYJ+Ue2
         qQxSppHCGGxlr+CEYPqgvQqbCcGco6mIawvzWQUOsie4T7cfMFcY1IA9Tkiqe2SoulSY
         xVcO7O+D6rJpAmHHDiBxS6dPIuZM3DPxft9WIK6Tqy3HJCRVhMt55OAPat4+Nvn6qXMe
         Jwc30lzZkABnxmRcT092WszH3QGpSwrCncMfEia6A4zRPIhcZ/jCmD41AWoXJP++d56c
         FU+Mr0MwXHhFVqywDo3oYVjW2H+8D+FRHiWKlgRXb0A8NkpRxQNFqQJWxx5s+aSSGzas
         uKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=K0/aQ8f0SB/cc9A3TzqkZlPUBZIQaUKOOQqL3s4bne8=;
        b=h43xpzQssEQSY74h5OfnpxDWvRT91qp1ko8YQ6/aFKmDtc419BUwd4EySf4cmTuycK
         LEnq4gKCLUf6LP+npuSXX31lMNA8gylwczRk/Ep7IkwfoHM55bjRBG7oKJ31f5QOQPx+
         PcSQsWFlbhus6/Rmy2a6Yb6zP62aVvr607M7ZUZ6PkJCC1DC3A/xW2HE9Ge8aiSlqKU7
         f6TFua/+7kOnHq8Gad3AB19yYObZa5Bl0QdtNxVU0gNgVY+vtSJE+5BrPYUyAJmJhSn3
         s0Nzm+CWCFAKM8Hh9kwvYqkXesDajnMyIJViIUrcoIpsNIBTEKw0YUxOwtvqLtyZdCwg
         4X1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531vNBiOn9F9FyH3v1E3aQY744vlygmORs8qv2NCOCLf2HQoDldk
	hY4dGf5iya0Yceg1RCVYmQY=
X-Google-Smtp-Source: ABdhPJz4nexMXSBWZfUAOzZUbrcJ1kzOf7cHE9VoJc6XRppyMbH4pBrYKe+kZwX0g5v+UhoA9nnGag==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr7764495wrs.390.1607597326857;
        Thu, 10 Dec 2020 02:48:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b688:: with SMTP id g130ls2702428wmf.3.canary-gmail;
 Thu, 10 Dec 2020 02:48:46 -0800 (PST)
X-Received: by 2002:a1c:810c:: with SMTP id c12mr7566424wmd.96.1607597326045;
        Thu, 10 Dec 2020 02:48:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607597326; cv=pass;
        d=google.com; s=arc-20160816;
        b=fdUc4aTAo1Va76MqhJxogyAWPm2ya/9TNEDa9BogZJeqdqWqPKYGnxX+GLKMzg5T3f
         gJ5JWo5M8zObkJV1LahDAJQ8ZyXKVh7C9DKyh0HvX4N7Ktp4YynTz+jczmjLZ63EUUUg
         orz48EYz63HoZi4Ijy1i0cSLKJhIGhUv8ml7krUi8o1uYxRhNcy/BcryrA5nSYtqNiyW
         kNMwNnx0Ei85fHpGEQGnRM6guDAlDDCO6Zl+G1wMpE6yhJyucvuFhWpWPsiyG2d7t+Fs
         TYHnA4ggzfRnkZy7FpQaez6Ng3ZOD1rZvehBLGFwr/4lJznxCjxeB1pegKSPqfK1+PXz
         7jYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=prA1DvjNnYpi5AJZZHTpsD9V0pP78JgmA0KXBdZXySU=;
        b=Zq1rbGW6zzK3AgodFO6EYIwZbp0I7dEFedyKZ/xSqvM6vUFdKYBqSfoll3OIWqIteE
         /3ExVg3dkeTaWarsMn/3RaJtXzqywYxnlWUbUVqyl6S9LQV3F/BgDYK3e3+92I2AIJ3A
         swSdXUzGD4w7BhDMln9AkcxFTXXRtix8vVRkF0IWaphER24BKzTmpweymG/NSMKYuVYg
         YdkfZfjgmxbQI9uc1HLiPax3WKcaopl5G8noHoF84oy9w5xyBCIm03uRTBQo6kERXZeu
         HbppfT/lBbZ14dmU/YDQf+5Tmvf9UXbWFBoD/bHr/zZw+lLthMMgVSO9BK+0a8cZpCwD
         h4NA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="T+n/ZKOD";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.21.68 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2068.outbound.protection.outlook.com. [40.107.21.68])
        by gmr-mx.google.com with ESMTPS id x12si204581wmk.1.2020.12.10.02.48.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 02:48:46 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.21.68 as permitted sender) client-ip=40.107.21.68;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csXtPSOWamZeGOVicJjwIlnpQBEGUkDupdnafGMpTrAFK0IWJwdovyxVK0SMoZxFPVP1dPcvsJIyILHW+RbjV6PZTkYFxcLzi5dbPHXHyWdxYlnRoXQfRCLThwk9sQgBz5st4XJEGkd/eYPLoRrmzSNoM3xW2Qe/6assxCzumQIGYNIBtJ6Vr7JwYVDuIN4h11304FpkRXEF/bKKEgut7HPeXk4xGaQ95eI2EWxkpjndJrV6pIqQ1hG7zJeWaFDXQunPvXAY9BsQkPlDHzuBIYJ5yUzjgytoOM/jPo6G61JNH4vPcxbDbaf567pjYupsSqtWkN/xFvcv72dKDZA9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prA1DvjNnYpi5AJZZHTpsD9V0pP78JgmA0KXBdZXySU=;
 b=Lppdek2hrEVlnNtmRaOmGm3ZUjnIw7dtmhe2wO/0245qglTfoRe+FPo88m5eGhUsSqXgyENV8q+CMAwUzgsnYPcPS8+tRxI3BDW//C28xBEBBbEU4HLPKNe+z/Nm4fGZcrzQe3BbfMJiC1mz97KQisvQjw2YmOkh04xt7fTQcKjIG2c0salCaIa1eHAoBaDExbjGuYyf3qbAL67Pzzf1A5oX9OrjtYhi48WbpRgC+gGCDI1OgB0qSmvtxV3v+znMEreik58U30sYOH+H4SbrAeCKrFVVj2vG75qXa1TiYjV9IyyMhEMaJLZdddzxcG96rXZXsnA4padyngnubRnYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR0402MB3664.eurprd04.prod.outlook.com (2603:10a6:803:1e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 10:48:44 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 10:48:44 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v1 2/2] configs: ls1043a-rdb: Add linux inmate dts demo
Date: Thu, 10 Dec 2020 18:51:28 +0800
Message-Id: <20201210105128.25554-3-hongbo.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210105128.25554-1-hongbo.wang@nxp.com>
References: <20201210105128.25554-1-hongbo.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR01CA0098.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::24) To VI1PR04MB5677.eurprd04.prod.outlook.com
 (2603:10a6:803:ed::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR01CA0098.apcprd01.prod.exchangelabs.com (2603:1096:3:15::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 10:48:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b49689cc-b8c8-4bac-5164-08d89cf92a79
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3664:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3664802C76540E59FD782937E1CB0@VI1PR0402MB3664.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TdYf7+WQkpvukZ6IeQlIR/HxuBea267z16IWtzDkE3pMRPw45EPCKeaHVOHiJmE92w5zFrVrCMl7d0IzAAAsyZEnPaeNlBTyFentoeVCxUQGKd4fXL1UOZWBoZUPd713A/dhlTEHrAVxJlvDNoqNwUKFSupnF8T66y0vyW5CMrwM/TfdjEladC9piapUNjAU3zwVa8S3qA9eaZY8fr5bgmiPy5lfLQv+pW1DNf4/YKDvvY3m0QnagnasMkCnWFvOpT1cGqRAOZjlTPNJF22S3jPpGCZuf/WRMF/vRNPuQgde0mbcXerwNzqlLtiKt2Ot
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(6486002)(2906002)(956004)(6666004)(2616005)(86362001)(66556008)(66946007)(66476007)(5660300002)(478600001)(8676002)(8936002)(6506007)(316002)(9686003)(26005)(16526019)(186003)(6512007)(36756003)(1076003)(83380400001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?m8Fqu0ZmgorUgqzdKjf3l31ROagJwMxWaI0BzlKxoL9uddewGMKXXT4jASvK?=
 =?us-ascii?Q?hSKrlCxR9CjPavz+D8bXF9XyIz9ucHZAFjtXREPAY6GCTEJKmHnOXhw1VC5m?=
 =?us-ascii?Q?6RHpWyoEcVq45Bnd99zrVSLI5moQhMEnjoifd8oRzvcFIvllrDLVg0ojto7e?=
 =?us-ascii?Q?5Pu8ABtJdZP3I05b9lD8H1qJvwBT9TtZGpjY396PYpQSF5FPT8Vf3gpma5XW?=
 =?us-ascii?Q?Tz5+uXdQ6BWUvqWYZTB9bYWVsE3+UPe1YmbTyPByoXMkNXgLnrapRXxsF6B5?=
 =?us-ascii?Q?diZdkWDkLHjq2WW7qJ1dnGr3+j3UYQx6+qPqpAuHvFr/jPw09Vgf5bR8x5oA?=
 =?us-ascii?Q?t1fDranTyRH9wJqWASTZJe/efFjLx4fz6EACtm0BORm+U/OJsbLCXX4GxMlU?=
 =?us-ascii?Q?p40DPXLenEbBKYzA0fL8JChwJK/nNpGGVc6H2BwvkLf/f6oYImVOgNNMOTe0?=
 =?us-ascii?Q?wdpYSXX31+Sgq1D8IDE2zNFjB5MC9ggFNFOZlHI1fV2UFlK4gSIoaKeZ8/kH?=
 =?us-ascii?Q?cw3kSOOLXEAIM9vDLZO6TN3rET9rXkoYZqtHhe5EUTusf6wdSGxvwEjfIThX?=
 =?us-ascii?Q?75iinhq16FI0F8Zs5VY98Iv5UxwNIVesCrEeOOJQYAK/ZD+Vg/Imzwxo6jMe?=
 =?us-ascii?Q?FmZrBHhzJCkW7Wwj7hasvNISgU0CEPsL6azKiGB2bVKEV6QebmxwAj0cM5AR?=
 =?us-ascii?Q?tVsVH1bd2zKLtpMk/F/PsqjVyA+WyHtQOvguqdQdlvY+XPmfpB7HK3RzaIuM?=
 =?us-ascii?Q?h2JfOnKGVfPrAdc7l7v+PeuIRXyHWxY+wd4p9dJVucj2u5epclCFC+7Rl2rM?=
 =?us-ascii?Q?3TUt08wsaIZJ4bdhiTQ9Znm/hZVtg035XFdE0XNmQND3FoTvZAORa1raIgbZ?=
 =?us-ascii?Q?doeIdIkf/BcB2RIRr94o6kadTB+Lty0c4/4lPW5yl5EdZkJ0Cyt/kYaz4r2K?=
 =?us-ascii?Q?OLUe3/tEguvuYaQOhRQTulX1FEBt0OGoIqTd/LWFpmayFWIVWG2Qcno8BTZs?=
 =?us-ascii?Q?LS10?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 10:48:44.4969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b49689cc-b8c8-4bac-5164-08d89cf92a79
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nb+0BcE9yk0Gqbug/Lg5hHQWvIFflY35/MrTcrZXmWAnJtlUybf3JtiiukJvtaEzgHUNmu0e2tAP5mXKSIBJJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3664
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="T+n/ZKOD";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.21.68 as permitted sender)
 smtp.mailfrom=hongbo.wang@nxp.com;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

From: "hongbo.wang" <hongbo.wang@nxp.com>

Add device tree demo for running Linux as an inmate on
NXP ls1043a RDB board.

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
---
 configs/arm64/dts/inmate-ls1043a-rdb.dts | 176 +++++++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb.dts

diff --git a/configs/arm64/dts/inmate-ls1043a-rdb.dts b/configs/arm64/dts/inmate-ls1043a-rdb.dts
new file mode 100644
index 00000000..c01822b1
--- /dev/null
+++ b/configs/arm64/dts/inmate-ls1043a-rdb.dts
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree for inmate cell on NXP ls1043a RDB platform
+ *
+ * Copyright 2020 NXP
+ *
+ *  hongbo.wang <hongbo.wang@nxp.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "Jailhouse cell on NXP LS1043ARDB";
+
+	compatible = "fsl,ls1043a-rdb", "fsl,ls1043a";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	hypervisor {
+		compatible = "jailhouse,cell";
+	};
+
+	aliases {
+		serial0 = &duart1;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+			cpu-idle-states = <&CPU_PH20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+			cpu-idle-states = <&CPU_PH20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+		};
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	idle-states {
+		entry-method = "psci";
+
+		CPU_PH20: cpu-ph20 {
+			compatible = "arm,idle-state";
+			idle-state-name = "PH20";
+			arm,psci-suspend-param = <0x0>;
+			entry-latency-us = <1000>;
+			exit-latency-us = <1000>;
+			min-residency-us = <3000>;
+		};
+	};
+
+	sysclk: sysclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "sysclk";
+	};
+
+	reboot {
+		compatible ="syscon-reboot";
+		regmap = <&dcfg>;
+		offset = <0xb0>;
+		mask = <0x02>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 13 0xf08>, /* Physical Secure PPI */
+			     <1 14 0xf08>, /* Physical Non-Secure PPI */
+			     <1 11 0xf08>, /* Virtual PPI */
+			     <1 10 0xf08>; /* Hypervisor PPI */
+	};
+
+	gic: interrupt-controller@1400000 {
+		compatible = "arm,gic-400";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x1401000 0 0x1000>, /* GICD */
+		      <0x0 0x1402000 0 0x2000>, /* GICC */
+		      <0x0 0x1404000 0 0x2000>, /* GICH */
+		      <0x0 0x1406000 0 0x2000>; /* GICV */
+		interrupts = <1 9 0xf08>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
+		dma-coherent;
+
+
+		ddr: memory-controller@1080000 {
+			compatible = "fsl,qoriq-memory-controller";
+			reg = <0x0 0x1080000 0x0 0x1000>;
+			interrupts = <0 144 0x4>;
+			big-endian;
+		};
+
+		scfg: scfg@1570000 {
+			compatible = "fsl,ls1043a-scfg", "syscon";
+			reg = <0x0 0x1570000 0x0 0x10000>;
+			big-endian;
+		};
+
+		dcfg: dcfg@1ee0000 {
+			compatible = "fsl,ls1043a-dcfg", "syscon";
+			reg = <0x0 0x1ee0000 0x0 0x1000>;
+			big-endian;
+		};
+
+		clockgen: clocking@1ee1000 {
+			compatible = "fsl,ls1043a-clockgen";
+			reg = <0x0 0x1ee1000 0x0 0x1000>;
+			#clock-cells = <2>;
+			clocks = <&sysclk>;
+		};
+
+		duart1: serial@21c0600 {
+			compatible = "fsl,ns16550", "ns16550a";
+			reg = <0x00 0x21c0600 0x0 0x100>;
+			clocks = <&clockgen 4 0>;
+			status = "okay";
+		};
+
+	};
+
+	pci@f2500000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 28 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 2 &gic GIC_SPI 29 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 3 &gic GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 4 &gic GIC_SPI 31 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xf2500000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201210105128.25554-3-hongbo.wang%40nxp.com.
