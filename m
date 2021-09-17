Return-Path: <jailhouse-dev+bncBAABBC4QSGFAMGQEZT5XO2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CA440F37F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 09:47:24 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id p3-20020a0565121383b0290384997a48fcsf6048726lfa.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 00:47:24 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1631864843; cv=pass;
        d=google.com; s=arc-20160816;
        b=DoRT1l7Z9ELaeVLZDYjekUH0YuUC4CpCuRtXn5APGAFaXQlMAEElygzOA3279eK1NW
         pjMXaJw6NFiQwL+qQB+lt70ChjFe8GVhvFaSctkXDOh1vau2qsNTZ7YTjkUwzE2EBMgl
         e138wUECU/4GA+HL2BqsPtTTLkwoTfNd+s4qMbmjCo7Qf8a+NhvJ+VRwa4Wv6pVa8of2
         PaAi2DrUEOUwRd0Prw40Xw+mrFa+3jda/85DjrrWY/+HfH00FU7MkuROTV6KMFYWSxKV
         HwID47vn5Qpknj9nJIE6C2Win5c44bv318Fil55kJbMYe4UWZHVtL2a8b6RO4vgr0DsZ
         nSLg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=eNAeOurbkcuGv/7uN42Ega1808RoVSJcNEkH2rnY7kc=;
        b=jPHfpZXpBV8wJAjTL4FyckuxdO9CZnGItEeKCcPLMBvtuR6gY/PSZ+ntf6zgmvXCet
         wGJt07p4e7u8utDmzGmJTvuZQWJvO/+bE9vaYUw8gp5xTN0G09X/CIDQeo8zofu63KZF
         v+/WL6xwyhcPqrIqt5cNodHwuE1GfG7hOClm+6UYdqDhCUKsQnsRu3+Ta15GhLcZ+NUH
         uzjZWiws9G6Nn3WRTZAhyUj7zh5H/penFxdR1PZlBEHgpAGsFli+OMsDY8l4OIw7DP2f
         CGNNymgpIhWvNl4bRZs+roIkFElG77vGXeY+zsNgjdC8aBVSovD57qAZox+UgMzmR76r
         G38g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=eH+VzCFV;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.7.82 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eNAeOurbkcuGv/7uN42Ega1808RoVSJcNEkH2rnY7kc=;
        b=bvVVktn/W7ORSWDwVmama2Q749oxWnr+8AEWaR8pi/6fnfHvnKmotn5cOLLFLaSDFP
         mtJsBQANzqm4QRD2gEApsfkBAa1nkljW624HN6SXIXDJx1XhY6k2imLNGnwoUgHzGcwS
         0k7GjLrtMkrSNGTBaBwoss/iOPCe9JrVrF/2k8tPX6S9Zd6Ri4/f5YN+OahqEMK4Bdej
         vANyBH+0udKnOyZ6q00ytCwiiRqBx6i9m5VjuMpTtMyWwsNtssPNXmlL8//HqIqO4svh
         /4YRxP5YJWVXEEWQKCH4gPyVjpy1utVsGYmbVWYyX33eVeOM357jRu51OZLHO2m8zE1d
         LsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eNAeOurbkcuGv/7uN42Ega1808RoVSJcNEkH2rnY7kc=;
        b=051r0Ts6Fd4mZusLL5llUsc9HM/1+02kE7njM3PINdiTup4A6iNynfBth+F6enZOuW
         Sn1pUpa/4E5UgkTgGVLEWrxHxQJVgRr2AxjKjMQ2r+VjX3SJLCZk9mGiqjhYTzfoPXdT
         n82aktF6ChBL9Woo2jLWQXBbMY/+TOBWrL+bMcrD55DnkKZL8mDJ96JUR8eyVYEY96hL
         YO/a7CdSZT1vP2rlcCk+VbXSBjSQWBHhZSNqDA34AUKVxiMn1dbz2cEMfVc6okKdqe/E
         xW20/NMexC97AAcsjWPi2vghLZ/dPX0ikjkZ/DvvE/DTeJ3Bp8JoUTmCwNFz3mSYEIlj
         xxbw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532+D07HVOGGbjKVD69hVxO5+qKLtMfr+zD127IfCmSndIYLkfhi
	zbv4SmzC3okapY3D4EwkUak=
X-Google-Smtp-Source: ABdhPJw9NKGPkUXFB8FvzHqfdnq6m/UIVoPqCaKChMwRxQsexZ8yPhLFI8HF4UxXEVsXM00+yGQP5g==
X-Received: by 2002:a2e:4951:: with SMTP id b17mr8434092ljd.414.1631864843560;
        Fri, 17 Sep 2021 00:47:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2119:: with SMTP id a25ls1264827ljq.9.gmail; Fri,
 17 Sep 2021 00:47:22 -0700 (PDT)
X-Received: by 2002:a2e:541b:: with SMTP id i27mr442924ljb.510.1631864842605;
        Fri, 17 Sep 2021 00:47:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631864842; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vs6LzSi2eyhF0h6H4Mcp5pVE4DaDLXK0sG7CiEv+PaUYOKc8pSP6oZS2W+Ayqw8uL3
         j08l0GXiG1PVyP+XAvyXkuoj3OYH2lHaECOkuXlbUReGh301JYmvzvruxirUk2Dhsx+u
         6467Wv5egZ02efofs9KD1uvYxflNaFUo/syUwsjY0hc9TDB544/tkqaSyS62d+zMiIua
         W6ggoobyZoEqlbJClBFTHlspVEGpugQmHGKOAme1VKLhSn+NX+3pmf1DwFTZHfi9Bqpw
         48+W+AIfbf8ywJIOkl1U1vVH5fzJeAVEUpE53qtvLYg+TkvpYns5mVoKlGdAoX+s//bM
         pJaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=IHKxDuiI7L0WM8jMmw///OHq4UlU2KkXyuWKUO3AJCg=;
        b=M7MKFoZgXHDz0lDxhGudFiQj5iUXio3lGQLsddZH+jdlTl6sYzfVPYEuJhAca3hhnV
         QFKfJNvqMotCBx/rJH5C4KKP+l3URjA02tsBd4v125PYX8X8zwdP4JWmq1GGeeUBJye6
         H5h27zZlb0jVMvpXZIQHJqVvk8jgLN6l1rDEDTmntFG8s7R9JzokT8XoOogvI/pwyJAO
         ofjlTEzV5K6/ht6+xXOYJ72Nhnecn0+GoKG/wkZY31++XULyJ8A7enkyXRW3kI4g1NyH
         EZRTwDpHQN0xTFi8RgQ968HBg3cDCT8krmiZwoJpv+38VoA9Q1YPn128sj3rARO5bgQ3
         6PKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=eH+VzCFV;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.7.82 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70082.outbound.protection.outlook.com. [40.107.7.82])
        by gmr-mx.google.com with ESMTPS id p14si614546ljj.5.2021.09.17.00.47.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Sep 2021 00:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.7.82 as permitted sender) client-ip=40.107.7.82;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBkS4H7tlaxta8j9XOaNIL+8t+hD0GAy4/uWKJgW7kOBNmtwYM5Z4n49L10OYFge+OeLolb+zrO11DQox904p7mJBMFOMZCB6vuxht2AtY1thG9R3O65EMFkPksz/diQDx/MOt+29DLEbnkaRQs14/kr6ujvbJvR55L8Tj2GJegquizn3RvKiwFaoiedRtrnB6pe8toZV2tPsM5+2PhDsAVmI8q+hxxXfpSTn0aJkKMwVOHokKKCGcx+X+NQV8nXbubiRRwTo4JZ+vz5UsSBrEuqQDQE4cMo/1gLMSYhThwqiKiyNfRhT5F0USuVfa3PmEMgqNXyHFmAGCYfNKtcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IHKxDuiI7L0WM8jMmw///OHq4UlU2KkXyuWKUO3AJCg=;
 b=QUqUogx+238RYhGbMVW+/tZOggQjJMmS3ds5gUnwij+6hohPJfjGHPCrn7KF7n8Hn1SsS+zkZ3CA1StqVG3ojJ2bI9U9EFUc4YMNyzhExXodYNW7Zd5r9d+70kkHvTo/ArcuQHY3C/uGnYMNPK7sDsYiw7/xmcsZVCnvh12djibR+NiNNgCvzgeKDGnyYUnT1Uostmo4DSDBDl34ibn9nvd6WIOzDdczDBVSmHVR2G9kPske0n5f6WQ2G5rwDMnQwitAhH73jU5HQKg5izjVnh6UgCWu7VIDHjq3PYjZw2F9vzfE5TcKiyWfVqilA6QXE+G22F4DM/0bGM5+dfV1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4489.eurprd04.prod.outlook.com (2603:10a6:5:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Fri, 17 Sep
 2021 07:47:20 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.018; Fri, 17 Sep 2021
 07:47:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/2] Makefile/Kbuild: Fix "FORCE prerequisite is missing" warning
Date: Fri, 17 Sep 2021 15:46:29 +0800
Message-Id: <20210917074630.2585329-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0109.apcprd03.prod.outlook.com (2603:1096:4:91::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.9 via Frontend Transport; Fri, 17 Sep 2021 07:47:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b47d094-4eac-4a81-ff56-08d979af60db
X-MS-TrafficTypeDiagnostic: DB7PR04MB4489:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4489BC9C8401DA0C9FEE613EC9DD9@DB7PR04MB4489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:56;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I4Rc8Cr6wuH//eQCQIXIL/A7U/wTvOWxNWS4iJzH74Dk4dCnMtKzu0LSQTHfxQbixyaFEKRXPQ2B4vJo/gXILJ51w0gqxZ4xlntO86NGi3WiT6TmpX8cNdRP80UJ6ee6TC10f7Y0/2lWF2e+CxNMgSpl0aXdZNJHWy595hKelQ+2AjGZkHyShq6E7SZ2QhZooZrO0zyLW0lBeKc2eBmaFAub5w2Xnio9VjgjZ0iXLPBtmblc8m/8T883LGZqItG3gsPpEPjnDjPLR8VPAvfiFyhZsvjOiqNeOlAf20sRhz1V6L8q0YThJXilShIWmTPGm5c28QLAp05dQ2Fz50kUFbUWx32fiLnSG7eUW5m0TLRhQ27McIW86m3C2jzCKe1JW2gkcTCpy1n4AK5oQQF/6rVQ0hGVF+iXMltoRlr6TU2bhgUbjYLGrgw4BqenSBokSZ4OE8300jxm8QY05P1ELaJVyXaAESh+6RvgNe8sXAVf0Hy05EjOfRJIjXCPRTpMjfNXVL3dCl8gJMMsKX1hSzlQ+qnx66P1njdKXXbUeuantB+zktxNWe9fFlmPeSFlK5sDmlvuPYCSpWGzck7U+SP5OjmOSVJnY2RJVubFxb1ri9fumyFse4h/jCjLljzC+LhQBUKO0qWONGfHCsWbHltt9AGyOvoQV/YgpYizvErtxuLqNEw9mU7KZXd0yGNEQ0Y/H6jcaf6HKVGePnxSJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(6506007)(316002)(956004)(6512007)(5660300002)(8676002)(66946007)(8936002)(52116002)(83380400001)(4326008)(6486002)(2616005)(26005)(6666004)(186003)(86362001)(1076003)(38350700002)(2906002)(38100700002)(6916009)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tmz9QPrZBzscdT4zEy2srRbepynW7cYPeMwoj31XilQPrni9y0m0KQT/h2c1?=
 =?us-ascii?Q?nb0Q2H8m3L4557gKoywe72gQ578E6rCo3+ktVsBTotamaG49sf5tOTBUTTmN?=
 =?us-ascii?Q?PDPg29DxgN3PW1jEMnNZHW3OiDhrrOpo2RfMACPHVGYPku6Qh3OpFzkkJuMN?=
 =?us-ascii?Q?dOnVFIBOANflopfaaYp/oYWZJLlgngCpIxQviN09a74wAUNJvCDklsPCc75D?=
 =?us-ascii?Q?RjeVZsY+ai3y8YVeqYBmu88Z6Bj01bDzX8TxA1f99WB/INL0CiPwzQ6kVM5c?=
 =?us-ascii?Q?Tw/wXaRwmgx1h3XRhuwEOoODE27syh+NIorEMdcjPMn26ZQY66WwKiUbILyP?=
 =?us-ascii?Q?AuoKnAUgBLNEi8n0zZOy0m+nM1pSs6KYlMuvHdsO6v8zDGSMnQa/IFJ8kmsU?=
 =?us-ascii?Q?EkR5/sOkvi212lT6btvBAmfm7AYoOkEfWz6FgrC9vn+dZtHBrcA1FBuPAyL6?=
 =?us-ascii?Q?7iPBXMvb5gzWGMgABrEzMiUo8NMf0la+wlOPkMPNHF8d14tsnWnGhGSbDXUE?=
 =?us-ascii?Q?2/xYDaknF5S1mLoIg3isrrzxMx06bmGZd4VqCHqyVF9u5fL1INlmPSCdIBio?=
 =?us-ascii?Q?Hz0EcavMkBYMusQH5bXzXS1/QWCL49P6M0sZ0qVRLqQGXr6MF6NQLQqH0dKH?=
 =?us-ascii?Q?1OVx9aHfTD5ZDGWImvV7EvUi852dhvkGTLabxGfaHf8PRWzb0xErE3kXLmZb?=
 =?us-ascii?Q?tdeyrPEHs2yt7s1SwPeJb1XwMbFiSeKK5CegtsF26/kYgqnI6wPKfEroZsf5?=
 =?us-ascii?Q?jEK9cXw/9N5d3PLOU1BuBMVTcwYOFSWeAcPMbR8FD+/+JIulJ1pZkxvqnc9i?=
 =?us-ascii?Q?V/Rrbd3YLy++joaMGYFmMyd0WXiPLpQaAcqoPjR7qsA9WAhVIkAniHQYEupC?=
 =?us-ascii?Q?Z4i+zm4I47moFszCVT7+OmtbyxbggOCtCRcGy7JSZGkVSDh4oMWve28bPxKF?=
 =?us-ascii?Q?QxpgA8gE0BPzYr23LJFS72aRrG3jQN7Ai0MTaIEfLkR17PFYTQ0I4tVI71vx?=
 =?us-ascii?Q?BsabmmHRGxy7QP4ecPPBR9RL65ZrPVI3VvllK8wUPS5UkAS2Y6c9PViRbZrl?=
 =?us-ascii?Q?llpQUa9H+1UaCFY9JGv58eM38GTPYyvajbzm6FEj0EBDo4O2nVaQxZDqZCp3?=
 =?us-ascii?Q?wIYrES9Gs8hZA345yGn0h83Kk6xHpy7qRgY9jDMRUJUP/6qQg6bxZhXJMhuO?=
 =?us-ascii?Q?h8uJAfV4CeHqZYKVs7DHn6g1UCaEUGfxCSnjAvIVFZve4tCNkesiJEispL13?=
 =?us-ascii?Q?aHuu2dKiPq1FfTFRVQBpCJGa8TvM9rvtTUEfkEOLZhQwHGGwCuizBeb7PJzs?=
 =?us-ascii?Q?8kTtJEXMHftTSe/Le0QPjWZJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b47d094-4eac-4a81-ff56-08d979af60db
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 07:47:20.4532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfFXpXDKsve5Wouf7+aj+KVM5G3VRx+OksYbrWNLKDtNkoYTDZ410Fc/v92vPiaDbxo0hEKF4zEZlDpZgGHElQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4489
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=eH+VzCFV;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.7.82 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

With Linux kernel has a change that
"kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and
filechk", so add FORCE in Makefile/Kbuild to avoid build warning.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Kbuild                         | 4 ++--
 configs/Makefile               | 2 +-
 hypervisor/Makefile            | 6 +++---
 hypervisor/arch/x86/Kbuild     | 6 +++---
 inmates/lib/arm64/Makefile.lib | 4 ++--
 inmates/lib/x86/Makefile       | 4 ++--
 inmates/lib/x86/Makefile.lib   | 4 ++--
 tools/Makefile                 | 6 +++---
 8 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Kbuild b/Kbuild
index b76a8dd7..2863c121 100644
--- a/Kbuild
+++ b/Kbuild
@@ -46,12 +46,12 @@ $(GEN_VERSION_H): $(src)/Makefile FORCE
 
 quiet_cmd_gen_pci_defs = GEN     $@
 define cmd_gen_pci_defs
-	$^ $(src)/include/jailhouse/pci_defs.h > $@
+	$< $(src)/include/jailhouse/pci_defs.h > $@
 endef
 
 GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
 
-$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
+$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh FORCE
 	$(call if_changed,gen_pci_defs)
 
 subdir-y := hypervisor configs inmates tools
diff --git a/configs/Makefile b/configs/Makefile
index 74b35f0d..327043b7 100644
--- a/configs/Makefile
+++ b/configs/Makefile
@@ -38,5 +38,5 @@ targets += $(DTS:.dts=.dtb)
 # prevent deleting intermediate files which would cause rebuilds
 .SECONDARY: $(addprefix $(obj)/,$(CONFIGS:.c=.o))
 
-$(obj)/%.cell: $(obj)/%.o
+$(obj)/%.cell: $(obj)/%.o FORCE
 	$(call if_changed,objcopy)
diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 3807e608..8ae4e332 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -80,7 +80,7 @@ ASM_DEFINES_H := arch/$(SRCARCH)/include/generated/asm/asm-defines.h
 
 targets := $(ASM_DEFINES_H) arch/$(SRCARCH)/asm-defines.s
 
-$(obj)/arch/$(SRCARCH)/asm-defines.s: $(src)/arch/$(SRCARCH)/asm-defines.c
+$(obj)/arch/$(SRCARCH)/asm-defines.s: $(src)/arch/$(SRCARCH)/asm-defines.c FORCE
 	$(call if_changed_dep,cc_s_c)
 
 $(obj)/$(ASM_DEFINES_H): $(obj)/arch/$(SRCARCH)/asm-defines.s
@@ -110,13 +110,13 @@ HYPERVISOR$(1)_OBJS = $$(addprefix $$(obj)/,$$(hypervisor$(1)-y))
 LDFLAGS_hypervisor$(1).o := --whole-archive -T
 
 targets += hypervisor$(1).o
-$$(obj)/hypervisor$(1).o: $$(src)/hypervisor.lds $$(HYPERVISOR$(1)_OBJS)
+$$(obj)/hypervisor$(1).o: $$(src)/hypervisor.lds $$(HYPERVISOR$(1)_OBJS) FORCE
 	$$(call if_changed,ld)
 
 OBJCOPYFLAGS_jailhouse$(1).bin := -O binary -R .eh_frame
 
 targets += jailhouse$(1).bin
-$$(obj)/jailhouse$(1).bin: $$(obj)/hypervisor$(1).o
+$$(obj)/jailhouse$(1).bin: $$(obj)/hypervisor$(1).o FORCE
 	$$(call if_changed,objcopy)
 endef
 
diff --git a/hypervisor/arch/x86/Kbuild b/hypervisor/arch/x86/Kbuild
index a6badcac..7a42adb4 100644
--- a/hypervisor/arch/x86/Kbuild
+++ b/hypervisor/arch/x86/Kbuild
@@ -40,10 +40,10 @@ intel-objs := vmx.o vtd.o vmx-vmexit.o $(common-objs-y) cat.o
 targets += $(amd-objs) $(intel-objs)
 
 quiet_cmd_link_archive = AR      $@
-cmd_link_archive = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
+cmd_link_archive = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(filter-out FORCE,$^)
 
-$(obj)/lib-amd.a: $(addprefix $(obj)/,$(amd-objs))
+$(obj)/lib-amd.a: $(addprefix $(obj)/,$(amd-objs)) FORCE
 	$(call if_changed,link_archive)
 
-$(obj)/lib-intel.a: $(addprefix $(obj)/,$(intel-objs))
+$(obj)/lib-intel.a: $(addprefix $(obj)/,$(intel-objs)) FORCE
 	$(call if_changed,link_archive)
diff --git a/inmates/lib/arm64/Makefile.lib b/inmates/lib/arm64/Makefile.lib
index 2ea037cd..5df2632d 100644
--- a/inmates/lib/arm64/Makefile.lib
+++ b/inmates/lib/arm64/Makefile.lib
@@ -58,8 +58,8 @@ endef
 
 .SECONDEXPANSION:
 $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
-		   $(INMATES_LIB)/lib.a
+		   $(INMATES_LIB)/lib.a FORCE
 	$(call if_changed,ld)
 
-$(obj)/%.bin: $(obj)/%-linked.o
+$(obj)/%.bin: $(obj)/%-linked.o FORCE
 	$(call if_changed,objcopy)
diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 35f04161..a3e149b3 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -51,9 +51,9 @@ lib-y := $(TARGETS) $(TARGETS_64_ONLY)
 lib32-y := $(TARGETS:.o=-32.o) $(TARGETS_32_ONLY)
 
 quiet_cmd_link_archive32 = AR      $@
-cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
+cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $*
 
-$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
+$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y)) FORCE
 	$(call if_changed,link_archive32)
 
 targets += $(lib32-y)
diff --git a/inmates/lib/x86/Makefile.lib b/inmates/lib/x86/Makefile.lib
index 872b7ce0..b5748565 100644
--- a/inmates/lib/x86/Makefile.lib
+++ b/inmates/lib/x86/Makefile.lib
@@ -57,10 +57,10 @@ endef
 # obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
 .SECONDEXPANSION:
 $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
-		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
+		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a) FORCE
 	$(call if_changed,ld)
 
-$(obj)/%.bin: $(obj)/%-linked.o
+$(obj)/%.bin: $(obj)/%-linked.o FORCE
 	$(call if_changed,objcopy)
 
 # 32-bit (i386) support
diff --git a/tools/Makefile b/tools/Makefile
index 4faf9430..1108433a 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -111,7 +111,7 @@ define cmd_gen_man
 	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
 endef
 
-$(obj)/%: $(obj)/%.o
+$(obj)/%: $(obj)/%.o FORCE
 	$(call if_changed,ld)
 
 CFLAGS_jailhouse-gcov-extract.o	:= -I$(src)/../hypervisor/include \
@@ -122,13 +122,13 @@ LDFLAGS_jailhouse-gcov-extract := -lgcov -fprofile-arcs
 targets += jailhouse-gcov-extract.o
 always-y += jailhouse-gcov-extract
 
-$(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse-config-collect.tmpl
+$(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse-config-collect.tmpl FORCE
 	$(call if_changed,gen_collect)
 
 targets += $(MAN8_PAGES)
 always-y +=  $(MAN8_PAGES)
 
-$(obj)/%.8: $(src)/%.8.in
+$(obj)/%.8: $(src)/%.8.in FORCE
 	$(call if_changed,gen_man)
 
 install-bin: $(BINARIES) $(DESTDIR)$(sbindir)
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210917074630.2585329-1-peng.fan%40oss.nxp.com.
