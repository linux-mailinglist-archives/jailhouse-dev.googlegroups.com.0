Return-Path: <jailhouse-dev+bncBAABBCMO5GAAMGQEI5OVX6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DB130D37B
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Feb 2021 07:47:37 +0100 (CET)
Received: by mail-ej1-x637.google.com with SMTP id h4sf11524044eja.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 22:47:37 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612334857; cv=pass;
        d=google.com; s=arc-20160816;
        b=bJdaBCIWj/k6p1qIc1pJS077J/NrVs2lJ77eZ3uTXOKX3YBdcE0BaIabf4QM8S0tY5
         sN7QDLorSchxxDp7Frmnzn/P8JYX0nHcZR9IhY2rmLWq+pJq25S5XRE78vrH3YAEuwYL
         dxIRwgDCVeZE92ljYgnPmci3yVBkAyrKMwSrDaITX+O/xqxnssvm/ina5+a5GqrBbnEe
         u6EXeJDi9RCpX3VESqeX09MbXJVMWRedEQLzzGNIqAG4h0PTiCuIJ8d650IPJU0XnOna
         cLPAufH4mbjxdLin1gfrS+fdgy6Xga+FWeobnyFL7aKx4H6DD9pz8h1F2MEMrhUfdqMJ
         JAnA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=lPuq7jPFxhA1uAyP2uQsTyo4KgSIH3A7sUxHKTpvx2E=;
        b=H5cn49jiw3IywPzWdyB8DtwQbO3PZAhvailpU1qFHm1Dnldezh3F0g+lqNBmuCF8a0
         kl1vgz6uyFw1VupuQKxSe+M5SqfVU053oveVPtkVC04Z8r8og1+AE3OAsAcxBtwgFHvt
         Ugg6pg/Y2ep88wdFoDnBxhUZD/1lyol5kpTbZIK7l55/yCWD316We89lBYAqtm+QZ6bp
         rB3iBEExCBWwEs7Sm8W3nfFtsC9rbToMf2phT+yQFJpwwF6ctzd6BCapzWScJvb4ZvdQ
         6wJFYeuHNDmcoT81iSX4ge8/FYUJplzkZiNY+5ze5V4ZnkBmf3k4txrfiNX0sZZ/woj+
         HA4w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=XbVuENDY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.82 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lPuq7jPFxhA1uAyP2uQsTyo4KgSIH3A7sUxHKTpvx2E=;
        b=bzRo0D9smIUcQSojomoup36Tg9TysusE9OHJN/99DpdYrRy2WYjqe7/Uh3p85uGfjp
         qqbotS/1ASzr/9Nb8muIuT2wG3pNZBfWS1QL23asud1QfVBdRGlXzg0dOonHDdNgBhIQ
         32EWsGmy9Ydvgkau5IOeozHDcmVqBcNV/6em1hfOGD8mwNJB2uS98dV2bYgI6n/vE8Bd
         LBvdhjUD51L06N56hr7jNiwSefiMJ3WIg/ByoTOkNVYE4SH2/P38nsPJDI94OGmf0+/T
         g/jefbMuiLo4eRlahEYyTP9Tc7/LQMDxpInbpmVd10LZp0NRCM0PXaJR/24m6u5S3s96
         S3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lPuq7jPFxhA1uAyP2uQsTyo4KgSIH3A7sUxHKTpvx2E=;
        b=LqMU2ow5ZMB74QrWNMncYukO+dqF1iSWYhfAh3iPoqFZLRWkSBEGxbt/0aUt/DFqnw
         j0hbiZ462kNjeKrzdOLm+JG6J5XMGHTrG2YIbbAviK1Soq63TcG+MfxqVhiY0rqFsm7s
         ZFtm3MPhjwge9nNp2qiLltgck2hezLvhHqtk+P2O/0XNpiH6fmz3bhkVdl/vquljDtuH
         ZFTefe2oKcLNX/rjxiIYCJrqQCJYME+dnd/Nfdspv8amaUqjJ0J+EkV+o9w9pNXkv637
         b+OJAJIboQdNG/Dw+cHS1oqBJOXuZ5QiiihUIGmtiQfgZRMzQRC9PFZZRsFU5Yl+LE/L
         QycQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533D2i6Tj1c0u9Q/aa6R1XYEGXx3YmfWKvAM9G8kQ5M+sG2yERov
	RFrQRTGR6Q1Hhr7NyprPuy4=
X-Google-Smtp-Source: ABdhPJy9W0pd9tb1jz6o1isDIbGG5VzO1AaNWZ4lPCfATEXuYmDjSF7/LrI6bKu0WNHIq3S1bU/OYg==
X-Received: by 2002:a05:6402:4310:: with SMTP id m16mr1559262edc.207.1612334857274;
        Tue, 02 Feb 2021 22:47:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c78d:: with SMTP id n13ls1072070eds.1.gmail; Tue, 02 Feb
 2021 22:47:36 -0800 (PST)
X-Received: by 2002:a05:6402:17aa:: with SMTP id j10mr1580321edy.184.1612334856572;
        Tue, 02 Feb 2021 22:47:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612334856; cv=pass;
        d=google.com; s=arc-20160816;
        b=nCWaAR5XBSqNchXywgb+JFZRFvlbURusBCiTvop0YHpQVxjRX4G4iLn8CX4InqsPlB
         vVtnSBjQxvf3KSwDXdOMtN26cATHdq+XUukl117FXorOrwYNns1cTaCf32xoTcKPAQIU
         wlpB9rQUl6c7EJjMFk4pAR1tfSqS+ddB5vIIGl+466L6EzuoVXAinzslVWozUkjcO266
         uEhetEUUDv7Jr8D2D2eatn4eMQwmUrkn5sN+eNkDYdkP2ij9sryY50q0MfMc/cszhPYI
         xCDBQZ+jOm/BVsRk1KcV7LDE0ALWs1NwHZI7PW39Za1KJXKfjaWquTjr1QvsvQZG0kdN
         HpcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZexY9HlUfqgRZh6FEbPuLFN/jcpRiAPXfXRiBfXxk54=;
        b=aEifYJP9+Mza3oXPTLN9hvB8iSBphMz3sToenk7cNX0AAZOTVYtQ3ACwp8kaFSLvIJ
         lRUH8J/BUrKBGya2yR6d17R1/ozXqhqXdvQ799BMAYJMAhX9QEI6tivcT4C6sSMIHTHn
         phBMd88iCdme7y4toEXUPkuWIu51/l4rCTcpSXnku2v8mbYPpyR10qiRiQf4XyQRmCtC
         SfsDaGvwUQhoWowW/AEa3eZmWNjWQJaU1bT8AgHQ7RrhAlD3SrqAS79RidZwa28IWcAh
         msolJcZdgwYFc9DNpKxoikeg/35F+8EP1J2STXvfgagErxl0B7jsF8yiPMTwn6gC2Iha
         JWhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=XbVuENDY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.82 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140082.outbound.protection.outlook.com. [40.107.14.82])
        by gmr-mx.google.com with ESMTPS id r19si33066edq.5.2021.02.02.22.47.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 22:47:36 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.82 as permitted sender) client-ip=40.107.14.82;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeWkRw2jNOqlrPx8aX6Z8zPjq5I4DGy1QDMSK7k4FkL06VMr66H97sMHlVG9G0O9sTP3ZY1HJRh+xh4HGL4mj4ZKFCUyCTOllbDKlASIOP/n6iwkHHPdi/Wb8gnxRkHBFSPkyTG1xnU9GGeyewdBB/9q6J/Y18ITwM6iInpKsELXg6THAhhUsa6b0XSnzfiuQtMehEvG8l8URaEbfQhK65n0kVDpX1Xp8eIiyzv6Rkt/aLOXm2julTWV5+gq3oGuXEQ7FYvRTw68gdvZh+NdLbRSFWp25juUVbEAKwFf+XcFK5SeIN3BdGRp74oi81iwZ7RK3YmJiWNE2CYC6wgVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZexY9HlUfqgRZh6FEbPuLFN/jcpRiAPXfXRiBfXxk54=;
 b=iDMi4nwtJrTuo++jv7kfKyaxVM9UQgwX9pbSCgAqsMUd8RpWj324WPo+Bxn9q9dASwvH4HMgYFCZGSxdNllHkuHE+yVCrPz4DCVa/O+TpSoxVGEyvDpo9Bv7IWa6DG3SQfOR5x/ESP8TU3H7wxRhl3Yyfzm3zZdH2q4Qurj24oxS7LBkufGxa4liRt/UqIohxHLPZgUc9zlakXrsIt+sOBlLzNhWE1YwnkyFd+v3P2UUZxHTLBtdwoHP1+A1eh+iBcp0vOvEWJtnmfwxqWthuej/pLue9khRU9PIcFzJOEVhY+ICv221HcxUJFPklVbR6SFOlI06nEa9wkbupjQiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB5149.eurprd04.prod.outlook.com (2603:10a6:803:54::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Wed, 3 Feb
 2021 06:47:35 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093%4]) with mapi id 15.20.3805.024; Wed, 3 Feb 2021
 06:47:35 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	xiaobo.xie@nxp.com,
	jiafei.pan@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v1 2/3] configs: ls1043a-rdb: add DPAA support in linux inmate dts demo
Date: Wed,  3 Feb 2021 14:50:56 +0800
Message-Id: <20210203065057.27914-3-hongbo.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210203065057.27914-1-hongbo.wang@nxp.com>
References: <20210203065057.27914-1-hongbo.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 06:47:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e82bff7d-6766-45a9-43cd-08d8c80f9686
X-MS-TrafficTypeDiagnostic: VI1PR04MB5149:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB514999B6AAD7473366AF5A9BE1B49@VI1PR04MB5149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3d4ZpUiVMgnMStnBTm1S0LmXH6FEkwfItF3BokqOC2Xa2Xei8eQr7gDJ/XS935ir5Oyl+9fbDMweV70FJdTJrbF4FY/JTcKG46mIQ2nHBjEoU9gxFLvpC2CEDDi7uZbpK+7ga64QnxASIC9AONj5bUINYm5/vjaS9CGvxTKdMrQp9hZJ9iLITXCsPO2EQKXsgo59OlNyY3pJR0m66oEsQn+N52b+56iVJANszm890fDqsR7eN6f0lqyBSOXs+FI3rU617GkPzkt1k16xr/76U40yfOF4PfTqAZSocdVm8D6TyAhNzWSymo7KqCufzPZJd/Ia7+1C4eQywIVY8Ls4DfFenbe3Q/L9ndf/b9Wz09c03NrbHazFFO5Uqy0tRvRm+jZS6QzYQCh2mnjjTH0bVAfOFLJYu5p4E4VACvX1zaXysQHJVCvHHYieIvPT6OZ6gvCDUYQr70idkjPjnpfbDUtkhBhitkyXaiCudFAhxkTwdxrma/Xv40wvHZZ3S23LElt634H69sGd7hxuW6Q19Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(316002)(2906002)(5660300002)(9686003)(8936002)(26005)(8676002)(6512007)(86362001)(186003)(30864003)(478600001)(16526019)(66556008)(1076003)(6486002)(6506007)(83380400001)(6666004)(36756003)(956004)(66946007)(52116002)(2616005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YcraZAQwn/RA87lc4FWPBcCgZ63Pi4RfSERCemKLm+4j+qhdlGbsyTTlUe3S?=
 =?us-ascii?Q?Q/XRCGx17lgt0fqUWC713sbhFUii6f43+wI+ZsjZGxvFkK+xf4icrsg5b36i?=
 =?us-ascii?Q?ixsLmyMu6Xo/leFxCMB7+OFGRrF3ygfQr1NdSzcP8uAkdSiv2HbN273CnqQ6?=
 =?us-ascii?Q?I/b+qtw6iVAVDqMnnTEjYRnpWpxkYtxic8KZA6HCRgECX2X/zEK7OPFveoWi?=
 =?us-ascii?Q?AsOmvstMedL4Qqq9wXG1rVIg8MOmcU2w4OrRks4yBHfUHBmKiUKex23TvlA7?=
 =?us-ascii?Q?gFVrqH91hPqeSsUb4WgK7ETOK3+cIrwnKXhJ5sb+Xe0ppTykvqJlOKvoY2o8?=
 =?us-ascii?Q?Z8FHOScTwj42OnciC6i1FRkqzI+0Ax3c17xEBgs2MnD4xNrO8jnYtqxhfcdh?=
 =?us-ascii?Q?MhO0iE9fBG7r0hNWN8b0UaltydXbnbFmiHuCsGPzCLiDcYmrYUf9VHipqsnx?=
 =?us-ascii?Q?rXFD6TXVsAN7dRSl2UkbfvfYmAkpuz69uWb6EL0kp+N6FTRWZEd03+AQvvZt?=
 =?us-ascii?Q?M70XdLI0+Sj6Ip71gd1XE0WHKayYqIU9c/DfQf5FHsp/XdqzC4t+eI83d9Sx?=
 =?us-ascii?Q?qdFD6or4BPC00mogtJptWfdnI06JaSWSECOMyC9xeuPuzmHKe8zdrOdFYBI/?=
 =?us-ascii?Q?EfaXffgqp6GJuUX7cl4VnLYkslnG+sVzQYYRUcY4eISTBgDWcafut0K7mPQh?=
 =?us-ascii?Q?PK6fkmDNJMZkwi06lzl6WaWV5nwftXpH4xAheoDuthklW7Gz6cUWdy8mGOwg?=
 =?us-ascii?Q?iCHRKRsrMeuV4RS9jv2uW+ij/tL4qwbFEcWNm2QE5kAtdiaGKphzgKglug3a?=
 =?us-ascii?Q?Q6HQ54YO6F8B8rFDpA78bqUU/oeVPDF2IAea0c9+yqhu6f15VwaMq87Wybij?=
 =?us-ascii?Q?mgJCXUKWzQUtMRGSdBhAgnE7Hre3V5hM4P+j9Y2IuvIitzAl/6t3V9iz4Axm?=
 =?us-ascii?Q?+rCCag4c6hFYtAtlScPgC7ETDyP27lSmhjseCHGW4gur9kOi4Jp9bxjDq/Xt?=
 =?us-ascii?Q?iuHb7PJhD9xfs/XUw6gvW2k6IBwOxwNyeVYW4K4y6+jcY6F+YqEjPY2KNtfc?=
 =?us-ascii?Q?IXmjWCMh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82bff7d-6766-45a9-43cd-08d8c80f9686
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 06:47:35.2928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtVn6Wdt9RmqRDOJD95r+5PjA5IZ7S7xKs2TH1/1hRpQJKIAKVZ7cSxukk7F80QS+URC3Kp15GPSK4N4WbLF0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5149
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=XbVuENDY;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.14.82 as permitted sender)
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

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
---
 configs/arm64/dts/inmate-ls1043a-rdb.dts | 767 ++++++++++++++++++++++-
 1 file changed, 761 insertions(+), 6 deletions(-)

diff --git a/configs/arm64/dts/inmate-ls1043a-rdb.dts b/configs/arm64/dts/inmate-ls1043a-rdb.dts
index eb8bc172..34629a41 100644
--- a/configs/arm64/dts/inmate-ls1043a-rdb.dts
+++ b/configs/arm64/dts/inmate-ls1043a-rdb.dts
@@ -24,6 +24,14 @@
 
 	aliases {
 		serial0 = &duart1;
+		fman0 = &fman0;
+		ethernet0 = &enet0;
+		ethernet1 = &enet1;
+		ethernet2 = &enet2;
+		ethernet3 = &enet3;
+		ethernet4 = &enet4;
+		ethernet5 = &enet5;
+		ethernet6 = &enet6;
 	};
 
 	cpus {
@@ -74,6 +82,33 @@
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		bman_fbpr: bman-fbpr {
+			compatible = "shared-dma-pool";
+			size = <0 0x1000000>;
+			alignment = <0 0x1000000>;
+			no-map;
+		};
+
+		qman_fqd: qman-fqd {
+			compatible = "shared-dma-pool";
+			size = <0 0x400000>;
+			alignment = <0 0x400000>;
+			no-map;
+		};
+
+		qman_pfdr: qman-pfdr {
+			compatible = "shared-dma-pool";
+			size = <0 0x2000000>;
+			alignment = <0 0x2000000>;
+			no-map;
+		};
+	};
+
 	sysclk: sysclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -113,7 +148,6 @@
 		#size-cells = <2>;
 		ranges;
 		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
-		dma-coherent;
 
 
 		ddr: memory-controller@1080000 {
@@ -121,18 +155,15 @@
 			reg = <0x0 0x1080000 0x0 0x1000>;
 			interrupts = <0 144 0x4>;
 			big-endian;
+			dma-coherent;
 		};
 
-		scfg: scfg@1570000 {
-			compatible = "fsl,ls1043a-scfg", "syscon";
-			reg = <0x0 0x1570000 0x0 0x10000>;
-			big-endian;
-		};
 
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1043a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
 			big-endian;
+			dma-coherent;
 		};
 
 		clockgen: clocking@1ee1000 {
@@ -140,6 +171,7 @@
 			reg = <0x0 0x1ee1000 0x0 0x1000>;
 			#clock-cells = <2>;
 			clocks = <&sysclk>;
+			dma-coherent;
 		};
 
 		duart1: serial@21c0600 {
@@ -147,6 +179,443 @@
 			reg = <0x00 0x21c0600 0x0 0x100>;
 			clocks = <&clockgen 4 0>;
 			status = "okay";
+			dma-coherent;
+		};
+
+		qman: qman@1880000 {
+			compatible = "fsl,qman";
+			reg = <0x0 0x1880000 0x0 0x10000>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&qman_fqd &qman_pfdr>;
+			dma-coherent;
+			clock-frequency = <400000000>;
+		};
+
+		bman: bman@1890000 {
+			compatible = "fsl,bman";
+			reg = <0x0 0x1890000 0x0 0x10000>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&bman_fbpr>;
+			dma-coherent;
+		};
+
+		bportals: bman-portals@508000000 {
+			ranges = <0x0 0x5 0x08000000 0x8000000>;
+			dma-coherent;
+		};
+
+		qportals: qman-portals@500000000 {
+			ranges = <0x0 0x5 0x00000000 0x8000000>;
+			dma-coherent;
+		};
+
+		ptp_timer0: ptp-timer@1afe000 {
+			compatible = "fsl,fman-ptp-timer", "fsl,fman-rtc";
+			reg = <0x0 0x1afe000 0x0 0x1000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clockgen 3 0>;
+			dma-coherent;
+		};
+
+		/* fman3-0 */
+		fman0: fman@1a00000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			cell-index = <0>;
+			compatible = "fsl,fman";
+			ranges = <0x0 0x0 0x1a00000 0xfe000>;
+			reg = <0x0 0x1a00000 0x0 0xfe000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clockgen 3 0>;
+			clock-names = "fmanclk";
+			fsl,qman-channel-range = <0x800 0x10>;
+			ptimer-handle = <&ptp_timer0>;
+			dma-coherent;
+
+			cc {
+				compatible = "fsl,fman-cc";
+			};
+
+			muram@0 {
+				compatible = "fsl,fman-muram";
+				reg = <0x0 0x60000>;
+			};
+
+			bmi@80000 {
+				compatible = "fsl,fman-bmi";
+				reg = <0x80000 0x400>;
+			};
+
+			qmi@80400 {
+				compatible = "fsl,fman-qmi";
+				reg = <0x80400 0x400>;
+			};
+
+			fman0_oh1: port@82000 {
+				cell-index = <0>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x82000 0x1000>;
+				fsl,qman-channel-id = <0x809>;
+			};
+
+			fman0_oh2: port@83000 {
+				cell-index = <1>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x83000 0x1000>;
+				fsl,qman-channel-id = <0x80a>;
+			};
+
+			fman0_oh3: port@84000 {
+				cell-index = <2>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x84000 0x1000>;
+				fsl,qman-channel-id = <0x80b>;
+			};
+
+			fman0_oh4: port@85000 {
+				cell-index = <3>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x85000 0x1000>;
+				fsl,qman-channel-id = <0x80c>;
+			};
+
+			fman0_oh5: port@86000 {
+				cell-index = <4>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x86000 0x1000>;
+				fsl,qman-channel-id = <0x80d>;
+			};
+
+			fman0_oh6: port@87000 {
+				cell-index = <5>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x87000 0x1000>;
+				fsl,qman-channel-id = <0x80e>;
+			};
+
+			policer@c0000 {
+				compatible = "fsl,fman-policer";
+				reg = <0xc0000 0x1000>;
+			};
+
+			keygen@c1000 {
+				compatible = "fsl,fman-keygen";
+				reg = <0xc1000 0x1000>;
+			};
+
+			dma@c2000 {
+				compatible = "fsl,fman-dma";
+				reg = <0xc2000 0x1000>;
+			};
+
+			fpm@c3000 {
+				compatible = "fsl,fman-fpm";
+				reg = <0xc3000 0x1000>;
+			};
+
+			parser@c7000 {
+				compatible = "fsl,fman-parser";
+				reg = <0xc7000 0x1000>;
+			};
+
+			vsps@dc000 {
+				compatible = "fsl,fman-vsps";
+				reg = <0xdc000 0x1000>;
+			};
+
+			mdio0: mdio@fc000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xfc000 0x1000>;
+			};
+
+			xmdio0: mdio@fd000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xfd000 0x1000>;
+			};
+
+			/* fman3-0-1g-0 */
+			fman0_rx_0x08: port@88000 {
+				cell-index = <0x8>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x88000 0x1000>;
+			};
+
+			fman0_tx_0x28: port@a8000 {
+				cell-index = <0x28>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xa8000 0x1000>;
+				fsl,qman-channel-id = <0x802>;
+			};
+
+			ethernet@e0000 {
+				cell-index = <0>;
+				compatible = "fsl,fman-memac";
+				reg = <0xe0000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x08 &fman0_tx_0x28>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy0>;
+			};
+
+			mdio@e1000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xe1000 0x1000>;
+
+				pcsphy0: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-1g-1 */
+			fman0_rx_0x09: port@89000 {
+				cell-index = <0x9>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x89000 0x1000>;
+			};
+
+			fman0_tx_0x29: port@a9000 {
+				cell-index = <0x29>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xa9000 0x1000>;
+				fsl,qman-channel-id = <0x803>;
+			};
+
+			ethernet@e2000 {
+				cell-index = <1>;
+				compatible = "fsl,fman-memac";
+				reg = <0xe2000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x09 &fman0_tx_0x29>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy1>;
+			};
+
+			mdio@e3000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xe3000 0x1000>;
+
+				pcsphy1: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-1g-2 */
+			fman0_rx_0x0a: port@8a000 {
+				cell-index = <0xa>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x8a000 0x1000>;
+			};
+
+			fman0_tx_0x2a: port@aa000 {
+				cell-index = <0x2a>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xaa000 0x1000>;
+				fsl,qman-channel-id = <0x804>;
+			};
+
+			ethernet@e4000 {
+				cell-index = <2>;
+				compatible = "fsl,fman-memac";
+				reg = <0xe4000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x0a &fman0_tx_0x2a>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy2>;
+			};
+
+			mdio@e5000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xe5000 0x1000>;
+
+				pcsphy2: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-1g-3 */
+			fman0_rx_0x0b: port@8b000 {
+				cell-index = <0xb>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x8b000 0x1000>;
+			};
+
+			fman0_tx_0x2b: port@ab000 {
+				cell-index = <0x2b>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xab000 0x1000>;
+				fsl,qman-channel-id = <0x805>;
+			};
+
+			ethernet@e6000 {
+				cell-index = <3>;
+				compatible = "fsl,fman-memac";
+				reg = <0xe6000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x0b &fman0_tx_0x2b>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy3>;
+			};
+
+			mdio@e7000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xe7000 0x1000>;
+
+				pcsphy3: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-1g-4 */
+			fman0_rx_0x0c: port@8c000 {
+				cell-index = <0xc>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x8c000 0x1000>;
+			};
+
+			fman0_tx_0x2c: port@ac000 {
+				cell-index = <0x2c>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xac000 0x1000>;
+				fsl,qman-channel-id = <0x806>;
+			};
+
+			ethernet@e8000 {
+				cell-index = <4>;
+				compatible = "fsl,fman-memac";
+				reg = <0xe8000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x0c &fman0_tx_0x2c>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy4>;
+			};
+
+			mdio@e9000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xe9000 0x1000>;
+
+				pcsphy4: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-1g-5 */
+			fman0_rx_0x0d: port@8d000 {
+				cell-index = <0xd>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x8d000 0x1000>;
+			};
+
+			fman0_tx_0x2d: port@ad000 {
+				cell-index = <0x2d>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xad000 0x1000>;
+				fsl,qman-channel-id = <0x807>;
+			};
+
+			ethernet@ea000 {
+				cell-index = <5>;
+				compatible = "fsl,fman-memac";
+				reg = <0xea000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x0d &fman0_tx_0x2d>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy5>;
+			};
+
+			mdio@eb000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xeb000 0x1000>;
+
+				pcsphy5: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-10g-0 */
+			fman0_rx_0x10: port@90000 {
+				cell-index = <0x10>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-10g-rx";
+				reg = <0x90000 0x1000>;
+				fsl,fman-10g-port;
+			};
+
+			fman0_tx_0x30: port@b0000 {
+				cell-index = <0x30>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-10g-tx";
+				reg = <0xb0000 0x1000>;
+				fsl,fman-10g-port;
+				fsl,qman-channel-id = <0x800>;
+			};
+
+			ethernet@f0000 {
+				cell-index = <0x8>;
+				compatible = "fsl,fman-memac";
+				reg = <0xf0000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x10 &fman0_tx_0x30>;
+				pcsphy-handle = <&pcsphy6>;
+			};
+
+			mdio@f1000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xf1000 0x1000>;
+
+				pcsphy6: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+		};
+
+		fsldpaa: fsl,dpaa {
+			compatible = "fsl,ls1043a-dpaa", "simple-bus", "fsl,dpaa";
+			dma-coherent;
+			ethernet@0 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet0>;
+				dma-coherent;
+			};
+			ethernet@1 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet1>;
+				dma-coherent;
+			};
+			ethernet@2 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet2>;
+				dma-coherent;
+			};
+			ethernet@3 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet3>;
+				dma-coherent;
+			};
+			ethernet@4 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet4>;
+				dma-coherent;
+			};
+			ethernet@5 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet5>;
+				dma-coherent;
+			};
+			ethernet@8 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet6>;
+				dma-coherent;
+			};
 		};
 
 	};
@@ -173,3 +642,289 @@
 	};
 
 };
+
+&qportals {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "simple-bus";
+
+	qportal0: qman-portal@0 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x0 0x4000>, <0x4000000 0x4000>;
+		interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <0>;
+	};
+
+	qportal1: qman-portal@10000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x10000 0x4000>, <0x4010000 0x4000>;
+		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <1>;
+	};
+
+	qportal2: qman-portal@20000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x20000 0x4000>, <0x4020000 0x4000>;
+		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <2>;
+	};
+
+	qportal3: qman-portal@30000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x30000 0x4000>, <0x4030000 0x4000>;
+		interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <3>;
+	};
+
+	qportal4: qman-portal@40000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x40000 0x4000>, <0x4040000 0x4000>;
+		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <4>;
+	};
+
+	qportal5: qman-portal@50000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x50000 0x4000>, <0x4050000 0x4000>;
+		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <5>;
+	};
+
+	qportal6: qman-portal@60000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x60000 0x4000>, <0x4060000 0x4000>;
+		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <6>;
+	};
+
+	qportal7: qman-portal@70000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x70000 0x4000>, <0x4070000 0x4000>;
+		interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <7>;
+	};
+
+	qportal8: qman-portal@80000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x80000 0x4000>, <0x4080000 0x4000>;
+		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <8>;
+	};
+
+	qportal9: qman-portal@90000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x90000 0x4000>, <0x4090000 0x4000>;
+		interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <9>;
+	};
+
+	qman-fqids@0 {
+		compatible = "fsl,fqid-range";
+		fsl,fqid-range = <256 256>;
+	};
+
+	qman-fqids@1 {
+		compatible = "fsl,fqid-range";
+		fsl,fqid-range = <32768 32768>;
+	};
+
+	qman-pools@0 {
+		compatible = "fsl,pool-channel-range";
+		fsl,pool-channel-range = <0x401 0xf>;
+	};
+
+	qman-cgrids@0 {
+		compatible = "fsl,cgrid-range";
+		fsl,cgrid-range = <0 256>;
+	};
+
+	qman-ceetm@0 {
+		compatible = "fsl,qman-ceetm";
+		fsl,ceetm-lfqid-range = <0xf00000 0x1000>;
+		fsl,ceetm-sp-range = <0 16>;
+		fsl,ceetm-lni-range = <0 8>;
+		fsl,ceetm-channel-range = <0 32>;
+	};
+};
+
+&bportals {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "simple-bus";
+
+	bman-portal@0 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x0 0x4000>, <0x4000000 0x4000>;
+		interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <0>;
+	};
+
+	bman-portal@10000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x10000 0x4000>, <0x4010000 0x4000>;
+		interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <1>;
+	};
+
+	bman-portal@20000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x20000 0x4000>, <0x4020000 0x4000>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <2>;
+	};
+
+	bman-portal@30000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x30000 0x4000>, <0x4030000 0x4000>;
+		interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <3>;
+	};
+
+	bman-portal@40000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x40000 0x4000>, <0x4040000 0x4000>;
+		interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <4>;
+	};
+
+	bman-portal@50000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x50000 0x4000>, <0x4050000 0x4000>;
+		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <5>;
+	};
+
+	bman-portal@60000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x60000 0x4000>, <0x4060000 0x4000>;
+		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <6>;
+	};
+
+	bman-portal@70000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x70000 0x4000>, <0x4070000 0x4000>;
+		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <7>;
+	};
+
+	bman-portal@80000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x80000 0x4000>, <0x4080000 0x4000>;
+		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <8>;
+	};
+
+	bman-portal@90000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x90000 0x4000>, <0x4090000 0x4000>;
+		interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <9>;
+	};
+
+	bman-bpids@0 {
+		compatible = "fsl,bpid-range";
+		fsl,bpid-range = <32 32>;
+	};
+};
+
+&fman0 {
+	fsl,erratum-a050385;
+	compatible = "fsl,fman", "simple-bus";
+
+	/* these aliases provide the FMan ports mapping */
+	enet0: ethernet@e0000 {
+		phy-handle = <&qsgmii_phy1>;
+		phy-connection-type = "qsgmii";
+		local-mac-address = [0e 09 00 01 03 05];
+	};
+
+	enet1: ethernet@e2000 {
+		phy-handle = <&qsgmii_phy2>;
+		phy-connection-type = "qsgmii";
+		local-mac-address = [0e 09 00 01 03 06];
+	};
+
+	enet2: ethernet@e4000 {
+		phy-handle = <&rgmii_phy1>;
+		phy-connection-type = "rgmii-txid";
+		local-mac-address = [0e 09 00 01 03 07];
+	};
+
+	enet3: ethernet@e6000 {
+		phy-handle = <&rgmii_phy2>;
+		phy-connection-type = "rgmii-txid";
+		local-mac-address = [0e 09 00 01 03 08];
+	};
+
+	enet4: ethernet@e8000 {
+		phy-handle = <&qsgmii_phy3>;
+		phy-connection-type = "qsgmii";
+		local-mac-address = [0e 09 00 01 03 09];
+	};
+
+	enet5: ethernet@ea000 {
+		phy-handle = <&qsgmii_phy4>;
+		phy-connection-type = "qsgmii";
+		local-mac-address = [0e 09 00 01 03 0a];
+	};
+
+	enet6: ethernet@f0000 { /* 10GEC1 */
+		phy-handle = <&aqr105_phy>;
+		phy-connection-type = "xgmii";
+		local-mac-address = [0e 09 00 01 03 04];
+	};
+
+	mdio@fc000 {
+		rgmii_phy1: ethernet-phy@1 {
+			reg = <0x1>;
+		};
+
+		rgmii_phy2: ethernet-phy@2 {
+			reg = <0x2>;
+		};
+
+		qsgmii_phy1: ethernet-phy@4 {
+			reg = <0x4>;
+		};
+
+		qsgmii_phy2: ethernet-phy@5 {
+			reg = <0x5>;
+		};
+
+		qsgmii_phy3: ethernet-phy@6 {
+			reg = <0x6>;
+		};
+
+		qsgmii_phy4: ethernet-phy@7 {
+			reg = <0x7>;
+		};
+	};
+
+	mdio@fd000 {
+		aqr105_phy: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts = <0 132 4>;
+			reg = <0x1>;
+		};
+	};
+};
+
+&bman_fbpr {
+	compatible = "fsl,bman-fbpr";
+	alloc-ranges = <0 0 0x10000 0>;
+};
+&qman_fqd {
+	compatible = "fsl,qman-fqd";
+	alloc-ranges = <0 0 0x10000 0>;
+};
+&qman_pfdr {
+	compatible = "fsl,qman-pfdr";
+	alloc-ranges = <0 0 0x10000 0>;
+};
+
+&soc {
+	fman@1a00000 {
+#include "inmate-ls1043a-rdb-fman-ucode.dtsi"
+	};
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210203065057.27914-3-hongbo.wang%40nxp.com.
