Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBEEF42BAMGQENYLYDGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id DD06634578B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:54:24 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id m9sf595780wrx.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 22:54:24 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616478864; cv=pass;
        d=google.com; s=arc-20160816;
        b=d1NSkhB8X7qnqtM/x4M1pfB7Mh0CA3dMOqaK/NHAO+9Mi5Wa9KIGxX6bwmK6yXS2r4
         8XJJIFAB58wBtvJm3dqkCa15jXM9mVOqyVI2cpYSzereqwu1KASbHfoRi21jo9Q01JAk
         i/elRFRbSgHKdr67Km5lp8/9ob702M7hL2aD194nJFNbLyo/tGHjgsj9Nhk3pCUsY5Ml
         NEy9nfK5lWSnL0hrl6+hzeQNO4VAYBXVGEMdM/BRDAM4159NrLlPUCInkhbcWskHVxgN
         jaa7uDX7lpGGH8AtocCa2zE+S0EOPtyBnT/YqzYqj7tQrfA/z4mz+btS/ayOu0cB7axn
         //Vg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=3IeOPWuMh9J0gQOkBL8pSrSTzlJuWmJG80EX6Xg+/9Y=;
        b=gW+9SRg/1PPAXlpUWzZZVIQadnvwXwyQ3S+ZDBDAOAfz2Qa1oTjJ3G8BQ10g9TWk3g
         j2MGt/8aLmmOeS6xXysAlwQoTDBf9woNgvOgYbw8sLEuIEwRLrIoZWMfQ4qvGWYxS3W+
         TflCUqBNHYu6KkmS2DuAUmlmKXGvgeslqN9Fm65Pdp4nWVbq5rDSEFlsAhGwiVxm12YC
         /dd8FTI4/fg2C2YA0sqlxe899dTA7RMyc1YVs1hmOO8v7ceXIz4mBDaPYHTdv9pbgYfG
         DxAmz5BugVVB0KxKHKkGkOHRLSd+CDuyQErNm28Jnez+0MHCpo2fXdc9Bp5H5yaqRUL0
         8hJw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=LTzBj3Sd;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3IeOPWuMh9J0gQOkBL8pSrSTzlJuWmJG80EX6Xg+/9Y=;
        b=f2CM50xJiafmpZ3bn1RgDpZgYOvVW+liwbH6pkpJ5NAuO2u3zgWD3Ww/SWdPlN6dSl
         3ITnHAensR/SKm/a9BDzDP+vxjhqJfPXCRifBmqKgxNWZSPdygBe7BLBFkq0PFP9fWnF
         R0UI+IQG5pDET2zyK+uu000ajlAhuT7e/rOeDiw+bwDFplNUNWnrYfk3YOi/1UkK5wEC
         bar9jUSdGJwJJ8q3cX9+i5j4DRyloQHVoNGD4JLKop9r/MbssNaeqAkj5tvNgeLSX9BE
         nv4NtFNHIfzRpe2YKMPR2iL0aoWb0/HA5I5Ske4QFjlP6Am9TBpPGMsAtNkrBsuyNKCm
         W28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3IeOPWuMh9J0gQOkBL8pSrSTzlJuWmJG80EX6Xg+/9Y=;
        b=aCDgTryAhSHDzEJOKNHTFxGQlJIS1aZ/Xa4J10XOjtrgHV+0W77AOcAN5EUNpUjCzr
         WK1kUEYpeeh6D14C0IG1roIoKjbzycxmIHvPX1VsN+/IePo2+X1FLJ+wKyVF68QbAvP+
         +9Ki/FS5O4+Cmjy6e7jHOMAjKHRkI4tdLvEEjkIYCtnZPhLTwe8vafqCH4vIrhjKu/Ov
         +zF8YKB2TDY5/41oBLc2f/v2vvqScxXExYwogsfsvHoqZ9kBQT6+sxn/2J8VkI5Ev4Ew
         HB3xzCyOMW8QUqSgfk32T5U0dLbzBVB0Or0LFJS3lk7Urpg4SDEKj+b1iRGQiyZOs7NJ
         0PYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53327iGoWB3At3us/iOL335Bq8DxpdGtZq+KVYwrE2JhNl3s/9Q+
	LbIIPRX0KRDa9EKAtN2KZWo=
X-Google-Smtp-Source: ABdhPJy4WYCUMLRgQYZO8ExPi3cDrLJpp0u8Gg0Dbqd2+NOmPm7GLEmbNQWdqvUHYlZyGr2ueNhu9g==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr1590072wmj.122.1616478864650;
        Mon, 22 Mar 2021 22:54:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1986:: with SMTP id t6ls635656wmq.1.gmail; Mon, 22
 Mar 2021 22:54:23 -0700 (PDT)
X-Received: by 2002:a1c:7fcd:: with SMTP id a196mr1615620wmd.180.1616478863808;
        Mon, 22 Mar 2021 22:54:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616478863; cv=pass;
        d=google.com; s=arc-20160816;
        b=aGnGr17NcjSMkj+9HNn20+lNeDO02ZgqCoYKxT8+km5EnGDiSZNT7bm6qNRQUEp2P9
         zsdKUK/6mNASVO2Icie51yni/8YIdGr+oY4gf/5VVqMnQQ9tj3lldZrwOn9HBOD4x0Le
         UNp16tfr6LK0xbGpy2oDf2FDqI4NFPUQ5rav82joYletyc2jT5CkxN2YdoPs+56e8RU9
         WndBACSfeB6zVjxTc4wdUVJdR3ItOHKw7tDHPiirC+ZI0mA74Ndhonz1NfBnaPavL4QV
         Gxd4mBWMbNEFs+KXI0dHCbiu0Eu/5uOdKQQr+2d2+MvWw4AedPHCpidZKFUhAYqoVEh6
         XNfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8gvIt+Ri9aU7dPZNkDEnEieH3gIZe89USHuFO/KauQY=;
        b=Zax0sMh2Hm39U/PAalNRteubFJTpivLVKKz2Rf8OT8+dgdautBHQ+32nOfiMEV2obq
         vI3g/V44K+pCO0IJ42K/Z/oKMsBso1UEDIN+k0QsNCstvfvcyFkT/R9kEFQx1f8K99Sz
         LiFx1qL3iN16srZNsOnsdUQDpvj6bkc1bR7Wx1MEsTAr6B/xsvrfsnTbP4jumGGsYzC0
         uJhreu4zCNFW371J1Ptho3a02Fny/ng2X7S49T/I5qe91k0urk5hKwgAPDtA9uoacByY
         YZB2WckwWVX5apIq1a/uirNQQ8Ht2jHDSU1F1tj4O7Jceww6clya4E1/PUFtJF8iXlUx
         X0+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=LTzBj3Sd;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40047.outbound.protection.outlook.com. [40.107.4.47])
        by gmr-mx.google.com with ESMTPS id p189si41831wmp.1.2021.03.22.22.54.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 22:54:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.47 as permitted sender) client-ip=40.107.4.47;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+gE9IYqnFTFOhri8rsGHV1/DcrYVrUj0f/YSlvMG2NyPDW4yEIcqERM0dtVZHC6Opa0co+n1dmyYdq2sjR1kK4AaZyIXW3HHwiwTGPuRVflB9Fte47SBhiTLVqAh5jBoj90rzMiyQJuSSDGorvGCfGko4H4WGbob0Ly4+3OUdQnYayRsaQ6uC3IAXxStJGbOynGmgmnMTD3QgbV5rkwCzGl5JzqHfLaX3ZzICJR/SDtSIe+rHANYf93XRvO0IG4b6Jl/XedkBq5nVPc3mtAwMRE5wLDiWgp98IvxPrjqO+3M4zzpk2TKWdbmN3qwAPKXO/3UGSXBfDuyYiBGhT91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gvIt+Ri9aU7dPZNkDEnEieH3gIZe89USHuFO/KauQY=;
 b=Of1+23z5SNfQsiWhLvCBK6gnbohfKATnJxzrj57EdlUwMvmVr2HvZbRH6i44p50TcQKsk4M1s3xsHj5naJsjUAz0/To7uFQCs4rl2szOG4NmUr5XC5pIzpL0UPxVshOJE7YgGnyR6f/1NfO3rHfF/xX38rI+V4HZDBK8tt3hCU/A6gp9/4wejZIecS1XPtRG4as7x8F0+eDukKatl+5ccWuB6+OVassYPd9myBozoeYhqiebm2lbi/55Y9kPMndMRzPsYogWxJWm47N3sr4Db2snCQgEZCBRPxsOOJGpU7zC0iHG8laZd7EjprKwFAo5k1L2/gdljCZWvjA/0ZSuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6619.eurprd04.prod.outlook.com (2603:10a6:10:108::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 05:54:23 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 05:54:23 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/5] Check UART UCR1_UARTEN bit before writing data
Date: Tue, 23 Mar 2021 14:25:33 +0800
Message-Id: <20210323062536.3888-2-peng.fan@nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210323062536.3888-1-peng.fan@nxp.com>
References: <20210323062536.3888-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR04CA0076.apcprd04.prod.outlook.com
 (2603:1096:202:15::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 05:54:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eeb6d608-e5a2-4dc7-1bbb-08d8edc01bf1
X-MS-TrafficTypeDiagnostic: DB8PR04MB6619:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB66196D36822DC6758816707588649@DB8PR04MB6619.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: arCrTP2kwkRq4CDE04Tc59xw1IsPz26uCNqluKimSixOdgSOGrRDMQfBGLdTZmJPH5FsYyB2Xo830fnq+9z64lCoUNRNArb18mrua1CYseV2u/pW8N7CV1nhA0Rh+whKPMnQpbq4iVusnJq/p31dGlIglbfjza1h0GtoNEULrJyKLexbW4pp17a2n540+FKOiRHEYT6Hs5u563LlxvTaXovCOistLyObDmafapCoXRIIR+kNmPtghZHAZwFG77fZfFChcvSzQyZH0eHv22ovNRW8+U5VF43ipahXP2b360Ro/xX2c0ZStRYyP/e5bTLwL07C8W9IUyfbMOztR6xeNW8pAAc71oyghe+agdWVf449mFraDsMlEeUl/2k01bhgGJAsOqVskcoDCcpWZurQGCXDGhqkuO1nwn9kSghHuHQz9G53C5z1LWsI/Zte2ds3kMQTB6B3wCowdb2QPXSVbhdSfQpm1F3B/z4PkVNiFd6HHCe7MTiMHesuHs1LyNmX0+uSzkVWStfpQNKk5qI60Uu9wmNYRMCUx7MLfNhhVoe3Ca66nBk9t7SNUwbwdec7VnOqYHu3TSvr6BihhlnV37LTlzJegCIwLabrOqv2tx+ZAoVe4guePCxqnxHXDpmZx2eE7j8oZuoc+beaY4e/WWJFcdweOJ+NoVupW4rLMfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(6666004)(478600001)(6486002)(6506007)(38100700001)(9686003)(316002)(956004)(2616005)(6512007)(6916009)(5660300002)(2906002)(4326008)(8936002)(186003)(52116002)(66946007)(83380400001)(26005)(66476007)(66556008)(86362001)(8676002)(16526019)(1076003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?M4kNWrflKWsciTPCFmVzA37YRNvhXeDEFmdFbXz7pR1l+Nm2WWFlgCEnsUaB?=
 =?us-ascii?Q?HUSJ2lRKth6WtC9HB7WyhNxizmMlMMnaLoyUJlXQGzmRa7d1nHDMw2M01E8t?=
 =?us-ascii?Q?MQMjH1+DLRtCI+XOSfD/Q4neVw1uX3ewKLUBSLDL1MJd07BpeMsasYymnFsX?=
 =?us-ascii?Q?Q1EbJ+nLG3WLpc4oQgDYjUGooNXic2EVt7HuTaMGvG/BEHsDIAlaYY4lJ6Yr?=
 =?us-ascii?Q?RLqXy81iNsDBV9s7KzYz+u48BeAnkO+5WS8+4ddC8qDLZ778+ZLGQujs0Mkz?=
 =?us-ascii?Q?k2Ny6PZ7URjBpYwYmmzQilf/G2k5GrK1QESnndxab3eZNd4pg5Z0Wok0t6Bt?=
 =?us-ascii?Q?0WYmLCdOX0B/uy7TaywQmqE01cgJTYU/5ULxdnuhghNPlO9QC7i++JO7znVX?=
 =?us-ascii?Q?jtgkNJqjFhcFTxcBcvlVEFmk4GImwP3p/pPY1aLtb52JRV5TTeeErG3y3/1h?=
 =?us-ascii?Q?fbbXsv1QBB78Au3aY/ZWbiBkechwFRBrbE1+cx2ACtqyiK9MLc99Ad35ZtCZ?=
 =?us-ascii?Q?kKGUbCQAJksbt97yguxxn1C+UYFDim/fGcdmCXC8DQPzGC6d69iR56WREoC2?=
 =?us-ascii?Q?VeNx24cmcQcZ9sNZ90zv2U5zqhQzdR/l41EcdfMHN4Vx28udKnvt4zc8Yytp?=
 =?us-ascii?Q?jW268tQT5MkQ6XdwPdvz2DrBSKFPaWcxyPTBeB9ieHUJXecE4fJhh8AWcYl3?=
 =?us-ascii?Q?Agg7ucEkJ9QBrbyhQ0a0kCxTP+8Dn03KJm0B/dhJ4D/OZXG1AFNHybOhvyY+?=
 =?us-ascii?Q?haV86GK9Xqm+lnBW10aZFH6xT7qy72/9U0EFOEgpE6Co2faP4Mj4jrwCts2e?=
 =?us-ascii?Q?aG+BgkjMAUDHpvFd95hdM9HovQOFifmhUUHcbTgf4TVHtz/cp+0CYca8B+jR?=
 =?us-ascii?Q?V4DN8S/cZG5g6QhwoXa29G/o1lHwjDtJl2Ph7Fw5UVbb7pqWiPdso9KaS+vK?=
 =?us-ascii?Q?8WyZ+CmFI17TxgBl6tEXqH+j12rt8z6Q4sIdfXLUaYyW5wfCm5NeVBr09m9f?=
 =?us-ascii?Q?At/Xf1UQ9hzicYmN2tojB19TwS7o7eaTCEozvVcAp4xGLIHIKfnOmPEWWt4P?=
 =?us-ascii?Q?vFJJMhmucNKqvrpe4HDXN59Nrqv2JNKNvbpgDTjFMGna9SVvG9KRSNo9rA5Q?=
 =?us-ascii?Q?i75DbK4d2x+0oWp1zSbDIcOJFmEKgXrkI3DJ6tgXm+6R/7MbNM/9EDxKLWXY?=
 =?us-ascii?Q?iDfuuKTkCmJwEvfxAzF48Biph4DAJnFL2RJrg9u8S2IztHi99XObvDzLQQvV?=
 =?us-ascii?Q?ySmovvb6l5GNwx3SYYv+83OhnkNTOBDiuqxOjDGE3VaCA++TX5xbvfMO7bm8?=
 =?us-ascii?Q?5G/6HJHwL0H6Y7u/GanhaCnG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb6d608-e5a2-4dc7-1bbb-08d8edc01bf1
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 05:54:23.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGKcOo4SMMejBY+F9CsgyenhVW6XBkXlEcSTGohblKtSbdSMttsUfHt1xVrpgdPHobGxrzGr1hMGdsCfnVusOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6619
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=LTzBj3Sd;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.4.47 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

There is frequent start/shutdown operation in kernel reboot process.
And at the end of kernel reboot, kernel will switch to use console
output,saying imx_console_write on i.MX8MM.

imx_console_write will save/restore uart configuration.
However before imx_console_write the UCR1_UARTEN already set to 0.
when restore, it is also 0. Then when we runs into jailhouse
disable, jailhouse write to uart will trigger errors.

So let's add a check.

However to hypervisor itself, there is still risk that
kernel disable uart, whenh jailhouse is going to write
data registers even with this patch applied.

There is no good way to avoid such contention,
the best way to avoid such issue is that
use a different uart from Linux or remove
`.type = JAILHOUSE_CON_TYPE_IMX,` from configs/arm64/imx8mm.c.

Remove `.type = JAILHOUSE_CON_TYPE_IMX,` means
jailhouse hypervisor will not output to uart, but you still
could see jailhouse log by `cat /dev/jailhouse`

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm-common/uart-imx.c | 4 ++++
 inmates/lib/arm-common/uart-imx.c     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hypervisor/arch/arm-common/uart-imx.c b/hypervisor/arch/arm-common/uart-imx.c
index 849f8fca..6485f36e 100644
--- a/hypervisor/arch/arm-common/uart-imx.c
+++ b/hypervisor/arch/arm-common/uart-imx.c
@@ -15,6 +15,8 @@
 
 #define UTS			0xb4
 #define UTXD			0x40
+#define UCR1			0x80
+#define UCR1_UARTEN		(1<<0)
 #define UTS_TXEMPTY		(1 << 6)
 
 static void uart_init(struct uart_chip *chip)
@@ -29,6 +31,8 @@ static bool uart_is_busy(struct uart_chip *chip)
 
 static void uart_write_char(struct uart_chip *chip, char c)
 {
+	if ((mmio_read32(chip->virt_base + UCR1) & UCR1_UARTEN) != UCR1_UARTEN)
+		return;
 	mmio_write32(chip->virt_base + UTXD, c);
 }
 
diff --git a/inmates/lib/arm-common/uart-imx.c b/inmates/lib/arm-common/uart-imx.c
index 984dc218..9cdf9089 100644
--- a/inmates/lib/arm-common/uart-imx.c
+++ b/inmates/lib/arm-common/uart-imx.c
@@ -39,6 +39,8 @@
 
 #define UTS			0xb4
 #define UTXD			0x40
+#define UCR1			0x80
+#define UCR1_UARTEN		(1<<0)
 #define UTS_TXEMPTY		(1 << 6)
 
 static void uart_imx_init(struct uart_chip *chip)
@@ -53,6 +55,8 @@ static bool uart_imx_is_busy(struct uart_chip *chip)
 
 static void uart_imx_write(struct uart_chip *chip, char c)
 {
+	if ((mmio_read32(chip->base + UCR1) & UCR1_UARTEN) != UCR1_UARTEN)
+		return;
 	mmio_write32(chip->base + UTXD, c);
 }
 
-- 
2.30.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210323062536.3888-2-peng.fan%40nxp.com.
