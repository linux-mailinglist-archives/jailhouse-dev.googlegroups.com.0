Return-Path: <jailhouse-dev+bncBDV3L7XXLYIIT4EVRMDBUBE4657ZS@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B4A42A3B3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Oct 2021 13:56:58 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id k2-20020adfc702000000b0016006b2da9bsf15515079wrg.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Oct 2021 04:56:58 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1634039818; cv=pass;
        d=google.com; s=arc-20160816;
        b=SpyhtJmeuHtsw76QvLjReD3jLTnXqO/3H7uDpgtYn2cRTcz/XfWm79TFkxjParrAm6
         cU/Dvec52Ig/Cc/b/A09pm6h/9I4EVnZCYMMaCKEyB/uNWZGhS/qPnwK+C1g506gmCQe
         NG0sKz9rniOfip8OW/O0EetvGQ5A4uP+IAH5JZm/rYOL4/5DIKWmxq4+g7SiwRzaZtVZ
         HUnacUt0gDvhMHmdZ+Jzdzyr7bgarwxYoQyDqfM5TlQiL3TZCkhTymVTZvbcoOJH9y2c
         FeRIJabA73+H5EwV/nLsYVRjqr+0Dn7BnU3lPrB0WGhR2XD7d7U5Dl2JIQpp+zSptWhX
         U0aw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=RyYbj1NbXZ7K7QJk+eNWFcSAX+i1qwXbHKHdsMIuO/c=;
        b=RXoYEr+cJl/e8ZPT177t/B0TnQ7U/ikQ0OtuysmVVzdlVdExzLC3IrJCXFJ2YShQ+r
         SFL19qSPCImgLYmcnVvWrIXVgtdihuTHN3O7vWyl/Cn4DRO5SAgAidtU31XxCniyugBl
         nsAlPHXnsvYUqjE1XXY4zB9pEqyXNR/sJZJL1rAUuQk0Flil5rBC+g3KUa2NujItC/s6
         agcddS3eSf6ByIjmVsLcBzPG9nmgPMRu80flsJcQyaASZa4fqSZkMQ175rReamUEz8X0
         gDwW8V9WtuSYYblERXBIPELlpcgz0yHz7XntpPhe+NgVvX4e1YOjrJii1CKjFJraBnE1
         Whsw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=kbJp099z;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.64 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RyYbj1NbXZ7K7QJk+eNWFcSAX+i1qwXbHKHdsMIuO/c=;
        b=OVHq7+LLtSfX0ZYQVXQ3jjNBdVwueCNSN9ZH/hyWxmeZ29pqyXrOJtWR3cRDmucN8n
         GzlasPLoxu3xEThvvOyvhPYUz9vrsuXiQDDeZeZH0SJTkVAvdPR/tpyxLgP8Sud2GfQY
         Z+Agii3Z4LCTDuhs67/IC6/RW894w84gMQ2+NfZhs8jlc4QcksIi/Gt77D9i99ulFpWs
         wShADcXovcy774jQl9QLAc8WXRFXJzAGTpS08Wxh49zse9ao5eHhy9DlUytZzVo8u2LH
         UAuyQInXCk4Dqxmk0673DY3Y8l6WF3yVh/L+sxo0SfTgFndKBO9tgjHdgXitr4yFQy0Z
         SLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RyYbj1NbXZ7K7QJk+eNWFcSAX+i1qwXbHKHdsMIuO/c=;
        b=1FYNt4SwYtiQgl1/IiJdGxB1N2S8R/ElGTpJZtb3CrAYjZkn8lPZS8Nh9VBYax7Srq
         rv2aQimZPgxd1U6QF2gh9/0B973xv/jyMZoGqHy7uCnmzESLyqHSqhAg0c9uplv/hN+3
         7Vzmc/xfin8CWdh1nF7c59ngUWDFtEc/wB45vujv0dfDh7g7UHHHOLF6C7bj6U7lVjiV
         tZe4sfZABvGOtZhBvCWWFPHqw0nosK+rzOfUgn7y9KY1ytUDd13PmTks8/RnTvcbatFs
         CZDzyjqnSdvUucF4Fcxa4R91s5+f1RoSR07Cl1ghKn5+H12lD2gP51RlWOecehlHhpHQ
         X8SA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530lDDL7bQC+DKnqqgAR+STmy1U2t0VoV81WF8278D8sMFeJNJvU
	ugXPBByERD5vVqDUT+cNYuA=
X-Google-Smtp-Source: ABdhPJzv8qRh9egIZq/UNwiiEYH8bnDm+TaJQ+mLxTtJmcK/Rdw2FbrrYzsbm3VRreF4tE4yq4DQXA==
X-Received: by 2002:a5d:4b85:: with SMTP id b5mr32244173wrt.362.1634039818338;
        Tue, 12 Oct 2021 04:56:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4ed1:: with SMTP id g17ls1258918wmq.1.canary-gmail;
 Tue, 12 Oct 2021 04:56:56 -0700 (PDT)
X-Received: by 2002:a1c:f703:: with SMTP id v3mr4801595wmh.177.1634039816614;
        Tue, 12 Oct 2021 04:56:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634039816; cv=pass;
        d=google.com; s=arc-20160816;
        b=OT+l86qmpTGugQwk6ufZoK0Axflp3SpKMO0VWSxGUfn6bFybarHCTKhXizSjS1ype+
         ov9ZGvPo3XH/UF+vJ/drOmskA9LqZQaJ+eW3G7+Nwwl6t5o2seGGJSu3ZqdFqYEndr5r
         HtlYFZEwEVbIG6KkW2hk0s0McmoOIgX66EhPEXUEKIi4VbFUm+ium/UHes0qx9x91kKq
         jUMBFLuAXBpZ9t37j/JYMoS6Mbl6KL+g/AXz0m15nNiiqthHB+JmHqUCcNC5j/NpZyg+
         dn/b0AHTNgEX8wI2DfBAh1Q4cP61aJ8DeKacPuyr0XI9HdfZioP8hbs34Fh6hGmwHCJl
         KHxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=aOV7uUcfNlXz0UmwaOOCMmFYR/gfEooisSCJenYrYck=;
        b=cpZp53YjnsRoFVt9BkFetq4Vs4tIGEQku+EvNKOtBkcjhuWTtw1Ywcw/Y2y94i5cvB
         abzjUdD3fgZoZmBkoGyv2WpZXNKKOnMjEPzPlegJ86oOlMrEV/LO8/OFGaAo7f6DSoQF
         ZCmWKaL39jGg6K4nlixqUui47DhU+H6R2fnuAeJLQgfxWbsTXkdzQtJWaGfkb91lZ+JY
         JJuOM+UbunnboFIxfN2eRDb+I/f8AGvqBiisDVap4PlAIv6XpEupMt8P0Pc/xcve39Q0
         JtAQ3h8OUGXCl0EHO9FMy8sye5u7REmKpHzYYWhUmsE9w/qzPghUkneW9Kq6frarU76D
         1KSQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=kbJp099z;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.64 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com. [40.107.21.64])
        by gmr-mx.google.com with ESMTPS id b72si137559wmd.1.2021.10.12.04.56.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Oct 2021 04:56:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.64 as permitted sender) client-ip=40.107.21.64;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMe4LZ6/YssD6rwK6s6HpMCp5GLL+JoWKfk++aPk25PTu9GGLDt9JB6vStEiABW/J4/+B4U2ZiwkX/i5OfBQ73xzt7lK1urDA/LwFXfPmWS0duQrQziaI/hwUtF6M3GFYmUCXiJcv6jkvPLzx/5jeZYrZTxOVRxCorspKmNxLFKQzIDBYyjDDOteTt3SHSdcZ09TWTtO5ZaUFy9vhsHLmX/wFzu1uhZzmFCU2s2E+fcmbgsGTqE8+RusIDEkzhhJ112Lv2WUeyAtCHQVrCVnkHui6YMWh47Bxl9IlqA+UBUtON4zPYaUBjW+2dyx+OwF8FBHWPIm9nWuHDUyanssZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOV7uUcfNlXz0UmwaOOCMmFYR/gfEooisSCJenYrYck=;
 b=g6Un5/EmUiiBuQvSQdrk+ioUXfJiKBdPEkVTc8hVhLw6fUz3A4TlDKQbhDNMQgXezRDBr/mGd/feFLIz1bZxstKlhvVoukJimtx5OuSekK9gMjKtd4q/OqjbYuc6FnbbHmcEWkARJPAMxRxcBDhENITXf50zYbSiIP4KzNrzol0WYgBo+Fzo+MyFpFL+tDhjFl3Ce8+iSxeyWjagWdWuiNtGiWBoxl0jzoDDmWISULZdYUGBYudCMTVpynhqABYwwpTPPgt5To5vjNXlQDKWVpXxV0QxyOnLzeCWwT+PqOfiOudd6/Gv39+IbJnMHxNV0ONB4Gt48GikX+U46EQ76Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB5581.eurprd04.prod.outlook.com (2603:10a6:803:d2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 11:56:54 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc%3]) with mapi id 15.20.4566.027; Tue, 12 Oct 2021
 11:56:54 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Subject: [PATCH 1/2] configs: arm64: Add support for NXP LS2088ARDB platform
Date: Tue, 12 Oct 2021 14:56:43 +0300
Message-Id: <20211012115644.31005-1-anda-alexandra.dorneanu@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM8P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::11) To VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13)
MIME-Version: 1.0
Received: from fsr-ub1864-119.am.freescale.net (92.120.5.1) by AM8P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 11:56:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 153da3a5-80de-4d91-0be7-08d98d776298
X-MS-TrafficTypeDiagnostic: VI1PR04MB5581:
X-Microsoft-Antispam-PRVS: <VI1PR04MB5581FECC6AB8DE2E60AA84A2BAB69@VI1PR04MB5581.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MxQt/nseIAHDW2cX6hJJGDQznLC7nfncyiGvjg8UEfBfoXEqtNxMwbwUXfSoKjPcvCtUxmRaziYcyuEyCx9OKALtNPGLnoCgBcyoiq9Esmq2fD8BykC18scc5eE5l08zV9v0k1A3sNkIEa8q6bNNlu4ZwRLII2qEHFH2zmDs8rdLhmOtiSJJ7zRnT/eXkMdpU9kRzWqMhtqAurotyu5LiGfDtqNLiQw+34AeisRWkcwqtEnUf9So4qtTwfkB/G9l4X1e6ibL6+3ank2sNJtWVhZA0GHUW1wZnJVgdBeYPOBoTNZ7nVS9jgSYXkruEP6a0gvyDhd9P+npXIqr3JvDGBYGwgmrDFWgfDoYTt9KqYtHjQtysgk6INcpbemLScs2Q0rvndUgsZxmpEXYb3zV44/dAHSwOPLgug+I2ksaLYzrH8af8CbpvCEmKitssP0KYfwBniCyr5B9hKERD6n5Mj1XZsSxGoS+ZjDMbHCT654H8biNpiEvNuTl2LqeF5q1VfZNNaC78HDmoWd+jSMcfAZlXd29njcD1PAgxm6XtO/84DOM1sUQjZ660KhsWLKWvAvhOBXTWf465HuGMGLvdWtDxgjyE699RQtkJAlsI/SYcS9eQ3pNgD1Xd74FwfLGVLnarbzmyEF4htQl2AZtwSoLf+h5wuUglxdK0ZgrYemdyss3gkbMchFuaNjqhcjdJqeqVGB8UKlmOHvyPm4FmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(6486002)(8936002)(52116002)(83380400001)(6506007)(508600001)(2906002)(36756003)(5660300002)(8676002)(186003)(66946007)(6666004)(316002)(30864003)(66556008)(66476007)(38100700002)(956004)(86362001)(2616005)(26005)(38350700002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KgleshSloeYz03m06bqCDIv6yxJ3U/KR7T+/yh4jmNY1awy26IwaMSXFBt0P?=
 =?us-ascii?Q?SHnbMn5JlycCeWxgqW38smZN9SquGBy9Slu2sUkG2aWn2h9VyhuVVLhdrwfl?=
 =?us-ascii?Q?FnFK5I8II4Lt9FmDssJ3mbN4tgDCeOj3gR9owwIv3TwxFXVRTBGNIs0t5aM8?=
 =?us-ascii?Q?W61ByWEx2LOQ4ZJa+698zDPTg7hE666QGY69xOryDP+n26kInwusnrBoYtFV?=
 =?us-ascii?Q?0ruwZjmcPpxvht5Pq9V+1Td9bbpkct/+QTSXjqEDGpPOn30OS8Jve2DRcs0G?=
 =?us-ascii?Q?kaQyFgTzGktww8/ETJnsOcdAzyFKWN5D8wUVc0aQoEhJhZ6852lVyzCKuC83?=
 =?us-ascii?Q?uYRH7Md05e/NJDEfkZ59Kgt50ubfCsR4i1qUKFWN4gw14tlZAnx9GNctvPjY?=
 =?us-ascii?Q?vLA76Diq5kDkPcLqZOXYoAWH2zJ0M6Jp87XJGM8lIkQMBYv11ywI8RESiBHi?=
 =?us-ascii?Q?qcvb/kShEiRoh2D0rl1nYWkp6EehM6L7J9EQaLrz3FOV71n2IVbIk9F1CNMH?=
 =?us-ascii?Q?BN9JNUBGr/CevI4/tFwLXlL1gHiF9j/KFnZm/erM9H0yZz3bA/CaR+fCMX7c?=
 =?us-ascii?Q?7MOWc6aVAV4GmrJYNrl7ZbYdD6r4PdSTMuqmr9IbdOquEqOissSlWVZYwTtI?=
 =?us-ascii?Q?G3cfot7L5sOixTLUc6yNVMX8fN5JRBsx6dcE7PyX8udbhGktc1hAH3DnxLEK?=
 =?us-ascii?Q?pzJY4K1KqOHn95cM10i6X8ZiTKHeMNLQvVsTaKAb5raaNT6cLmLgD27L6WrT?=
 =?us-ascii?Q?tLwh3q/Jh1oZpLeX2Ys0SaJlc2DlMqZNshfDrbTnKU2WHCoIkEq0kUBWqoSJ?=
 =?us-ascii?Q?5Juv/MjAFF6mRj/fmCyUbwzU4iIzjqCJXGiXTFZbil9Fg7Oj3mHWNsAX8jrE?=
 =?us-ascii?Q?L2VkDAo4aLEDIzSBx5bWfA0/6aQihttMCKlSRHvO9J5YrGFx5NGthEnNvmXt?=
 =?us-ascii?Q?U+EEiTroG/m08QxVudFnVCLf78wixvwUbjur2AaIQ4BrcfDEIEDbl3pRZhSL?=
 =?us-ascii?Q?A8XFvou8fZQ/ZmEtR/ECDDK4A/pb9mQpMDXU8idz4nahNK7/fGu3vQ4uUVKF?=
 =?us-ascii?Q?f+A3IHPOb9U6YfSzBCVkXEv0+RA5KMbNgZRAsiFIOOSa5Q+Pw80sqch21hTM?=
 =?us-ascii?Q?MG7qYYRg4zCNaJRwf4UWQgHbml6/KPhoy22aFXHU6yRdqtyQvhlyZncndlpm?=
 =?us-ascii?Q?E8ZrobENIpYHkcKcI9kh4Q1FGiEK/6K0mzucjYIg8t/lwBJLhDbqdogpARsN?=
 =?us-ascii?Q?StT+qusgvNuWH1FqdbW6WbGiQRUi3UUghyp6Yu+gSzw1yAPS3QgMfa+FliaS?=
 =?us-ascii?Q?6BQ0NOmC3C/7SQedZ+BuTWGz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153da3a5-80de-4d91-0be7-08d98d776298
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 11:56:54.6750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/Ldu8Pj4RZq9m8J9PPphBOHHahqnEw37MUf6+klXqazdSSo/71l2GQdCZSHzaGvMDiXbT08EVIJ4Ujh6n8CBSa3qSZTiSH2LeBI+nYa2hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5581
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=kbJp099z;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.21.64 as permitted sender)
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

Add root cell, inmate cell and Linux demo cell configuration files for NXP
LS2088ARDB platform.

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
---
 configs/arm64/ls2088a-rdb-inmate-demo.c | 122 ++++++
 configs/arm64/ls2088a-rdb-linux-demo.c  | 141 ++++++
 configs/arm64/ls2088a-rdb.c             | 556 ++++++++++++++++++++++++
 3 files changed, 819 insertions(+)
 create mode 100644 configs/arm64/ls2088a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls2088a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls2088a-rdb.c

diff --git a/configs/arm64/ls2088a-rdb-inmate-demo.c b/configs/arm64/ls2088a-rdb-inmate-demo.c
new file mode 100644
index 00000000..bbc6812c
--- /dev/null
+++ b/configs/arm64/ls2088a-rdb-inmate-demo.c
@@ -0,0 +1,122 @@
+/*
+ * Configuration for LS2088ARDB board - inmate demo
+ *
+ * Copyright NXP 2021
+ *
+ * Authors:
+ *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
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
+	struct jailhouse_memory mem_regions[7];
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
+		.vpci_irq_base = 85 - 32,
+
+		.console = {
+			.address = 0x21c0500,
+			.divider = 0xbd,
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
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
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
+			.address = 0x6000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0,
+				1 << (85 - 64),
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 */
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
diff --git a/configs/arm64/ls2088a-rdb-linux-demo.c b/configs/arm64/ls2088a-rdb-linux-demo.c
new file mode 100644
index 00000000..b8e583c0
--- /dev/null
+++ b/configs/arm64/ls2088a-rdb-linux-demo.c
@@ -0,0 +1,141 @@
+/*
+ * Configuration for LS2088ARDB - linux-demo
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
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
+	struct jailhouse_memory mem_regions[13];
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
+		.vpci_irq_base = 85 - 32,
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* clockgen */ {
+			.phys_start = 0x01300000,
+			.virt_start = 0x01300000,
+			.size = 0xa0000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3b500000,
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
+			.address = 0x6000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0,
+				1 << (85 - 64) | 1 << (86 - 64) |
+				1 << (87 - 64) | 1 << (88 - 64),
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
diff --git a/configs/arm64/ls2088a-rdb.c b/configs/arm64/ls2088a-rdb.c
new file mode 100644
index 00000000..421ac7da
--- /dev/null
+++ b/configs/arm64/ls2088a-rdb.c
@@ -0,0 +1,556 @@
+/*
+ * Configuration for LS2088ARDB board
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Anda-Alexandra Dorneanu <anda.-alexandra.dorneanu@nxp.com>
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
+	struct jailhouse_memory mem_regions[70];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xfba00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x21c0600,
+			.size = 0x100,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_1,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0x13000000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = -1,
+
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x6000000,
+				.gicr_base = 0x6100000,
+				.gicc_base = 0xc0c0000,
+				.gich_base = 0xc0d0000,
+				.gicv_base = 0xc0e0000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "ls2088a",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 160 - 32,
+		},
+	},
+
+	.cpus = {
+		0xff,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
+		/* RAM - 1GB - root cell */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DRAM2 */ {
+			.phys_start = 0x8080000000,
+			.virt_start = 0x8080000000,
+			.size = 0x380000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM: Inmate */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3b500000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DDR memory controller 1 */ {
+			.phys_start = 0x01080000,
+			.virt_start = 0x01080000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* DDR memory controller 2 */ {
+			.phys_start = 0x01090000,
+			.virt_start = 0x01090000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* clockgen */ {
+			.phys_start = 0x01300000,
+			.virt_start = 0x01300000,
+			.size =	0xa0000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dcfg */ {
+			.phys_start = 0x01e00000,
+			.virt_start = 0x01e00000,
+			.size =	0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* rst */ {
+			.phys_start = 0x01e60000,
+			.virt_start = 0x01e60000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* rcpm */ {
+			.phys_start = 0x01e30000,
+			.virt_start = 0x01e30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* isc */ {
+			.phys_start = 0x01f70000,
+			.virt_start = 0x01f70000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* tmu */ {
+			.phys_start = 0x01f80000,
+			.virt_start = 0x01f80000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dspi0 */ {
+			.phys_start = 0x02100000,
+			.virt_start = 0x02100000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* serial0 */ {
+			.phys_start = 0x021c0000,
+			.virt_start = 0x021c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* serial1 */ {
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
+		/* ifc */ {
+			.phys_start = 0x02240000,
+			.virt_start = 0x02240000,
+			.size = 0x20000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* ftm0 */ {
+			.phys_start = 0x02800000,
+			.virt_start = 0x02800000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c0 */ {
+			.phys_start = 0x02000000,
+			.virt_start = 0x02000000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c1 */ {
+			.phys_start = 0x02010000,
+			.virt_start = 0x02010000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c2 */ {
+			.phys_start = 0x02020000,
+			.virt_start = 0x02020000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c3 */ {
+			.phys_start = 0x02030000,
+			.virt_start = 0x02030000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* qspi */ {
+			.phys_start = 0x020c0000,
+			.virt_start = 0x020c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* esdhc0 */ {
+			.phys_start = 0x02140000,
+			.virt_start = 0x02140000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb0 */ {
+			.phys_start = 0x03100000,
+			.virt_start = 0x03100000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb1 */ {
+			.phys_start = 0x03110000,
+			.virt_start = 0x03110000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sata0 */ {
+			.phys_start = 0x03200000,
+			.virt_start = 0x03200000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sata1 */ {
+			.phys_start = 0x03210000,
+			.virt_start = 0x03210000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* its */ {
+			.phys_start = 0x6020000,
+			.virt_start = 0x6020000,
+			.size = 0x20000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* crypto */ {
+			.phys_start = 0x08000000,
+			.virt_start = 0x08000000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie1 */ {
+			.phys_start = 0x03400000,
+			.virt_start = 0x03400000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 */ {
+			.phys_start = 0x03500000,
+			.virt_start = 0x03500000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie3 */ {
+			.phys_start = 0x03600000,
+			.virt_start = 0x03600000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie4 */ {
+			.phys_start = 0x03700000,
+			.virt_start = 0x03700000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie1 pf0 */ {
+			.phys_start = 0x034c0000,
+			.virt_start = 0x034c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 pf0 */ {
+			.phys_start = 0x035c0000,
+			.virt_start = 0x035c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie3 pf0 */ {
+			.phys_start = 0x036c0000,
+			.virt_start = 0x036c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie4 pf0 */ {
+			.phys_start = 0x037c0000,
+			.virt_start = 0x037c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie1 host bridge */ {
+			.phys_start = 0x2000000000,
+			.virt_start = 0x2000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 host bridge */ {
+			.phys_start = 0x2800000000,
+			.virt_start = 0x2800000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie3 host bridge */ {
+			.phys_start = 0x3000000000,
+			.virt_start = 0x3000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie4 host bridge */ {
+			.phys_start = 0x3800000000,
+			.virt_start = 0x3800000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog0 */ {
+			.phys_start = 0x0c000000,
+			.virt_start = 0x0c000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog1 */ {
+			.phys_start = 0x0c010000,
+			.virt_start = 0x0c010000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog2 */ {
+			.phys_start = 0x0c100000,
+			.virt_start = 0x0c100000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog3 */ {
+			.phys_start = 0x0c110000,
+			.virt_start = 0x0c110000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog4 */ {
+			.phys_start = 0x0c200000,
+			.virt_start = 0x0c200000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog5 */ {
+			.phys_start = 0x0c210000,
+			.virt_start = 0x0c210000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog6 */ {
+			.phys_start = 0x0c300000,
+			.virt_start = 0x0c300000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog7 */ {
+			.phys_start = 0x0c310000,
+			.virt_start = 0x0c310000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* mc */ {
+			.phys_start = 0x08340000,
+			.virt_start = 0x08340000,
+			.size = 0x40000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wriop ni */ {
+			.phys_start = 0x08800000,
+			.virt_start = 0x08800000,
+			.size = 0x40000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wriop config space */ {
+			.phys_start = 0x08b80000,
+			.virt_start = 0x08b80000,
+			.size = 0x20000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wriop ports */ {
+			.phys_start = 0x08c00000,
+			.virt_start = 0x08c00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* mc portals */ {
+			.phys_start = 0x80c000000,
+			.virt_start = 0x80c000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* qbman portals */ {
+			.phys_start = 0x818000000,
+			.virt_start = 0x818000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wriop access window */ {
+			.phys_start = 0x4300000000,
+			.virt_start = 0x4300000000,
+			.size = 0x100000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* peb */ {
+			.phys_start = 0x4c00000000,
+			.virt_start = 0x4c00000000,
+			.size = 0x400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x06000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+		/* GIC */ {
+			.address = 0x06000000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211012115644.31005-1-anda-alexandra.dorneanu%40nxp.com.
