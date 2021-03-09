Return-Path: <jailhouse-dev+bncBDV3L7XXLYIK7P46QIDBUBEXC4JVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7D332BB8
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Mar 2021 17:17:52 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id j21sf5909097ljg.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Mar 2021 08:17:52 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1615306671; cv=pass;
        d=google.com; s=arc-20160816;
        b=hJtjT5oFYY8iNVoW4KdGZ11yneu5YriVVH11oSH5E6foxylkp+gqg/kFWJaDOhvp4E
         KvrDcFcQ6fNE1nzB+EFrPqNdHYAdOib7MRISi+0RcIyi7QQi4lQg5GRGv9HroR4OG7y4
         pXYNhtVIXP8zUXeMu0ZwHDdEbIBO8oL6WEUeX0HGhXQsbCu8MfYwUUDuYkwVrTPhHoue
         XzAybNyjyewdVef2p608cZZWBTDyH1gHdaF6adPvZghs4keaiWO1Vexh0U1RZMKTfbf6
         WpiSfUxwirSf7sNGWfXu77cMKuLA4gxz/xlFultsvM/I6HIh+PzVZWJ9n/gYxIm/vrTi
         yZ9w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ndBANdTXNGCyzUztgQdlGd9drk8h8HH7IS0H83a9XEQ=;
        b=fcgGX2iwDbKEwE9ootrIO0R8RZRHUuzgw0TL0k+DLt1V6dxIQQtnrdtZzfvAMIOMSE
         BvFZcLShWmcH+6RHLVQk3O+Woi0IZJpwmcY2QGioGNekzt5gK4lM8xPF8cCUF8P4CFss
         ySwJ/6AyOopakji2+pLmNZf3TVN/Q/GztoV1/to8BNkxJicH6AtCX/IhidOHF4G4zEVS
         fGXhzLgOWbKHMxi2CGSXa/9KVZsFw3ns/d4dT4b6GN/SQP2jj+fx9XEVADVolu8kocEp
         fbizikIWehL5MN8ModVX3+Fwmhg1vM6E7OnSXZhQqbIM1PACvtGJmLA0cme/e8q4ROjs
         PfsA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ojUwa9lC;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.8.87 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ndBANdTXNGCyzUztgQdlGd9drk8h8HH7IS0H83a9XEQ=;
        b=czm62GHhtnD/nkb2CU0TSsSaecWM+0Y7EneSxAKWWeQBODXx4Pwz/lwnATEFi4GIhZ
         X0Z5+R4j/zt/AQjN2uWJ6C7Wwfp3ljcPgfMBbkYH4B5g44oDpqjvU2QMqDOnHbqyRWTR
         GhKvA07DniimHTp2Dt5xDvSrFQX3I4Wuqi98eA6v5oKu50kvuWLFVQm4Wl48rtiWcIFw
         jSOXcaD7evInNqYPFDKgMJ6lmrlFJUNJB3KHN/uOBFMxwjkfhmddr4iFxtjU8mlpNPk0
         OSoZcv9pTqyapfivVselkUcbR+H4C2rilMtua2oetjTywfyXt5H8Krz7x/O5THouOfb9
         vDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ndBANdTXNGCyzUztgQdlGd9drk8h8HH7IS0H83a9XEQ=;
        b=lmZCiK+0gIKNK5f5JZfL76ke4967rrUNMzzbLlIvvoOR0/s/VUpIXPEQx0G9MDLX3U
         0YJp4s3ovW5HsYQww4d0Oq7f2c6KYa8K+Af3/GupNy1Fc2NeRC+YkWequwET6CEWAs3C
         jLdwANKAGjRegMyO+ZkwKSOAqZdld9Wtc5tGrFb/8koNxXfIBhWlNFnJcfcCjbUWhrax
         THss9utUPrkDS9PCgihHgkgbGLKclVVMR8sjI911aV81RQ5R5z9NCA3do9KbLt9Z4sT0
         4IY1jsdZuukL0+vihLhJLpRwB8FoEKV+qrRa8ZyW2gg7l3Iyn8tE7PT3Ydha2LkgcToC
         9qOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ZJt9YOIYeEXuy+jsnain8FLZtZTL0HfL4KV92KcwQ+snl1cry
	fN7mzyIvtiPYu9AUzZycQ+g=
X-Google-Smtp-Source: ABdhPJyBNGcOtugd65h1jvgIG3k5IHw1JeaECBvmCcKYdLXZrYDqmHosPNYhTuPZWZp2auEKjTSl6A==
X-Received: by 2002:a2e:9ec6:: with SMTP id h6mr17460405ljk.12.1615306671649;
        Tue, 09 Mar 2021 08:17:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6d4:: with SMTP id u20ls4367020lff.1.gmail; Tue, 09
 Mar 2021 08:17:50 -0800 (PST)
X-Received: by 2002:a19:4157:: with SMTP id o84mr2672166lfa.321.1615306670466;
        Tue, 09 Mar 2021 08:17:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615306670; cv=pass;
        d=google.com; s=arc-20160816;
        b=ip9rze3gX28jUCnWHB6DMkm2oSUSIp7PMjttNoeRCiNqG+Y6GINfrbR2GlZuFPZIml
         q+uwisE3++Pu90A/4DI4smg/8tjJs7gGzrX8oRPqzRY+CqFhkTfYSjQMkPOpUUhYtZyO
         twClmC0cIc0JXM7DiQBCi1r8QrMA7JVhmQuxmRs6/FrVplWgLeLbVnzFcvPMPlcE2D0t
         wTfvdE8CZIOTo4xWa1EeHpzma9HzAq+/iiVZuoQprYheLVfy5Ny/fxjD4mocZWb17gZh
         TxqO0TGxcJ3y9w4Q++jwDzoBEtmQbM7oxM7+9htampz44wsoYWwdK2TfY9N3VnhGqotH
         G62A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/05z2fM6Sy7HseGhLMll0i1uWFiRmmcsjGSAka8PGb8=;
        b=ynU9i9GgggOwlBD68Kj9Q8moZS/TuzhZVy4wUeAamf07Vk5hIf8cpApTNJNmwu60mI
         ZgeNaE8snDuYJRHRzaNNg8B1MzwWQKw57RW8k1tf/RARSCLX+gcUMkEdMjBELZqa3KDw
         gPpWLMHTZUz5SdBM/40hl3lQnw8DOzTf1SbXwluGHPumCvurcHP6yKm/pcKI2ibu9mhC
         o2O6qoWzoksC2iEmmoAIGetApWWVsTSgMSyMmqsOmsUfB66rZpIpw8CKc/VqHlYOUtBg
         nOx82rqclzb45V4yVf2GbyXYAozELSfLwiT+WsBgTuhO8oiOpvEO5ozNIO3j/r4yBKN/
         txtw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ojUwa9lC;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.8.87 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com. [40.107.8.87])
        by gmr-mx.google.com with ESMTPS id a66si555162lfd.7.2021.03.09.08.17.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 08:17:50 -0800 (PST)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.8.87 as permitted sender) client-ip=40.107.8.87;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6LB010iER4tKxzYYx2eT6XG2I2kgEh3XBIgQhBQ36eWX353wq9WpkXi3mStEDAM6cyTHpCJ5lc42F5d1+FzOwZAPhYDpuS78sOH2lC4Ie2Z4MoK7bIFLi/vJtONogIMmEXaYlVDu9fgr48N4p3k/WOUFOEuzyZroQK6dkvf4VfqAhsmXTwh9ywJ0X29e0+3rut4NanVmFDEPmD08ILLfDhOupXjjtoY/7ur1zF8woDrZbagimw3E6aXWsLbJi4tGFW19M9LUQi3DJVmONlDdJpAvo98TZVQN0t8grQuCycZ8mfLZpR49+TC+JC0tvZN3xjQ8o1GJU1iHokeJU9ZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/05z2fM6Sy7HseGhLMll0i1uWFiRmmcsjGSAka8PGb8=;
 b=gugqGoEUSEDlbHYXknpNftmkZsfDdI6k2nmy+DYs+w0DRyq5SWXbYRgIE7rd/LpCB3PXSplgo4eynmNxCf1FxhKOW2o7/wq8PW9PoZCu+gijwxwZyJimPO6K8YOrNW9FO+vrgz9wmpo/0oi522gj0UBDgxoelykGQt8uJNkXg/5ctQVDScMfd7JNk3YuU1VRXOlM6xqNKMnI65hpV8elAdI9SVUjtj9RV0ScXPZUrdqGpkdVZBh9hoSYrM15Pan0XJHlEAN31DJs0BL/tPR4ZnDG0W10xVDqwPbx3M9KjEsvhkTrtoNxxt5VQU1IGP5TU3ZRuKVhq9PYlaW4jIBXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB5871.eurprd04.prod.outlook.com (2603:10a6:803:ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 9 Mar
 2021 16:17:49 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::71f7:66cf:af9:814c]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::71f7:66cf:af9:814c%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 16:17:49 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/2] configs: arm64: Add Linux inmate DTS demo for NXP LS1028ARDB platform
Date: Tue,  9 Mar 2021 18:17:35 +0200
Message-Id: <20210309161735.26777-3-anda-alexandra.dorneanu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210309161735.26777-1-anda-alexandra.dorneanu@nxp.com>
References: <20210309161735.26777-1-anda-alexandra.dorneanu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM4PR0101CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::24) To VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-119.am.freescale.net (83.217.231.2) by AM4PR0101CA0056.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 16:17:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c54ab826-e328-498d-eddb-08d8e316e1ac
X-MS-TrafficTypeDiagnostic: VI1PR04MB5871:
X-Microsoft-Antispam-PRVS: <VI1PR04MB587175426237A6900BB3C74FBA929@VI1PR04MB5871.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c3vt+yPgM6YEK1fOqVii6N9lQynJAwG4//33tvBHtobxmZGR0fnzZdhdqGJQ/5MD/US5bxZuhSMjiZs5d3WkJUa3mu3DhrdqC2ZFYQO6A7v4hl8TLjOl5lBunYzB50Q/WxP0aVR8WtUm5fprxK7RtIytc14Of1hspN7Vk5z63EE48L/RS0VSdYZGxgNhygfTrFAWkC5xRLFZG8dYERyRZ9aoCuMr3ZmfLzXs1MBPtz4S66qQD8j/ML6wwdMr72/YAmjSIx6EQJ8Nd398+NjnYcoqWJtHloGtpnUW47fGtNNnBHKWrCn0Dzl2Mtdpes2qd59L+DJNYwSxFr+jlZRU2R3oqUCtcp6lLWIfdUILXNMRvSHediEt5MIm2ZHPMUnJvqXIrNsHseLD6hs5J3RdPtDz0kNSb70pFPvNi8PuCxs3Hvo+2mg/rB6SjEnVPPBdpKLpvU/hnZ6G41izcu9OUlfwCFlCvBPFVufqVnu25d6pfKLuJKVtBVSzISsuorF4uEfOHJNY9O3LU0ckQDgd1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(498600001)(186003)(52116002)(2616005)(16526019)(1076003)(86362001)(956004)(5660300002)(66946007)(66476007)(66556008)(36756003)(6512007)(6916009)(2906002)(6486002)(83380400001)(6506007)(8676002)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aE4/l3eTfG5a+SIE6GPSfZ3hq52eXURwZF1QUCwG73KKABMBFPerv0ddaepM?=
 =?us-ascii?Q?RY3+8l+MAqMmJ5t3eGP4wZPBEfS5BcerAHZe/zlyxwYwxcOyrItcN6MWqRUX?=
 =?us-ascii?Q?i3NLev/iRDIPwzMnFmBi1O4ZIqh2Tm7xV1m9AQC1glOHkXW/d9nK/orrHQfF?=
 =?us-ascii?Q?qFm9MNRh1mGSWuEnsPN/3JEdE/BvHCk+px1wYtNV5BTPk5KKdYoB30d6YtqB?=
 =?us-ascii?Q?apWVFDN7/juX16FXjLE4AoiqL0zHO9EIjATpsVGLP8+h7kMitnGQLl98PUj0?=
 =?us-ascii?Q?B+FWlvup2GMEawU99jmXFiDy8mMPNp9WszJrdcUnfUDtxAUIP+R2fJh1LRhA?=
 =?us-ascii?Q?IdbWmynqzhUfIG7KRlHTUe7wpzlam7IdNT7UU61fkT1FAcvPG+BUW08Q/pA2?=
 =?us-ascii?Q?p+jS1Mjnd4Y+WNTWubzXhKCn5Mnur7jpWt1FIpROJxHulVRqVUa12IiSjFZe?=
 =?us-ascii?Q?ZG9gsK/MW2lR0cKaeUmv+Ex1UgP2MUOpg+Vg7QPtd3uLZxbR9hj38WIdJA+L?=
 =?us-ascii?Q?Kp6Dx4CeAJT91q5liINoSKKtV4SnuZWy+eB8FZBUpbgmkl167Hi/OCSAhYKd?=
 =?us-ascii?Q?sb3sPkubTn03QgJ5/jEk6vxufPlIbNv/DpRT3ITtiMbtHlKabXi+uRneH5wu?=
 =?us-ascii?Q?FRYlinSPn3bHpeZHcr+PRjpzIIXwQucMrOSR3abRNB/G+Kb9GH8PvAlD2i7D?=
 =?us-ascii?Q?91O55o6N2nCr1dpcY2FyPuiOs6JGVhAIUz1HS27/5zz10hzm/1mf+Ydijx6Q?=
 =?us-ascii?Q?DwgDDMtP8lNEvtTwWeefmMAi6vMP0Nz8JMkXLtLmX36yKe6Ms9RamHBD34Ez?=
 =?us-ascii?Q?1C/ZyMi/BE7u/dD3f0sgQ9npggF+MC6YFYYSZyZKgBJVL3ERW7Xt9cx7My/h?=
 =?us-ascii?Q?cJXiRQPtmMwFdTIDC1VHuHKEN/L7AyjLhex9h+g/DBZl1BXNLxNMvjZXtIVx?=
 =?us-ascii?Q?ZcfZLcGFmPvZ41ht0kjLYc3jf/gA9U4NUrpXcI5f3ZfxpJu0YZJ/sguDQO0l?=
 =?us-ascii?Q?SpXypBqyGMnl3wJ3cZ3zLT5cX47qMqOQbyjtLKsrzb5DcKRH7kWRp1E7e3vu?=
 =?us-ascii?Q?943Y96riRNutW3OMII6+BreWPjAQPOJNWTIF/6Ph76DVPrF7hwL1KjxXaG90?=
 =?us-ascii?Q?dHvZa5NkFQPp/s5imTtveIS6oeEbm6JX9lhNKZ8MdGX+MNgwRrjT+Pt1bgCv?=
 =?us-ascii?Q?1p4N8dA6F2P4m6aZRHzzkrpRba5uGpDf+tCdDMcVN4IvOBZdLywbg6xogcj+?=
 =?us-ascii?Q?WXc+oSIMR1vG93VWRowG0BRs7eSwqyJidlsYnZwaTp/k12hjvUS5cPSPeGU5?=
 =?us-ascii?Q?Ibol2bxc/mvXTf/ND6ScZHIQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c54ab826-e328-498d-eddb-08d8e316e1ac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 16:17:48.9736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzFTFOX/Ycf0PDK5cejKqOTVcFUPjiPJ1M4JL7PWsWcUYZjFMGEf7MYeNgOsazXhFBJDjSGbRWDQoUIND+cw3wwx2mjJXQzdTAavl4cEUYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5871
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ojUwa9lC;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.8.87 as permitted sender)
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

Add device tree demo for Linux inmate running on NXP LS1028ARDB platform

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
---
 configs/arm64/dts/inmate-ls1028a-rdb.dts | 142 +++++++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1028a-rdb.dts

diff --git a/configs/arm64/dts/inmate-ls1028a-rdb.dts b/configs/arm64/dts/inmate-ls1028a-rdb.dts
new file mode 100644
index 00000000..df1799d3
--- /dev/null
+++ b/configs/arm64/dts/inmate-ls1028a-rdb.dts
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree for inmate cell on NXP LS1028ARDB platform
+ *
+ * Copyright 2021 NXP
+ *
+ * Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "fsl,ls1028a-rdb", "fsl,ls1028a";
+	model = "LS1028A RDB Board";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &duart1;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x1>;
+			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+			cpu-idle-states = <&CPU_PW20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
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
+		CPU_PW20: cpu-pw20 {
+			compatible = "arm,idle-state";
+			idle-state-name = "PW20";
+			arm,psci-suspend-param = <0x0>;
+			entry-latency-us = <2000>;
+			exit-latency-us = <2000>;
+			min-residency-us = <6000>;
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
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
+					  IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	gic: interrupt-controller@6000000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x6000000 0 0x10000>,
+		      <0x0 0x6040000 0 0x40000>;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
+					 IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ddr: memory-controller@1080000 {
+			compatible = "fsl,qoriq-memory-controller";
+			reg = <0x0 0x1080000 0x0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			big-endian;
+		};
+
+		clockgen: clock-controller@1300000 {
+			compatible = "fsl,ls1028a-clockgen";
+			reg = <0x0 0x1300000 0x0 0xa0000>;
+			#clock-cells = <2>;
+			clocks = <&sysclk>;
+		};
+
+		duart1: serial@21c0600 {
+			compatible = "fsl,ns16550", "ns16550a";
+			reg = <0x00 0x21c0600 0x0 0x100>;
+			//interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clockgen 4 1>;
+			status = "okay";
+		};
+
+	};
+
+	pci@fb500000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 2 &gic GIC_SPI 9 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 3 &gic GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 4 &gic GIC_SPI 11 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xfb500000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210309161735.26777-3-anda-alexandra.dorneanu%40nxp.com.
