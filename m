Return-Path: <jailhouse-dev+bncBDV3L7XXLYIK3P46QIDBUBBYZLSG4@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D31332BB6
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Mar 2021 17:17:50 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id b14sf5881421ljf.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Mar 2021 08:17:50 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1615306669; cv=pass;
        d=google.com; s=arc-20160816;
        b=zT1FEXM1d/NwjT5WQoWATtX0TIkj8vVx4hr1aSUK2t2LESfo46DMg2hw1W+Hho60HQ
         U1SumivFMRFDy4aS/the8uw9aHGKHqp5Mwndv/rBNv4vqqNDMoq5VNwWBabiDty09j4G
         FSgsaGayW7GMit+buw1z2xm4AJhO3LR7TG16kiwE8bAPwfJBWDuEKyesaPUn81dyNkQT
         3082+IRXoxaq3am7aUscn9dfDdpFxPl+stoTgh6dEYFruJQY9NA0EmpASC5VTWv4RSPE
         Rq4WcLa5axX/36tSydNPSA6SyACU4zw7yWWKSCQe0oCSaUyUO8hlu92Wkm2ndvfHiFL0
         PdkQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=EHaww9v9Q9Bslmw91MsKceHV/Ec5WQwXkYzza7RP5i8=;
        b=BI5yMLWckt4PsIs8I0Jf5aNSUpIQLgFSsfrDbBC2WtK6JOIDJ9vZONJWy/tFSxIXzI
         pJVspSJAHkPWrdqk6RIdybT1Bt3tNtOQMoXCtghPP83VfW/fyDXMeC2sEv4BL9LQZGLT
         WYT3iZy5NATcWMndxPGmGNO3ivNxGwgRwPO3/JPNPkJnoz5JpVe+dZmv2F2StfvxZuvR
         XjUixzddTr1BVaeYZ3u8u6mdt6l8lMGjh/RaAZM8uIv8TfKZdVBL6zsbcpMtlBTmJ9nD
         Ns30qnATPLQ8+aa8SoCP1A12RSPgrR89rIYV+H+e+IphDPV8JvT/cuJbQ0IIppS21X1X
         Ajqg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=KUYttr16;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.8.72 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EHaww9v9Q9Bslmw91MsKceHV/Ec5WQwXkYzza7RP5i8=;
        b=mbDiRlYsYQuRPLkH8YaN3QYdF9w+Lz4o8qPsbGVvLAVvDISCgEYhzs4RgerX4AxYpC
         4/NuE6xWwcUH5vJJJ4gYjbDxV/tmBkFNb4wcTTNPOeHAR9gTQfEOYtkXJ72k2JvL9uBa
         R5EDCq7Vi3fppsInRx6z5HxrwGF92fOoAcWktzaQvB2HCdGB7rvTK1lCIZuZhhYctuca
         0nyyuT1TbRuNgvpf88spKyKBVz6NgmeazCn3J+AWiLZ4f7N+PHvAneurrnbd6Xl0GK59
         qYVy0NmPJ1kv7TbAeEPLUokNITlKQ1mtN3om03YB0ZVH7Z/Kx/UpvqKnHMBO8T5bHxwk
         dZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EHaww9v9Q9Bslmw91MsKceHV/Ec5WQwXkYzza7RP5i8=;
        b=H1lzdsdZlwNHEcqbBX+thYm7prDHmcHtSnAGTJatUbofA0Jzg8ODW98VTIEd9qhYTS
         hhWd6hseEEBQ6hs7f8td67UuZRkQ7hDDAkH6vYieE1nvZWnbdNmgar5vOT/69kUGtgKE
         rKZnilFXmkjp9T8EYh/OASmFKcL4r4NKK3rTZAnVSh8x+MDCZw6Un5ze60XcRrTtgk8q
         NZuUI6NMHZdsFg9hEFqkPh94UDonQIzwjpFIqtsoOMg82dEYHwNWYOlHtQlhp314diHc
         qlzQI6e4kdDe4znGmWaHD7K1k7dgRGAibHtgPiJOL8H/+kmSAjztt5lf1F/1nEEP4zIq
         AOLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532AFVHEYYqWiRBc5ZXOcJ58IYENyN518MrmAK/ShpQ58PON6Hy8
	NnWNDQcDjBGixTFdzcYT0z4=
X-Google-Smtp-Source: ABdhPJyfYokdIvcUSTWEMZQZ2s/UlT9/rL9IOURZ3MqQsZ28YNHMtmiDw1cXcuxOSoPOw58yvMBmHg==
X-Received: by 2002:ac2:47eb:: with SMTP id b11mr18886731lfp.390.1615306669732;
        Tue, 09 Mar 2021 08:17:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9212:: with SMTP id k18ls4459361ljg.8.gmail; Tue, 09 Mar
 2021 08:17:48 -0800 (PST)
X-Received: by 2002:a05:651c:553:: with SMTP id q19mr1544228ljp.342.1615306668867;
        Tue, 09 Mar 2021 08:17:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615306668; cv=pass;
        d=google.com; s=arc-20160816;
        b=cVFuMxw9j2Qb1HFTdqnEIiQEnIAFHsAj9PpaVlNhT5Qon1cKXw31/9KteSnJDTUt0j
         lUcoFUKMPpfwBS4IpikEhY4r+URMMyEaF2HMl39A665dwYCWHMqdKQtRdmeS7lbOYUQb
         52vq7ciJ9DZNcERAP0e8A2/g5ChlvT2bR1b39pGi2NMEOB2diTeICf5Jr8QS3PbL7ARZ
         vS6JPdM3NbFOaA2qkhM1CbixKnNdF+5sYah33iwCTfsRnv6ci+8NwN8F70XP9Mpjo5PK
         qHarmzJ3gVHVQZlW4ghpTQ09EBgln1oq566Yf9Mq+/+A7k2Jr6Dy2SVl96DCkyvR3LqI
         slLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xiqBuIplEYl9W+3XoKIfsHMe6NqnOwIfUkOL3uF7hhw=;
        b=0+8JI28c1DPX0Roh8ps4E5J7+rPa1aghH0yVq5CcnaBPgieLIdiOXBk0Gxif7Uy+v5
         20M5UJ209KAITkQsQMr4yb1A7fZaCjpJy35zS2FwHGGO6wx/zrMBHyUzVbS9IxaOS3C8
         hM86cJ2dhzmwJjlsHexGdAZYjVV9afYWZ5Qcva1m8dl3XvhBfaujfKKmbY+bzbPTQRqe
         V84Lg1M3fLuyIM1kYf1tEjqGQvTQhsY6gS/XHHzAUIOETm/j87QL+i6wHu5ywBr+gmO9
         7woiWQsYMI/BjMlW+AODF4ewYyJHyLORYVaIqkiwmABy2Dd9ZgOERV8o7Dk1WGiTTCEa
         fouw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=KUYttr16;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.8.72 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80072.outbound.protection.outlook.com. [40.107.8.72])
        by gmr-mx.google.com with ESMTPS id p18si598908lji.8.2021.03.09.08.17.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 08:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.8.72 as permitted sender) client-ip=40.107.8.72;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXPnanyDvt/g50L5vYpwisBJYMNJTacTM9gZpv2AW6epg1d61Ou7Q+tH9WImul2EtQVvfmnjFMZjDcZ88X6nKWkrkEGVebzAvoC9aqlaHH1I970849mvXEw8GWT1XG0S5Z11oPBkHX23idGboXtXDhdlX30Nd7tbTJcQ9c7Hlh+iku/GbFVXelRxOSeATnUQDu0LctwLKzdf2YNmJXUkj3wglvKdhM9ns+169dZv1pzg953NbvJbjZD4e5X5JQxUN5s6eMM+Bc5u8tyDMOyUSB2H0nL6R2WRmGNYKRIVFhKs+OznOp9UVg6tbj6/8ouVMsPx40YdQUCRwAxgR+6t5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiqBuIplEYl9W+3XoKIfsHMe6NqnOwIfUkOL3uF7hhw=;
 b=KnPJrRrViAWktJjkHa6VyRkGi1M4XW31oRNFFWcjiN9RPMQfLN7ChGsWgtXbP9yKxAZ//ZAv3feG1lkXMTMW8HvVaarUGrvxGlHaQH0NpU/09B9iSwhB3K90XD2xZ8aPhgHdQYgNYzjRQukXHwZOmhd6yBzfP694SLOcO5Te1HGJmub0QQzDCmEeQI/Cm7+pBSIsvykvqX3OuODzxgE95WJP4IFaL3jz0fu/jif/jIkRhZ99e7OwKs32pvjO+4JEUaG4jPU5A3MeFB+U1HNGTTAmjAqmY0RXe3snABhngAqt5IPH37YRwD5NJEhG7Hv/9Qz9apYU+B9MDEGngd3/1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB5871.eurprd04.prod.outlook.com (2603:10a6:803:ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 9 Mar
 2021 16:17:47 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::71f7:66cf:af9:814c]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::71f7:66cf:af9:814c%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 16:17:47 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/2] Add configuration files and dts for NXP LS1028ARDB platform
Date: Tue,  9 Mar 2021 18:17:33 +0200
Message-Id: <20210309161735.26777-1-anda-alexandra.dorneanu@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM4PR0101CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::24) To VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-119.am.freescale.net (83.217.231.2) by AM4PR0101CA0056.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 16:17:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b3f1e80b-05d4-4051-6cbe-08d8e316e0e9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5871:
X-Microsoft-Antispam-PRVS: <VI1PR04MB58718581CA07B67C6DE8A439BA929@VI1PR04MB5871.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uFcu/09RLQZwEBcMnHiLOJpKLmlCZy/pgHEXu7DFuhes0MleKiTuDlEmRxkEFrY7ex6NSVZ0lt056BRor7LKGNUNezQ6A8HJ39FH4a7SEAZB/J0qggjrH6KkFXAsp+vW8S1psBP44a4lXxUuHO6Kv3gdB212PL7BpVQfPPHg4OuoljpIiHHB7eNiHcfObkqlIAH3hYDz+GE9d0YFleX8TkpKHpZL123e0+Dvuqm9M6fVB0P5SH3UrY2p1aHyGNUzk/ze76grNpMr3D3b3eOxcbbmNOYBetNvhOowEDJ4esG4oJhKDKtZQsLINUHEX04NHNjJc5PuzFtAt0wW11UUl1u/6WPBQaiwLkxfHwdzQkAye51rY2mdn3W4ulWUW+Tr6RVofNxQ/jwZt3IekpnpeJ4kMtZVfDlCEnussGPxttMsuGumPNcgF2DtFJ8jPWmEYjnX+uTboM/9Dk1VdPWnI/YxHHA8qxCQZoSwqD+UwM+YByQdGQJK7WixdzgW1rISVgOlwti2NtqsLCmuHHMODA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(498600001)(186003)(52116002)(2616005)(16526019)(1076003)(86362001)(956004)(5660300002)(66946007)(66476007)(66556008)(36756003)(6512007)(6916009)(2906002)(6486002)(6506007)(8676002)(8936002)(6666004)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WcVjT38TuO9+kTHsGf5+woi9aHNx16I9jLLypmLnRBT0DieJR/IkzhxUa7i8?=
 =?us-ascii?Q?5fOnnJx5S6uR153Ts9raNOwbMSum4XnVG68TKn6/lUgqyNjVcV7NkkTxFYPO?=
 =?us-ascii?Q?pfAPvenFFV6a9tF0LWy6uWHsfBZDR4akeaaHasyYekypUIcPebO4y4JVJkrg?=
 =?us-ascii?Q?9STbgd/gwzXOlOGvUvwG1c+6SQ/KwQrd+CXktuPZ1C/HQp4NCMZvJyBqpX5B?=
 =?us-ascii?Q?EfgLz5nHuIs/+W6I8QThWU1w4qJgA5bFUMzR0U7l/8DDv3SRjo2SR3cHXtX0?=
 =?us-ascii?Q?1X0WWWoLR/q8l++2glwtPv6m7S9+FWQtTWDF4UbTjArPHRLH/D5TvOjNvNw4?=
 =?us-ascii?Q?6T6slk7HNmcgrAx5x44vJdNP/LXZoAo2Q1k7Onkoj4GIKs6vQGIGfxzQyN0I?=
 =?us-ascii?Q?xJm8Wwt5EpB1mDBZ6gbbOLL4L0Y7TwPoJ/0SnVMIRO/8zRm1hZmY7dPwYHkt?=
 =?us-ascii?Q?M/tm4xl8DbqX+1Z+X5+y70HLNtsJU4GAdbLdR3uQyS/z12U4eV8aYlwdSAui?=
 =?us-ascii?Q?hUhDut/SF5a/wTAzUpgr5b5Ifpsrp1ifLm4Zxjm9TElOojx9BEeYAzHC+M/9?=
 =?us-ascii?Q?tnwsXs3X05KeyE9mUUWnCuUCn/NG55SHPi1EWOft0rYs3tLNh+ZEkUPt8H5i?=
 =?us-ascii?Q?pMwOhjnXvXNuVmLYQVAff3UvF/C8LjUBPVJT8mUCc+EbvgGz1wEQgFXZ5zND?=
 =?us-ascii?Q?/jXPqy1SqtquG+B7HO2RBKNX+uw4RhoudTS8UsQj+82njkzwCXKXX37VsALE?=
 =?us-ascii?Q?zPcwtouHVMhsz32jOK6P5WoKcztThBjgALk3H72mn9dYLzZF9dO/7f/d95xa?=
 =?us-ascii?Q?tK4XnXfnWOzEu7kwm6VL4NQdlB+y6tPFz9IefVqMAaD4R7fSD2qWY+9C4mGA?=
 =?us-ascii?Q?974ajIqzqY5+Ha7ti1ZqRUwhlHKJZ8F58bNtQU3rRHk5cL7K28Ehml7yZvCG?=
 =?us-ascii?Q?H1xQSuHTqtTJxSX0+64V6o4ynSAXp1YuVfBPOn2Nxn/RScRUusRpqnXNuIdV?=
 =?us-ascii?Q?epMpfsLzp0HHnCdDi5/buBn8+1uFO8rUqrljOwgfqNPLsH2n+zZfMqsy9B/I?=
 =?us-ascii?Q?cYvczfZGsoalMdkn5rg7ApcDo8HhC3dq0cFp5AZAeKB9Vw7/lEuQTzXTHhpQ?=
 =?us-ascii?Q?WF9r6DbkuKgbeTRoNe1Jh9R07xkINLjhyQpcKKtsAFEh2KZjemYxGhIG2ISp?=
 =?us-ascii?Q?a8Hfu3Cqkw1o9FF7sd1iqEL05dEIxElYPwfUW4nCfGGjnQqr0HJ2IUW8L4pI?=
 =?us-ascii?Q?I0wyUaFrsj+R4GI/lX87oBTiRhFHB6QT2x8YyalqYqUXBS3BIIdmDS4HtP5p?=
 =?us-ascii?Q?adqT58bT+y34UV541clGStkk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f1e80b-05d4-4051-6cbe-08d8e316e0e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 16:17:47.6883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIF7CVCY3EYlHuWNwo7Spr90u/YvKVy13VU9o7oH78PMSxPdN5UyLbc70qM+4IiqAo9tZYLnEwPPn9asjCMWBTrH6Bji2VS+CT/iXYWFvrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5871
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=KUYttr16;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.8.72 as permitted sender)
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

Anda-Alexandra Dorneanu (2):
  configs: arm64: Add support for NXP LS1028ARDB platform
  configs: arm64: Add Linux inmate DTS demo for NXP LS1028ARDB platform

 configs/arm64/dts/inmate-ls1028a-rdb.dts | 142 ++++++
 configs/arm64/ls1028a-rdb-inmate-demo.c  | 132 +++++
 configs/arm64/ls1028a-rdb-linux-demo.c   | 152 ++++++
 configs/arm64/ls1028a-rdb.c              | 617 +++++++++++++++++++++++
 4 files changed, 1043 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1028a-rdb.dts
 create mode 100644 configs/arm64/ls1028a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1028a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1028a-rdb.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210309161735.26777-1-anda-alexandra.dorneanu%40nxp.com.
