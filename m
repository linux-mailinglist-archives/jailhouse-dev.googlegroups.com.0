Return-Path: <jailhouse-dev+bncBAABBDH2Y77AKGQECFTANKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A702D5885
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 11:48:45 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id z12sf1853191wmf.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 02:48:45 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607597325; cv=pass;
        d=google.com; s=arc-20160816;
        b=tli4vHz7vRMpqfSfamxF/b7+YZYOvHUgm9a7c5axZAGsdJ7MEU1A1rpVCJLb8QT9MO
         NAHepiF2K6SpNNZMoXgg5Biby72xGQydG1smXHoWun7ILy1/glD07jhuDu7zmYjuwrZA
         LCNjACG9ZYV4zsDe7YCb1VH2x3euRomJj1wiKaNW4MiR2OULnBu/1qF1T1oRB8AkkPyF
         FKGYaaSFIWaXIVMLPswxBK3RiAAdmL5WBlixCW0zDAg10QNQdDirgi38zM0v2wY8r3HU
         wnEjnIhin/BbsaZwBbnpm9YQq8v1unJScJPXxO1isEv2kRMZLZNf4fvbvUqTa9VGlbmB
         6zUw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=jdG+p7FuxZ9ORyQ7l/8p1QfNLqlaIpQIClZy/xKs6W8=;
        b=VHDJlhhBaxI5cMkNTAD52XrXy84lnVsE5ESTQ020UceRTE74Z15p5fxBl98u1V014C
         /klVlhkf1TS7hqbQBQ2d1uHPwqgMWVdrFCFcr0VwGGaRZH6qZ/olI0lMPKSkFtYhy6UC
         B9G1h5nW1MhBaZwY44KFrsfSXhIxGQ0f7Yop60zhiZ9q14jYr/N2gZi+bwrWfxFULmOT
         tVjuL8OH/NnFqPo767aBDSL/K0DapUypmE5/CmAw7xD8sBORplc4Y/xhjYNTTn7Jy+21
         A6ehJxFXfkfjFajHhvn0Vf8mffjicenFJKgZHZZQVkdVnxWanIMbiUObY8t9ZYGjxSlC
         Wvgg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=XLwwlLx7;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.49 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jdG+p7FuxZ9ORyQ7l/8p1QfNLqlaIpQIClZy/xKs6W8=;
        b=hbG7xdtD6sp/XdGPbgA/BD3kcj7KuJ7gB2rnNlIY1mvw00YiaBVfmU6WnqoMO8ocay
         soTetiBrl0lqBk8gl+w/PEglUrmDIbrPLMPTrys4wYHST7P7bQ23IRQFMIAFrvTI0MFs
         6lcLhOMAAIqfsru4yqbbgdqq/gZnaSfUeDelWsqs3Do5Q0/WZzDXq77dHseRdSoESpuV
         SY/nMsCIdKkUwnb18m3BF1XEIbq3N2hde3TGysLqpEzZhG/DdYGcbNiZLKBIVuiwE+iQ
         yWtNx/QqARB2YoYmOn7a5zQSOifBi1zgPSarb/q0BjFPWY5e72rdaRGzdKV6FTJohiX+
         AAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jdG+p7FuxZ9ORyQ7l/8p1QfNLqlaIpQIClZy/xKs6W8=;
        b=YMimyNLMlfFq8nViENO//wbKHEEb0hNpjA8Yw7DTZ8ARY1AvKo5q5Ml/r1csO9TCUn
         or9udNjaO2R2QxTsN24sB2gxf2gv010NRC7KQE535b2QRSOxi1KeiLCfgwiCV8igR9no
         SywyfY3zu51lDD3qHSwjx2Do0vfoN7t6hQan8WsTkp3qTgNf0SOhpaAlrtlTZH3JqTIB
         vuyAImiG2TC5vRFZdtjVbMMtFHVXbv1Iun5Z8/KmnHwUvNpqSUwxKYtnfIJZSLL749vK
         MuAFqTETr3KKTG1O2adc+XP7n6nfTTMge05rCVZV6N25Wdv2SezALI+//O6oeNp+5W8/
         2krA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532pXIcpS0DIsfsfNoN8h7+GrziUYl0t3GuiK8zL55LHLVjIH72b
	9+nwYt4zZbXTy5vZfmKcCpY=
X-Google-Smtp-Source: ABdhPJzqQrhZfi9dV0vvAOPV29oFPey+EYpzYrNM2DyGN/EwG49Bc0rX+5pWhQHFJviCOaEvQ5VZ9A==
X-Received: by 2002:a5d:6845:: with SMTP id o5mr7379165wrw.421.1607597325225;
        Thu, 10 Dec 2020 02:48:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6812:: with SMTP id w18ls2890864wru.1.gmail; Thu, 10 Dec
 2020 02:48:44 -0800 (PST)
X-Received: by 2002:adf:f143:: with SMTP id y3mr7546374wro.138.1607597324292;
        Thu, 10 Dec 2020 02:48:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607597324; cv=pass;
        d=google.com; s=arc-20160816;
        b=Va0e5WhqPzCcPMZm2ZBGCt5E3U0Fnry1zqiJTEQV8JNuRhdDg9zemRM5L4ITkZJJ99
         OAcmxArUbx8FnTsf0Cr+h67pVYw3Qc1rG1RYormv3hv3vBDUo9eZcl/pv5vpXtFlI2t9
         ojHxzznVpNdU+UCZhbmpnic/e2Yyn9gQHIyQCquqAyiDOTDvrTyA2UgkRSh6Tu7rosqn
         BL4Ub410BUqMcrNrh+H60PDG57Tny0dCoziCRsuxVoaxny/3k/XTA01tkm6ALr/dUThQ
         /82zpH/z1MqOErfd/7CcFwEKsjYG2sbAyL6qhzfVjLnGOVZSnDRcVr5ECeol+twlVkkP
         kCFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=D7xIXsNR9yaDNg3I3VXv7Gl/ds/N3v8CPVNOPwSf/Q0=;
        b=Eg+h+cF7izhyat3L7zyuB8XweW/CRxG1o7vXfAXq6loLiN3PKxqyfQAeArIBkeKp6h
         Tr68ggVEiWUKGZAp1DRj27FYToU7hdvCHV0eMye/MNbRIqbKCQf74S6t3foHV3Uqlev8
         alA+Rth6JhGDqlk1Hs+8OFe5ycDzMz7RHZw9awSsdCCwNf6+jGWyn6ZyfTE3fjdIeC4H
         zv6qgbMSQ7ltziOQBYX9qqnSaV6fICqgkRQQafHkp040aPscUyRCAnLaX2UmYotbtahR
         GUE61PmEhRoiWn1Yl6wSyvN2sTYV+yij2JC9mk3XsTp0dkgk2WoyHMoU+FfKw0WG8SLV
         mgvQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=XLwwlLx7;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.49 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140049.outbound.protection.outlook.com. [40.107.14.49])
        by gmr-mx.google.com with ESMTPS id o135si150724wme.3.2020.12.10.02.48.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 02:48:44 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.49 as permitted sender) client-ip=40.107.14.49;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTETBH0wzOqRI7nTDXHp/8rVBM61iftUwsm1m7HDYoW6sMw/rMCvIiYOr28Jip6G9rqNitdOej1ucN+co9hDDBmwWLSe7PUEIztlZaSk5yo98FBiSX/7sicZ4LtgW4X+Ssjj9VoqSzBpFWIuBQV86xUDffAOjYuge2VANnuDfpVhxN5DbmfR/2UvrkjccDo2nH8GeiEhQrVtEj3KrWoPx35sVfVl5NEisw0ENCfqD3WZ+jyU96GLp4GBbX1kb015UzFRUr0fHRxCzhrxUMJxa8caGDocWseKpsCl9C3LPcqLcRBvmCKEqMkj/pFAqvPTZOFKDq+LYJ4fLiYRfDGryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7xIXsNR9yaDNg3I3VXv7Gl/ds/N3v8CPVNOPwSf/Q0=;
 b=an4gK8pAbSuEmr9ysRJzuFBZ6iXYML/kRgi1YEimt7v9FdJDr60qYxUXsq/rZJfd5nIPNMGi8r2sOK11NayF54JlXtVs/qgR1vPrYMC2vU49xrbycVd4NeuqlE2pTaDgfpAVo1tlgAdH9KEQ7BBSVuhfG+bef6pCOuUkJpN0biMCepMRAEcnu5b9SNh6bENvQC961RhLrbTfeu/6LWBhLKMGTsgGsmELtbM6ehNnVYoqzrBw/JGQaeUIpg7b2p1Ib/otKDZPERJ48WpAgJ+4KQ7DEDDgg6QWy8NRJx6S4xC1OplIawfHtVnidDfeMX43o9tfB/JerPQF9vcDfDhUsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB5375.eurprd04.prod.outlook.com (2603:10a6:803:ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Thu, 10 Dec
 2020 10:48:42 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::a8e4:608c:b05c:7565%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 10:48:42 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v1 1/2] configs: ls1043a-rdb: add cell configure files
Date: Thu, 10 Dec 2020 18:51:27 +0800
Message-Id: <20201210105128.25554-2-hongbo.wang@nxp.com>
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
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR01CA0098.apcprd01.prod.exchangelabs.com (2603:1096:3:15::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 10:48:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8ce23072-da5c-426d-f80f-08d89cf92929
X-MS-TrafficTypeDiagnostic: VI1PR04MB5375:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5375BAB29DE52B6036FB0AB5E1CB0@VI1PR04MB5375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cs83giqgp+hAaJnZ6Rrv9aNKn5KHFNsZno23QhEKaZQoO9WYx8yn6wRp7cO/fc1zp56h2Hwt8Cq8GS6nFCmRJ6wPOC5NvLnut5aKEIu6VWTyEqsrBpjD9u5kllruu3Z9anSj9jT+E1eKe77ZjpM8bBoB5k+1QogsOSHuBGwLBz1D7TzZ8BYjp7S1DAD5gpg+9pMOm4EGR7nOFhn7SSx/DbIf8eAHLGfHaicMEFaN6NBEEij4LSCKfa9EevfdQuDHScfMR8DdSGd910LDfZDdP390DV5434eXrd/2Sv7gANGMVYfL72AIvdsk7SZU+b4V
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(6506007)(8936002)(83380400001)(478600001)(2616005)(26005)(1076003)(16526019)(30864003)(6666004)(2906002)(66476007)(66946007)(5660300002)(8676002)(956004)(316002)(9686003)(36756003)(6512007)(186003)(52116002)(6486002)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?g2bsBYPMuDzowlT2nt4E9NoVOmqj6h3zB/fZbNM2Ybmt+BSpXw3MDbpOCNi+?=
 =?us-ascii?Q?sZaz5LmhGF5X2hRkVcItbMx3Hdr9pBCG11r/CmcfDdKXG4Bm2GdkY+cGh19O?=
 =?us-ascii?Q?GaEUrVsGkJ+tXBqR+LczHgNBf2h3Q7DyNhjKyTVim6amQnhDm2Vvfq8fs3rV?=
 =?us-ascii?Q?VaxojOKU1ZwCEWPnU/iZQgtYSvGK6631fwmCT8RTReWcbUkePqv81G9FdnhN?=
 =?us-ascii?Q?No7BfA9UQ1dbZCApvoefZCxPdvW94UKiQabtzEVhb1M60Lisp6sO0sTi2ai6?=
 =?us-ascii?Q?O6kR2k7UGkVDL876ofHCE+JcMCaHGOpLFnNuqQbUIY6xVQayZ1a5X16M7JEm?=
 =?us-ascii?Q?K6ZGPKZwW6m6h+E9O7eTJlb8wOsWdaFXiSs7J/zylO2vZMht0FTy0yEGOJQZ?=
 =?us-ascii?Q?tz9EwJNJ6lGcpsK5KkbGsml+Hh1YRRdGxWEhkw4ieotwQy64qGTbgih239rq?=
 =?us-ascii?Q?y9wVq8IX8vB6mN2ovju56s5fJW2+w/OoZA8f6LRVZdOpOjIanfVEUR1HcRu4?=
 =?us-ascii?Q?qX5j3Amulv1jzJ7kJsXxpXOp01Ine5cd83ZPF/9ugK26SrlV/xgrIrdH+F61?=
 =?us-ascii?Q?S+XcxcsXuBzkEdu/dCKwWU5uUBAcIfq6ZA/jaM7oBqCVtL5yNcjBXcehXeJx?=
 =?us-ascii?Q?FZTLTPpPmvWp27i6Bfo+eJbKzN/qsllPb9XEjIys80zdrp6l4jhJDO+vBOis?=
 =?us-ascii?Q?gt42YmosNb4y4TVDD9IJmLGZwAgqfOg+gkjs0aj1Mi4PVWdsLqXpY5PnYJLJ?=
 =?us-ascii?Q?GL+8tHXgBGdDm8QCntBpcKWmx0UlDdfRhUJ1Xm+T87/nUkEK8/kNsCvmCx0L?=
 =?us-ascii?Q?kyxMAVWX+jqBqfbQN+ZNiDa+f17vslaMMiTuAsksRlh3sMnVIo/pMmAxswuY?=
 =?us-ascii?Q?c9cRrq48mgRYyK/p5eXCeX9Z67VIkZNjzKndEqMwcLJ6i2ORiyd0TbBz7ZMI?=
 =?us-ascii?Q?bUN4YR1xW+fVG7NSvwPmwrLA+JRQDcsDgoS61tMQNcBCbx7nFSShMwGxx50e?=
 =?us-ascii?Q?gzVS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 10:48:42.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce23072-da5c-426d-f80f-08d89cf92929
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhiWj8RKS1rnb0g7QUtIrBga4S8wz2HipcbYQHYFlObTQpy1lpwVuUyR2o5m5wr+XuZfFliziS6IX5ye3WzDAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5375
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=XLwwlLx7;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.14.49 as permitted sender)
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

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
---
 configs/arm64/ls1043a-rdb-inmate-demo.c | 137 +++++++
 configs/arm64/ls1043a-rdb-linux-demo.c  | 165 ++++++++
 configs/arm64/ls1043a-rdb.c             | 498 ++++++++++++++++++++++++
 3 files changed, 800 insertions(+)
 create mode 100644 configs/arm64/ls1043a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1043a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1043a-rdb.c

diff --git a/configs/arm64/ls1043a-rdb-inmate-demo.c b/configs/arm64/ls1043a-rdb-inmate-demo.c
new file mode 100644
index 00000000..48d50be8
--- /dev/null
+++ b/configs/arm64/ls1043a-rdb-inmate-demo.c
@@ -0,0 +1,137 @@
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
+			.phys_start = 0xf2700000,
+			.virt_start = 0xf2700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xf2701000,
+			.virt_start = 0xf2701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xf270a000,
+			.virt_start = 0xf270a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xf270c000,
+			.virt_start = 0xf270c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xf270e000,
+			.virt_start = 0xf270e000,
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
+			.phys_start = 0xc0000000,
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
+			.address = 0x1401000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (60 - 32), /* vPCI */
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1401000,
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
index 00000000..0f132bf1
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
+			.phys_start = 0xf2700000,
+			.virt_start = 0xf2700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xf2701000,
+			.virt_start = 0xf2701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xf270a000,
+			.virt_start = 0xf270a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xf270c000,
+			.virt_start = 0xf270c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xf270e000,
+			.virt_start = 0xf270e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xf2800000, 1),
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
+			.phys_start = 0xc0000000,
+			.virt_start = 0,
+			.size = 0x00010000, /* 64K */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Top at DRAM1 2GB Space */ {
+			.phys_start = 0xc0100000,
+			.virt_start = 0xc0100000,
+			.size = 0x32400000,
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
+			.address = 0x1401000,
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
+			.address = 0x1401000,
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
index 00000000..12a10807
--- /dev/null
+++ b/configs/arm64/ls1043a-rdb.c
@@ -0,0 +1,498 @@
+/*
+ * NXP ls1043a RDB target - linux-demo
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
+			.phys_start = 0xf2a00000,
+			.size =       0x00400000,
+		},
+
+		.debug_console = {
+			.address = 0x21c0500, /* Uart0 in DUART1 */
+			.size = 0x100,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_1,
+		},
+
+		.platform_info = {
+			.pci_mmconfig_base = 0xf2500000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = -1,
+
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0x1401000,
+				.gicc_base = 0x1402000,
+				.gich_base = 0x1404000,
+				.gicv_base = 0x1406000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "NXP-LS1043A-RDB",
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
+			.phys_start = 0xf2700000,
+			.virt_start = 0xf2700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xf2701000,
+			.virt_start = 0xf2701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xf270a000,
+			.virt_start = 0xf270a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xf270c000,
+			.virt_start = 0xf270c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xf270e000,
+			.virt_start = 0xf270e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xf2800000, 0),
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
+			.phys_start = 0xc0100000,
+			.virt_start = 0xc0100000,
+			.size = 0x32400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM: loader */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
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
+			.address = 0x1401000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+		/* GIC */ {
+			.address = 0x1401000,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201210105128.25554-2-hongbo.wang%40nxp.com.
