Return-Path: <jailhouse-dev+bncBAABBVGVUOGQMGQEYIYIQJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819046671F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Dec 2021 16:48:37 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id w5-20020a05640234c500b003f1b9ab06d2sf11813302edc.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Dec 2021 07:48:37 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638460116; cv=pass;
        d=google.com; s=arc-20160816;
        b=Dnu2ge0UFrLJWs74jxKmofF8PnTQ/F0SUffFCLvNvwpRxCCbEKSVBe+h34sfIVEmHa
         4guIyWmTXLxROAVcS5i81n9rutyR1AcQEJRHbXjTB3cGYhzqJ96KPjUR7u05TrJncx8+
         wnwMh342SVkX2edatBbUK0QBGd42EeBAj9amUgUukhVyQ7OQWF06Rc69Of5F+AtWNG5p
         ak6gp231kOeDbvNqlaF8/iwF1mjLwbo7ducqhZyymf2Z8Bztm3vSWe+Uus+S0BDSBtUV
         qo4Hu639mqBQbp8BNo2N2DorW+IC7HFtyj3Y2heTGq9wtBpDNK91+evhmkxOjwA3lpVd
         ThvA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=2Ls+QSqBea1HfubFqdfnKx89pm6znm+nlH82MjcOYPw=;
        b=JoV1ugWwez42r/kmbS5GuPMNuc+eryBdmt+xBDozdRRRNgvof53h7Qoss/NcezeW5v
         HxacooUk56l/fIiycNfFOef/21PObIj8c4Xukq3Q1bRYcQRmBhKEawrPfw8G+9+ziFIp
         bA6AFGJN00ROz+z+MCOIgiXs605JeZi5VUtQmbcLKcstEtRJbZop60t8TzTWBLAznoJv
         rC+wq0Otysp3DY/TM6w00nBoAiVv+2p5nnSK+WSJglLrlIxT3RlIYj+XVPazZ2nEpwet
         3HhGkf1PcY5Ew4WcvjucNdKL4SbtGVv7X3qUgvO4lk4f0Tf49TZa7DvBprQYoTr6PYwF
         AWIw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b="jGVPVhN/";
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:7e1b::60a as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2Ls+QSqBea1HfubFqdfnKx89pm6znm+nlH82MjcOYPw=;
        b=VRBF2MRxBh8OTZniPRVaunY14+B5CvWHSEXhbGQsrIvm0Sqn4K4FTeXebgCOtQBB/k
         Btiw5nRPXoJ6kOfytTsI1Ald6Q7FsZIETrWXQy9FADz6WZ2w2dNP13vAGK06+oRMWgb3
         USsz6XVnJDAT9BZRtrpv6iqM+6glfpQaCcFRIA/7dEk15uD2mJZDvNww1AJu41d//58Z
         X56emC7GcjiFBfvsLxaW0I7U9+ZC/BbsPNjZrGNVwLKA6pH2Elt5SKfCyPFt5L91Z0ZP
         ur0tbHABrJ7FTn0SVEa+GETVKR6T9ogP4UseOxIeJYCIUsD4Oj3TsLdAqCw37i6yQT2K
         6Vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2Ls+QSqBea1HfubFqdfnKx89pm6znm+nlH82MjcOYPw=;
        b=Uxo0J79jQPQ2c8sn/gZj366ekC4JYIOULReTjxuoQD7mQVb9Pq4YpAclUf2aiQ0EQ2
         r6i45/pL6DQyN2EiursuU6btkwz7gBXNxpac4CiosTlfN7D5rDnFrYc/9HLqVD01xzye
         BMnwUl478/JV6MEloz2lsKkedAdDMHMRDDUoYU+QWRZ4k3Ub/Of7YwVlLX1L7b/UdVPa
         GQC6kla7igQJzcKGxwc3Sd7cP7DdVlKoMv5oRLSd18BLhZxix+QS84pntaFC4BkbCpNS
         qm+11T+RcVC2hYWBN5Y0jCDQ45L68+LBUXj9gQZfKiNgrbA/orI5tD1ciACbBrkfR1Sj
         GxpA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531+o9GqJWL5sYFPUeYzrO4qLzRrdgEPh2nJdDrOgay3LR/xqZf1
	0RRWqSGqQqG23/jiFnDe//U=
X-Google-Smtp-Source: ABdhPJz9SeoeZXRsXTzCPYDsHwjfWMQMPDXklOovNziq+ekwLkBu6KYiNELPogBPQN8QM3fVa+WKPg==
X-Received: by 2002:a17:907:1b24:: with SMTP id mp36mr16094180ejc.487.1638460116701;
        Thu, 02 Dec 2021 07:48:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7f0b:: with SMTP id qf11ls2699011ejc.7.gmail; Thu,
 02 Dec 2021 07:48:35 -0800 (PST)
X-Received: by 2002:a17:906:608:: with SMTP id s8mr16313652ejb.405.1638460115868;
        Thu, 02 Dec 2021 07:48:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638460115; cv=pass;
        d=google.com; s=arc-20160816;
        b=h3DMwMcZODhCapRVrQzrFWJxW3bexlzlewOoNYhX/qkWd8V70r/Di0YcUYqNQIz9WN
         kJ+ZyklYapZ4XkgINEwUtu97TmRbRExbvh7AaVr8jwikQcK9unPoLul535/Q7tzx4OfV
         e3tCiqC1DuMz6x7d5N4pT5suboruXO2mGZ2xmhUI/DSuHD18nM7wzO2Qcy4PUWu+uPoN
         dI/U8fFvUVjSgQ5UFVwaXirXfIfyb//9DSIxOmzo/B+WKqszPWBdL06UO1vX0bzc+kq+
         ddblxlOXFZFTxVJ8LuwI6JkiR0lPzqZZ03H6hKHlm8gvfMsSo6FJXuai9Yp9G3X6Vvt6
         M50g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=q8FpooQfPpof3dEcKzpDXuL6ob+zEJFDvSdbjGcQSyw=;
        b=mOOYmkSj051IfBs9+Eki6hIXNEvpmQVzmKRhHw7Iw22LEZtkoy5yPOEvZAompcksgF
         uWqkdF8DDcUO1GQl/9KRyEajI0lrFu4PABTt1n/tIGfNqTVZ3sFxXxxheGmic5Kp33Wq
         Mwu74KFATXRJhlol4ZEwKAJxuxXOLGRIfdoKPw/RU6CkpETU5dLXb8cbthkhFpPfY22R
         BS/N/BPqRRRQjnsRyYTBNQ6QkVRakSrBlfQViCaJ3igw2nyIuXcECAdVig1ei3ko68gH
         yKQ7XHlGzlBRQjyw1lMP8UNO0TugKGgrBlciMa12AKDnTHrEG59VN6Kxbs/Ar6sdJV2T
         vW0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b="jGVPVhN/";
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:7e1b::60a as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060a.outbound.protection.outlook.com. [2a01:111:f400:7e1b::60a])
        by gmr-mx.google.com with ESMTPS id fl21si10005ejc.0.2021.12.02.07.48.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Dec 2021 07:48:35 -0800 (PST)
Received-SPF: pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:7e1b::60a as permitted sender) client-ip=2a01:111:f400:7e1b::60a;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmLR/b7O/XFs8W9Y9wt+sPbbdOmq2dHNjJSpUU9aUwbOXWj09sojXBbOTjUA8apcNiHNrEAkb9qcIu8UWzFwlsFizOeMUrCsjGb3d0RQExQ3+d/lAyINmoLTuLRLXcEP8uJpThMWRProJHFQerv/Eh3MqsAODh09A9cTdtESED62uCOw7+5t+zd9zRejJovuFjra0qYCoSLxlbodohnqWOAzbUQ9cn6Qdn29k53mNcEA5mesRLgVrK0FVKUv0IkG+74F7xXZXwFVEBe2ZCN4r6LreHcBITUoO+JkNoKpkTme/Nlr99xdcWeofJRyxSWa6VnR2va4ekPI7bWWOn5+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8FpooQfPpof3dEcKzpDXuL6ob+zEJFDvSdbjGcQSyw=;
 b=LFTVvATI7kgTVEuGzN0wkdGZdze/41ITPdRNLZHafdYbIET9DwJvFAd7p0+sOOMOWMyeaaXm1S+XeaHysgWZ7BZm9kt8kB7SmxiwdEsZSLmAQ55S2bT18E2lROuDI9cVpXeOLp/jxYaecDg7jmKukD74n1RpDxK+YfLPNpmOgbYfPVdKEyzWwMSbEz6j99s3bIIBDEutmdEV2HQPbI7B+vN3nXT8kEmqNTTzNBfUQ/F1rWmwC5l4n/BF7hmQEosnysP0VmlKkclgCEN64/hTF6rYF0pBbVQrHiG9HTPxu7QmPjdYWFwW4aSTR3qbn6kuoAMVK2DhKsB7K+CTYFk1Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21)
 by AM9PR04MB8716.eurprd04.prod.outlook.com (2603:10a6:20b:43f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Thu, 2 Dec
 2021 15:48:34 +0000
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370]) by AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370%9]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 15:48:34 +0000
From: Stephane Viau <stephane.viau@oss.nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	ralf.ramsauer@oth-regensburg.de
Cc: Stephane Viau <stephane.viau@oss.nxp.com>
Subject: [PATCH v3 0/2] [RFC] configs: Introduce helper files to create inmate cell configs
Date: Thu,  2 Dec 2021 16:47:58 +0100
Message-Id: <20211202154800.2671-1-stephane.viau@oss.nxp.com>
X-Mailer: git-send-email 2.34.0
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM3PR07CA0075.eurprd07.prod.outlook.com
 (2603:10a6:207:4::33) To AM9PR04MB8652.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b57362-l-11.ea.freescale.net (81.1.10.98) by AM3PR07CA0075.eurprd07.prod.outlook.com (2603:10a6:207:4::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4755.9 via Frontend Transport; Thu, 2 Dec 2021 15:48:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d8cb944-ff25-4c88-eb26-08d9b5ab32ba
X-MS-TrafficTypeDiagnostic: AM9PR04MB8716:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB87164B9921AA5A4FD2F7F778A7699@AM9PR04MB8716.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /NzI7rkrZkYwSXsm2YNIqyhXR+QrgJ/kiLCPUMvfbKmJr4IZWPyWeBJh0HP64H/dKAK8IXg3eWRdhnUhD4jYj9/4ixPgaTM0oRXWf4aq5hSuEZR2OQob+ypSsOFxugjz9W78ULsjTrMAb31pviscSReMbzfdIf1i3j89t4fE6YYGy0ujPlm1MmG7v9GjAFeibD7Qa/oJdMeRf6OWmBNGDtZS8032hpifFlTbQnedcZdHj4bUjgHlE2vMkUMmcu8kNl5N/ZswVYiqGnf2MaiOYEeLo2VjrUQ7G2A6O2bboQByd/9+eCcT2JdfDrBNSAxE6Tbtv46AhPwn4LWZTMshysAd/T8qed2DecgxMs33iFaT0hBDcoQU4tXrdUlmu9P3GaH9pyfyd9sTLxdCVAxMkcCpR+dXD5rdOvq/gZhNV5w72nOpNL35ogDNcz0fd4zIBcByN7cczZjGYgWkZ2lQ7tyDgFWpeVrbroCbxCXVLq+tz63u73AzZPxECbTYhP8z1/DJMhHkJBroU1VYJ+l5bapme3yeCX4bOai7l7Hpjr+fSniX1tyINvCjK7uPc8Q6M8YL+UGXEHSvIUfl4Ey2KDYxjA7TMYqSp7hlLp5Nea+p09xfimcrzo/wEJT9ivlg7flNENY2tQ9IrBAE/rmiUzRHMcMUgWn+0+bz7mN94VFQB/fwyltyAPW41dQ/QkVBK0eGQY1TetSazgvct+HvwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8652.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(44832011)(956004)(508600001)(4326008)(66556008)(8676002)(2616005)(38100700002)(66476007)(66946007)(8936002)(1076003)(6666004)(38350700002)(6512007)(2906002)(86362001)(6486002)(5660300002)(26005)(316002)(6506007)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PUW89PROMSDPzET79Ju/+5fLwA23wEsmxJq4Vz19rz/UrYJ03g2AYDzoe2QH?=
 =?us-ascii?Q?WLz7cswTB74X5HjzP1AoOD4Uq9BwPcgsoTBjUocLaH+1dQe/+B72Tmz6ZENI?=
 =?us-ascii?Q?r34dnrcLeSIefE/uFsOHjnxCJHNJr/Prp/hrP3yq+8G7CTJXbRs3uubgrMhM?=
 =?us-ascii?Q?4vKaoFAyM9O3f+HgOiqayTjgt2l4Q/w6sVU8OUkrA0lRFKuNVlauH2pBIgdm?=
 =?us-ascii?Q?7CnQ8Q/fVJu/ELq2KK7yDazM2N1TdbQWUpXtfmaCvEBr1ssXXDkrOVHQoKz7?=
 =?us-ascii?Q?rkuHs2DZg5eT1YF1vDy5f6VrKZkNH3v2ZUNCvgomCpAVV6Mu3zAT3bQ/eXyL?=
 =?us-ascii?Q?XSpIO03xHYxnh0C9sJiuI4L3ULw00rCa1RLFJU5z7VuaOX9U5XrdBATASLWu?=
 =?us-ascii?Q?Ui1SLrANN8MzZh5pEhGKraOsN+fMYGlwyEZ6RPJ6tTmOa8Fp8r0g76SvnC2V?=
 =?us-ascii?Q?GqaGPb/ilbLoYGYzkNPEmqqproJym0OCX50YwPdMWCr33+eNzbXl5OnRSUGM?=
 =?us-ascii?Q?GdVhoMDfu66M6GL4QqAuCjaNAH3iqZr7Vcq+Uk2J3NpYlbU8dtJoFw5FZAnF?=
 =?us-ascii?Q?ccbQIHIWkQXQNbWLaVFRZb7icxEZ3TblBQdXY+XeDP1cDIVwHRy0GiIx81dI?=
 =?us-ascii?Q?Xg/j3db+VZNSGcixaU+FLEaGb7ME0SklkJxsfAmpXaHjmh8PImDnR3upR+lZ?=
 =?us-ascii?Q?OvoqUh4hGjzuZgKpDSI+QQHihC9MUIf449v/S4sBoxBn4MI7rjYuqxYQYOdH?=
 =?us-ascii?Q?1Ru5cCcVw/bK6/M/LDIEn5e1B2aZS6I+l1FlPIYuywj8gNlrg/xGISTmWl50?=
 =?us-ascii?Q?909fVOVOelcdYlDhp3SICLKIgnnIdF7Z+vs+jizbCcdmudVtsx1pVzQ/NTEy?=
 =?us-ascii?Q?r3KdZAlGtWERjbCIn6YS85O7njpu4RA1I+eRf5Q8lc7bgTMxvowKFZzOBuGF?=
 =?us-ascii?Q?3ADvjs4UrktDDf4IxXE3fIaosmqEVCexQWQOFcLJBZyZFZGetYO0D9tzUnuy?=
 =?us-ascii?Q?a46IEWK3Gir55naHmAhUtTeFQgVsH9ajDFjEyJd8jI2Qhq+CPDp7xw6J+wTn?=
 =?us-ascii?Q?1/scUmnmv478721ejZlhMybH6yh5mvreXIX8wwR6vjXYys0vbOzkwwHDUiHN?=
 =?us-ascii?Q?gsUUxhY6Tmij1XemPd/Ac9dna0fqKbDvyY+ZiR/o5VR4iNM9vzZVTFK7fNhq?=
 =?us-ascii?Q?7vugm0cNkR1aTtMpddOKWVQYhVPa7SikDb0iZS+q1PuHY3aDYIRXXkgA+1uk?=
 =?us-ascii?Q?5JoEkXUEX05tE4Wg+r5Y8gPnLp0nRJyghaZyw0EgyFSDNFt9jgU0wR1/hqDQ?=
 =?us-ascii?Q?xqtW+9JUTE8pjor57J20Tzdxsm9idL/uv0AmK7phy3O4LyLgL6rR0pzBwm7/?=
 =?us-ascii?Q?nB4GZDMrrsVkl1qGBfiq9QRwsI8gCuoxHO/JWn9lQJzlQbynSjVtF2iU6dMO?=
 =?us-ascii?Q?YYSmk0G7/FfrwokCQAHdiA0WcPAz7QwmY6W0N2TWSE/0dz/V+mkwXjNO3Wq+?=
 =?us-ascii?Q?9dKAmXnMG4E+sdV6KmAeQkc725Oj3tAXCTNYBpBCBEO1BJI8q7Z5173z+zu+?=
 =?us-ascii?Q?kM6AFQX45pYtBEcZyQk8Z8OSlqs09ISstjMcikwHw55sVxzgEeHiDy7DexWa?=
 =?us-ascii?Q?tYq5UA4pyc+Nl+V9dWeUYEQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8cb944-ff25-4c88-eb26-08d9b5ab32ba
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8652.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 15:48:34.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmL2BtYrvq6B8HJzhygH57KyUIz+pvzQpPpPFSgzThc9OLkboh+O757/YfRWR0RkfpEM5SFmtroXKHBv7uj5kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8716
X-Original-Sender: stephane.viau@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b="jGVPVhN/";       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates
 2a01:111:f400:7e1b::60a as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
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

Inmate cell configurations all look alike - more or less.
Let's create a couple of header files to hide the fastidious stuff
(structure field names and so on) so that .c cell configuration files
look a bit less ugly.

	v1 -> v2:
	- Convert an existing cell to see the impact of the helper files
	  (suggested by Jan)
	- Add PCI and Console helpers (needed for inmate cell conversion example)

	v2 -> v3:
	- Get rid of the *_NUM macros in config files and have them computed
	  instead (suggested by Ralf)

Feedback is always welcome - and much appreciated.

BR, 
Stephane.

Stephane Viau (2):
  [RFC] configs: Introduce helper files to create inmate cell config
  [RFC] configs: imx8mp: Convert a cell using helper files

 configs/arm64/cell-create.h        |  75 ++++++++++++++
 configs/arm64/cell-helper.h        | 108 +++++++++++++++++++
 configs/arm64/cell-template.c      |  48 +++++++++
 configs/arm64/imx8mp-inmate-demo.c | 161 ++++++++---------------------
 4 files changed, 276 insertions(+), 116 deletions(-)
 create mode 100644 configs/arm64/cell-create.h
 create mode 100644 configs/arm64/cell-helper.h
 create mode 100644 configs/arm64/cell-template.c

-- 
2.34.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211202154800.2671-1-stephane.viau%40oss.nxp.com.
