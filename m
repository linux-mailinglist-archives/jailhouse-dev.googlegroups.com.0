Return-Path: <jailhouse-dev+bncBAABBGMO7P7QKGQEQIXMLMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1490F2F4856
	for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Jan 2021 11:10:35 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id v187sf473795lfa.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Jan 2021 02:10:35 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1610532634; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ai6hravc/x9nHdLWWMjakMFiKIzQfbeilXVSJpTsOYK7qOMJNaofaoEIwFpoqnWWNP
         JqqlmYAvXak9za3a8HqO9tL9phL4VSxnIZV0m+RCuFTU9nniXTFbH5lbr4ay9U/Ko4oD
         02dsfha54pDnc5UrnNeYSAS2u7nRa2/eP/qa33s+hfWb5YudA8zd4aar9/ixE4tMUvO4
         OheYSV89jDLA5yQ6gEtU51WekDfhYSbMJuWtJ1uvMfTmeEvBjyKNxQeY6ohFHnCAxnSj
         xwwJ3TNWXUl999tiMk3dNz6UWLS/UjLLzCgn2n3nMRMyEiAyTDnpOeeIC77VzxoyJqR8
         +MWQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=0RkcvASTstlDKjX5H3Z7xBVlpUyb6u0AHEi6IluFxig=;
        b=l3LHCOlBnoxfU9rTwWepN3C7gb2kHSBN8Y4JejzV/5aL96TreuuOWYLbxlQKHqSpu0
         2wXjlbsDA6wYbxmcJ4iI87PU+1FCSF0XWJ9fZhxZVcAbpNu/9TtZtSQDqofqqL8xp9ZB
         3C8aABj/LTmeBFNsrlm+XwstKO0XWz5bnk8GdRul/BCYz7YDDmaBEF1rgLVCh+/Qq7v8
         wTKIL5JFl7YqX+F3dLamrP7kHw4v7lJ7LDjmdYpQcIHOriDEnmi+HMpMthngYALfUd57
         6ifQJRPNKPwgkY5IzJ0HtgqgKHGsOCdGrOYtMNnI7SK+IfZtbCmkEyK4JzYJxhryb6fT
         YANQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=DMC+vBBc;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.8.80 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0RkcvASTstlDKjX5H3Z7xBVlpUyb6u0AHEi6IluFxig=;
        b=OZyfqrldDYsSHMZr1vRxWSCp0Q3S0EOszdxFnVePe+WmnntAZux+VnwzUu1vjWzIkV
         Q6cH+YTqu8jpc4wXn9J871vEN/IXrnXKvzHJ4rZFzrBxAFRjr0+hOzOYEC/ydLZDuk7+
         /sIzAeOxmgW2w8bxMtZHWCld2fzKkrAd0MluNERym8MKffu1Iy4ZteH6hlZ7aiiW8nsK
         a1Fu2QtxXpfCTApZlbjO7QI8oEmjF+BjwljTQZHu9SA/UPiIt8fBRDA91lwidr/OI/a7
         Cw+NT9P7ddJ0Z77NRs4cShKfOCCO1TqykdYC5m1qIERQwD8rGgsihuVF3aDba7hCXXJi
         jW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0RkcvASTstlDKjX5H3Z7xBVlpUyb6u0AHEi6IluFxig=;
        b=PtTBAuSzSb0892GDYwsUimH86xY7hnLrGKCNi5KpIgbpFEaGAXHcN8qNEfNcJlfibZ
         DEpcwcSIl0tpi/bTh0IdTS+k3+Dy/zQDs7i2w9C3PccqF5nBg5jLIuZ6HQVqVNKdEpQQ
         cYRsLOkFEFmh07cbuMj17mTikPZJUeNI45oBANc7GPSlGsSgV4fAcsJugRKTbOzPi2WA
         q25d4KI7a1Fozcmt0o+zKoKDbTPPhTP6X3KHlnvNVJEJiBdNturkHL+j0FAcx9AhNmbR
         6whqdjsZl5Y+VkVzm7BVJuMVvG7Vom40CluOoJYSFt6bp3DcvKdrsKWuq91zG76OPdq1
         EIuA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530d3VgdQ7YR+TD3wfrzJGm6lvibJZLdMbMBPlwPgSBipSAWNGLn
	R1Vh2F3SZSHJ+x1U2tMhBIg=
X-Google-Smtp-Source: ABdhPJxD039z9Owk9TKwgfKKu5HwRI7vqO6KDxXI9usQQ3yClf5QT697CsziYuwxWopM4y6HB3vcfA==
X-Received: by 2002:a2e:8e3b:: with SMTP id r27mr643273ljk.196.1610532634539;
        Wed, 13 Jan 2021 02:10:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6145:: with SMTP id m5ls1203181lfk.2.gmail; Wed, 13 Jan
 2021 02:10:33 -0800 (PST)
X-Received: by 2002:a19:810c:: with SMTP id c12mr579771lfd.244.1610532633108;
        Wed, 13 Jan 2021 02:10:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610532633; cv=pass;
        d=google.com; s=arc-20160816;
        b=QOeAT6LvWpe+Y6UTv6WdNebsv+TGBHn8pUlQ2K5UCq+wbg344qhxiwET8Z5mgL12ei
         QGXSjLbQWVg6BT4htob0BmFQldB+tLgO2jzKuajcZebKLg+I+hcRIV0Bn1QkmZf+jrHR
         Xue/PHvEeH7f+zw2ljjt4x3Hpfcf6NIE/pJItzPyMKUZZAvGi8S4gFcDL8Scdi5AGf1c
         XeMwTrEJ2pcvKsiMI+109uJh7Kd1x04ySEVmSU/tZxQy58Lpcb9UVr1x72kUl64WcrNd
         Rnu0Zj7tdyJKVRcoT6t1dA2NKQTEyQch2dfW73Jg9u24vkHIVaIyL3t6vwPI9oikbLZa
         yBng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=oT2+tLvO6lV+OlGspwn5YtqfigvAJQ9ielaTNPoDJyI=;
        b=OriMv7+5U88Ri/0XjicyncYAB/eihU5vaY6isDDf4SQ7AEkZ029WkHCvco3SbZn93F
         1u8uGXAycYgB+j0KqgFs4XZAfweMlxbGARpOFGixSKTsh3/OLnCw5tW0A9KiGSHsQwwY
         2nL0NRSleRFZnJdHARYBpsrwBsD3BocMZkw2jSxlQDpT9vB8rVEhbCYcXS7Y/ogY/uXq
         ZtoGtN6ijMN/mi/SgNflSIHNWE0rM3LEFWKyopTeL7prI1rzOBX8wkB2Mgzoq7FMi6hz
         RCsQJZVvU4CtGHFtpJMIHe+CydOphNUuoBED0lNiGxtljJUL8gE8d99BDC7zP/B+f8Bb
         hC3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=DMC+vBBc;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.8.80 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80080.outbound.protection.outlook.com. [40.107.8.80])
        by gmr-mx.google.com with ESMTPS id e18si76498lfn.6.2021.01.13.02.10.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Jan 2021 02:10:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.8.80 as permitted sender) client-ip=40.107.8.80;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8v+mf4vEayoUusf4fZco5uACHR2RvLXzbGjT/akqJWrZCOUOUw/legybZQnXGSKlEUmszJ8BFrj8BMh+DiGND310CTluoPYwaAAEpJtZf9sQ0N1hIkUNDNG68S7ADeSDV3UHsffbiz0iUhruNrbhd0TReeTvIgLAv4pmEfrsQ3Jz4/LeGaGc770NLyVLOanRqAB+RiZwFSZHVvF9T2wCUysLaEuG2JA3pjsebtSZzetB94tT6WtGifRLpE/i6aaGknC6PRBTnqxYdZEyXamg2yQGXeE3r/ZCgjuB8MRbQuzZQ+gAspAJNv5i9W6H3mddIis58mL7JpNOTumXfuc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT2+tLvO6lV+OlGspwn5YtqfigvAJQ9ielaTNPoDJyI=;
 b=SCIYbocuU2VrhDda2qQbBm71PfeywO8tzhOox5TL65x8ZPR5n/dns8zFtnLjOsqfX6mGNmtyK5JHrMWKjLic8WuKPAV5NrB/IrJhO/7hHyrYIUNSZO8PpMDn2V4x1x3wg0T0NnHS3S7lawBTZgqnVq3W30oGJPfVpv+krEA1HOnJrbmX9AMV1oxcBTvPVqNEGzW0pQvkngp1r+HXIqeZid/uaBwE2KM5xt+RfiecjEmruhGmjuhSWvxcBFyIERlrgCAD4ERStqd0mQjBnFES0E7M7w/2SivvrLyLhSNLz2dTf0SB2XnBVd8ePKH9WuUti7KC0yrvYjaZ850giwfbDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB5658.eurprd04.prod.outlook.com (2603:10a6:10:b2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 10:10:30 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 10:10:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] virtio: ivshmem: check peer_state early
Date: Wed, 13 Jan 2021 18:39:46 +0800
Message-Id: <20210113103946.359-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SGBP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::34)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Wed, 13 Jan 2021 10:10:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fa135fc-4e70-4174-b4ed-08d8b7ab7544
X-MS-TrafficTypeDiagnostic: DB8PR04MB5658:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB565811024623BD5921C71CA2C9A90@DB8PR04MB5658.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQ/5j6ZTWjrFIKU+5t8uDaN4xeWOwbbfYC+dEPMp088uHiD3KgtFCDEkmChNsyRaIhYiOwiUEGFrlj3UZm6PXd6P7Rxsbm4g2dRABbPDVTQvxh8Uc6BfciSGcHRNEGpmwwm8u72q0SCi8J4DYHw9VSJW35xTCoNUbADp8em30/Gq4QybjRCnngZnykdD7Nsijz2dgeWiV74mWN/xjZkw087Q8Rx1ToN7fSs7AV3ZAnD2H9IYW3m12gZD9PCzPfLbqEZwFoLzSSrTswD8kLQ1fHcfSdMoT7C0jQsvtmDYU0eBc3fvHFWUWUc0JX65TlwCQ5lt6iKg8sfhn3rtWxhGWXvTaqgQWx0byOLZi5Oh3ZJ26yn2E2XR6769VVs68J22mB9ziYt/ysZwU6FtUNd9zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(26005)(2906002)(5660300002)(6506007)(1076003)(66946007)(316002)(52116002)(66476007)(6666004)(478600001)(2616005)(6512007)(4326008)(186003)(66556008)(86362001)(6916009)(16526019)(6486002)(8936002)(83380400001)(8676002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lL0MVlw4OSIjWmuQkmHSiCfS9g6ciQgnM7Y+MwX2ooi9jVep5MTctJf7ax99?=
 =?us-ascii?Q?cRd/sYuUIpOQIPp7hI0dyBRwjZwqU5xdlnvIQpfF2ZNPMfbQV/4szspCWFtk?=
 =?us-ascii?Q?l/8FliqUVtBZw1zWKIrRqDA8Tv8DGymq4MgW2tyGRsRYXhTcYxt2oNkmoxD1?=
 =?us-ascii?Q?kgpCkXyll9gWrtyFTTIA+nUXRony15b2BYy1xQQGpKjRtath9NjD/vWq6IL9?=
 =?us-ascii?Q?Erk85A1nDthFBcJxq5pRkh9wPN+ID/uruOeH8WAHMHnzf4Jpnose75CzkH+M?=
 =?us-ascii?Q?8b0NyEPTrHwcYsoBMo6X4kPje9TWsVAg59Ld9r5HnUwK8DEE28R1jRk5S08/?=
 =?us-ascii?Q?7fa/Jaf1xse0EQcqwIF43oGrYDMbXVV6E1s9VoNKldWD0gI28K84bGZl3smO?=
 =?us-ascii?Q?spqv47CKuEPokN3JJlUVfJHeutyK+BYF+u09m6BmDixHtiQB5AXAs5uwAsK5?=
 =?us-ascii?Q?OX4H6lkw5aEbOGZTg0/ORjXG3A5Ibc/3Em58cjTBNIZbtEWS1gt964KiPa6b?=
 =?us-ascii?Q?+L4EQs+/+jVaM5Hrk21psIjFXCjNJMN+/T+2+zPRD8Z79WWEF0KFesq41cFg?=
 =?us-ascii?Q?cvqEDgFrkXTRN43TRI1nMlUDCjyDBTn8xtcuj86jS30f065KRak8lXZenc7e?=
 =?us-ascii?Q?sTiylVMCZRCNMfX90pfXJUOvS7N01bdm26+y80bxgDevjl2lJqv8qG/iFjXN?=
 =?us-ascii?Q?YPFdfnbe7GWeuIBXBaiYlw3WcAsWpQEDC/9jAoeShTbfOiVOXi2CLqxEFevS?=
 =?us-ascii?Q?ZR7t01s3Ls85zMfdGWHcopt70XjR1qh2RuwYM8q26UQzzESmMyLnF5Fcgit9?=
 =?us-ascii?Q?1teNOkt31dK5iWzEj83ztIvozgE4JmOD3WkbXsXNLldHRSeYs/6yXlG5+66C?=
 =?us-ascii?Q?5OJYdZKNI7qsA8JWxckDlaymuvmoYqke8SJ8hw37kec9XALkcJLUUaUStoJp?=
 =?us-ascii?Q?/kL6Z/oDxKn1lzJw3AE/b4ZzUSGjhG+j9+OwJHBuWXMCf1stKB/I13bsEhsB?=
 =?us-ascii?Q?kWE1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 10:10:30.6653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa135fc-4e70-4174-b4ed-08d8b7ab7544
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kpch3g1KuS7FpvyVNvMiRQEN0h88nC1m5ECLzyJxSObkUpdOPw54JidaFii9IjvCqxKuf4FG0tQSZCju+RmMqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5658
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=DMC+vBBc;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.8.80 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

We enable the virtio_ivshmem driver and add
shared memory region including pci devices in cell file. But we not
start backend.

There might be garbage data in "vi_dev->virtio_header", so we need to
check peer_state to abort the probe earlier.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/virtio/virtio_ivshmem.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/virtio/virtio_ivshmem.c b/drivers/virtio/virtio_ivshmem.c
index bf62377790b1..7132cf0e25fe 100644
--- a/drivers/virtio/virtio_ivshmem.c
+++ b/drivers/virtio/virtio_ivshmem.c
@@ -846,6 +846,10 @@ static int virtio_ivshmem_probe(struct pci_dev *pci_dev,
 		return -ENOMEM;
 
 	vi_dev->peer_state = &state_table[vi_dev->peer_id];
+	if (*vi_dev->peer_state != VIRTIO_STATE_READY) {
+		dev_err(&pci_dev->dev, "backend not ready\n");
+		return -ENODEV;
+	}
 
 	section_addr += section_sz;
 
@@ -898,11 +902,6 @@ static int virtio_ivshmem_probe(struct pci_dev *pci_dev,
 
 	set_dma_ops(&pci_dev->dev, &virtio_ivshmem_dma_ops);
 
-	if (*vi_dev->peer_state != VIRTIO_STATE_READY) {
-		dev_err(&pci_dev->dev, "backend not ready\n");
-		return -ENODEV;
-	}
-
 	pci_set_master(pci_dev);
 	pci_write_config_byte(pci_dev, vendor_cap + IVSHM_CFG_PRIV_CNTL, 0);
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210113103946.359-1-peng.fan%40oss.nxp.com.
