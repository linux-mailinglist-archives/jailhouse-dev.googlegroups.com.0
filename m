Return-Path: <jailhouse-dev+bncBDV3L7XXLYIKVK6LRMDBUBBSPUASA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F34379AE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Oct 2021 17:15:55 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id a18-20020a1cf012000000b0032ca3eb2ac3sf493035wmb.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Oct 2021 08:15:55 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1634915755; cv=pass;
        d=google.com; s=arc-20160816;
        b=WMofcija9+H89UVFD58eEpC9+dQBGWloS4rm+9EjUp+u/7Qsv1rS02XWm2v5hdvCRW
         hqYha3V8KunwRv3IYmBx0raruh5b/EVDcdWajoIAyQmlv7QBgccA8rOyPU/k0s6OIi7f
         MjN+6G4pm4lOc/9ZRwunGImlIZMuncQamtjSYCWInYOxw19z1BmChPer/NVSv1ez1BxP
         LOcNx5tUMkhY1xUc+DXbUslB8FXRLUzu3NWEMofV2ITVpPYDUiMQAMcMPJGKPkfMtNgq
         xTwzphHSMzNVioETlV4lz/Z8QoYI6nPCgESXRD4hgoTIonZNlKc7w6TvbljoaYedBJTj
         aAbw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=T45Nu6MH69kVwAOb0QSTEyHA07yx+5lEsuHWZEc7qWQ=;
        b=Ff9iPwSF8SzKZCF3/c4DUlUEo9gbeJnXBveb/ZAB86TABfEIFV42r7CNILC3DJq2Bv
         /1HiGA9ieCzyY6GN9F+z3qIqDIn4vtn20fS9y4rxDTm05L6hc6ZLxqmLasFhlf0MGWfg
         /fTGzwBHUNE0NiGdDWuPS5BBawmPz2WCZrKFVab1lKp0siHOqKr5DY3yfs7xGLOW3ecK
         8qEbjQtmBdfwlHfr2XraQWjnJKPuDX1aV0kecKVB9HrJRiI2Gd+x+P9EN9UR6gK3qE30
         0dSBIirU0Y42MgikME6zGdWyWhA1LxW0O6rAMR2vMvcNaLPhCKm9sQkIvFmvLzYQZmT+
         Y5CA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=enNhp1FI;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.1.73 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T45Nu6MH69kVwAOb0QSTEyHA07yx+5lEsuHWZEc7qWQ=;
        b=BO4xyOlkwquOpUEa45KXg8j/q+S+IP3rPhBEU+ZaJdvEWUqT8agYz4tSQM2QFsHiGT
         uzveUR8A6R5urRgH6Wn8lw1s56x23NSfFw0iUHFYVUxE8JrSOCjk9ZCpfMT6ZqTyhLI2
         i7zkml00+gyrqYhxv78VGQuQKmytUBpU8za8Kp5S/UT6DkfW/Q0Ih2ZwNPtazlgcTyvY
         Q6CwoSUAxKsM08On2A01O1EnvfGzC8vndoKQ07p8IYsk/4LA8D5b73DhKrT4qqAfdu5W
         l5XXRnX150rQfHZ+a/2yuljHKk8i2GVE0xxVi7EQaobBf+dB9ZNFL4m32dCdhG8xFihZ
         NWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=T45Nu6MH69kVwAOb0QSTEyHA07yx+5lEsuHWZEc7qWQ=;
        b=6eXlc8hcFU5cgc+RNUFsjtKDsY8I27XOAQpm4AWKnECWUMUg9TREm3qJLaZDkPd5pU
         Z//SQ226I2S8t60gO/eDbzfYxsGY3ZC204YXORObin/I2/WtnfH2W9JXuNQX639aLsLB
         5hdze5CamsYxrCaLM8K6luI0QTsuF21CEzays16jdSwAoENeejCuZX5MQc5cM1Q3/XA0
         PKRykDQrjydRTb8q9nnzV+1DY7AUzzqXzPowYvR8Px9HmUw8TNA/3KmfxN48PEeyPGyB
         sHbSOifKrvmpQ+r9HDglF5dvyOhaKgRYuxThDBKr5/9IHd0p24eGQxeVDJ1vIrgdeoUm
         rW9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ynfJh85oTkUEox5UmaIHWb+mU1M+ookV41PJBGEJak95pJjl+
	iknrnlaMqN8plY4Mc85qjhc=
X-Google-Smtp-Source: ABdhPJziOvCtgwExR9RlBt8aJ4/XJ10GxypQyO/yhvyoFftzUvsmNu9w5hSmYPrcjZVwo/NwtwePEg==
X-Received: by 2002:a05:600c:b41:: with SMTP id k1mr30094590wmr.4.1634915754863;
        Fri, 22 Oct 2021 08:15:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4f08:: with SMTP id l8ls2278863wmq.0.canary-gmail;
 Fri, 22 Oct 2021 08:15:53 -0700 (PDT)
X-Received: by 2002:a1c:e911:: with SMTP id q17mr14480473wmc.174.1634915753849;
        Fri, 22 Oct 2021 08:15:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634915753; cv=pass;
        d=google.com; s=arc-20160816;
        b=X3afbG06ZniWi229LaHLDpqCoPhX07GvIkE20LYvlDV3jABN8pkpSQcnzx9tk8fRhr
         w+gTp4Qq2Gwl5GQw+pL3AWC5WGwvpyfiZD8COmp6bx2ybGky2KL1vP611x8p7MRMptVa
         HxrZPIm76+uln9NDEvi+k4B3szX5m4/n1r0mXrUH7YBE6c7jXAv9iq6L7oGsbCLvqwKB
         t/JqWoPoyH2+KxMpz1CwORF25q6QHBY5wp7ZME9lo/UCZASNTx4mvKMy8I+Ssv9KkyPL
         2igwgj/gIpoXpRj6XN2tQml3ClvIi4ElUGlxx/jiPaw2hrtFdC6XIY3UxMlscOnO3R6t
         SHjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=GVoMLarfzDjcUsV+JtwyNygfGtlH4FE5OHY6fg449Yc=;
        b=cYREm/ZHAKuslJVBCnBhIUj9KR6rcQSzrpW6QanJkm9bxyhO2soYn9vWh7xoZaSiBL
         KccxWFvjmBP/kzonPylMA/BuMWC1y/qF1PmnnjZHITt1m+uFmX8894q5qwiqsozwpYGY
         KKfx36bP3h0lz14wZJGCVPY9EI67SwfbsP/ewNGcL85V/+5TfOSHWsD4byW8EJ+DRwin
         6rOjAjYA9lX7JPR2tmo4jxLF+TaVYYhu8BCUEQoNG0W+deYeh4ZPzDcZSkP9vKryob8B
         DYdzGqrHVzO/klfAo+t2bYtawnhbqt05TlCYx2NUaSt9MCaPLVzE/M6wi3NzmmtXTMfg
         InrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=enNhp1FI;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.1.73 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10073.outbound.protection.outlook.com. [40.107.1.73])
        by gmr-mx.google.com with ESMTPS id i1si348536wrc.2.2021.10.22.08.15.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Oct 2021 08:15:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.1.73 as permitted sender) client-ip=40.107.1.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQteArgNiGaIpRympuqqtOtkSSSRjLyqvHeOiLA5zY3yf8h26Xa3vCCsm/uMMEmuT8XDfjjZpBrakI2xLrlp2BCr0nWhXr1GyBc2Q9Dk/bBLnL2nwqgk7hJtgtDJpo2r4vLS1rNdpQDnzZxcpgi7tOXTvjXzI1IDDSvWdr4hIYZqAhosXwRKDyDKzljs3W4ROhvo9J15cbo7U507AlRvclKIWWIGlEGwzq/j/1pxb1oingKoMmzkpNOloXibXetpP88p21KidcmRGbpmMGmo/zBG6uHra0+hSO+TY50j1jRdvQ0BKKM9Kpn1N65qgf6d+ZxbhvX5URrgjX59CC7hsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVoMLarfzDjcUsV+JtwyNygfGtlH4FE5OHY6fg449Yc=;
 b=KRBYCPWmlYpjuqCGy4agpPF/q0bdilc0YREJIRIw/d7dNcZ4RpE8J5Zaobu2ApvJOeodWXDJr3Mjdk9/CZdYKT3ZX2G2QsnXBZj+9Cu6kRpyRuTzc/2EsDaII180whELob1y9UGzsaHQTDcMwhtgS81VcC3OZj6K2i+UQlEG6N93SqZ9Ln2E6HFh6jpcazozM4JCVQxbHrJ2ZNRSFBifcogllnGz9vO0tYukxW8xiQ+Ab5DCXcbjH5fqaP5AoSD6Aw3IsBtXHijcaZPSGjRPYJoIxLxcqf0zDbuWQpFWJQ9uXcJZilnWzfBZmaNiKvdjSMckDQvm5A172TJYewT6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB3312.eurprd04.prod.outlook.com (2603:10a6:802:9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 22 Oct
 2021 15:15:51 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc%3]) with mapi id 15.20.4608.018; Fri, 22 Oct 2021
 15:15:51 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Subject: [PATCH 1/2] configs: arm64: Add support for NXP LS1088ARDB platform
Date: Fri, 22 Oct 2021 18:13:09 +0300
Message-Id: <20211022151310.6058-1-anda-alexandra.dorneanu@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::35) To VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13)
MIME-Version: 1.0
Received: from fsr-ub1864-119.am.freescale.net (92.120.5.1) by AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend Transport; Fri, 22 Oct 2021 15:15:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ecbd96d-50f8-46c2-93da-08d9956ed5a0
X-MS-TrafficTypeDiagnostic: VI1PR04MB3312:
X-Microsoft-Antispam-PRVS: <VI1PR04MB33120B0C2C27ECB1E6BA02F9BA809@VI1PR04MB3312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGWUdPiofKyyJq6Gp1C0qdYOKlH2nRup7h3Crl0Vq8r4evWU1m2fMcWFlGVvn0+5HPTMEVuMWZWS6t/cwFNZhnz8Oo7wrj2FdhbvCFy4/UF2Dn/YSArC2VsipnCyjVqmA9vZt2bknsJs7JmgY411gfYmOpuALoqLiPXl08ip510TFVtEo9AxNKxcUHZ2+mJv4ZUV01oQoMqMwvrhNQY8/1non+veJKf2nrffWtqCbvlL2mfA21P0UPp4cKJQfrq0cnzH3+XI6went4GIgBlyAZcnZqYNMQPc1afg8Ag0Udw4MF8w6/ka05QQlC8lfKRf4f39lMo0T3F3GDO2yPeSqVzcgcUQXnmC9iZg9Chpl02iMpQsVBne6sWiqtLjCVzpaJf/C82F4Wpzak8eGyrjS2B77ckv5ezPZlfmxvH9aVyNWcyyUZOfRy2mIKUYOObI8IM03lgwAE7XOIlpPtf6RajPUhWyRdOT2z3PeoaAOtAganctTbDJ3ZN+Fw6LSFkaoTWvdtlquROX8K++RpRl0PFTAwriZUpjfZYm0vpSTwdBFWcJXBaMMroyO2EtXSipCvwGuN2M2ydhXUprs9eEmmcWO4Z0QCwurjNPBKTMpJSJvYoeZut/ybk6NS2irIPVzQvaq3Epmxw6OxmrTjeRx+EosMKA9qitrsE14o4707MaHTU846WJxwEcV4kU+34JkdKR9WNi+qygsL0AnthT2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(8676002)(8936002)(52116002)(66556008)(66476007)(6666004)(6506007)(38100700002)(316002)(5660300002)(508600001)(36756003)(956004)(38350700002)(1076003)(2616005)(83380400001)(26005)(6512007)(86362001)(186003)(30864003)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a047B78KKsJPN/+VsVBQyhnho5h2ZSObX0UG1cfgmXAmMln6i6ierx8Iyb08?=
 =?us-ascii?Q?4J+84vmgyhRlFaRAYSv2ufOpJ29SVmajf1MVqV1sYbObyMS2REULhE+m+x/O?=
 =?us-ascii?Q?LPNcBjbrPLuSpEFsmpvJ6sNLDTc1OO1yphy0iGP797suS1fxi+Qz7kAm7ZBv?=
 =?us-ascii?Q?1uKZa6mQmg3lddNkqfn7yMAuUA51dXf4CSekeOx+NG0zVYnKHDJzH22i9GKY?=
 =?us-ascii?Q?vlJkbJ3lnuuoMXwtHA/Nfu87vwprKS4FYoP6brM9yuLrTYuDnUTSuKbbytCq?=
 =?us-ascii?Q?3DfcZOLJ1PXj0yWQcCKNHgWJPeCYrqa5EyjGPk7TJWJR4lTc/6U5NvfayB5H?=
 =?us-ascii?Q?h/2k/a/ohAq/1IG59QpSadWhZKkdlSyp/p23OtNxNvdOBz+QHJOP7OsRtHSl?=
 =?us-ascii?Q?SVr3dXkYERVg+4OYnZBbcHyE4CxkJm7N734DwWp8Fh9RPXJs43TrUlK4Lk4z?=
 =?us-ascii?Q?wI3qnmgAEStVkUVXHA7XjCkoiFUj2SeHUQ8Yh2f4ZtPan4Tk953NO+fTf74n?=
 =?us-ascii?Q?B38Lc7NF2oIqER8YNeG1WTGPXQTFmHpQliM/jiYIwstrNwU9IncrmAJuSCGa?=
 =?us-ascii?Q?tHPNL9VdgPI4HYENhyRVmOjnDGC1kZv2CytznzGYDYLFfkN5s9fcwMPAuh+Q?=
 =?us-ascii?Q?j7vQ4QKh+ubz2tl/8Ll5VPBcLpnew/VaA/brZJDod8JJjZUq+Chc0kgD+T5z?=
 =?us-ascii?Q?gKsV2oYDyfFwH9fUbsxwsBf/RiU4Rg/89pKexhp8vlP8hWoNo3C99PDnW0nG?=
 =?us-ascii?Q?gj3ZuxhWQzfKB3z2tf4EpqUBWxjXvqQC9oh3jKP+yrQVnOdNBK2JVxo3ykK0?=
 =?us-ascii?Q?uwI77Ab7fqCGqGfdGXlJUshorwPZhrlPraIyQW1xDKBaQbzm4Pa5fgNaZDgp?=
 =?us-ascii?Q?bt+AZh9tSh2SSzrGW6P1OscDCV/2YoohO3KdBOVb5qUjasC/DlC6Wa3nlfBM?=
 =?us-ascii?Q?x9kt95yLv4G1Jp6M+4sZzneZUIBvBPQU/v7xyuaCsirY8A2ZIiUaR3elGnW4?=
 =?us-ascii?Q?tlWVz673j0tArAfNa4RsZSVksfXSCS+i+ZxGJ2R28O5JZ6k4lJu6QqNpEAK7?=
 =?us-ascii?Q?gN76wCDUGbYZQH6cN5qG8fqH9fo8kyBdLvPE9agZzaHTQKVj0uhEyEp0VpfX?=
 =?us-ascii?Q?isL0jvazBWsOvUeX8deyjNCoVJLnzWfPUVpMFHiGzlzzw4ouKqQU9q0p4920?=
 =?us-ascii?Q?vEfNb9Y5FHUxtoJVYRxY15391cRkdIxHMDa4vQWGISiubBGgRMhgY7CBsjTU?=
 =?us-ascii?Q?bE+vMhLralferWOd7uj7GxcXrC5JXTO5sH8uQESy35DdO2mA8ynm/9fjt/nA?=
 =?us-ascii?Q?WwPmALR8u3WgUw5mBapJmrdi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecbd96d-50f8-46c2-93da-08d9956ed5a0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 15:15:51.4716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anda-alexandra.dorneanu@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3312
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=enNhp1FI;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.1.73 as permitted sender)
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
LS1088ARDB platform.

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
---
 configs/arm64/ls1088a-rdb-inmate-demo.c | 128 ++++++
 configs/arm64/ls1088a-rdb-linux-demo.c  | 148 +++++++
 configs/arm64/ls1088a-rdb.c             | 513 ++++++++++++++++++++++++
 3 files changed, 789 insertions(+)
 create mode 100644 configs/arm64/ls1088a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1088a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1088a-rdb.c

diff --git a/configs/arm64/ls1088a-rdb-inmate-demo.c b/configs/arm64/ls1088a-rdb-inmate-demo.c
new file mode 100644
index 00000000..3caee05d
--- /dev/null
+++ b/configs/arm64/ls1088a-rdb-inmate-demo.c
@@ -0,0 +1,128 @@
+/*
+ * Configuration for LS1088ARDB board - inmate demo
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
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
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
+		.vpci_irq_base = 81 - 32,
+
+		.console = {
+			.address = 0x21c0600,
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
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
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
+				1 << (81 - 64),
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
diff --git a/configs/arm64/ls1088a-rdb-linux-demo.c b/configs/arm64/ls1088a-rdb-linux-demo.c
new file mode 100644
index 00000000..ee8b18e9
--- /dev/null
+++ b/configs/arm64/ls1088a-rdb-linux-demo.c
@@ -0,0 +1,148 @@
+/*
+ * Configuration for LS1088ARDB - linux-demo
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
+	struct jailhouse_memory mem_regions[14];
+	struct jailhouse_irqchip irqchips[1];
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
+		.vpci_irq_base = 81 - 32,
+	},
+
+	.cpus = {
+		0xc,
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
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
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
+				1 << (81 - 64) | 1 << (82 - 64) |
+				1 << (83 - 64) | 1 << (88 - 64),
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
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 */
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
diff --git a/configs/arm64/ls1088a-rdb.c b/configs/arm64/ls1088a-rdb.c
new file mode 100644
index 00000000..cb93df1e
--- /dev/null
+++ b/configs/arm64/ls1088a-rdb.c
@@ -0,0 +1,513 @@
+/*
+ * Configuration for LS1088ARDB board
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
+	struct jailhouse_memory mem_regions[63];
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
+			.address = 0x21c0500,
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
+			.name = "ls1088a",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 114 - 32,
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
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
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
+			.size = 0x180000000,
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
+		/* rcpm */ {
+			.phys_start = 0x01e30000,
+			.virt_start = 0x01e30000,
+			.size = 0x10000,
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
+		/* duart0 */ {
+			.phys_start = 0x021c0000,
+			.virt_start = 0x021c0000,
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
+			},
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
+			.phys_start = 0x0c020000,
+			.virt_start = 0x0c020000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog3 */ {
+			.phys_start = 0x0c030000,
+			.virt_start = 0x0c030000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog4 */ {
+			.phys_start = 0x0c100000,
+			.virt_start = 0x0c100000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog5 */ {
+			.phys_start = 0x0c110000,
+			.virt_start = 0x0c110000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog6 */ {
+			.phys_start = 0x0c120000,
+			.virt_start = 0x0c120000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog7 */ {
+			.phys_start = 0x0c130000,
+			.virt_start = 0x0c130000,
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
+		 /* wriop ni */ {
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
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 */
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211022151310.6058-1-anda-alexandra.dorneanu%40nxp.com.
