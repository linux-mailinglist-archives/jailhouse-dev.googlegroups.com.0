Return-Path: <jailhouse-dev+bncBAABBAOKQ37QKGQE43ZNBUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E52E06ED
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Dec 2020 08:49:21 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id c11sf15478622lfi.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Dec 2020 23:49:21 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1608623361; cv=pass;
        d=google.com; s=arc-20160816;
        b=IMJGxn6q/aF2JjOL+Pij6XovTUCHUZpmjFCNgEGU0wrsgpSsYFEnYxGV/Mtzz+mpWY
         f9HaltjaHpt+wDcBNAh4jy1mkDgMYLgtXCwDBT6opvAROo2TYj+5RpkZvVikU8DHeYGH
         x23T4Zo/JkqqGj7lKYJv1Rs0i5dGd/IJmsmOWhbDzlV2nm26zn3ZPTumwRhjmQC6BXs2
         qJr6bi/XmrCu2xFSyI1GnIP+1fnGklK8R3pcclfYnlLU2zX3r2iuy6dhIhgCn9EXi7jD
         AtzmRf3b7d5kkX75ls7C/E170mi+T1Qk4IEPHSfBSJseXY8GMgHtPTWkcbKT7XQB8sbB
         5SNA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=iQ7ASM2t1sWq2aC9iGKRkBSrG/6YhUEkH0lzjP2HNeo=;
        b=P2pAHSp4/rm0MB2xt7dtRmc5dEQjKG7/V76ob/J6dA11ifil29AzcahKul84bvBCNw
         MJHEt0O4ekBDTjPlUUwdbtv7Yzja+Wntg8qRshB3zYQcFBlTgMEU4AhnLGSDvZ6ZHK1U
         Voxh53ub+EcmkkjilTbylRcka0MFZ/bh+prMmsDxin1XjpG2Wo+YW8k+5VdAr1FL2Y/j
         BTSuymf7tGgeWnOYxPiokYrSS2TICNFRgY8mxR5Uvu7Wfd3ivm6wiRKEB+bCDvdRvOjl
         +ejE5f2fzX0VKFIqQ96GyGueXG0oFzCcql+Yy0ZskY/lheTeiAvCh8L4r1aKrDybcKpW
         ClRw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=R6ra7+ec;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.78 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iQ7ASM2t1sWq2aC9iGKRkBSrG/6YhUEkH0lzjP2HNeo=;
        b=tieSUK9iSLSkA+awZAUWojSYryfzj6b/aiDpZTvMpzEEL6KOrruBqnqPkMz+dGNhAl
         VbD3IpaM3ukCPwBcZyHBOF0UIoPq1i0zLF/GMf8FEV6Mf48Z2wCcYgPVoNooNKZrs5iW
         TSs+woTTrLzFTl2pjm8C7Do7sPzX1cf7JVxQIePX2K2gMy8Q9Tt8a0OC60Hfx5qiSi57
         39gU93pO+uyQgDosfrXuUGR4E65J6REKEMbnnVpfzgR6RhR0iXA1s7D14FEMZ1ozOgPl
         u/mmHG+z6mFiWCS6YTjc37IlXzqepPwty/yjEu3ERts7qmTFWMg5q26Y4lx1yXjvvuDM
         VS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iQ7ASM2t1sWq2aC9iGKRkBSrG/6YhUEkH0lzjP2HNeo=;
        b=jF/v1s5aHeJ6r8zsiUQ1ec3Sg09eg5vczuSN3JSNVrIwnSJW0rl7WwI7w3ImRdsTW/
         Y1CX6cBN/bb/42CkzEm8dkdjAdk6V0SOYEpf3BO4X0Hlp2INp9DTlIpMtILU/hiDVF9R
         e5T3b9NDvNtryYfNi9Vq0wopkGglfyQcHI8h8n+Q2/Dve0KF2XO+ZVIE58sP4VyzquLl
         mBgwcWd+ibLXDvdye1LeoXfAQ89SZfgbjPPwDMBYfYX2NgMMJniizbUeHOJSiG//ot3K
         6f0CEWhNzNMX8pkYLjLO0ciFQ2ghbaz64pP+6jol80q8/D02abv9er3ZN8YKoxOSgE0F
         TxcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qmHkmQF8aRdtCne/XQTEkgGEGWWe/56tOYeWVoUddzmYFeePD
	covtPas1jrxa68rz4fO1v8g=
X-Google-Smtp-Source: ABdhPJyzU/VnsfOGiXJPR5Ju4JaWJFDbR9TkHmtZbH0ch9Y6CF53+yv5JSYvIiKCzn1syLMkYgTXFw==
X-Received: by 2002:a2e:b80a:: with SMTP id u10mr9671501ljo.267.1608623361518;
        Mon, 21 Dec 2020 23:49:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:810b:: with SMTP id d11ls8622104ljg.11.gmail; Mon, 21
 Dec 2020 23:49:20 -0800 (PST)
X-Received: by 2002:a2e:b4d4:: with SMTP id r20mr9325669ljm.445.1608623360643;
        Mon, 21 Dec 2020 23:49:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608623360; cv=pass;
        d=google.com; s=arc-20160816;
        b=fRBSJPm8VXxClp/yrHkHFDH+60KUZTKD94jghn2yuNIdn+nb9quM8VspxxrlSXnLI4
         cTrjgTmj0GZOMTvDlGXOtyoBQp8Ir3k3glFUg5s6EGV4LAVJeSnnOy2U2C5giXoB7yOd
         x+87Z/9YZQ48dpM/yH49yzn8mRUt149T2gDlwmZ4/st3kY708YK+Ns5ID8Pjwsui8TvG
         4gwzDCd/vLXr8UNJ8R3sSDANOBc1XmJ3+CYQ6EgnyfTWTQyKgDjrn6L3cNL9MNioYkRt
         kwDqlzd2/uRQqlBD72D1XQ8PS5L6k3DjchY5YfGL1z0HEEfkPCl7CrxuXBV0h/mhE880
         yDkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=c5kZRu/bvYb8+yuQUSQcTMYoBrZ/5/ftJOWqmfK+SR0=;
        b=QuKESzTuJRtxrJlr09egBnSTAaLs3AVFlT8jvQc/5dxPIAtfogmJhxU3o0hdrjPx3i
         zpT8zdsO34iKtAzkrJzVIl10agv9wThgWS9HNlEOZ8NmmEz0xPwB57DLSyvCKuAn99JW
         BTguUL56buyrOxU32hZfPjVMyl5v3hLUEQmr8QwXMvaMfjx/pJIcs31pDfViuPvlRXxx
         FuaNJyyWSWI3BnaE8/E4UI/Fgt4iX3EExpOv7qa2djTLA2SQIKBxTNtCF3QJYHjiVtw4
         I1rLNUcyxifspCnmvzJAYXfdsK6Ky0y1oEF+6CiqkpbGwT4iDVbnCAThpGSiE5d5VXPL
         IgWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=R6ra7+ec;
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
 b=iyR2pnnnItthkaQb+5/AmJg80iV5cdn0h2+x+xAyBL7iEyTFRRhaMlowwozD9pYPhl9YFJh6xWIfLpDXk/kzLltCdDLnD3QtYeEDdPpSfnJ1NA+9x5ua3ChvfRDGiI1pj9AzH6e+qLK3ZNhx/FtOWoLjBFHl1mi7VPH+yGCXWHEvWexBXm8q7ZNmHFcc2M/26JirqsmeKuXVlly2mNFFxSx922R6kuRHzbej6dJxFfMOzsanyYKUo8Y0CcRvZad0L7ZVqVC+x0s+25QGj3waRhwDlGQX38hwQgm7P9TF4aGdC88PWaGon7reYA072CN9lhkwfTbklTFxNJChH6qYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5kZRu/bvYb8+yuQUSQcTMYoBrZ/5/ftJOWqmfK+SR0=;
 b=no0nXV/JZOfxK2x+zV8E2P3TzN13M0HbQ3EN70asRqJJ/gLL8pG1UFaPqxcYfbnTG3AppUOwsbyEYOs79ArWO+UFTtYKNzhtRMTWLIsQSo18DihCHfguZFHmaft2Jbs8nQRc3v82Il5AnWloyS0jXNxm1udO92JJBJeWYhej76qYfMSLZyRYuI/u+0o/Fy24ltHAGJF0iQjpKItqX/uft0GD7olW++NDmALp8Eb+E4m7tywLf4YXk6qJYO2rf23i5VFpVEZiZHhi/zt7x64PSBCWp4IxtcJ4mbV5+l7adlx2y998XCMOhUhF519OKJmW7xnkeUjj2Q7p8ievrmmJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB4013.eurprd04.prod.outlook.com (2603:10a6:803:3e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 07:49:06 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565%7]) with mapi id 15.20.3676.031; Tue, 22 Dec 2020
 07:49:06 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	xiaobo.xie@nxp.com,
	jiafei.pan@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v3 2/2] configs: ls1043a-rdb: Add linux inmate dts demo
Date: Tue, 22 Dec 2020 15:51:27 +0800
Message-Id: <20201222075127.3777-3-hongbo.wang@nxp.com>
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
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR0401CA0011.apcprd04.prod.outlook.com (2603:1096:3:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30 via Frontend Transport; Tue, 22 Dec 2020 07:49:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eac76a96-2e88-4ec0-3cf7-08d8a64e0f6e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4013:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB401337D7087EE5FDC4767A55E1DF0@VI1PR04MB4013.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q/9anG+Jmk6tpVoaYwNMm1s2u+Zx7w5S75UgrJWFxLxwzBzrVnuH1pyveGgVSqnEuFj54BAmG7zTmZsNdOddFzeWZTGSyo43OAw34rVlHTVxHYJl8OZ7YwMcixc36A+NKLNyhK/uk7AecdW5YoP78LGAtenjFFpuZ7FSVwqWM7Q1i3Upo1GrpyaD0Mfjs1oGsS1+oyl21iWYMRDN3YCrL5Snqzu64OGjahkPyr+g9s5UmV6eZ43t86Ys1cv5314cZbmDxTz4PoO/9MQhOkSvF0TarZHIC6qTckcXMONi35YKCi/3MbnieK5l6OkcGGfeyLSDUjhCPxoB2NZ9iM/aQWYUrACJ5wk6RBBIMR7t1eRSWd2lcZNpSpnkC7B1LqFCarMqY3eo1LkTt34a7nX/vQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(36756003)(1076003)(2906002)(9686003)(8676002)(6486002)(26005)(6666004)(186003)(8936002)(16526019)(5660300002)(2616005)(66556008)(52116002)(956004)(6506007)(66946007)(316002)(478600001)(83380400001)(6512007)(86362001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BysxxOPkLheGSYnfGGwO1LcrB3ky1VaypC2u/m5V7q4R90yc43pw5i6EuLOy?=
 =?us-ascii?Q?qnY5yTmo6d5Q9zhr6s2QtAglN2wCCmGQ+MQYBydq8cXY9Nwk4FUsuDcUD1We?=
 =?us-ascii?Q?VqJK1h39fX9FNJNVd+q4ugu+Rh5aUsWY9aDhEsThln0N8I/NoN+sRJYy7xPg?=
 =?us-ascii?Q?u9EcqO8X/KZvg5jq16YtIKC4cAGxngPqqZJH3SMBwNmcyk2rfKyOxqJhZFvf?=
 =?us-ascii?Q?ebRJvW0Rz1KiTTh5BV92Y5hXUSeQhHRK5Xncl831NVhgQqL14azDyJkvM411?=
 =?us-ascii?Q?1Ni34lFtJOte0IvagpuRm3ULLMsBYOYTQt+2V2UNgvsZGQx18VjxANl3qA8L?=
 =?us-ascii?Q?Za8VNPF3q5TbljvoiyyHi7T/8D3n9TVhb2qBnZEMn+XhK9HIoOeTRPv5wpgX?=
 =?us-ascii?Q?UR/+ahErGzR4e9B6BzjMZtsE5KSX9SsfuIjkfaxh6FkLEjAAju+ZcSVJ+u+I?=
 =?us-ascii?Q?qCkGHpNrj+14q4XGeIYCG2U02vQysWAZzZukMNX1AExu/9XHcG6aWO9jhYlB?=
 =?us-ascii?Q?EkUB0oYSTa/toYK4UB18IJl9fHdesjW7NOaNB19vOXU9KTMslRc3VGuAmnNQ?=
 =?us-ascii?Q?abwEqNGr2MY+s0awyPzQTP1LGb6CSstRKCWJXKf+fXse2reic4OHyCmtWZqv?=
 =?us-ascii?Q?CJgdCgKNpZhlSdwH5N4TzHGgOeuPreWTtwejgvgeyHBiivzhWD+NM8hZG7rD?=
 =?us-ascii?Q?aR4DRfWZdSXGUy0ju++rCmbssInXJy7SYl6AT71GY1qGyvp3fYAQreAiv6Ec?=
 =?us-ascii?Q?qyhSjgWF+VDbZuv1dIELea6L5hHE4kDXqqJ4e5kZ6gA7vy4IGJ6SHvADSUyB?=
 =?us-ascii?Q?CEtITIN4ix+F75OR3d8zCTzqLvdUx4Ho6ak/Voq7wTSKqW/VgU9T2d5axVbT?=
 =?us-ascii?Q?oe6fx8arL6Bg3/O90NAPL/CMP/MkOSvqpslInsLXkt9qfTrHKIJ8W0sKZktI?=
 =?us-ascii?Q?My/fEbBc45fHFf/fZNinKRDC9F2c0s87Ys4ghAyYdjTyI5oSLapXLP1VSOtE?=
 =?us-ascii?Q?8J7s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 07:49:06.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: eac76a96-2e88-4ec0-3cf7-08d8a64e0f6e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZ5ZuAg5qtKv0IzaJjegbVukqhuqS7zbfzHnEFhtr0cTo+z3pM/7URbQaBx5rYdAHvb4k5D60Ujb7pUF/gsLLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4013
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=R6ra7+ec;       arc=pass (i=1
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

Add device tree demo for running Linux as an inmate on
NXP ls1043a RDB board.

GIC base address of Rev1.1 are different with Rev1.0, default dts is for
ls1043a RDB Rev1.1, if want to run linux-demo on Rev1.0, should change
to the following:

gic: interrupt-controller@1400000 {
	compatible = "arm,gic-400";
	#interrupt-cells = <3>;
	interrupt-controller;
	reg = <0x0 0x1401000 0 0x1000>, /* GICD */
	      <0x0 0x1402000 0 0x2000>, /* GICC */
	      <0x0 0x1404000 0 0x2000>, /* GICH */
	      <0x0 0x1406000 0 0x2000>; /* GICV */
	interrupts = <1 9 0xf08>;
};

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
---
 configs/arm64/dts/inmate-ls1043a-rdb.dts | 175 +++++++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb.dts

diff --git a/configs/arm64/dts/inmate-ls1043a-rdb.dts b/configs/arm64/dts/inmate-ls1043a-rdb.dts
new file mode 100644
index 00000000..eb8bc172
--- /dev/null
+++ b/configs/arm64/dts/inmate-ls1043a-rdb.dts
@@ -0,0 +1,175 @@
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
+	compatible = "fsl,ls1043a-rdb", "fsl,ls1043a";
+	model = "LS1043A RDB Board";
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
+	gic: interrupt-controller@1410000 {
+		compatible = "arm,gic-400";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x1410000 0 0x10000>, /* GICD */
+		      <0x0 0x142f000 0 0x1000>, /* GICC */
+		      <0x0 0x1440000 0 0x20000>, /* GICH */
+		      <0x0 0x146f000 0 0x1000>; /* GICV */
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
+	pci@c0700000 {
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
+		reg = <0x0 0xc0700000 0x0 0x100000>;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201222075127.3777-3-hongbo.wang%40nxp.com.
