Return-Path: <jailhouse-dev+bncBAABB6X22D7QKGQEOLLAW4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA12EA87A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Jan 2021 11:20:43 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id r1sf1039140wmn.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Jan 2021 02:20:43 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1609842043; cv=pass;
        d=google.com; s=arc-20160816;
        b=x4QfGXTIfTLta99GukZrLD9e/Od/T/MKxwUtHIsR8Fk6W61U9B/8ic8H+yxE/3md7O
         BOq8uRpULNxOnjE+nnZyfMGN1OBXZuzcb3NrGeiivE3Bz0Tq5yf//N0oTAhdyaOI5qgL
         W07K7wY1bIGlLrRsQ9nQ+Ngi/URa11+/oqLkE/ZbpCAdKvkGnJtLzc4lLsFAKWR9LbaF
         YFNNfTbBhsKTkgDr3JZecoB/HBjxQ3Ck9oDInVTBq/5vJcVzKCXFT0t+pOZpE4OdpXeq
         MmrmtYQ7ISi8Og/s4OWkt1PZoksuggJaU7HnzqrV8IxocK07RDP37k6o+eq1slShjc8e
         gz9A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=xC10rybS0InSZT4IeANF3Vd3o17u05tsVkzrtz7DaMo=;
        b=Axdsl7sE/s1vmcRa5FbwkPqzS8yyRnHfzDX7SUaSP7U18/fLL2D8VvOwscjcsrVZKE
         WgZSY6rPzw2aN0Jq2L/as89R5xAI1vtHOehnDfFRH0+bJqsP0eyhXV1hoken3fakmdAj
         GgrW8IjBvzyIKGdCI8SNMogiZGYM3rwJluBt8hPKICQ19Ms9TkCqE7oynjYwKEm1xF3C
         EfL4vbi3i5G1MgEo/3wH1rsQNop0G1ops7lS5Z+oNW1l26KQldP4zrmsLGSv1lVIyCMU
         X7iEkm7R/PMyUXBSxkTIrxbEEEzQ43pETU+TJTBQFGlZQSkRIZYWYDqmmFosYqUlEAHK
         V/mQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=cpghL3m3;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of alice.guo@oss.nxp.com designates 40.107.7.72 as permitted sender) smtp.mailfrom=alice.guo@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xC10rybS0InSZT4IeANF3Vd3o17u05tsVkzrtz7DaMo=;
        b=Pkq+nPD6CbMgtNctFmeuId1LF+eGP/Ve19j9P/ltdu2izscVVGTz8WBnkK+MBu0Vx7
         0P0M2YBHeA/e2AwnrvdLrEFxOxORZ5be/wFTYsVPjz/WQ+aZYKfXHKb0XQCLzp9fcgdC
         N8M8lqXsYW8T8ryDa0Q6sdwybSt2r3dDxtXtLGDikeM5y2jdJs7xG5SYJT7LIKJjUhVK
         ddzw6F/8cRqKC6XC/AOkZAkLFk76l1jwX2OmSiKNmE4h0p05+oSFwvUY3IoAQG4Z5nsx
         vXvrj3WJi5yxHoqYzyqTwczlUT3L8y8YpzzMVtP0D1mNutDfrkwb/pk8gcs6YFaFVmfD
         Yd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xC10rybS0InSZT4IeANF3Vd3o17u05tsVkzrtz7DaMo=;
        b=YrAYfhugpd4ME1gaLef8LIjhYoKdRaEv/eXmDbKiqULwQinRnxJUIYgVhRjZWX3/PR
         dCkCnOY8iiWS11v0J7/1BkZagoWcdWj4U3AvdmrvXkZE+zbTocaXKcm3ZfqxagmwPgTT
         t6tgzPpfwCCrZD5ayCQ29trkvHASycOxi+5ucJKXTic79A78prX25TbVuGJFBRejrrC7
         14NNWydu5aJ6fOuTfy3OXALF4mi/srojzxQj06xwkkSmDpc/3WLwPDa1qrQd2Ra5NnOJ
         E69GZTYNK30NDB4913gai1mRQshacwWNxAnR7GG19kPbajz6iCN543IicGKPQ6ep6xC6
         HBtw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531bFTcJ+CWjOJRIToro21ydPw0ptHH2Gn3T1VPQJyov2ZquRSkW
	/I6K/Zyhrrejs3YlLud+sWQ=
X-Google-Smtp-Source: ABdhPJyvb5iNsk73F1rVpMHTFdKaxKdj8Oejd5vfWbAlG6yvFQenQsn7BkvHZQC7CH13QgX/UrHT5A==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr84417599wrn.141.1609842042504;
        Tue, 05 Jan 2021 02:20:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5543:: with SMTP id g3ls3806308wrw.0.gmail; Tue, 05 Jan
 2021 02:20:41 -0800 (PST)
X-Received: by 2002:a5d:4101:: with SMTP id l1mr86028240wrp.196.1609842041748;
        Tue, 05 Jan 2021 02:20:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609842041; cv=pass;
        d=google.com; s=arc-20160816;
        b=XYJXP8Mfyu+gsi2jNhtL04qqVYITQ/+BXHR+QFEJLAWrV06aESOuZaXV/I6WYE9Rn6
         K4z//c+TT2aH76Oj8Nl8p81umdZU+B2CcYoapBCSCyTf5vVj7wzmCNTvRkwng+ZYlvnC
         cHrzspnKvYuAWsApdy9tYVBDdI7bqavPO42lSWo5Ihe2XELr7yqvBZ7pT+NaYGfrDnI7
         G+JCmVZBZOUtve3xETJin8QqlATcayspVvQIdIeXfByTqkZJPIwOJV5Q3FMi1gmTKUco
         NyEfxWJv9xvHDd05jA/vGx28dxDQ6Su7PtvQAhsAzYJqC99X/3h0dRhTN4H505N/aHZo
         e1zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HWsZoHoG1cAgO8N2ccZXdPEC2DWF0PIF3naWZEOsO5c=;
        b=fevKbhcNjBKFrYVFUBpiGKkbDizTuPLd6p3Yog7TO+2NxGZhBzap7AHc6HT3oUsqZ9
         vgVkruH2/rcEz9mC/e4GlYzv4CRMLcrrxLgbs31dokt6slb9xRxvzH58NoPVi+zFOmAE
         WjqsLgenwlOt7/pcRKskD2e0Fmq69imabAlzJcsD/J47lsI22NyMbQL0jK4mOBf1CzOZ
         aursit0Zm7X18QqRUpe0cpq2WsCDKoBeXMkJurfxMffTzn1gxQHIGhIdyHEkztfbDz3p
         2ti8E53dRbEaPy4SImpPkcUgudbeXINENH3rtlrEtvE2PzXElY+0pzrxGdF8irs0mePO
         fYdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=cpghL3m3;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of alice.guo@oss.nxp.com designates 40.107.7.72 as permitted sender) smtp.mailfrom=alice.guo@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70072.outbound.protection.outlook.com. [40.107.7.72])
        by gmr-mx.google.com with ESMTPS id 10si107449wml.0.2021.01.05.02.20.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 02:20:41 -0800 (PST)
Received-SPF: pass (google.com: domain of alice.guo@oss.nxp.com designates 40.107.7.72 as permitted sender) client-ip=40.107.7.72;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7E+XKTv4ou/2IHaMF3rOSZS8Dn8DiVHfD6gKKagtJ0cvDBa5nzBuS9GOshjVdZ9PtLkuE965kOgdHRzva/G0iWF79s64Rvt0Y5BY+CwniXVZ2b2zgHxeG3QyynSAhszZFAAwo/t63K+bjxif2QFn+pPx0nlZNsUqgnVzxhxQg0MI1+zJmcMFBj0CRgZClznw9bekJi1Z2vK57+RkfOtA6tZ2VW2MhqB6cbNvGpfSX1XhjzHL2J1Gk4CWXbkttZ1zm5YCQkR2zy+lhlQnvOKYgVmIsn0fdB0XaOym2/pWRKtuXyNaELlQD2A5JKMpf+ilqWBKwjTaGKhdBoLoxUgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWsZoHoG1cAgO8N2ccZXdPEC2DWF0PIF3naWZEOsO5c=;
 b=PpHCiDrruVAJBNkmulNlluQSIDWyhD4OmCYBCbEmFAgil2yoSgpQ/MdHAIp1ruPHUuniNHAxo9p3LN6J/y9jDSLRLl3lLsEa5O0cZDgrrjUsRBSHinJuFBIxzrbJUvgH1uVrX5fBA6vyYWu2L17nIv7S+Ee1WxhGSLY2wsPKES9TUiUPs6ufSb3NmttNuTTb1/IEkblvG1EppQJ0HMckLY4en35EHFAyC/YcTIEPW1SJFto94nNIpbwM/bF3hCjUahVMIzeiZx9536rtEhQImi6ucyA7WYnTw6brMsqIbPkZKn7V1Z18h2lABdqtX1CIyVc7BQ1Rvx1tl3is4AkK0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM6PR04MB6053.eurprd04.prod.outlook.com (2603:10a6:20b:b9::10)
 by AM6PR0402MB3414.eurprd04.prod.outlook.com (2603:10a6:209:3::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Tue, 5 Jan
 2021 10:20:31 +0000
Received: from AM6PR04MB6053.eurprd04.prod.outlook.com
 ([fe80::78fe:9b7a:a2ac:9631]) by AM6PR04MB6053.eurprd04.prod.outlook.com
 ([fe80::78fe:9b7a:a2ac:9631%7]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 10:20:31 +0000
From: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com
Subject: [PATCH v1] imx8mm: fix ivshmem flags
Date: Tue,  5 Jan 2021 18:19:55 +0800
Message-Id: <20210105101955.4419-1-alice.guo@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19)
 To AM6PR04MB6053.eurprd04.prod.outlook.com (2603:10a6:20b:b9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Tue, 5 Jan 2021 10:20:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f96915e4-ec3c-49d1-2489-08d8b16387c5
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3414:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3414FA33FABB0D002D083E8CA3D10@AM6PR0402MB3414.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cSNQUA/u7iqdRByhC33d2LWGuYjZpjd3CnGwa7qJ1xp2sYdTeeZ7X7dPupFpOGWkLScqpxDIXhBnF0ZMKrrr/6Up1pLSKvS/I1LnXvkJcGTOcc3mzhTxIru4DhC/3SRgqvi5VOn4h/TbHWWwpgVgDpvJXd0tSaNr1rIH8dM3X6rubLoQpNaxm6+4clBYgTWdg0z+S52Pp8kGE9tbsVzKNUiMa/Mbw492G5vy8rAydiAyXIuiEUInsBkGAV9hs6Qyifp+tYEGM1Htomq86Xk3CSEvM+NK7C37EQStpAGJvPmb/6Orvog4PjreISv329/ayMuxiCKZMpqS6qOUmmzZKc6XrZLP+cycUzoLJ40TrYosro8CWvWc2gktiIzoBJqFeTAzXS3XKe0qz2FrL5wDKhzsukx6FrJ1d0iMhFsu4/qPXKlCrCQehNpbQ3VBH5MI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(83380400001)(52116002)(5660300002)(4326008)(8936002)(6666004)(6486002)(86362001)(956004)(2616005)(6512007)(6506007)(498600001)(8676002)(66476007)(66556008)(16526019)(186003)(66946007)(26005)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9DcnLPbYQEUHd4dCwj73gKg5a7jD13e4C5yOGSMLY8+Ee/A5ONDt+b89WS0f?=
 =?us-ascii?Q?covV8/6uJt8qgDkp3w9KD0XuigpYl75V9qLIzQcIA89Q2Z4c4RDLwnv6o2oz?=
 =?us-ascii?Q?+mR7v06MYnsNgB+4nJh4TruVRjiYP4sUCwrV/IMo5T/luIGg7nvNUEgJSnM5?=
 =?us-ascii?Q?XJ5+cG70UNKVTNmFRuNs6gMVPRE1IAW5TaRYCM1QzTrhkslv3MzV/PrR/7n/?=
 =?us-ascii?Q?qN/fk1a4g7xgIO2X+CU8ftjwhhArPYiW3BiAN3zv33KhAsVHCQKhoQHeT+o8?=
 =?us-ascii?Q?Ea57UWCweF4MP4KlsCgDDlBXvzyjpu5IOzFDpTRl10g5v9WlkLML2lm4rrGt?=
 =?us-ascii?Q?YUGxThN7ugGgqR1DtS2vGF+vGBsp7mGpkdRoK/0Q7UdrFJDySQjPzBztKKm4?=
 =?us-ascii?Q?scPG4BGzoTOCQgnuxLX9AdMT9RHepLriBXWggCxgeKEjZCFz1UT8YvmkhvdQ?=
 =?us-ascii?Q?GNRns+PH0RdthWQp0BqsWP35tti3tkPO24jG8Zhg/2Ok+sDL15Xqd4rZ8ZQT?=
 =?us-ascii?Q?fYPWm+V3X68LyEVhw+u+nrKUpmDbbMQoqaTj238ep9bGNqi1FWpedVGJAA72?=
 =?us-ascii?Q?/SVCQpKeXV7w1lwmegbFJP023yDnfCyyZmtjzaKBKMPu2adMRbN5HrRxJ/+Q?=
 =?us-ascii?Q?VZ1M3f3F89/yi9bvaIR8MpSUxmcLx9sH81+u0VUF2syeVGOdgoKGUbsknrJ0?=
 =?us-ascii?Q?0JQ7HwbBtenu8huU2SYihCmYWUnh1shquyZUKPJeGNIZMwPLAQwLD/bVsUj5?=
 =?us-ascii?Q?3AL+WXIKc5lmLw2UQ8ayQwtIyihp7SzUrTyuA+vR5P0QyYdIm84XGooyNbvG?=
 =?us-ascii?Q?g5zfVU+sa1PrCy2TO+sd6qbfSEbt3sDCYez7/birjMsdASfpkCWskaoqKHNt?=
 =?us-ascii?Q?DAiYTQyTR16LWOBJ9wAuiZo7rif+ezquYnKgebOBXwQI5Qvdq4u8oHb9RjgE?=
 =?us-ascii?Q?PsdF6ZzMAqHIAawbZJW5Qk1NRA3yy7eywxQG7qzIUkzQOdINn/wMsMT1Qg/3?=
 =?us-ascii?Q?RHH4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 10:20:31.0088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: f96915e4-ec3c-49d1-2489-08d8b16387c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kA36Ahsh0Ex6bDlPjoNPu4DpPqNBn+JvWKIc9QikWIMftn3f1gw1+1tVzMhx5ZtJf6iiJ0gK2YkbBz3RO9Cbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3414
X-Original-Sender: alice.guo@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=cpghL3m3;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of alice.guo@oss.nxp.com designates
 40.107.7.72 as permitted sender) smtp.mailfrom=alice.guo@oss.nxp.com;
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

The inmate linux should have root shared flag set for ivshmem region

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 configs/arm64/imx8mm-linux-demo.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
index a3e85c0a..196740cf 100644
--- a/configs/arm64/imx8mm-linux-demo.c
+++ b/configs/arm64/imx8mm-linux-demo.c
@@ -47,34 +47,36 @@ struct {
 			.phys_start = 0xbba00000,
 			.virt_start = 0xbba00000,
 			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ ,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
 			.phys_start = 0xbba01000,
 			.virt_start = 0xbba01000,
 			.size = 0x9000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
 			.phys_start = 0xbba0a000,
 			.virt_start = 0xbba0a000,
 			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
 			.phys_start = 0xbba0c000,
 			.virt_start = 0xbba0c000,
 			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
 			.phys_start = 0xbba0e000,
 			.virt_start = 0xbba0e000,
 			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
-		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 0),
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbbb00000, 1),
 		/* UART2 earlycon */ {
 			.phys_start = 0x30890000,
 			.virt_start = 0x30890000,
@@ -143,7 +145,7 @@ struct {
 	.pci_devices = {
 		{ /* IVSHMEM 00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 0,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210105101955.4419-1-alice.guo%40oss.nxp.com.
