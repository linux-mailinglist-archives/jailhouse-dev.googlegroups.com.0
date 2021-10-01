Return-Path: <jailhouse-dev+bncBDV3L7XXLYIMDJW4RIDBUBHKE6IWC@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A8A41EEF2
	for <lists+jailhouse-dev@lfdr.de>; Fri,  1 Oct 2021 15:55:14 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id i40-20020a0565123e2800b003f53da59009sf9035104lfv.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 01 Oct 2021 06:55:14 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1633096513; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ay3cRoJeTGt2Vgl7wjbNjWSySdUCMitd0pjSobWZ7H8Kc8ZDBmmGnPCXcRRsZtryus
         y+jcyv61vy8lP0HEfGlsdueWIs4qRBOT/EZJxvQR3FX2SiGYyfeV8/uIIHkW2q4yH8on
         bLy8DgvGkNelNAhjhh68qINtRstZ1yWX3K2sw12PzC5gfnyMuVBAddsxegEX2A9ErMWu
         I/8SKPrBQZlaGKDAXanGTDQQ5tK8I9BIRn6b7fn39tqB5aeHcTtPnHJCEKxNEt0C+t68
         ln+EJzE3vf+nrAcOzasUB5UVUKGdzBoRMkRtW07vPd78gj35VbRCp25TvJ2L65+92uII
         1KzQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=JA9T2RxL/thVOgMM7NZUUaeqpTqlZ/3b2WuxmLMeRyU=;
        b=R965IJrEkJoNrqOfVxD1iQjo2GRmxSI5BpJOj7WmdWKuD+ygpUYYczdgLPIcD3STuD
         o5fi9jhQPjgdHdJr502wlPCnOqg1Gp6dYJhcbS/0Z0HjZUeGtM3cuAiUs78MCFvVmFbk
         9xkksU/LLSOt4MyzgMDVgmuN2TD+TAF/hsZS/35JvklaOBwxZ2mzz317OEiM6EDwg+Kd
         ND2qI5EqhYxGWiVx3v6xVCOrbpIHgp0CKVcw56a2ilDJfGtqu0MVSNivb6LOn36eKzOd
         oVdzeWeGTNqAXcCEjOhBHp4NjhzCg2DG6qW1qcw8qnI6xqxK0dCrSYcX4Zd1/gdtft9e
         tOGw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=c7w+XCnZ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.22.71 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JA9T2RxL/thVOgMM7NZUUaeqpTqlZ/3b2WuxmLMeRyU=;
        b=jl7uKrTs7MoOsx4WfjRMo9YZsoIeyMRAmW8xfshXnhmfHIsQclfsdhQ+Deho2bEC5q
         Kum5Rt893Prj7fhAegghMJIeicP8Kvy4HEVlrZXNtKQKXNPO9Xgk/28AKz1UhhF3uTIz
         c1TNKLJVQmK39Reyx2nRv6J0cOE+yeQRNbU3vz0NzeStemo/NxqihBZ+bajbBZrEn5Sc
         dDINwJMW9YzWzFmHhIAO67FmHpT+UkkAjlXuywOSqqPAolMTxVVeBCaf1Esk0lAsqFpK
         ovzt+HISsrenD5/mb6VXfof2hdXmJGdzXLU4SCFmmgFI/QDut3LF6upGeV+dqgZE5Twm
         kAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JA9T2RxL/thVOgMM7NZUUaeqpTqlZ/3b2WuxmLMeRyU=;
        b=x0Bt6Us5F0KSKedFYEX4U2iwUT7jJqqpMTGX56ILS1Zz4idZGGUeD3ZoXfhU8na7wP
         Q30XCi76ZpY+mNlUOcSTY7EnfvT/YERHWKbZHnluONSBkQPgYDVFwumRYNReE9Kz1SL7
         DrLskp9iK/GfP2pUYPBGmm0HM9gJDNf79rW+6H/A+4Kvqc4pK05n7Q18AO9cMnyojjjs
         QQ3JdB5I1AfNqYDtrMK/QMwDHRL+6fWjfQRgQmgfP8p9kLEh7N90V7/PiLhmJ+qrun1Q
         w0K6b1lxMdF6kQWYhK/1yor7+6FJmn+xffBokFQ9gQhNB2NZmUsA0MF5pbQOsuOci+nI
         BA4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531tEN+eGbXkia6rlpDP8egQDVltkTpNismNMySRpxyzmOQbhWhz
	y6P3uMswb7KMFwTVsWHNLHo=
X-Google-Smtp-Source: ABdhPJySt/S0Zs1LHuIGouzuHzQNe2shW3j8cwn2bCly6ATj5Qktnlsn8HSHoNc3XzPkV9TvVXcdCg==
X-Received: by 2002:a05:6512:12c6:: with SMTP id p6mr5323676lfg.526.1633096513778;
        Fri, 01 Oct 2021 06:55:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3994:: with SMTP id j20ls1007411lfu.3.gmail; Fri,
 01 Oct 2021 06:55:12 -0700 (PDT)
X-Received: by 2002:ac2:4c50:: with SMTP id o16mr5423099lfk.286.1633096512785;
        Fri, 01 Oct 2021 06:55:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633096512; cv=pass;
        d=google.com; s=arc-20160816;
        b=MsHEJA8GfxtJw+uowMSeHcwSPzD/87IgZ39YW6qQxmEFvhvytq044/laitW1AIV9po
         JImASySgAmvq0hlQGD9vAl5MWeRurddgc9qnr9PlLYVGTmdKU6njFI3wvfbb2H4NkzGO
         k8Mh2uL6Qy09BrsjPqAIqBtgGQ9TVOHsZLXM8ppC/tKZ5cNfrrIZjElmJcEoAl0X+Nhm
         h1V8KZeiOWkGbSaTx3j/ytm4LLfx8xykSATl2bpXsm2EneaLy5WIlbYDva6gcIXLCQpM
         pvG1eCRRfhsti+Ktc7uUzqaiL828sfJjFlY2OIEIOFl/8F9BZEqBl1GenCNiwjGSBSdF
         2wdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=W0DksorfsZ/aUR3WbtGUbibM97e+o0I5vzqiph05UoY=;
        b=L92HLmRTLWa2rTMHDay5RBxN7tGFIpVxSMOIZZ2+pMPEC0VHfBtiXtfJIpH31zOwM1
         kd6YwFPAhpXEKTCQ2PSZhcIwnP/txECnZg/L6gFwuWNcTLNS9mmxLcLqf1sVeGFefHCq
         S6cr3lEgBGGWkLhcdSguV3pRxqp7iKWt8WMDiAmKUYPIEqlLxZnNgHnXNH8vVO5Mmzkm
         vpIb62CZ8ZQsdwb0W/avbm1TcvuppBEhqJknD/f7iZnw9VuWULxUXCrPKM8SrK0gwR9h
         glpXs/3jt2xtdyCyQY4z9LUKudAk3AboO4jsxTd/4P8GDdLo8leqDBKjAUqnFahd2/qS
         ki4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=c7w+XCnZ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.22.71 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com. [40.107.22.71])
        by gmr-mx.google.com with ESMTPS id v25si366975lfr.1.2021.10.01.06.55.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Oct 2021 06:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.22.71 as permitted sender) client-ip=40.107.22.71;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MulK6XIBOLc66cE5tq8H8zkiQpbw4Op6rSnUVu5/BPovWARrwKn1Ok2o+KudpjSMVfLTx9nPDbTH5vyM7kC0kK3r68NcZBSVXPEAvLoOUzsIZn55wsJQr1qz1qqvqmnmHkjwZCJQK4C1YZ8PdYh/Yc0Zl1mDrqM8AtibdbefClI/iq91npgwS3772GpIR/hJ+hrr/1apBC0zo8NizNLEJBHVNtjtBGBXy9R5ine7P/1t/r3qsagZ/ITVcz8rpNWB5XdYCBDPHfTs3nLI1rc4rECQiAkifoBwxhI8fY2n+QFLNLyhFmpSBjrboJ6e70CAJkzNcdwYL7L+nAAbQ3Uoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0DksorfsZ/aUR3WbtGUbibM97e+o0I5vzqiph05UoY=;
 b=bpmoqjs58a4yYmqf1yd9DICI3hsMUUqOljZIUqPTafijYpE2EcD8eI6wqbh7dH5ei6uqyo1ovN5Rel5Nl0Z3Y6LnN4tcLx5wT7isg4oQd9mwA3U4R5chx9G95d1obVwIGXmjbsE9FCc7fsLWR7WeUWQD6xGrM5MYvVvC8ab2w8o6cX9seW9gCnWf6M5NIUyw5anRmxy9nL72XOSWbzd/azFEi/M8PSC2qGbsIu6+58nWSPOPXs0P64PtP2Z81exdnWTpa2UAaBl+9aF0w1+BUYLzO/3RjmP2pOEhHR++Q1zjtVuKF30vplao4VStSXTRIizg8g8+oR7zSODdXvv0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB6992.eurprd04.prod.outlook.com (2603:10a6:803:139::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 13:55:11 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc%3]) with mapi id 15.20.4544.022; Fri, 1 Oct 2021
 13:55:11 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Peng Fan <peng.fan@nxp.com>
Subject: RE: [EXT] [PATCH 1/2] arm: gic-v3: clear SGI GICR active flag
Thread-Topic: [EXT] [PATCH 1/2] arm: gic-v3: clear SGI GICR active flag
Thread-Index: AQHXtcnlt0TepSll3kSWUFyEL/AnPKu+JilQ
Date: Fri, 1 Oct 2021 13:55:11 +0000
Message-ID: <VI1PR04MB4719680FEAC9CAB7F5C5DCFFBAAB9@VI1PR04MB4719.eurprd04.prod.outlook.com>
References: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
In-Reply-To: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e8b610e-d8ee-4cc4-194f-08d984e3163c
x-ms-traffictypediagnostic: VI1PR04MB6992:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB69922DF5A7D91EA627B9BE6EBAAB9@VI1PR04MB6992.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nRD+tA+IF0ZqBeMKk5h142zdXx/8cC+/ty9NGRCTCrY35Ic5fLQ6YQPMg0VpjYRJnJZOaXc4UYo1jik9oDveSBn151wOH9gVVjVa7lI+qm79seYDV2vf/5pDV97jmxAp4KHDO6P2RDM+KfW51hGo/k/KOtV+Nn9T54DrFZ1WRQO04NU1bJi1nJwL7WOA+3FttK0CTThuJCxguCG9Bc/eRq0BzJWOMNB0BxYCkw/D3jxz8HQjRXxQV/BM80hthgV6NVKdNjkZVZGTS6hEl/jIjqiwEZLfSP04ZvYACZDxwPjif4U0nGYYkMoFZvCOxWdVmZ0hJJv5N/Q5K04KnHZ8mBFZJFGPISjJ8jaR12z0VUoY66yzt88esaM0xz7cN75Zs72qk79DAUVMgivgbcUIRKyR1Gam2HZ92tfjOd8lkwIdzspxtL5jC1ulDvvKZ97rX/AiV/VYtmnkHm8mgo2fjIO0Nvuh7vDwKsc1IxSHWn1p6yDAxGzv9ItrqsKAY2exUZBXNq6MdPB8fF/nl9+Zfgn8WHpspjCX7Tz3p0xbTNcSYirGUtwtLVHdKzCw5FMA7/me7yM8cEzjw9sCfA1soonXARhbu4lVRjxQGITOBdEXtFghkS0PakpE/aTeQSv1G5Vv4xyWlAx2WbxJv8fuMOCdmPY0VDRtLWoe0nNQr30/yx2x1LEfvWuzQJj6Job/fvwoGhYBhq70/CwNsuHX7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(8936002)(83380400001)(76116006)(66946007)(8676002)(7696005)(64756008)(38100700002)(55016002)(2906002)(122000001)(110136005)(9686003)(6506007)(508600001)(66446008)(316002)(5660300002)(86362001)(186003)(52536014)(26005)(33656002)(71200400001)(38070700005)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oPRpiY984nivecgyg9v16eVfiTsBuV78LIUGapE7BPNK/wxANtowFldLL+2b?=
 =?us-ascii?Q?tbIMgY2QLSpGf3WzdtgJin+YV7xsD6H2GY3bjX5Glkbxj/5M323C329To8Di?=
 =?us-ascii?Q?2kmLmHamzgfoaSZPvXXlEscZ0HuzhLeLpw8qCJPxTt++P9scdS+h7fRMiZi2?=
 =?us-ascii?Q?iz2VxHrB7nOsWhwC96iBivvyPx81gbauPrFfWCk6z0qcC/ILLw/5e1aBaDxg?=
 =?us-ascii?Q?VzPiCTAmCvXdUN+jJUFvMzVpXWAMhzRG75JzK+2beKhdCskKGt3zuG3Qhc+a?=
 =?us-ascii?Q?/BhKDy4ClXQE+rDVnTsS5JTIr4iJVSE91K3XaAq7x3nrkGkN7CvHcEda52Db?=
 =?us-ascii?Q?wiMAmB5WllDe+JX5qM/HzvuuirAauVePArVhjjutycl+osnXepMYaeQp8SUw?=
 =?us-ascii?Q?fpdKnbaUQEgfTtaEVvA7HUbfHRNNZQkVrbhJxtf5eAgAcmKhrSzxrfUvKksh?=
 =?us-ascii?Q?pGCFNZE2iJS7AgNS/6o56OFuaysNGfXZUBvXGunTdKmmW6axRP1ujvOuRnkS?=
 =?us-ascii?Q?GGjVn5sWnSRjUufX1CFXv0HxenAP2y1Q4RFt1REypXUXmzjjOQlcMCKkDb93?=
 =?us-ascii?Q?/sL9JZaPq8qu/eIo6MvNo/7lNNAaa+13vF8hhvrFw7/zYymWi6Wew7Yh6Brm?=
 =?us-ascii?Q?XFRRfQ1MR4ZPVO0xLPzeEjKBoB3obOLAsnFLmlmaDyK7l4ZrgANbo2nqWRY9?=
 =?us-ascii?Q?d2iKFqNUwV/ulsjbejlPMa0bV4mUVAt0u6daVI63NgIwfJHllttW43vLTKdl?=
 =?us-ascii?Q?iOqRPXinJUvhz689pabW2UX7aovT3R8Va6eiAR9djk4nAAhcH+pYx0Xhe0Cl?=
 =?us-ascii?Q?jc2FKU89QFAWUzeG+3grxNXeoSLGf297tdjmBtNEXLExcDPV1XzWrH6UxUSU?=
 =?us-ascii?Q?I3wYLXkfd1uZI0YSVuT5H5uuPtnp3fCJC/NLI1H2b8o4Lg2vDn/30Ov/pq1l?=
 =?us-ascii?Q?ACC8m32wbV8NvcMvv/juYp6R14X4omBE7sT1cfwgXsxt96/mnSFFk18pNvm0?=
 =?us-ascii?Q?pDlBibF8u4f5rqKpqQKo7LdFH6rIQ0qGEp5uS6B0Nv0nAH6mJga6piNVPP+d?=
 =?us-ascii?Q?UTGQWkJ65gooxMjKacJ1fD13gQMQS74qla14X2QeM+AYXRP74ahJHQ8hPhxz?=
 =?us-ascii?Q?M56cmx7ZM3/JUF371sMHu0zd/LZmKPZQ5wq3diA3TbUtmbInlHhSg2Q68vs+?=
 =?us-ascii?Q?P5mVcFsqsc+L1E5gqVla9J2XIuAP2M8lIhxFMWaE16h+PaeZ4g1c4lVrdnlz?=
 =?us-ascii?Q?V5hfkuNqttsqrsDR4oSAtYUqxPeV8aIud8HbyQjkf5mssTfWeAG6uX/pT2UG?=
 =?us-ascii?Q?k7xVepMfvGTD2l/0jTGil29q?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8b610e-d8ee-4cc4-194f-08d984e3163c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 13:55:11.3543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uYQk6t2BfFi987eoCp5KRYqyX58M3V2dDLlxb9o6UpFB7Gcsf3Hr6mjDfGbw9uUv0II04EL2c7nMW7wpDO35Ruac7ot85FU9vNs+DSexDCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6992
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=c7w+XCnZ;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.22.71 as permitted sender)
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

> Caution: EXT Email
>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> With Linux Kernel 5.15
> commit 6abbd6988971a ("irqchip/gic, gic-v3: Make SGIs use handle_percpu_d=
evid_irq()"), the on_each_cpu IPI_CALL_FUNC interrupt active flag will not =
be cleared until interrupt handler finish.
>=20
> Without Jailhouse hypervisor enabled, everything is ok, but when enabling=
 jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1 is actually acces=
sing ICV_DIR_EL1 when eoi_irq after enter_hypervisor return. It not able to=
 deactive the interrupt that is actually a phyiscal irq which in active sta=
te.
>=20
> To ARM64, the IPI_CALL_FUNC is using SGI 1 which is same value as jailhou=
se SGI_EVENT.
>=20
> Then the following `jailhouse cell create` will hang the system, because =
the previous 'SGI_EVENT' is in active state and not deactivated, so the cur=
rent SGI_EVENT issued not able to interrupt the target cpu core.
>=20
> To resolve this issue, let's clear the active bit of SGI_EVENT and SGI_IN=
JECT before back to Linux.
>=20
> Tested on NXP i.MX8MP-EVK
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm-common/gic-v3.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-co=
mmon/gic-v3.c
> index 03cface0..8327a95a 100644
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -200,7 +200,7 @@ static int gicv3_cpu_init(struct per_cpu *cpu_data)
>         unsigned long redist_addr =3D system_config->platform_info.arm.gi=
cr_base;
>         unsigned long redist_size =3D GIC_V3_REDIST_SIZE;
>         void *redist_base =3D gicr_base;
> -       unsigned long gicr_ispendr;
> +       unsigned long gicr_ispendr, gicr_isacter;
>         unsigned int n;
>         void *gicr;
>         u64 typer, mpidr;
> @@ -291,6 +291,10 @@ static int gicv3_cpu_init(struct per_cpu *cpu_data)
>         /* After this, the cells access the virtual interface of the GIC.=
 */
>         arm_write_sysreg(ICH_HCR_EL2, ICH_HCR_EN);
>=20
> +       /* Clear SGI active flag */
> +       gicr_isacter =3D mmio_read32(gicr + GICR_ISACTIVER);
> +       mmio_write32(gicr + GICR_ICACTIVER, gicr_isacter & 0xffff);
> +
>         /* Forward any pending physical SGIs to the virtual queue. */
>         gicr_ispendr =3D mmio_read32(gicr + GICR_ISPENDR);
>         for (n =3D 0; n < 16; n++) {
> --
> 2.25.1
>=20

Hi,

I have encountered the issue on NXP LS1028ARDB as well, when testing with k=
ernel 5.15. I have tested the fix and the issue is no longer reproducing.

Regards,
Anda

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/VI1PR04MB4719680FEAC9CAB7F5C5DCFFBAAB9%40VI1PR04MB4719.eurprd=
04.prod.outlook.com.
