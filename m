Return-Path: <jailhouse-dev+bncBAABBAOKQ37QKGQE43ZNBUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDFA2E06EE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Dec 2020 08:49:22 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id a19sf15440790lfd.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Dec 2020 23:49:22 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1608623361; cv=pass;
        d=google.com; s=arc-20160816;
        b=NUrb5E59FOqAXXhr/5gFUq2qGq3TQ7X2j0GZzGyXwsf+A8n/gFPUlXoAlQ70BBc4N+
         9ow6eUUsONUET+kSm/CYoeIQrk9S6Ks47BDGOzWccdMqlnXXNA4QseFG198MlSATc+vx
         hFlJxq2OEUyeAy/qc4OUTl1p4FyB+sbF+W9/0I1qYEHV6uDFwDyZTB1312D6nxG0RFtG
         41oxS6UHXBU5QmVccJEEB3vu9Y0IyNKL8DT7bI5Oc837Ex+LZ18J7c9pfUWk3a0KKPHE
         eWkeYqzaZhIWxRrOwLrL635W6ecisQvCGDlzoGU4tJpMzDhpsXiLvG9pqWxCB8QdIHw2
         iRVQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=TC3QXdtctPKanVgD9W/EOh/cQD3w4WEnEEKv+WeM80Q=;
        b=IppUSM3OoTvHU7BH5cZrfgjFBskR3bRur0KCz/zZcepzfs8XN/PY4atPWomDIJhXDw
         rA9Vl0Ot3SVWJ1RTMsMyjZrHZZqrJfYzh0EJZCaViCyLRcPqc1gtJnxUpYDJVVOhCYNh
         5n2UuRZgnU1wsvK5jhxrsyRtHMjbNPTQwu+LFLa+AfioWGbLUJHRmUn/X1KRishaV8kA
         w1pO0ntJ7eyPq7Qy7VIqzzFJPaXylVf1cNcarQ7f9Kzo5p+u5U/Lq61+k3+EHq9G1ZVS
         L0zLRFTiSeaa7O4l9VCvcNEUzSWCcsgL95AmhFQTdIWvBc9sFeVYoaSPJAVEi8fJu566
         Gabw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=e0ED1AhF;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.78 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TC3QXdtctPKanVgD9W/EOh/cQD3w4WEnEEKv+WeM80Q=;
        b=lFfN4liyd54gE29tsgtBcGOe8i8XF2gNIMT2Avq+R0DNZzfzJo3EyEHDZdZnXk6lvI
         wGrZcd979qPCIkEvzrG98HbqamwXGM5Umhr+glvh4bQ9czbmsvUPb9hs+5xw6xrMI24E
         yFT1gHQnKDKdmLH31XmQ/2DpHx523SSWAVST55zJQ4YIfrMfjgeKlH4c7KzLzolg0y99
         sXtYEm+TPClUWf7yeH3Hg5Y7YqCkXriE0Zyva38GptXG+1Q7u1fa+AEulg9TfIXTxEob
         oE4kHz9y13LTr7BGJ5bDywAiwsN+SKnfysFbh9gLLpYwMr003Md26zhWYubjd7WVXHyO
         X3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TC3QXdtctPKanVgD9W/EOh/cQD3w4WEnEEKv+WeM80Q=;
        b=Pmt4wr2S8ob3wf0UIwpR7Y1VgzPBO5G5z8I0wr6A90FkKIAyuxMmxpkTTklT8XWMUi
         jpmwhiGuNj2NIF2ciWoUknuK9iDU6VMSOxX2xF9Tn93KnTIXbKk/azCid3DJCLMN0why
         nu69H3EY2/mg/mRbe9tkx/8OF2CXuuWJ/U0l9ceVSKk0WDEVce2e7easL/+qML8dLUuB
         VgMrbqR4qnKQWJn+ZLpdRHtI4jZNzxZZAx/xCZH1IjmcP0mtxkwVdBFCzByrnIXqa0tY
         qYjHegWkW6ixxT4cWT9ckw6xgyD/HPDkDoJqGtFrVqK6FOocuf4N9wmLgwdyN7Z4Sqnv
         bcVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53085fqvsL/P6XPHeNhs46OH4EkO7YxoOE1kUgRZzM+dVg6kBD3F
	7wXxy4H7iYHgPMNS+WyQJAY=
X-Google-Smtp-Source: ABdhPJzy229wnhvtV/12Z4MYKx8CgFNJ7jzkghfhEbfhrytmknv/kIVVvV8BHx2OfITs81ZWeNsLWQ==
X-Received: by 2002:a05:651c:542:: with SMTP id q2mr9529939ljp.19.1608623361740;
        Mon, 21 Dec 2020 23:49:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c886:: with SMTP id y128ls1215516lff.0.gmail; Mon, 21
 Dec 2020 23:49:21 -0800 (PST)
X-Received: by 2002:a19:8112:: with SMTP id c18mr7959365lfd.455.1608623360931;
        Mon, 21 Dec 2020 23:49:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608623360; cv=pass;
        d=google.com; s=arc-20160816;
        b=qHM4y0H4aCQ2EyM+Yio7rDmLpnpXsANIV0ycGWxY0iUoS9Cy9WLigjsbP638h1dogc
         KB6Bn7/TFNX6QTPCiW0APtAwU2ICjMESOHD9hS4xVzn6jdd169W8+CWs4Vv1pFtVJ1zT
         4+bMcTjqkzdnn1um+F2Yeq7XhgdEP3MO2uDWmF13JLBsWawi3GJ3dNSVSCzBl3WQvt02
         e9KZJ1TCvEXHzNgZ0gcfLPJT5QTo38VRfdt9AI0JOxVR4Ni4ndPDpLkvZVPs0ZI9/LW1
         cZgTd7AHeX0o6gPwN2BUZqEn8CyduOJE/4lCELTUWWyxUsuZz1ZNjt6FCr/HZRjl5TGO
         GkdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9ZPzyC0W+Px6q+T8jvEKajWEFPePtK+ZeDvziJHurtA=;
        b=NOspc8YFuQhxbQcNNLAdF/949/E4u/3e7znoDBp/zMgt2/Rf9d+HgYKmruOb2CcXrF
         GfydUYLNyCjGD7RMZI/xXQoGLrBN6vmIJDCvnGqPPgp8AFHLg6u9LWbKci/2XPtQqxQV
         JJqqUgQ+/D1QnzbXdS9VBDdsrZPbuBp6Q2J/tEWvvxyxvQ3svJoTc5iruAwuVNhAIbzY
         3+dV3RbzUEVY3rYnS7yTKM8D3xM+XWG24UDmoM9A1LKJ+AoTgD/VxuQvhNcya0l8siSE
         VZNfk7Hz3ssZSQyzAQtF24PuMkNYs416Aulx6dFnwsXRXkz2HgTWICcA4+UvwhoK88bg
         I1Bg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=e0ED1AhF;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.78 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com. [40.107.22.78])
        by gmr-mx.google.com with ESMTPS id 207si678754lfm.0.2020.12.21.23.49.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 23:49:20 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.78 as permitted sender) client-ip=40.107.22.78;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzNBOhVYkrwwIHBA+BPfK2b41FIE9ol+O+IMRn2FEpROJ5m1F1HpybqaXN52cnD9ySboOEQH3BgzABhWwwRqzeruYaN2Z9gQxzKH354QBhxOa39hy1NoK3pxa2UpV7WApaiBY/MsqjuLQO3rzBw11ubVg1oBw6P2lOwxsL46RQ/sfYWu9+LU1SdyOFVcXNSAw0bUvHC6dQTooWe8U1nuj9ktGGZwpl4JpxQ0wveGIJQUvDiLuIObq8OW6bLKg7Nr9x3h8K13nS0DISqjheoyTAHWtu/7/nnv+StEcfpIlFfgjZLgEQXpQxku1kHCnTOfJ/uKewDx+jqcw/RIka3qyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZPzyC0W+Px6q+T8jvEKajWEFPePtK+ZeDvziJHurtA=;
 b=ZmLzQb2wZtvG5CrwNHN0OXvnuz6zJWSNevqBKcWimrfwMYizVIFdhJ9KwuGFarm/fF3FqeXVCp/7ofP7JdzWpJeWMaqA0ECHoi9SGI3WgnI0b8ZrVzm5N+pPK1C3b4/qJ3JxoKqLW6c/5TkI5w7cGdJkqvVziwxyauLA6dxcCvga9CrCQKAsXD+iYHX0cuiYhtMKv3LphgAISeiljs4T73DhTzLO2zJVG73Bzd/SNa732WJbZfpfC5BfoaPmd7twrV6+8DA8ehlyGA9zotTCf/SPr8KtTyOCGKSmxKi8bSxDCKOPz42tgmGAGLukmL8MtJV6TElGboupCsThWrJybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB4013.eurprd04.prod.outlook.com (2603:10a6:803:3e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 07:49:03 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565%7]) with mapi id 15.20.3676.031; Tue, 22 Dec 2020
 07:49:03 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	xiaobo.xie@nxp.com,
	jiafei.pan@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v3 1/2] configs: ls1043a-rdb: add cell configure files
Date: Tue, 22 Dec 2020 15:51:26 +0800
Message-Id: <20201222075127.3777-2-hongbo.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222075127.3777-1-hongbo.wang@nxp.com>
References: <20201222075127.3777-1-hongbo.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR0401CA0011.apcprd04.prod.outlook.com
 (2603:1096:3:1::21) To VI1PR04MB5677.eurprd04.prod.outlook.com
 (2603:10a6:803:ed::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR0401CA0011.apcprd04.prod.outlook.com (2603:1096:3:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30 via Frontend Transport; Tue, 22 Dec 2020 07:49:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a771116-15cc-4749-5e4f-08d8a64e0d54
X-MS-TrafficTypeDiagnostic: VI1PR04MB4013:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4013ECD764BDFF0F5626F6F8E1DF0@VI1PR04MB4013.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B66TjuZyvKTYtUalxKYOKd3v7IzCOcr9eIEViGMxmzxcbuaSuW5+xLRjlY1GV0yAgPR1+94oj6kEIvHrIv4vyYi1c5M4wUN+/hNaz+xeIICuL/uugXjz/83gtMbA+o2rfsdeXmhSjnrzHj5GyPZMgtYrvc/iek7MBSOIBWZ7aLQw5GpNtF+z3ZNhK9LudRcfocDvNPmrcalsD7EcjRSqjXHML0AqtDUbxy3aCqHkuCAwVT3Vx3bdrFgmoeTO9dwlmguXy26L0KN3Ag7xPTdo93sYK77XLCZq6JprPpv5cRw1QfC5jajYCnt1PgrMCb9pEoAOUtq2u9pClP2mgwomTrsLvltmQOxZpajvqeNcnvlzp/vnfhdWypOdJYic4tkWVyx/R3PVH4Cy4U7GATUc2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(36756003)(1076003)(2906002)(9686003)(8676002)(6486002)(26005)(6666004)(186003)(8936002)(16526019)(5660300002)(2616005)(66556008)(52116002)(956004)(30864003)(6506007)(66946007)(316002)(478600001)(83380400001)(6512007)(86362001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QYR9I4+mcgQXcVccB4o5IhHida/6iB/3EuRgVxrwSBKzeJupoXL2bcPMsxdV?=
 =?us-ascii?Q?d6UU1Cn4mh3ibgtFK/zKkcPi/K3QzcaYSNiHFW0aAYOHBGPwIiwf/yyETRjE?=
 =?us-ascii?Q?1BGjqu86cI1wV8LlNfiMVwIDM/mU4MQYmxqe82Xbw3HCXgQDv0ch6cgwo6x7?=
 =?us-ascii?Q?vQlMpy/s850f5kEWU5PcexyxjoLw1AHitB+Rj8BqexfMYAMX7ueK0Fa8Z2m0?=
 =?us-ascii?Q?zGohj3FkQJdGchHUD/x7kj88NVjueThXua7V27ofBytyDtCjC4ZBp9PD+16x?=
 =?us-ascii?Q?DGQFzbsPHi402McO+2CEBDHA5T1s29pIhJPos4tS49nrUS5QDO6VSMeSRj6j?=
 =?us-ascii?Q?NHX1TFo8YWGIH+rXMn848qHj8HCy4bgv7NW6jP1IPEiyBTqn9XZLKcvBMmto?=
 =?us-ascii?Q?dtSCiP2c4m0tZEM+bEWs0KBGp/tzk2D/r50lmFDWigsDaC5GihBDfJD9J7gn?=
 =?us-ascii?Q?iVsTyrFtDeX2sLAe03dVCFH/mShslxXzv44Wvf+7x8TvZXHs7GioyutOoU28?=
 =?us-ascii?Q?gLSslgFnnzQgE/puWH3Jv1T3TqaGw/gzJHykmtBeZV57CB2BoJqTZMsZlPRM?=
 =?us-ascii?Q?C8H8eS3cbu+g+9C817txV1+uA+1sM478ZOlDXwK3Ci+G++FUjHpiIOUSwpfY?=
 =?us-ascii?Q?CcJrSL7iAUtEVRJlCR+1n5kiphzpriELgrDer7hBZqoekuX/RucY5Vpo8V7Z?=
 =?us-ascii?Q?Thb9L9r990VUWmg9wYne/GncWhvjc973xUQGuegYL2YACk3kGr5FG/y4ejgq?=
 =?us-ascii?Q?EzehrNqEgVS5kc4EHnJJmKG5D23EXHXl6SXbdsuYxJI8EwyxHxLfrmNOYdyj?=
 =?us-ascii?Q?5g+mpMsFAyCHh/ACU12gO7cLT2VCknyeVoiwc2q5YF4umYkUI/1ud9XUPrwx?=
 =?us-ascii?Q?3hv/OYDyQwrexRrW/FDeGLSA1XdyK0UDTjAVEDN2gRu8r8atqd8ALPqKIA1l?=
 =?us-ascii?Q?p/RANzE3dzuhYjxNFumJ5PpeBogSukQomVn3WgcEqsutItYYlYwWKcx8E06k?=
 =?us-ascii?Q?+fpc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 07:49:03.2828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a771116-15cc-4749-5e4f-08d8a64e0d54
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B70qJCwqy9uzUFFhrijbwXCmVjXjdPnnqnCjHFepDFwYHhrdYJhMCBOxMqtCkmL0I0VC1FOY3xe3lt6ZeGpEVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4013
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=e0ED1AhF;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.22.78 as permitted sender)
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

Add root cell, inmate cell, and Linux demo cell configure files
for NXP ls1043a RDB platform.

GIC base address of Rev1.1 are different with Rev1.0, default configure
files are for ls1043a RDB Rev1.1, if want to run jailhouse on Rev1.0,
should change to the following:

.gicd_base = 0x1401000,
.gicc_base = 0x1402000,
.gich_base = 0x1404000,
.gicv_base = 0x1406000,

/* irqchips GIC-400*/
.address = 0x1401000,

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
---
 configs/arm64/ls1043a-rdb-inmate-demo.c | 138 +++++++
 configs/arm64/ls1043a-rdb-linux-demo.c  | 165 ++++++++
 configs/arm64/ls1043a-rdb.c             | 496 ++++++++++++++++++++++++
 3 files changed, 799 insertions(+)
 create mode 100644 configs/arm64/ls1043a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1043a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1043a-rdb.c

diff --git a/configs/arm64/ls1043a-rdb-inmate-demo.c b/configs/arm64/ls1043a-rdb-inmate-demo.c
new file mode 100644
index 00000000..25645745
--- /dev/null
+++ b/configs/arm64/ls1043a-rdb-inmate-demo.c
@@ -0,0 +1,138 @@
+/*
+ * ls1043a RDB - inmate demo
+ *
+ * Copyright NXP 2020
+ *
+ * Authors:
+ *  Hongbo Wang <hongbo.wang@nxp.com>
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
+	struct jailhouse_irqchip irqchips[2];
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
+		.vpci_irq_base = 60 - 32,	/* vPCI INTx */
+
+		.console = {
+			.address = 0x21c0600,	/* Uart1 in DUART1 */
+			.divider = 0xd9, /* baudrate: 115200 */
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				JAILHOUSE_CON_REGDIST_1,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xc0500000,
+			.virt_start = 0xc0500000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc0501000,
+			.virt_start = 0xc0501000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc050a000,
+			.virt_start = 0xc050a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc050c000,
+			.virt_start = 0xc050c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc050e000,
+			.virt_start = 0xc050e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 2GB DRAM1 Space */ {
+			.phys_start = 0xc0900000,
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
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (60 - 32), /* vPCI */
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				0,
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
diff --git a/configs/arm64/ls1043a-rdb-linux-demo.c b/configs/arm64/ls1043a-rdb-linux-demo.c
new file mode 100644
index 00000000..afc10ede
--- /dev/null
+++ b/configs/arm64/ls1043a-rdb-linux-demo.c
@@ -0,0 +1,165 @@
+/*
+ * ls1043a RDB target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Hongbo Wang <hongbo.wang@nxp.com>
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
+	struct jailhouse_memory mem_regions[16];
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
+		.vpci_irq_base = 60 - 32,  /* vPCI INTx: 60,61,62,63 */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xc0500000,
+			.virt_start = 0xc0500000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc0501000,
+			.virt_start = 0xc0501000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc050a000,
+			.virt_start = 0xc050a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc050c000,
+			.virt_start = 0xc050c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xc050e000,
+			.virt_start = 0xc050e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xc0600000, 1),
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* clockgen */ {
+                        .phys_start = 0x01ee1000,
+                        .virt_start = 0x01ee1000,
+                        .size = 0x1000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+                },
+		/* dcfg */ {
+			.phys_start = 0x01ee0000,
+			.virt_start = 0x01ee0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0xc0400000,
+			.virt_start = 0,
+			.size = 0x00010000, /* 64K */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Top at DRAM1 2GB Space */ {
+			.phys_start = 0xc0900000,
+			.virt_start = 0xc0900000,
+			.size = 0x33700000,
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
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (60 -32)  | 1 << (61 - 32) |
+					1 << (62 - 32) | 1 << (63 -32), /* vPCI */
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				0,
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
diff --git a/configs/arm64/ls1043a-rdb.c b/configs/arm64/ls1043a-rdb.c
new file mode 100644
index 00000000..892dc444
--- /dev/null
+++ b/configs/arm64/ls1043a-rdb.c
@@ -0,0 +1,496 @@
+/*
+ * ls1043a RDB target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Hongbo Wang <hongbo.wang@nxp.com>
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
+	struct jailhouse_memory mem_regions[61];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xc0000000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x21c0500, /* Uart0 in DUART1 */
+			.size = 0x100,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_1,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xc0700000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = -1,
+
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0x1410000,
+				.gicc_base = 0x142f000,
+				.gich_base = 0x1440000,
+				.gicv_base = 0x146f000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "ls1043a",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 67 - 32, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0xf,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xc0500000,
+			.virt_start = 0xc0500000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xc0501000,
+			.virt_start = 0xc0501000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xc050a000,
+			.virt_start = 0xc050a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xc050c000,
+			.virt_start = 0xc050c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xc050e000,
+			.virt_start = 0xc050e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xc0600000, 0),
+		/* RAM - 1GB at DRAM1 region - root cell */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DRAM2 6GB */ {
+			.phys_start = 0x880000000,
+			.virt_start = 0x880000000,
+			.size = 0x180000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM: Inmate */ {
+			.phys_start = 0xc0900000,
+			.virt_start = 0xc0900000,
+			.size = 0x33700000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM: loader */ {
+			.phys_start = 0xc0400000,
+			.virt_start = 0xc0400000,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DDR memory controller */ {
+			.phys_start = 0x01080000,
+			.virt_start = 0x01080000,
+			.size =	          0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* IFC */ {
+			.phys_start = 0x01530000,
+			.virt_start = 0x01530000,
+			.size =	         0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* QSPI */ {
+			.phys_start = 0x01550000,
+			.virt_start = 0x01550000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* esdhc */ {
+			.phys_start = 0x01560000,
+			.virt_start = 0x01560000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* scfg */ {
+			.phys_start = 0x01570000,
+			.virt_start = 0x01570000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* crypto */ {
+			.phys_start = 0x01700000,
+			.virt_start = 0x01700000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* qman */ {
+			.phys_start = 0x01880000,
+			.virt_start = 0x01880000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+                /* bman */ {
+                        .phys_start = 0x01890000,
+                        .virt_start = 0x01890000,
+                        .size = 0x10000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* fman */ {
+			.phys_start = 0x01a00000,
+			.virt_start = 0x01a00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* qportals CE */ {
+			.phys_start = 0x500000000,
+			.virt_start = 0x500000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* qportals CI */ {
+			.phys_start = 0x504000000,
+			.virt_start = 0x504000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* bportals CE */ {
+			.phys_start = 0x508000000,
+			.virt_start = 0x508000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* bportals CI */ {
+			.phys_start = 0x50c000000,
+			.virt_start = 0x50c000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dcfg */ {
+			.phys_start = 0x01ee0000,
+			.virt_start = 0x01ee0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+                /* clockgen */ {
+                        .phys_start = 0x01ee1000,
+                        .virt_start = 0x01ee1000,
+                        .size = 0x1000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* rcpm */ {
+			.phys_start = 0x01ee2000,
+			.virt_start = 0x01ee2000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* tmu */ {
+			.phys_start = 0x01f00000,
+			.virt_start = 0x01f00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dspi */ {
+			.phys_start = 0x02100000,
+			.virt_start = 0x02100000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c0 */ {
+			.phys_start = 0x02180000,
+			.virt_start = 0x02180000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c1 */ {
+			.phys_start = 0x02190000,
+			.virt_start = 0x02190000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c2 */ {
+			.phys_start = 0x021a0000,
+			.virt_start = 0x021a0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c3 */ {
+			.phys_start = 0x021b0000,
+			.virt_start = 0x021b0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* duart1 */ {
+			.phys_start = 0x021c0000,
+			.virt_start = 0x021c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* duart2 */ {
+			.phys_start = 0x021d0000,
+			.virt_start = 0x021d0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio0 */ {
+			.phys_start = 0x02300000,
+			.virt_start = 0x02300000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio1 */ {
+			.phys_start = 0x02310000,
+			.virt_start = 0x02310000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio2 */ {
+			.phys_start = 0x02320000,
+			.virt_start = 0x02320000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio3 */ {
+			.phys_start = 0x02330000,
+			.virt_start = 0x02330000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart0 */ {
+			.phys_start = 0x02950000,
+			.virt_start = 0x02950000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart1 */ {
+			.phys_start = 0x02960000,
+			.virt_start = 0x02960000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart2 */ {
+			.phys_start = 0x02970000,
+			.virt_start = 0x02970000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart3 */ {
+			.phys_start = 0x02980000,
+			.virt_start = 0x02980000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart4 */ {
+			.phys_start = 0x02990000,
+			.virt_start = 0x02990000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart5 */ {
+			.phys_start = 0x029a0000,
+			.virt_start = 0x029a0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog0 */ {
+			.phys_start = 0x02ad0000,
+			.virt_start = 0x02ad0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* edma0 */ {
+			.phys_start = 0x02c00000,
+			.virt_start = 0x02c00000,
+			.size = 0x30000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb0 */ {
+			.phys_start = 0x02f00000,
+			.virt_start = 0x02f00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb1 */ {
+			.phys_start = 0x03000000,
+			.virt_start = 0x03000000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb2 */ {
+			.phys_start = 0x03100000,
+			.virt_start = 0x03100000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sata */ {
+			.phys_start = 0x03200000,
+			.virt_start = 0x03200000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie0 */ {
+			.phys_start = 0x03400000,
+			.virt_start = 0x03400000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie1 */ {
+			.phys_start = 0x03500000,
+			.virt_start = 0x03500000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 */ {
+			.phys_start = 0x03600000,
+			.virt_start = 0x03600000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 pf0 */ {
+			.phys_start = 0x036c0000,
+			.virt_start = 0x036c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 0 */ {
+			.phys_start = 0x4000000000,
+			.virt_start = 0x4000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 1 */ {
+			.phys_start = 0x4800000000,
+			.virt_start = 0x4800000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 2 */ {
+			.phys_start = 0x5000000000,
+			.virt_start = 0x5000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+		/* GIC */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
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
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201222075127.3777-2-hongbo.wang%40nxp.com.
