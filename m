Return-Path: <jailhouse-dev+bncBDV3L7XXLYIIRKGTQIDBUBFKLLBF4@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 716B6342218
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 17:40:41 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id d15sf18199476ljl.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 09:40:41 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616172041; cv=pass;
        d=google.com; s=arc-20160816;
        b=c03ACwNuDJLEkXq+g74hpL3dbQXdbEbsGIc/TCwzFA17aq6CIXge+nVudN03u7x5L5
         1DcVAHlpGSW1pMnTbMLd/0SLw8LE+nu2gZB8FlWLrZIfjYOD1irr86gJ7RCq9bDNzZKH
         TZ3IsyNSJ5S4yMX5huugjcFHCAdZ5I7RuiRAJ2czzRYSezSGpTptE8elpfA+q2UQ/qvm
         NouBSsqLuAXIfDCio+8aLHgODRACJGOO4q4FJMMqcg2elih4Rbp+tC+04RAqnYjLWgS3
         FXc6azCGNAlT24ZPvtxJYEbi6UNzdfbXob0baNAcmPXpjrAz9YFvSl2ldqps2AJI132Y
         mZWg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=TbS/a9tDbVZ1oLmqffodMoBh6TfHGPZ1M7OVgyMKEuU=;
        b=aAouQKurbqAPzeoAWCnsSomVCY/qh37kztnbnvDUabPzl2051tJsFJ2tUtm8+lKHjb
         tgb03KbQ/MwDj6Ies3XDqYecCzzSX0/0kbAkXP+jYVV6PBwOkvTH5VRGeJgwMyi4jt+R
         mXiJxvMIVKWxOBqUDt+OOS5IW+tWR6mTr9zgSGz9fOWdsruDhjpvuBHHLWYjIM0Nblp9
         AHig3Z3TsJdZj1zmX+nIu4w0qhAed/qTy4vbKLzSwbn3xnbFg4ihc7NhTwgs1i+wxJIV
         TpBKIb3eA9H68B/y703PbiqeWUBlBUs6EpECFr5YtoRLaofLAo+l6RvJbBYzgPVB14OK
         w8jg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=GIgkP9o6;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.20.87 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TbS/a9tDbVZ1oLmqffodMoBh6TfHGPZ1M7OVgyMKEuU=;
        b=jZLmb05Qp2BRYzn5U8lAa5ChrkGxi3sPfl1X4SOJOzyuJKE+Wfoy/Wa082abjx3SkC
         4FM8898N9BPaUExFSbTGccAT8wHIGLdeP9QDT5O2LuLDY+jK4U2PBk00sKF+KAoMF91p
         12q4zuJy2UAjZ9vi9wEd/yaerNGHqSe/m/Pq4LVaD3ews/rpOoSFvzOuhse9HT7XXY5q
         nY6CcWuEraF/faS/TqPcOWYu5IswDjSLrxiPkWIptOdA99Kuz8Hh7HESYP0p7ykcVcBB
         DQCGUdPfi/04V6cE7yU6UFaJ/pkAhjJmsxiTBHc8WzKom4lVcyahoz+834kKP/YU007h
         EJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TbS/a9tDbVZ1oLmqffodMoBh6TfHGPZ1M7OVgyMKEuU=;
        b=ETLDphelFE5N2a8CpjKplyFjAukXdo1Je1h6xuT/NhPZALOF/yjNUJGgSWL7Osdp8W
         BNTbB5zWVuJa+xatLfOmS2ZUzxlY+T39ghcvL4Ss17Obh6E1f63C5FXG28GlQ1J0YDgh
         bmT8l7NX6F6v/hv5EAuXTDKWAN2N6+vPFrmOQtUe45tTeVaqcTEXLwetFjhX5mBti4Ud
         nYijoBRmvcBZLhOVWErNBQBe1LGaL+HBAeOXGFGFC/atfmGrNGVj7cEMwgNDcYM++J3/
         mlVIIaQtsD/SvliXG0Q5zkVUL3BPyPPuzS/uf23SE6zn7jwSSHpq05drhHi2Pi3B+4S9
         CQVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qtnguSvaVj0He8tYaKXXVESxA3REcL03r38OBEbiql3jwB/rq
	lBa140KwWiYVV8QDpC+pf7Q=
X-Google-Smtp-Source: ABdhPJxqppojGgbcCHWE26H8tEwRUDTAjPNSDGy3BwK91BoI/WxPGr83E3cRQ9m8ohKfjTBk9Z4Rkw==
X-Received: by 2002:a19:6b13:: with SMTP id d19mr1252916lfa.291.1616172040819;
        Fri, 19 Mar 2021 09:40:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3993:: with SMTP id j19ls4864552lfu.3.gmail; Fri,
 19 Mar 2021 09:40:39 -0700 (PDT)
X-Received: by 2002:a05:6512:2391:: with SMTP id c17mr1349169lfv.652.1616172039720;
        Fri, 19 Mar 2021 09:40:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616172039; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y918+U/IqqJmLuXd4upxvQURpLgAG2sbuGBrp3m+QJkaK06nkyoCD3Iaftgn2LTldk
         ey6sdGQGKD0jycO3SR6BTvnYSCTYyKv1anjUJ/0IlmEiD21AM1Or5H4+84cdhACcDOMh
         Oh+4G8o4l0wlCi1k9SIl1K/PR2DoJN23xRgyv68BobFtXILS02iTMaNWKBeI/dHVw1uP
         J14xVwYsRQaHGOCpjRbW1wX8AnB3J7v+Drwnjq4GrwEjnMjWDCx2HTCEIiQjWk4nuqHb
         d7FOXfPro3xw1LEWq//Cy2f1AVFqn90ki1gq0mTyIepNcoAF0dIhDoEnPsan9JdtSSRN
         Wu8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4YJMjB0KfE6u0lL/SqVQvAdIH7PEew8PbueT+gcfJzg=;
        b=q9IheP+HBmMlhG1ufslqbuZC5zYPt509qZH4s85dPy8oOlY4hlBCbv0HK9OihQJ4V1
         92ZEn7eF6nlX3zhQ4Z4xSvBNi+3fVp/KbzwAPmVY+IIBGk68cNU2+7jQdxIrQvZlCp64
         Je0ZKmOTV83s49BR5hmZDfsMOCx4fo20zwYu1iUay3jKy987iK3N1F52lPb5PldeqKoA
         bq//GIZni5dJL+kVROr8wplI1zlgjX7f5i9rbhsuHvRmeLfUz1/xnL3oueGKT0BGmf60
         lDsI2LO1Hkf/VOQgMTOfD997x5iUwps+z8IGbdOVUToNs9g8mELlawtSWwHsyP0yptDx
         Th9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=GIgkP9o6;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.20.87 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2087.outbound.protection.outlook.com. [40.107.20.87])
        by gmr-mx.google.com with ESMTPS id 63si202186lfg.9.2021.03.19.09.40.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 09:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.20.87 as permitted sender) client-ip=40.107.20.87;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nr3KaADcEUoB6HfJOo/9KD7ADz6ysuhBpMhF6q6/r2gOkIlLFSgB7LzRv26lSKgv1z3efM8+MaaSVoESqSJKq6lK+S3ieieEfOaQ28h626GLXz/jDDdtXoB3CfrxDlDzLrqCM4VUpICI50Wt+iV5U8szLHh6GnMbauHbxw+i88UVhgU0meM7KOciuqyba0JK5f8I6f7XHqfVscZUi8/Qn3iVaT/lx5Z4WjXyOD98S1/Tr6fLzGO9zjU2TItKkambcmr1wOdH+NfSSI3Xs4diDwWufoVOm1UCmLr3gbw7uz1by5M21Gb2t6ylMHO95cxDtYlkKmUxQC4a3xwnVLNoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YJMjB0KfE6u0lL/SqVQvAdIH7PEew8PbueT+gcfJzg=;
 b=a2PYqn4T7rv/fcTtV3zOYubqOvmHo8DxKUjDkz20ybrfu39UMeMT7ZJ8Y0+N9CKOIzhDFNL7NW+OA/kXgkIs5LBZ+ZJwNR3/0jzcVOaKujCBFtlpYJfuslcOLmjMqizvd1QZBlxGdT9c9HQjLmU8jlybzd8IsVH7kxBS3Q8B7sJlRC4eZe7slaF5F2dbtphtGXmz5H0dtdkrGVgFjF6SeOQa7yArROZWqOcCSyLjSMqe+xvWtLBI6WqOKkB16I/94fOos+9ddsY3caSFoEFii8MFH6wOaXylA9sgD6lZz3KYbiWnyJScuweAdSwX0Z6fGDCxiip0/qDRnPfDXkaN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 19 Mar
 2021 16:40:38 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::5dc3:addc:b43e:a00e]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::5dc3:addc:b43e:a00e%6]) with mapi id 15.20.3933.033; Fri, 19 Mar 2021
 16:40:37 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Subject: [PATCH v2 0/2] Add configuration files and dts for NXP LS1028ARDB platform
Date: Fri, 19 Mar 2021 18:40:22 +0200
Message-Id: <20210319164024.4060-1-anda-alexandra.dorneanu@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM0PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::16) To VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-119.am.freescale.net (83.217.231.2) by AM0PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:208:ab::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 16:40:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 786678a6-d6a5-4a3c-d9d8-08d8eaf5b990
X-MS-TrafficTypeDiagnostic: VI1PR04MB7117:
X-Microsoft-Antispam-PRVS: <VI1PR04MB7117EDDBC8CCA2A2A142BD3CBA689@VI1PR04MB7117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PdA4jR/tBEUeHjPnYu8c75HiMSXNWzAjiRXStJM6VwMPpl6rTdXy8zlEQypFA7jBiE2TZnPk2qYfCqM4gmHGkBam3fYhCIygD8JQpqs0new5NJT+7Pw2QfPk9UtaxpFNysUuANikuzhhxPO1XxeYa2uWAQYFWx/YB1Eg4n3HzrBNBoBgoqCLF0ss+ct0uZYc3eClL3i5e/9lSdeOn7aoSwjJMkuny5PuO14LSCscL7K3PHnpUBm7fSenpmIs4k+ROEzjxU42lwSHIbaBdj/dF1PL6zsyqLQoSE1mRf8yCa4fcjlPfjHxVagjOzdnOnkHq0bw5FHYs3A2t2GtEcSM0OkLcXurq6/6QHBuQ8TZDZHXkNzVbrKk+nTzDVDqTwFMG+0iczi7LKlvR4TIK2ZxIdkTK0oJsDkmDtA9hF/2f/S8eLyrkdm6gBEWSjf6ytyTswWc5FXD8JJz9+dBAX6blyDBiNYtCpcKSbvVSENZCaMHxo0zBUu3s7aqHrwsW/3BSFsbxFQsVWMSNrYK05koo0wMd1gpWVOQ7s2NLKp0DFfIuTzDGVHff5Yt0wOvDn64WmJ9m5U0mPp7EQat6U/5V0613oAVM8cdb5TrVtPqB/SRz12Yu6xHuY/7u8dWELWB27kjUJYtNf08mS0xQio55CpJwLuOLuCSAqoN9wJdwfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(2616005)(5660300002)(52116002)(66946007)(36756003)(16526019)(66476007)(26005)(8936002)(2906002)(316002)(6486002)(6666004)(478600001)(1076003)(6506007)(6512007)(66556008)(186003)(86362001)(8676002)(956004)(4744005)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2L3DXZstaSiCv7tQWnzvqNZ/MXCCx2OuM12Co45C6aQ0ADyu+SfAl++c/Wjr?=
 =?us-ascii?Q?qZD/ozvdqVEvsnqcyBsfpkrVUHU32UmhVx+dDqMirr0X3nvBZYmoNNMdgfGg?=
 =?us-ascii?Q?WuxKCyKidQFsp+4re9fJjNXZViQG4m3EE0X1GgkeASgmI7ICtBbH/c2T6RGA?=
 =?us-ascii?Q?7EglCkGXLk9/Cf4NnQnAV0vGmTppUMACZtOaOvDWyuJ1vCs23F5y8Kp4O/e6?=
 =?us-ascii?Q?i9Vjg3WBvO9z8r31iou7OkOVjAQaUUNW5eymo5cSNPR5PjNqrtNRry6Au5JK?=
 =?us-ascii?Q?sw+XaAKaGNFqhQJJvAfuCK4IlAYB7GyP9T9t6hNzH24zMXND4yOco6ipBlWZ?=
 =?us-ascii?Q?ESYU4Na+IWuhvDQeOJj2uNqW1PMIyKVlRw/4RYknKRRXE47VioLqlT5Je78B?=
 =?us-ascii?Q?6t8Hqwr9NiWk+03jB4xGLZfrp7oUGUcD0h7Jy5k1/Z4HP+zXxJ23hBDnW2CK?=
 =?us-ascii?Q?TBMEFp/7nXsKVnOi6G8YIFv1mGIGeK+n7FQVsTBsJRmb15lhzwczXZ7O60XK?=
 =?us-ascii?Q?R4h3unh7tJ4hUEy0wOsQMkXdJnZ7wzEklB1hPhJXbwgTIHYIWTb1lBtNyaBs?=
 =?us-ascii?Q?vUrRXTgXu4FEN15tEaI2viF3At7pjd3JNrF7unbgALYdpAZ1w/+Z5dGSwEEB?=
 =?us-ascii?Q?pcPGNzamao2qAyfAo7G5tNQaEaBoZSBasPQxxqoceValTApUSri8kXZCSQ+7?=
 =?us-ascii?Q?34RXvg7omF8HX+bFhAsL1Sj7QVmJEoIH4Me/5uVbhw2Hx6lWFSwYfxu4g+Rb?=
 =?us-ascii?Q?+webpw4EnZELaiGknV971WwSg1O7OYSUHA0k1DfVkmIjs/gnuYz8k647zFow?=
 =?us-ascii?Q?/CfaxnuuboShN4LODgcC4q79MLgiqeUtLvDnP0PvL6vWIMd7lSf8XsxRz9yF?=
 =?us-ascii?Q?aV5nJAKRuIywA6FQRst5TgFauN7llqAn9FsN9evFWFRbrHKU912nusBDz6yb?=
 =?us-ascii?Q?6ybnpq56tzNv48WRP7HLWu15XV6k1vHZtkt5O9FRFhoC6gTuJBkp6QLtusXa?=
 =?us-ascii?Q?vRVCbOCOKe0mVkpV/QYBaKUPhwDKh0yub3lPLLew3GinqE/hRrbeAA9J4znW?=
 =?us-ascii?Q?1knQY4XxcexBS81MVJPs1k8J5CZA6Cvhr7GUHs2zCGP/kp63p8yhAJHbn/14?=
 =?us-ascii?Q?Oe/K+KkAGFn/dadAD4YwaAGdZUriWv9nYj1j0/g095w54E2Sdro7DNM7YbN1?=
 =?us-ascii?Q?+PNK7Di11Pku3wOwLFti749wE94oIOK7woWYSjIoMOwlIYCcY/dglE3L1OOW?=
 =?us-ascii?Q?3py4gZdDhqsuqDnlXrxMtvNl2hiLWU42Q+GLM9/44ckUCfzfi9QTAbpii2eE?=
 =?us-ascii?Q?HPN6FBSR42p38Au1cQfOmnsP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786678a6-d6a5-4a3c-d9d8-08d8eaf5b990
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 16:40:37.5408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUgYzBb8s7gv5NoUCi5k3kne0XCvgVpAXgClXIOCfsmIpFmCHZEa11ko1Pl3TI2PZ8iUczwQ/lXZCdtSHtMcY/a6FUq4YiA+xs0euBGpjMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=GIgkP9o6;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.20.87 as permitted sender)
 smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=nxp.com
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

Changes in v2:
- remove overlapping region from root cell configuration file
- remove gic empty entries from inmate cells configuration files

Anda-Alexandra Dorneanu (2):
  configs: arm64: Add support for NXP LS1028ARDB platform
  configs: arm64: Add Linux inmate DTS demo for NXP LS1028ARDB platform

 configs/arm64/dts/inmate-ls1028a-rdb.dts | 139 ++++++
 configs/arm64/ls1028a-rdb-inmate-demo.c  | 122 +++++
 configs/arm64/ls1028a-rdb-linux-demo.c   | 142 ++++++
 configs/arm64/ls1028a-rdb.c              | 609 +++++++++++++++++++++++
 4 files changed, 1012 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1028a-rdb.dts
 create mode 100644 configs/arm64/ls1028a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1028a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1028a-rdb.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210319164024.4060-1-anda-alexandra.dorneanu%40nxp.com.
