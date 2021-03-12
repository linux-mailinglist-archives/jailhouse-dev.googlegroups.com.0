Return-Path: <jailhouse-dev+bncBAABBKMDVWBAMGQE6SMQRXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D4338A06
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Mar 2021 11:25:46 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id u15sf4980960lff.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Mar 2021 02:25:46 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1615544745; cv=pass;
        d=google.com; s=arc-20160816;
        b=H1gJ36Q71ZHJVfujMtCHvnxqXo/m2/1sBMZTxx5KyCKQiDPPkyAn6jwewiWfujn58Q
         uw/j8VP+RoXL0ZN81b/pi+z28Uf+OdVOIrdLwzF0BuqIMmF7bXeQAOri3fqPZ1Ml9l9J
         qyIAgqowEgGdkJY0zBDqdugPss3SRc2BVl+n+57oYmkyd9TcnGxe//CaPU719SU4guUl
         RsST2OGDaKun6MhRH7aK2HLEZzoq/UYkOQznTThStgt1ARMY3BmQ4hWpwUydrM7qMHwb
         lcvbzpJ8LE4vzux0MZ84zQq8sym0r0yW5rsqzM0/URTdrvlX6V4RdFvL82mcbqo0F9J2
         7w6w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=cEmuL/meFc/kLutUfJ0EUTiX90KpvHVb4n/dkbX4FmI=;
        b=tTbqEdsAugj08GSqKHVWZFUgrJ2QDrbEA0g9tCYjFU0V8dTSYCy5SJC2p3PYOkjW6e
         fWHRmom6B9QPZwBYlVAN5esreCuJi48Un9+hQg7WYCbUd+LTyU0KkV5dehSoD0LTX0i6
         5CoyARrYqkdlbui0AGSYBo9TD6C4tQ0yVPLd7ilRrpjJb5cZ8xwpUbdDE/YhXsT82sTk
         AdQ9rmmx+2QXzgSSc9BnT0EwWsQUgINQ1nkfLCJcs1A0ErV9/hdx7uDSWc6H/Jc5KZyy
         j4slRrHzBUFA0myfHXiv0q29EBcQHA08ulOj7lKIIxU8/VlK5Q1ND6FZUBMmww5eyh3I
         jh7w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=eSnyBWEH;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of alice.guo@oss.nxp.com designates 40.107.13.45 as permitted sender) smtp.mailfrom=alice.guo@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cEmuL/meFc/kLutUfJ0EUTiX90KpvHVb4n/dkbX4FmI=;
        b=KTJQGIoEg/sdi1INVTSdu24Aj03XKRgXteIh8qo73jz9csNdO3dVPzlf9MpoFeYdXm
         xrM6g+tlci4kKDeum7A3+RaHYwxp1VYE9xjeY7GkpecsVdEdjhVvR0yX0NfFVJJZLdMl
         gERl0BlygUY78f/bznHlr8rtaunNZ48/64mCVg+OHAPmVeW+KZaTzGHNHsdbSBYcrYdA
         XLs9sA31OPASAqMRqHJ3QY6NXz7TGfhKmoxLCAVDaZhuRZKZ3Xc5b47gnuWzgJyPpVg5
         cH4leJFIA5VwSD0ztUMFV4sodV7hyY0nNNkoSa0F2zrllI3izJDEjqHgZfuoyNndebAD
         fM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cEmuL/meFc/kLutUfJ0EUTiX90KpvHVb4n/dkbX4FmI=;
        b=qOewDtbIPJlTZWODXwZzr6FiKj8LbajX5peAwbaphLxV2XLoEMD1KV4x0HX8Q8tmSH
         Llc6VjI/HK/K1NljNDDo9xBpaOeEc2i16bIEnqKe8taNoBLp3NPgmb0b/8cbt22p8j/C
         c5SEZATK1dJSfDRC0A+JbB3Pfs94HabdS+XE0L4WBK7ZER9qcURgdw3/kCRgURR+tCdt
         EMUn/li9h4asoKGdR65rOkSPF98tyuIiUD8otukTMvrlH7bZ5t8JPHCFDRHnsVlKskRv
         QXQAZu770ld/fjjGrxwMyO8xhpet4hdPzpHh4waQ5rmgRdzMB7vjLMEiVS2FCgXuCO8b
         AemQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532izJEUe2vuKfLFoxuMCT8sVCaYsvCF3nE/v7e+i1s74xRBFrt7
	txL4bZn+A2uadSyIuyEKlhQ=
X-Google-Smtp-Source: ABdhPJx5Z/EisODlWjXDLhdkD0hxnLeJvlhak1F9fYBTxmWTTvjH8Yia14JroLuwXdhDF+vKoi9Gzw==
X-Received: by 2002:a2e:87d5:: with SMTP id v21mr1965271ljj.195.1615544745696;
        Fri, 12 Mar 2021 02:25:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3c10:: with SMTP id j16ls1850370lja.2.gmail; Fri, 12 Mar
 2021 02:25:44 -0800 (PST)
X-Received: by 2002:a2e:b8ce:: with SMTP id s14mr2082443ljp.68.1615544744742;
        Fri, 12 Mar 2021 02:25:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615544744; cv=pass;
        d=google.com; s=arc-20160816;
        b=oo31TINkpVyfiQQlbUvowW39dcRWCfn+bRfeSq3Eq+OeU9MrHTtLClabahc6xr54ek
         iBTkp9U8z/BKMeHGxtdN7eoLDJRJ6eWHY9c3KL4DUSK3LvvPzYkbujbO+0luFWIzb/ze
         Qi+LCbzpmE6HHR6DTyTLY18qzNefGPaBB2cUJa2mCZy053FYTj2Hm7d93cIKClE5BlbR
         441vK5QTVYo9aXueiHMb4oTPjshhowykHi9mwd182dyNFrosJ6U1BdaM9AHtRu7jMsew
         0iLDQFFoNpbm3wmY7yIwPEsNU/N6yEP3rz755TljtqXLnbLoPOctcCxtG7yHj4LhIKe5
         3mAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tXbBlWI8xOM2PUGNLFQSObJDPRTZU+reR8V8nrCiJ/Q=;
        b=N17lQ1il4l25MYkV+7CAhTqfCUQMwOiNA0Ppyun/yF2v8TZ7UJgS+9geXT1u9NkNCf
         w2AegCqKrAcmPRiV1/2ZH8k2hUdwzjxxwrh5ZDrlYVbYN4RwhjTDkex5tAaie6XZ+Eug
         oEYo33xVdBySu8b8r/a+DLvEEQpEkLwv0FoZPSWY0KZsLVOrwyfuUqEhAyA5H1ajmN52
         uTqrIagF+WLgYzHyqEgomy/2ys2XT5HES5j9X2tNBktP2iJvx9l35hiZj5ndcVm1l2me
         8gFAlC0nIXWX5wabgBdPI8oSp06H1yEHRJMejzOntrMbCppIGAZbkpxKZ6I8y0NaAcxf
         IJ6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=eSnyBWEH;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of alice.guo@oss.nxp.com designates 40.107.13.45 as permitted sender) smtp.mailfrom=alice.guo@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130045.outbound.protection.outlook.com. [40.107.13.45])
        by gmr-mx.google.com with ESMTPS id q26si202874ljj.4.2021.03.12.02.25.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Mar 2021 02:25:44 -0800 (PST)
Received-SPF: pass (google.com: domain of alice.guo@oss.nxp.com designates 40.107.13.45 as permitted sender) client-ip=40.107.13.45;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhEvqUZW02VFZsleHrntTwU7lhJ1SjKVvMkTijvgWpSpPLhQ11UdwmOMxOfwCWYW7LzDVynEwY6oFqm4/aNVtJlW3idSfOuEQqwT/adppAMn3T2Epx87T1YyTIn2sZSxI7xR2WjRiJV8wE5Ljz0mthJcMYgom+nVEA76TTiNjh11qTXBVZqB5huxxz3eAFaqTONtIdB0UtBxHMPchw9vx8SA+DrP1bee+prX2wnA/bkENqfy6UjcK4dAqDjzhOmU83Dm4uL3nZu+EPXmNT1mLNCv8Y92PDga2VjlDtz4Racm5qVcN0I5B9g5B8QqfF81IPqGhOZa22i3sC5X9Rb36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXbBlWI8xOM2PUGNLFQSObJDPRTZU+reR8V8nrCiJ/Q=;
 b=MzPhy6Jq10sV9LdCQ8XZu5D5OEa4k3sjWbgF+D5QR7X0NsvfE8tSxxwLA5kdCaNYhz/WCv3CaSY/VkNAuEGL0wwJ0Nb00yFKCQZK60qyMk0Sa48aArIZR8njDS2OaPEdGIrJ2w1mjcWrQzaUZCdyigvfj2WazkuDulRkIjDufy4dE9C1uag3+AIDwA/AUZWUUlJFeicxc0YQio7upju1bKNCQQgPIVUISFkynrHuUbDmp/66IfiSJgU+7j+5cujqIA2ZxNms+GWrgLQff5HYvDbl1192KE2H8hBMPqmDRzn3g/4PS/UdOeP1PZjiDGAq3ALA0VtLXdJ/4FZK9oi5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM6PR04MB6053.eurprd04.prod.outlook.com (2603:10a6:20b:b9::10)
 by AM5PR04MB3201.eurprd04.prod.outlook.com (2603:10a6:206:e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Fri, 12 Mar
 2021 10:25:42 +0000
Received: from AM6PR04MB6053.eurprd04.prod.outlook.com
 ([fe80::394e:4132:3afd:7d94]) by AM6PR04MB6053.eurprd04.prod.outlook.com
 ([fe80::394e:4132:3afd:7d94%3]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 10:25:42 +0000
From: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH v1] arm64: dts: imx8m: add pmu node
Date: Fri, 12 Mar 2021 18:26:09 +0800
Message-Id: <20210312102609.20392-1-alice.guo@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR04CA0055.apcprd04.prod.outlook.com
 (2603:1096:202:14::23) To AM6PR04MB6053.eurprd04.prod.outlook.com
 (2603:10a6:20b:b9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by HK2PR04CA0055.apcprd04.prod.outlook.com (2603:1096:202:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 10:25:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 130a15c9-46a9-4615-bdd1-08d8e5413091
X-MS-TrafficTypeDiagnostic: AM5PR04MB3201:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR04MB32010D341B335654B236B4C1A36F9@AM5PR04MB3201.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q69eUOYy+9C5Iid+brjkAaMB3JMT/Ywi12KTl+AjPtas2kZAp1iFEhWI7FjVb7o0Et5ajIZYyMbe+A9yV3TXVLGiEffZ9K0d5o7ZAtcdeUVJc0lJXclIfJGRkTle0nH/w9EwDh0V0VdsIX4dn0TCff90xxqca67yUL3aCgtk1wu9eEqSxjiAAqx/L4JQ6Gxu2AlslHfN7fo3OaMsxo+X/zOBH5bZfOMDBf575+9PlxC2ky49AkbifJanwLDPbyy75QehhfaWV2y4wsVssyl5zlUNGQb3efCxpp3IQcnfk6ZMGs1C2FZIb0IzAJ7bjAugw/Cg0u67q+kNqoTj6Pyceq3zw9VriivChO2hwDH56VlZVSaNEA7OrDh7MbO1pk/LGCL6uthJz8MpXfVxClkCmLI1O5jTjKbuXm/v+XoUBlJmDW6yiiiNMdzO2z3MQIGc8jN3/h4PMziZqEAmcMYZwzfNc6lR6DL1Y4SQgmtLNs4WCllxTxcDQa8S/t+45U2N/xV6erdPnbribbhvfkj/J3ZKxDsQXKZp21grRAOczlYXdsgqGL5at2Y/OlEUzNDk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(66476007)(6486002)(66946007)(26005)(2906002)(956004)(6666004)(8936002)(6512007)(66556008)(4326008)(1076003)(2616005)(6506007)(8676002)(478600001)(316002)(52116002)(16526019)(5660300002)(86362001)(83380400001)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?x6qINthFl0AR3AQxtL20Hv/caAc0mY2wvBk8fbJ53Fa7iYEjrfwE5YXeyfsg?=
 =?us-ascii?Q?OT+vzmzETzgRn7yAPTIwhSEUPhq4dAGXtP6aepbjJwvdONSjtLRIvxDjS8ZX?=
 =?us-ascii?Q?wI07lqaWfwnzPl7q9CzZIvbLF4EZJ4PUxJh17DSvA0ys2OEqcXPJ3//fymql?=
 =?us-ascii?Q?zM2kXN2QXOwZjIUBNMx6R3kJTeFcldlDnWv+ClJpcJ4c7ztAF8I8QGto41LN?=
 =?us-ascii?Q?BlnZRR7LQo3CwtHDW2rtwBp7VZ8Tg29BdJMZ0QX0PoFU4k8p98apEeWhw+5s?=
 =?us-ascii?Q?VuOSaQ4f1OGP16cbagO8qcZaxNYtjZUu5jSkDULT7eNYcGLaWtJU2wCGHj3E?=
 =?us-ascii?Q?/ILDmW/hu/OltWbotx+tOM3TieKTlUxrDDc1no4FD39o0fzf0yAUfzuJSY5x?=
 =?us-ascii?Q?H+Bp59GZy4ycD1SlYp6teEA6GdWf/UKghFWvE8BGKAO8gQZJd46PVbaPOlE+?=
 =?us-ascii?Q?Rb/nYPjBJk81R54Zmfk3eD+p7Ev2VPBQ8bugDWrR1YeufvzC3rvrCb/IOI9M?=
 =?us-ascii?Q?cIZ9o0N95AtlLybPZxHFJd1BsPt6flh2LGJ2K29Ure+jBIOxkVjJWo+mUtDg?=
 =?us-ascii?Q?3S3TMrwmjjnZ6Rl5xHHKTzGirYRz9Dx5fBstqcTo3ks8Ts/favuCOQ7g4Bjb?=
 =?us-ascii?Q?yW8uFnQfqoUv2eVxCdaSKhmFfAaa8QV8kPrW1rO2w80jvxHQwMYeCIRGUI/l?=
 =?us-ascii?Q?155OLDjELP/52ytoj0FhDmwFGtTkMH0OZi3jsOx/fR8Za9FefXp8oiG4TvsZ?=
 =?us-ascii?Q?Rm0ZzVK5uI67OSRtEuawk9a8Uwr8hXVd11M7me9GXipwp3IYVPnFAqLau3I+?=
 =?us-ascii?Q?DiZSEQmKl2NlrDZBY8d/dh1sqRUwq1ANCWBeFryP1+CezBEsUKMRSBDwRVOF?=
 =?us-ascii?Q?FUwtzQCzAFC4CdLyikmEsh3Efl/SOXPv/ua4IyGaQBNrnIGwTWPJEWeNhGah?=
 =?us-ascii?Q?GCrLOu915/yU08ud/+MNbl51mbiYtiWD1pdAS81jManoNwLa3xxrQ8aSkp8N?=
 =?us-ascii?Q?LKtemvFP8IVGN4z0jaOGoCEU8UnpXDoZWqIxSp2QbkmBL95LxwtUavrExxei?=
 =?us-ascii?Q?gARDX9Ytaa6CSCndQY5wjUghpv8vnOvmSp5oRAguSb66ci4Db7STy4vZb165?=
 =?us-ascii?Q?3j1Ex1UcLJpkohEBXayMuoJGmRkrwnvRwrCxtxIFdbgEtjFdLBTFvwRQFXff?=
 =?us-ascii?Q?Y1lIJ1Bt+191iHC/ECjw7BGPKFQ4fBPuICU3RGqP5fEK90B81DwMfdhNwvp0?=
 =?us-ascii?Q?Uo/PqH2e7D/llxwJJUkQcdK10Jyu/GPdbji16Br+XTgxaVTh1c6OwlG1pCee?=
 =?us-ascii?Q?zofyODI8+ZYgpni16O4ozYOV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130a15c9-46a9-4615-bdd1-08d8e5413091
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 10:25:42.5786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yA8PBn0DEeW/WDcEFVWKS/8T97qmgZ6BV4jovHkh/K7zxbC6hR5lNpoz394+D92mMhBLO1vLGq/GQYds3bBlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3201
X-Original-Sender: alice.guo@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=eSnyBWEH;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of alice.guo@oss.nxp.com designates
 40.107.13.45 as permitted sender) smtp.mailfrom=alice.guo@oss.nxp.com;
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

From: Alice Guo <alice.guo@nxp.com>

Adding pmu node supports to use perf tool to monitor the CPU performance
of the inmate cell when enabling Jailhouse and running dual Linux OS.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/dts/inmate-imx8mm-evk.dts      | 7 +++++++
 configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts | 8 ++++++++
 configs/arm64/dts/inmate-imx8mp-evk.dts      | 8 ++++++++
 configs/arm64/dts/inmate-imx8mq-evk.dts      | 7 +++++++
 4 files changed, 30 insertions(+)

diff --git a/configs/arm64/dts/inmate-imx8mm-evk.dts b/configs/arm64/dts/inmate-imx8mm-evk.dts
index f7c21b10..591c3543 100644
--- a/configs/arm64/dts/inmate-imx8mm-evk.dts
+++ b/configs/arm64/dts/inmate-imx8mm-evk.dts
@@ -48,6 +48,13 @@
 		};
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7
+				(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupt-affinity = <&A53_2>, <&A53_3>;
+	};
+
 	gic: interrupt-controller@38800000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
diff --git a/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts b/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
index 74fe9d7c..e5a87d03 100644
--- a/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
+++ b/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
@@ -48,6 +48,14 @@
 		};
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7
+				(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupt-affinity = <&A53_2>, <&A53_3>;
+	};
+
 	osc_24m: clock-osc-24m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
diff --git a/configs/arm64/dts/inmate-imx8mp-evk.dts b/configs/arm64/dts/inmate-imx8mp-evk.dts
index 2fb4bc74..b4068771 100644
--- a/configs/arm64/dts/inmate-imx8mp-evk.dts
+++ b/configs/arm64/dts/inmate-imx8mp-evk.dts
@@ -48,6 +48,14 @@
 		};
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7
+				(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupt-affinity = <&A53_2>, <&A53_3>;
+	};
+
 	gic: interrupt-controller@38800000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
diff --git a/configs/arm64/dts/inmate-imx8mq-evk.dts b/configs/arm64/dts/inmate-imx8mq-evk.dts
index 8d620522..45b42c94 100644
--- a/configs/arm64/dts/inmate-imx8mq-evk.dts
+++ b/configs/arm64/dts/inmate-imx8mq-evk.dts
@@ -48,6 +48,13 @@
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		interrupt-affinity = <&A53_2>, <&A53_3>;
+	};
+
 	osc_25m: clock-osc-25m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210312102609.20392-1-alice.guo%40oss.nxp.com.
