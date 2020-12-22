Return-Path: <jailhouse-dev+bncBAABBAGKQ37QKGQEUMLRZ2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF892E06EB
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Dec 2020 08:49:21 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id a10sf15659339lfg.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Dec 2020 23:49:21 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1608623361; cv=pass;
        d=google.com; s=arc-20160816;
        b=XFkwnOYANBf7v6b9g4LKVfZ+O8hYWKzh1qN0g+NNbVwuwRCr5ZpZYWUgHW0JvN2CeS
         qmukwUYbW+UpKoHsl3UezcPxNyAm/k+olV8RCKW/43BSgCv1I2IlSMYXq1SYpUvOMRIu
         ptC2UKNncxs9Qb7HMexYVN1vKLrKGxFtCKyg6lyw6Wte1f0g8YP0jA5B2U+KF71DnXsW
         VWtSUrcZchCYzxxYUff3W6ZxNNIf0UKYPLRoSGNenBv3PiM90uKNXODFPAmCCGKTdZkc
         mEzRYshrmtENxizl7kTHzVVx50V8YHcqKTpPG852OUoYXslYo3hYdko6X6c8rk25PXXc
         NrFg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=wkYao38Qk/SdAcdS/m3TKNoe52QidgFr6xc7TpcWdOQ=;
        b=MdxMDewJwX6Uk6lPvo5/XqL83mb2SjWAarU2DVNPxxPjY9Z1BnPxNQKmCyhtiKVUzN
         QeJDlzdeG5Kj/Bfh7xFul8qOSk2+Dj/FKHuDp/GiTrrMKEcZzn2NGato0gIIPfMsrHQq
         ERjAccvladt+64AzvQKvFqV6GI8k5rhGzxnwONWChWW6b1VsKiF8zxjqz0DK4D7sKrlF
         LHHgyRClLbUZ5EbIXWELXI7+5Sgg4HSF+eTNdNVe1pdQtjxVBZjEe4r486yQ8qOIk1Ct
         AIuAo6QMEoNY/d1wD72RgQd+aH52V0SW2WxVHFxQqA7FQY80OeyE0fqTFcjOtAnFnGZA
         SuCg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=risWAx9O;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.78 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wkYao38Qk/SdAcdS/m3TKNoe52QidgFr6xc7TpcWdOQ=;
        b=XHDFEkTTxplIOVsx4KgmN0PTqhD9RsU9BfgTTZ0vey9DGL0zuv+oO55FrrSo9zwSAx
         4PRtePEJrNFEi4paj5dH6hVFyDA4JBbewUHPVdJmsDG9bXaMlEbScKdEb9u0AuqMEPJ/
         dZLkgm47Lb4Qqe37Lxeq6i6u65TxeJl+hwk/KoFCk1jYDNEWx90xVQa7fG9nRh3tX3fp
         8X467yMgMZIeDiJ5kLD3AS/+KEy7PVMsK62WcQKEnVwn6KpnFkyQrYost0DnyJJe63Oc
         +qUsoc8RvmpZbWVKjgioqA8Hf34CJCVKxxcZmM1YCQWr5tr33Vf4n8Wjq4uJyxGKR6tq
         yCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wkYao38Qk/SdAcdS/m3TKNoe52QidgFr6xc7TpcWdOQ=;
        b=F7DL/Ucntit3SYhsPMpxYmqngoNMo9i9ULsnWBkUlwzggHaLbfN8tT/DSaeT9D3ZYY
         z40h8dtfnfpP2OIR97OMjPzsXEhRqvRDx0YrtZOMFpz45Epza8H9zeYojeZGvAlr+8kt
         iJfsOBWPZMapcbZC4hLzQY8LlNBJfI/vt9555bH3fERqd3inNoX9SC1oEQl/tntmKH/j
         LMLxMtRCSg14VVGe88DATKKgyDTOsxjmsIcIdyzOOl0+OpCSoYxzfPDkaV/WfkfcnucZ
         JEbltAcTMVSdcTT/cLaNjydW2rBSF7WLn1FZLW/RFQiDkQDLrAt+XGxBWyxtuYcoyiOw
         +G2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532oc1XD3WSbiNZVo4aZHPTS5FCOuAujR8NTp+eZLzJiFygaTaqk
	V8Xy9n2bfrl0deuS+jsLIBc=
X-Google-Smtp-Source: ABdhPJxlj7Qmln6W5wab13bHsU3vavMEI1z2hWzFEoWcDL+rHnRMDmDYFnGzazvycQr981GXsJNhHQ==
X-Received: by 2002:a19:ccd8:: with SMTP id c207mr8160479lfg.326.1608623361292;
        Mon, 21 Dec 2020 23:49:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c886:: with SMTP id y128ls1215505lff.0.gmail; Mon, 21
 Dec 2020 23:49:20 -0800 (PST)
X-Received: by 2002:ac2:4a75:: with SMTP id q21mr8106292lfp.119.1608623360370;
        Mon, 21 Dec 2020 23:49:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608623360; cv=pass;
        d=google.com; s=arc-20160816;
        b=iQEKak5f0TF5Tg3uN5w0I+ghyPtmylcXeqbY0HITROEJRu/cB68Jy8q2oXvdK1yo7d
         ZXkTNMXH6g7sfopn6zMvkiklVwKJlnU9mWdpSED0/MLZR/8Jq1sLAq91kjoNpyB5vBGl
         jrwmHfmxlThaBLYdfhHZ/tGrLl2M5Xy2PFMmw9L8g424bAeshspQ/2gRC2P1M7qM3lTz
         SL7UsSJwT153FnhgeMncCCFmJQt1f/7zl4SZPltZLOHSIJtAIYHAch7Q/rMHumVnGvIF
         DCetB7sDAOFbPglOQn2U9nBd3CFE6vCkNEzASaQF1P7xDmapoYfgI0QeZjkDWL3ALrRo
         zv9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=fjPUTWod0IH5M7olFftLgm04PjepZ4pzLzHeGogCAWo=;
        b=wxS/dX9tXsUTgOK0T5NAVXpIc4S1wtd2TXCuDaFc8RNnYMDiaOmvuu9DGcYTRadORk
         1/CkKo3qZEbtIjBpaAKWqf0Ts0z65RB/OD+BAO27tPHbF8uZsfOgr5aXqhvsiybNaDuV
         rM+1mJmfxWWFWhy3SL3RiK/dip1jcqKq1YT9vpAPWxUwq+uCmXEoqrtLvY4Whv0R1c4Y
         09Jk8TaJLcmjbRmFJbdusOAl6qTw1rqyhefKtmLYzS+WA/NzHf8nDDWnC88z0fmMMXmI
         +V/zn9UHdr7k9NoJDnQ5kbfCntqjzi/RmjN8FffD2jzUZnqzCPU8rbtRIAd9urD/TW53
         RAVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=risWAx9O;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.78 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com. [40.107.22.78])
        by gmr-mx.google.com with ESMTPS id 207si678754lfm.0.2020.12.21.23.49.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 23:49:19 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.78 as permitted sender) client-ip=40.107.22.78;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPmfZqlbzgqryfAcfLk9gN8dyxvSfbrWPyF4EOkJ3WmHxwQp7n8NixbdP9vkyROlsoLLSMIz53cjN2dw1EOXyyXWo0gsXREWECgHb20A07JiRaWyu6kmxy9IsLO+iNlMQjHbwbHd43glPEzKxCuquxZzV6MUTqzMr7MOjmUu6VMkETLggZIaeyc1gX3soPcF07dFELRb1xEpMKYoCBY2mKDaqCDbjENIu/GPCqIXqxHxmQnr31fQ5eOzgllmfMWS9/SuiJd7iU9OxTe+ES1i9fKVPAxCF0Krs115JqcgVj0PjoeGbP3spSomCYq3Rr0Qe6xkIReoOI0tuTHwAL8swQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjPUTWod0IH5M7olFftLgm04PjepZ4pzLzHeGogCAWo=;
 b=Eq32owWeYBOFuX27AVe3rzbgBZPjgSi73DOuWK1BrgkxCwrxOTvU/MQdjipuPG+1UXMs24rPuRE0xnW9Ad65+77ErfYya/MXXM5qMUzCi6XcxwS9GO92stA5mY86bJMbz+6iQXxKhdS2hCNjTkj3ufZjYnV6J+yI/W/i3uOZKyz9cS1usIZlLzhFxvTMr2UKJkZPsu/f65vZ4CFJ4uSHQ/44/gs+cYQySFDiHcr14lmRoGqbOUrrjATQ0ygY08PKYbMzkohJvZ0zMtLuSIbDHC2IH+MDmvYHM3gPWshLxRb0fFrToIaD9QTd1ZShwvQ1eNCIIynV78PbOgj8IlxAfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB4013.eurprd04.prod.outlook.com (2603:10a6:803:3e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 07:49:00 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565%7]) with mapi id 15.20.3676.031; Tue, 22 Dec 2020
 07:48:59 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	xiaobo.xie@nxp.com,
	jiafei.pan@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v3 0/2] Jailhouse: Add configure files and dts for NXP ls1043a RDB platform
Date: Tue, 22 Dec 2020 15:51:25 +0800
Message-Id: <20201222075127.3777-1-hongbo.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR0401CA0011.apcprd04.prod.outlook.com
 (2603:1096:3:1::21) To VI1PR04MB5677.eurprd04.prod.outlook.com
 (2603:10a6:803:ed::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR0401CA0011.apcprd04.prod.outlook.com (2603:1096:3:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30 via Frontend Transport; Tue, 22 Dec 2020 07:48:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f9cfa93a-be79-4f60-76b8-08d8a64e0b3e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4013:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB40136C84C44857E4E537F0D9E1DF0@VI1PR04MB4013.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRZ0h6NUKlexAxt+e34M9FSKzrW+hVBUn5jrDK3jCXnXqBwqDws24tFabH5a9dWvBX/sW1ag6GFiZNcZRId8ckZ+vRwZikUsClQv8EsIqEQ50vrl9h4aFiAn4z/Bsluhd89JFgsCS82SZhr8WskJd+XZ03sEbfIFrewTNLC2ODP5PR6i2b4x5nLX4xAswOX7i8cMCNjJuR/qeMyByOaKtY/JjhqpoL8S5imBKuTjRRtwB9QbjnpCp27dVLYK9BL4NzG1m9/WPJwoDV7kWzY2x/x+ldMa6cXJEMl1K1pzogKQTnn+2orogltoSt+6AhVedc3T/XTyHv/ajqOqVRXOg9mPhTwsLQhRsLH/ojFJ0BVycppKsNfo3Bh/9NC/EETYjaoDs0WNh2Pi4td7wluMQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(36756003)(1076003)(2906002)(9686003)(8676002)(6486002)(26005)(6666004)(186003)(8936002)(16526019)(5660300002)(2616005)(66556008)(52116002)(956004)(4744005)(6506007)(66946007)(316002)(478600001)(6512007)(86362001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yDp2UOwzAJdx+TkbjV+GVgNC/AmWxQv06LACpma208rTjcCyqPFs7aSXrSWx?=
 =?us-ascii?Q?dK93A3tpm7dZhRvmSg23HvQtpMw2i8BdTpxIFvbKgr9iON+bu9DUHrSyVdCf?=
 =?us-ascii?Q?JN/ofEs7Kjut+6fu2kcF6S3sND3ThoUBnTY7Q9nSJKdl68yZMvOs9H3eNnL+?=
 =?us-ascii?Q?3ufNSpXnOaDPJeqKidTd047TEE0Ojp1m6NIbqSGMm0ay2Cjr0fDSr+eKAZeu?=
 =?us-ascii?Q?d15NyxuO4dxnZ8wbOFeM0NPl8OfWtQiYK6LLdwVZKszustTNbLXmwjotoRxz?=
 =?us-ascii?Q?yScAVbEimBJy27aVUhNG4OiKLZrszyiWXL/rT8snpqJF3tuUL7HfnQ+MzkCq?=
 =?us-ascii?Q?H2SL2sPyy4auV1prz/IW7gEdD971A6YiWHto7GGSSpm84Z+afJrEN+E5hx4z?=
 =?us-ascii?Q?HsPC3bMeJM6TDEKonB39xGsYDJfZk3bWMLJnHAd32UsARE00WKQR1riDWbLa?=
 =?us-ascii?Q?CUdZgkZw/e3Z4lCwpyaiIE2KOuiZS/tsZEJv2EEjk+IVly3zm7SguKQn6aLt?=
 =?us-ascii?Q?NnabfzMu1If0CHZg36BjveC7KMS4iF4WMRRov9aEhc6baGOJl7z/60NAT/sV?=
 =?us-ascii?Q?a7ZerUqGJIpE+mjdgbmO5YRVzqvq5shio5OtcwgZR4/zyftviEYloD1UT8pl?=
 =?us-ascii?Q?K/av0cOrb7jD5m1HdCi4LzLO6hB+sI4cYSq3dwSYwxmC+4eQ/1qpT0fUaiev?=
 =?us-ascii?Q?LJCqGJrsZ9IkhkcmNu+y49n6bEVjFjQO7PGQpKxGRJoRaVY8eX8I4XcRWdgI?=
 =?us-ascii?Q?W8IRREGG1zNDujycta12no0sW8ABUsqLy60LSvJ6Zvu+W0L4jGrKNTqU5TKk?=
 =?us-ascii?Q?lScK/EY9rIZVifkGFgPUml2yfl1GvMg2YHdLMs24qr6yLcblFv2nKTwVwap/?=
 =?us-ascii?Q?BSPw3uVsT5SjyqWJS7AflCJNawXJUVKOyBzckjpgjhmJzDvJNuU3x4tFkxrC?=
 =?us-ascii?Q?38MwMZfMNzU63tyz3nZQ4SBXAg0nj7allroVTaR826WKtnpuPAsiutZiQdNx?=
 =?us-ascii?Q?nghT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 07:48:59.3921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cfa93a-be79-4f60-76b8-08d8a64e0b3e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNg4zrDjylf/XVcR6BKRU7GU+nhAhi1UharQFLKA00QrfrLHa59Cmt+aqGGC2YHPiwZh1cxTa9+lVm6GWcjtUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4013
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=risWAx9O;       arc=pass (i=1
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


v3: change memory layout, Add uart divider in ls1043a-rdb-inmate-demo.c
v2: Modify configure according to ls1043a-rdb Rev1.1
v1: Configure is for ls1043a-rdb Rev1.0

hongbo.wang (2):
  configs: ls1043a-rdb: add cell configure files
  configs: ls1043a-rdb: Add linux inmate dts demo

 configs/arm64/dts/inmate-ls1043a-rdb.dts | 175 ++++++++
 configs/arm64/ls1043a-rdb-inmate-demo.c  | 138 +++++++
 configs/arm64/ls1043a-rdb-linux-demo.c   | 165 ++++++++
 configs/arm64/ls1043a-rdb.c              | 496 +++++++++++++++++++++++
 4 files changed, 974 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb.dts
 create mode 100644 configs/arm64/ls1043a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1043a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1043a-rdb.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201222075127.3777-1-hongbo.wang%40nxp.com.
