Return-Path: <jailhouse-dev+bncBDV3L7XXLYIIRKGTQIDBUBFKLLBF4@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id A27A0342219
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 17:40:41 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id b1sf14780104lft.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 09:40:41 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616172041; cv=pass;
        d=google.com; s=arc-20160816;
        b=vTUp9gV/nSKAOXQ6iOS5XCA9KvQY3JDqFSnFcZojWtH3IjflQyYcwgti38I2CKJeD5
         MOaMrLsRkCRkUYNaYfLhbW9AQszwXgjaYjiOUPrxVsMoANQZcDVEZMw8qO3pKR7lSCys
         SIvpSg9ATjbCi+lhrk0Z4X+cd8GGVpwzc/puD3B73mn9fRZR8CHQeWQiVyFxZcMTzdzM
         CjIzqfwQmwS9nuPuDMkMeCH9zQKG6Rti2zcVvevPJAFrq1sSRqQtHBtth+WEPMSFZfEP
         nLOBuAvSqFKZe1ra4c78oaa1KB2EBZnvf/UU7AGr+kIlxsEYg1CscJ69g/pHBSVZiC9k
         HwbQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ztJNbaLRbZfaq/QcyEJeTGVTuu0ETR9zmdQOQPuVkTA=;
        b=tZfLsprtrsXlEZ7ZzIJ23oyN405BCu1E9lrMCqv5ExGGZtHyX1DQ3YI98Rd3zdrDJZ
         YBxrQoEsoXoVs+yXdImLWbhJn2zAkHJGUtawAkEX8EVwsQ6sV925DvD1xx32r67n3BGs
         xmGQ5+fNYKNYRqLbWFyzYrThyA9f1V+E6SqNcWQQ9kwHe71xcLJFTQNXFe4oQiAgdi6R
         g1WrBBA3Eee+bZyPkkkP+iAZ2+gfP80zGZHCOKxHcBm42t5EoKFl/I9bsdE00T5rzj53
         9KJGIh36ZGskzYK+cbSn2rKqBUj4tJmecG/BzVjnWHYlAdqkULyJeq2DHpcd0WkGewxH
         KJXQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=MUPQ7Qgf;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.20.87 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ztJNbaLRbZfaq/QcyEJeTGVTuu0ETR9zmdQOQPuVkTA=;
        b=r/73nMouWMIGDlpLq2vggnnPnEG3HxpNFg/eGB+Qk1DLrYZAd5dXJmYOa32duF9zcw
         eGOoFVjuCTBqsEf2vV/81DOvCi/LJp/un6vpFm9nepwvazWDqlx+Rr0ALkRX0Ku3YkRu
         VgE0gJ/EL0rZkvsagyQYLefh66T2EYb41INAlXdzwSVuaZUBOBhDcTOORv5hjw2haVHu
         G8GmQLzvU9uuEe3/osBmMzY5rp0If1+lDNOiMjv0sJ8Q95rP/+myFSVNQyv1eW/rNx+i
         jcorNY/Phe7GSF2gry1CDMSzOZdhP1Jv9V6lFjInjWZBidEpe/yYHnV1Ec9lh5Ed7l30
         CaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ztJNbaLRbZfaq/QcyEJeTGVTuu0ETR9zmdQOQPuVkTA=;
        b=ECY2u2r3Q8B4sTkVqx2LUbgr/e3NWxkQERXOs7e6k3Qc5y/l7nCuqPi8Y5z9OgtDa1
         t6Uu9rsK+Sy6vfnziK2y9Hr+v6k1TmYaVoZqvvM7AMgddb/5TwcHxKQnKuGGNS/4x2y7
         +oWRVpJg/ieJ71f52hCjsISJk++ne9uTpu5u1Q7JEjApTymJZJebcGeA9kJnEpx8KT6J
         MxsDkE9uETeV4V9dGclhrCc3JdLRWEq9ATD8IXh3sh1gZ1dsFdlhvVn2xn3Mz4MAT9UK
         bkr8RstR33c6IPCHr9nCHJwetAKa9PItFOs3qLjBv3OXBA6b8CLvRH7HgKkDVp4Pjn7g
         s0eQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533daD3c+O8756POZjwxv5z0MSvlWDZdChhB3GgQ/kBBoBbqTVDf
	YMS5SFMGc1rG7kNJ8t4k1nY=
X-Google-Smtp-Source: ABdhPJxAmZwoW7JmYEeRatefcBm+DWRGvyaQlc6SRy90HakHyM6XPyxQ+htmBSgad74/p6DVSCW9aA==
X-Received: by 2002:a2e:87d5:: with SMTP id v21mr1420537ljj.195.1616172041169;
        Fri, 19 Mar 2021 09:40:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:e86:: with SMTP id 128ls4127246lfo.0.gmail; Fri, 19 Mar
 2021 09:40:40 -0700 (PDT)
X-Received: by 2002:ac2:43ca:: with SMTP id u10mr1286487lfl.492.1616172040081;
        Fri, 19 Mar 2021 09:40:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616172040; cv=pass;
        d=google.com; s=arc-20160816;
        b=pTnUSV9QYZSvGZwyy1U7lgqUQECKneP/9aJFazuFOASZ0WokR0qVA3miU2ZlBCFxg/
         GMKkpKXlqktiaFXa27hlKaVLtulrexzOfyRIdvc1r5hDSUXoifFIrzua6W9SbJRtaxZC
         3jcJbnLe5sMxSBciaRbXy1LstQPV+hTjkJGXoTIjz0OtQ9hL5EphwDdn406My1u2Zzrv
         gVswcB/H7uyW6To2UZC3L21x5vlJ0y8ALS9UBeXmm8qCGbX4v7vNSUjpOPze1ToaGqHC
         DSSZxSGDwNGa8OBULR7ZY+Z3OWY8WOAYo04Of/E2iKz16j4BbPyoIJuvEBs0vuRHA2TV
         m1PQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4gM6toiSPAZUH+3Ml+5JEo98zlhXzMwQ3ZWrbAo2IuQ=;
        b=C4BqJzBv6bA4xFb/iFN852VMW9JOjT2423HBiIJihhPZZyf02QN1Yn8eg4HtIihUOt
         QX50fxcJMXE8liACHIZxhKL4/WtweDU5o/ee7OTWjPOR/8tuB8Sr8szzBfIy1z2eGHtS
         Ltwzwe7tF9tHVSv/ftR2vkRClKU4K65cR4kqk5+LJCoq6NyC1Ur8vvU7I8XjjN08M6fu
         CQCMmY1xjgyr/cjnxfcVgvsqx2aDXNC9h28/o8OIBiAVZyBoq3wliZNH9r/zpPUuJqqb
         XP7a0qU3mOmD8MWyQY7UcVhFeDbu2GNNgQUv/UPwF33rAty0Uizqz2FzvqUdItYF/AMN
         UcFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=MUPQ7Qgf;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.20.87 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2087.outbound.protection.outlook.com. [40.107.20.87])
        by gmr-mx.google.com with ESMTPS id 63si202186lfg.9.2021.03.19.09.40.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 09:40:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.20.87 as permitted sender) client-ip=40.107.20.87;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxgbt24zIw/p/L0kHsjYEPu9nkbn35oNObZvzuwM68BnX4I4pwxxGcr/g41fVWEwX6ojLMRBZBYyuGSCA4mVZ9vVuEHbcL5AOiUk7GdBr2/oQLMqPj015csxrrWMK53DH7L3W0LB3qQ5gz6mw7mbQw9fAJjPFY6seMwXdPiJTPOd8EXYm7HR426PGpC0rNwbJuWDm6Gz51Dvzb3tPE0f0idBSzApJtjtpozs6PUd9EjvwiWoZM0g6HeoPaK+cqq4HjNW+3dRdBXc3NoXWhLQxDg3bP644xDkXSe0rrJspjWDHKggPOWknP6jMQff8VG2ghzKamgT3FiCSRdGFFdGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gM6toiSPAZUH+3Ml+5JEo98zlhXzMwQ3ZWrbAo2IuQ=;
 b=YzI+PFNXQMYCUcJg+BeRwtwXFHE0YMZHkMx+z+pgJ3jAPP6N850QPUnUamVY5ZxG3GRyv/TVPT458PXcv/lt8jgL2X4D7usYQy1p1uAjp2B5JE0Qrk7nVD4sv+gnNSUGnTXH6mmnCBHK08cfGhoL3GSvXaS7MNWNg98SBjv0rDLBwSWwRsCkpZ8g0I8/yDaY7H/qmtFRystho11KUFL8Zw7qkhiomy4xxYP053joLxocMoYiB/0/ncrlKGRhgaNA5dORb48rHN17ufjwXqRH2MUPmQ4KfufFWpd327SkLzOqdOtnkb6P1+VuqMsMP9cAwzgqR131Q6HRLLkhzFTGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 19 Mar
 2021 16:40:39 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::5dc3:addc:b43e:a00e]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::5dc3:addc:b43e:a00e%6]) with mapi id 15.20.3933.033; Fri, 19 Mar 2021
 16:40:38 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Subject: [PATCH v2 1/2] configs: arm64: Add support for NXP LS1028ARDB platform
Date: Fri, 19 Mar 2021 18:40:23 +0200
Message-Id: <20210319164024.4060-2-anda-alexandra.dorneanu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319164024.4060-1-anda-alexandra.dorneanu@nxp.com>
References: <20210319164024.4060-1-anda-alexandra.dorneanu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM0PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::16) To VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-119.am.freescale.net (83.217.231.2) by AM0PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:208:ab::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 16:40:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a72edfa-a8cb-4d43-fdbc-08d8eaf5b9e7
X-MS-TrafficTypeDiagnostic: VI1PR04MB7117:
X-Microsoft-Antispam-PRVS: <VI1PR04MB711713E5F17321D2EA855464BA689@VI1PR04MB7117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMj8ZtGWS4NsMMfgKDWGiHr0aqDQLAAaYklQX96OTzRG9S0c6H6V3pKovR0yDnrVQ0Qf2MdBT0Qq1Tqgc1yFU16fRONwRHuBo8+hqaQ7KaYqLtg2IQc9xfbyC23wxF+ax1Hj/10y3tvwAMnfR6HV97G5D/Ip39gT77tCr374jcTGMjlSDrOoZ+v0V5Z8+570a9GfUjfgaJLhFrZVCMvRM17d1eZTaTkughohDhSTKqTzcXMVxD0BJaBglC6Mkq1R4HVtRWfMpLegjt6TaJhMmhdnnSYpmjUzAK8oh8qZC/8phTjpTtkYMuGnK0H1wlaV153ef8DdTGhPCYE/NS+w83pxVzQqB0iTzVGPwG8SIzO2L6SObGltSh/Vk6ynLHTp2LqrvDg8ZhuZBvt0gYV+Rp+GrDgBN9cloVhd1xRSaKZF9JOMTLzBCnmVOwlW1Lmi04vqYekl25w1G/QajL4lPc66imTMsepZDYTbEGCWvU8kCWSw0saDEAh0tGnjnmbEN13hW/cG5NmQOswFMX4Vgh9VNzu4T1/rg/ZyXrQt/+41zrc83aFi/wvFl1zTBpl7JvKm/eUOUng8r6p1K2yc7LUSIzK2/V5Kf50xhSCwMSkBw9Wu7nsi31xBm83My394z6I70zqUTHSMFBXtcyaxwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(2616005)(5660300002)(52116002)(66946007)(36756003)(16526019)(30864003)(66476007)(26005)(8936002)(2906002)(316002)(6486002)(6666004)(478600001)(1076003)(6506007)(6512007)(66556008)(186003)(86362001)(8676002)(956004)(83380400001)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6T6Xn+M1dAf1vqOoBlPeF+prj00ONf6h29aCm2R0Yn9sGZIXcnUnAbgtQq1V?=
 =?us-ascii?Q?One01wG7vH+JJNAxksrHPfQ4MMfzOlb/jH1yYXlfJBxs/wy21SVEnJIu2cTj?=
 =?us-ascii?Q?nXJvZ6LLyaY0LAmQS8eH9CdJgjYS1Bxxj7LsYjOP6DowLOsp/ocg2/7E3qO6?=
 =?us-ascii?Q?ODSaxiJlfKstsXS6lPKFL4jezZheA3fR4Kft4UV+agC0kwQF9/jSN02Q5Vmi?=
 =?us-ascii?Q?k9HB+IbJlEw0Ray7dAtzZVobkaK0+TwjqhqattVZKpx9z/vHZpwaSDwJDnwi?=
 =?us-ascii?Q?TkHeOk8JNU2UsMnuYvTJ1iDjnWJdAs379MUEadmwNDM+orzlXz/HFuDW6l/s?=
 =?us-ascii?Q?sEjz63VVnD3kpNm/6SaHTYjtNPzIT6ENAl1hdAMUdQyh2/D2nNOZPzSGCZWH?=
 =?us-ascii?Q?i0pIf3ghVWwCoCE9jhyoVeHuk04bhX5gft3/s7/HbAc2+DzBIQIJABIcN9kR?=
 =?us-ascii?Q?zyMWJqbp/CxbmcbsxcdcJTaf8W+AdmauMAFofNDTxX16hSr0bwHBijdXdsVW?=
 =?us-ascii?Q?zTqJCOIC/mPNQYc5AdYOI77r3gLE7dao7K5mGFLxsX8gOrYYEZYBahLPaiCm?=
 =?us-ascii?Q?Bdc2lNKlBPm1Y8EhyVY3zVlooemI3jH4qN94z7sCButsIu1/ZBIHO7wU1O5O?=
 =?us-ascii?Q?wR8KobK4Ph4kzR1kDQ/a9p3q0pMQB/5yNdiRteFvBXxoqQLiiWgWdEiUeVl1?=
 =?us-ascii?Q?ia1jOr5V8EAW79FoMb8ZFSPiVQRNqX3O2kuTD9WLbCgUkYmEnHSzg2nWABaz?=
 =?us-ascii?Q?LwZhSDip3ynjhWRV+IujAhxDzoWd9DbPpQu2qTQJYxopYa1V0KY06qOf3CDd?=
 =?us-ascii?Q?o1Cvn4bY3B7TmFmiMVguy0zELnAeHxjn8Y2vAUhRDgxdNi9UQfW5OAuw9rmV?=
 =?us-ascii?Q?AzAhQTh3p40QaPoC6+RX47F976g81Im6bTKBTHD8xH+oZQ7hBb1OXjqrusJB?=
 =?us-ascii?Q?f4htiJcLl3dtb8s3xedzWuh9XoSU7aW4IlHXjG5i6njOektuToHEBO+So6gs?=
 =?us-ascii?Q?CMUbLoqpBuvBTXRuYBHFvtowRcvmuha7YEWCjKXSnGL3t9Cqij7BUwRTjE/j?=
 =?us-ascii?Q?NC4Iy/oVixsoMSBazz/6Segv/faZaWHlZuWFey6fu2ZH71HqcfLgePLvuNyr?=
 =?us-ascii?Q?lXzPL66GukdIxK/BOUrnlSjqU3mC+lWhPItHPrMaOeHIWtengQJhRFrmuq4y?=
 =?us-ascii?Q?PXwKer1f3Iuf2mNJ3aJYhoZfOL5GBC8rwm/HHnrK0Q+PNj4eZj3guxHy9BGk?=
 =?us-ascii?Q?saALaggFsw/6rRKnJeBfOICvJHOOWfOl5loccyHdNNqxzlx/cV7Thq2NY8XF?=
 =?us-ascii?Q?ulSk5dtme0JmkLuaOKaPQoQY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a72edfa-a8cb-4d43-fdbc-08d8eaf5b9e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 16:40:38.1777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqzhwbqcJx953DTG3s1+ufio77dZvtwzf3dZt2/lHLs68ZXY7i1I0OJi1Ch6qZQ3ksbvFeezzG3vXSTKwVgccK/r3B2LQQr9IPK5GlbBBaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=MUPQ7Qgf;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.20.87 as permitted sender)
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
LS1028ARDB platform.

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
---
 configs/arm64/ls1028a-rdb-inmate-demo.c | 122 +++++
 configs/arm64/ls1028a-rdb-linux-demo.c  | 142 ++++++
 configs/arm64/ls1028a-rdb.c             | 609 ++++++++++++++++++++++++
 3 files changed, 873 insertions(+)
 create mode 100644 configs/arm64/ls1028a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1028a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1028a-rdb.c

diff --git a/configs/arm64/ls1028a-rdb-inmate-demo.c b/configs/arm64/ls1028a-rdb-inmate-demo.c
new file mode 100644
index 00000000..8b45a9ed
--- /dev/null
+++ b/configs/arm64/ls1028a-rdb-inmate-demo.c
@@ -0,0 +1,122 @@
+/*
+ * Configuration for LS1028ARDB board - inmate demo
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
+		.vpci_irq_base = 40 - 32,
+
+		.console = {
+			.address = 0x21c0600,
+			.divider = 0x6d,
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
+		/* GIC */ {
+			.address = 0x6000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (40 - 32),
+				0,
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
diff --git a/configs/arm64/ls1028a-rdb-linux-demo.c b/configs/arm64/ls1028a-rdb-linux-demo.c
new file mode 100644
index 00000000..e2cb01af
--- /dev/null
+++ b/configs/arm64/ls1028a-rdb-linux-demo.c
@@ -0,0 +1,142 @@
+/*
+ * Configuration for LS1028ARDB board - linux demo
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
+		.vpci_irq_base = 40 - 32,
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
+		/* GIC */ {
+			.address = 0x6000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (40 - 32) | 1 << (41 - 32) |
+				1 << (42 - 32) | 1 << (43 - 32),
+				0,
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
diff --git a/configs/arm64/ls1028a-rdb.c b/configs/arm64/ls1028a-rdb.c
new file mode 100644
index 00000000..6027772b
--- /dev/null
+++ b/configs/arm64/ls1028a-rdb.c
@@ -0,0 +1,609 @@
+/*
+ * Configuration for LS1028ARDB board
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
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[76];
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
+			.pci_mmconfig_base = 0xfb500000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = -1,
+
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x6000000,
+				.gicr_base = 0x6040000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "ls1028a",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 50 - 32,
+		},
+	},
+
+	.cpus = {
+		0x3,
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
+		/* DRAM2 2GB */ {
+			.phys_start = 0x2080000000,
+			.virt_start = 0x2080000000,
+			.size = 0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM - ~1GB - inmate */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3b500000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DDR memory controller */ {
+			.phys_start = 0x01080000,
+			.virt_start = 0x01080000,
+			.size =	0x1000,
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
+		/* scfg */ {
+			.phys_start = 0x01fc0000,
+			.virt_start = 0x01fc0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* clockgen */ {
+			.phys_start = 0x01300000,
+			.virt_start = 0x01300000,
+			.size = 0xa0000,
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
+		/* i2c4 */ {
+			.phys_start = 0x02040000,
+			.virt_start = 0x02040000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c5 */ {
+			.phys_start = 0x02050000,
+			.virt_start = 0x02050000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c6 */ {
+			.phys_start = 0x02060000,
+			.virt_start = 0x02060000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c7 */ {
+			.phys_start = 0x02070000,
+			.virt_start = 0x02070000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* fspi */ {
+			.phys_start = 0x020c0000,
+			.virt_start = 0x020c0000,
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
+		/* dspi1 */ {
+			.phys_start = 0x02110000,
+			.virt_start = 0x02110000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dspi2 */ {
+			.phys_start = 0x02120000,
+			.virt_start = 0x02120000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* esdhc */ {
+			.phys_start = 0x02140000,
+			.virt_start = 0x02140000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* esdhc1 */ {
+			.phys_start = 0x02150000,
+			.virt_start = 0x02150000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* can0 */ {
+			.phys_start = 0x02180000,
+			.virt_start = 0x02180000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* can1 */ {
+			.phys_start = 0x02190000,
+			.virt_start = 0x02190000,
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
+		/* lpuart0 */ {
+			.phys_start = 0x02260000,
+			.virt_start = 0x02260000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart1 */ {
+			.phys_start = 0x02270000,
+			.virt_start = 0x02270000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart2 */ {
+			.phys_start = 0x02280000,
+			.virt_start = 0x02280000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart3 */ {
+			.phys_start = 0x02290000,
+			.virt_start = 0x02290000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart4 */ {
+			.phys_start = 0x022a0000,
+			.virt_start = 0x022a0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart5 */ {
+			.phys_start = 0x022b0000,
+			.virt_start = 0x022b0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* edma0 */ {
+			.phys_start = 0x022c0000,
+			.virt_start = 0x022c0000,
+			.size = 0x30000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio1 */ {
+			.phys_start = 0x02300000,
+			.virt_start = 0x02300000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio2 */ {
+			.phys_start = 0x02310000,
+			.virt_start = 0x02310000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio3 */ {
+			.phys_start = 0x02320000,
+			.virt_start = 0x02320000,
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
+		/* sata */ {
+			.phys_start = 0x03200000,
+			.virt_start = 0x03200000,
+			.size = 0x10000,
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
+		/* pcie2 pf0 */ {
+			.phys_start = 0x035c0000,
+			.virt_start = 0x035c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie1 host bridge */ {
+			.phys_start = 0x8000000000,
+			.virt_start = 0x8000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 host bridge */ {
+			.phys_start = 0x8800000000,
+			.virt_start = 0x8800000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gic its */ {
+			.phys_start = 0x06020000,
+			.virt_start = 0x06020000,
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
+		/* gpu */ {
+			.phys_start = 0x0f0c0000,
+			.virt_start = 0x0f0c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai1 */ {
+			.phys_start = 0x0f100000,
+			.virt_start = 0x0f100000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai2 */ {
+			.phys_start = 0x0f110000,
+			.virt_start = 0x0f110000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai3 */ {
+			.phys_start = 0x0f120000,
+			.virt_start = 0x0f120000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai4 */ {
+			.phys_start = 0x0f130000,
+			.virt_start = 0x0f130000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai5 */ {
+			.phys_start = 0x0f140000,
+			.virt_start = 0x0f140000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai6 */ {
+			.phys_start = 0x0f150000,
+			.virt_start = 0x0f150000,
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
+		/* pcie  */ {
+			.phys_start = 0x1f0000000,
+			.virt_start = 0x1f0000000,
+			.size = 0x10000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm0 */ {
+			.phys_start = 0x02800000,
+			.virt_start = 0x02800000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm1 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm2 */ {
+			.phys_start = 0x02820000,
+			.virt_start = 0x02820000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm3 */ {
+			.phys_start = 0x02830000,
+			.virt_start = 0x02830000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm4 */ {
+			.phys_start = 0x02840000,
+			.virt_start = 0x02840000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm5 */ {
+			.phys_start = 0x02850000,
+			.virt_start = 0x02850000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm6 */ {
+			.phys_start = 0x02860000,
+			.virt_start = 0x02860000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm7 */ {
+			.phys_start = 0x02870000,
+			.virt_start = 0x02870000,
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
+		/* dpclk */ {
+			.phys_start = 0x0f1f0000,
+			.virt_start = 0x0f1f0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* malidp */ {
+			.phys_start = 0x0f080000,
+			.virt_start = 0x0f080000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* hdptx0 */ {
+			.phys_start = 0x0f200000,
+			.virt_start = 0x0f200000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x6000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+		/* GIC */ {
+			.address = 0x6000000,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210319164024.4060-2-anda-alexandra.dorneanu%40nxp.com.
