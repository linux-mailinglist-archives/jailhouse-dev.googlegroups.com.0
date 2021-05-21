Return-Path: <jailhouse-dev+bncBC44VTVY2UERBGWUTWCQMGQEF4NCIRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3918638C154
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:06:51 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id g3-20020adfd1e30000b02901122a4b850asf1118687wrd.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:06:51 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621584411; cv=pass;
        d=google.com; s=arc-20160816;
        b=q82KHyVPNR0gws7+nqwN+P8gb6k6WaeDuPXGBGPSe2aKyATGkhS0avPLgbObaPw60b
         c+Khkbr8kZl1r6VFQTipEbwbR3x4bXMUC3cVzp3CvWxasZQ58Q/LDvocHmFgbdMfzrAy
         YXo6cdLe7IjaYYo/VfRY/jaHDBVIdl+6SVFFO1Ux3uXnIYGKmZ9NuXH7C2sX+3lKDl76
         AD6O2/Fw4vo/sjGrTLoJh/copR0pFeOLG4CKK2W0UecZ0oHuegpOzk536Qefwdrrpap0
         asjiNAt4VC1wquZnAABLP3Zinsy2tja7lCUrDD7MlV8a/6U8EFhY2DCTNeGyanFgHrno
         1/7g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=2jk8HYe+/2muy2iVdGf5eeqUkWHnYYTuJ3mS5GCDq9g=;
        b=tJc9CC1+C6hHXVqqIpEs6hdsqn2sM/4cKePMukLDLLBIUmcY0kjYMG8mJVJW7//cDM
         eXcfKdgCCdYqAzZeNMjwKESDuXzuf9Ajz4V28cfPEIiXRbR9oTg9zZM3HpLzG4W4YW2Y
         oMqir4Mr1aNzeGAhwcULmIeLOLfjgycnpSHge+EmKREG8JVyWPM8AmreXTXXPkSMDxZN
         Jjmv+M7mlx3uIzlYPGSnXQJ/oaYiQapWgAdCa3XIIqZY7BnUjLLxJ/1ss3QLAORmrP88
         mSLDIw0twE5wS7fHF1xOl+Fe5cct5fLe4XQuMkbFNOysuf9YZ/CdpD+SowPROCt3FKsb
         BUZA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b="X1Gzy/N6";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.13.75 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2jk8HYe+/2muy2iVdGf5eeqUkWHnYYTuJ3mS5GCDq9g=;
        b=IwwBTq/HLWXqVz64s6TNfT80taDL0Vv0jahFBBv2sz63X91GMDNpvR+WgeTfcKrCQ5
         mq/MgtK2dJCUAG1ruUobu5lWRToscs52NH8Ox18nyZ95suZr/PwJx8tv7bTj5al9/WaB
         +8TYfvEDHqkUO6+K7mWfJgmX6H8549OCaNdAWYhoJv1Z0HcYG1p4glfNIDZ0akIPWmov
         LJaWqUFNzGBSvVwpTTwFjOxiTyOnar0FDFfNQ2VS4LGmDtITCPseTAK3BGfQuRYYcnhz
         F03apePdyQQb+dGqrIiW+e3IMCQb7hg1YHmeFZNUP29kE+1uVX2tI9dmfLoRBJaD8lCf
         VB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2jk8HYe+/2muy2iVdGf5eeqUkWHnYYTuJ3mS5GCDq9g=;
        b=kmlk04XFp61ty9KWSa/nLf4n4t1t+S5aH8NLEAP8zFlhYX6zfP1VweGmhKumPNfF8X
         xA9kimRJ8gwiHZBzF7UzCTLOFy8+s/lsx8OGzbLKszl7DfFv0Woi7JRscdk8s3bPPmHX
         co9rADd6mNbIu0s3W9c+yGPlW1RMZpyo6W9RFnpsoT8Dej07B/0P9kVmeSVPXt+XJxYD
         8Gns9yLVX/9ultTZ+vplO5xbvaLl7M0ZsI0sckk1mQwRlzW+9BSsf3bho70pzkB8+Xyh
         mQnfY+Zjq2U3jAUGAVXq3848zaJkiihBf+wnqARCR4BpWvsw4W1vR0t/VtAi8ClMCzGq
         OBEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533vPUw5GjZNfC4UI3XRICboyDgohXRuREo6gqBxbvaT6bidNM/A
	LNOd+6QgTEYDKpSPt/nZpLc=
X-Google-Smtp-Source: ABdhPJzv6gKa0RlwbrwOxV965xUQpTA4hZXBuAButQqolHapdFNhkTmLZteMRb4SbZh8Nfz7ivKejA==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr7964114wmh.69.1621584410957;
        Fri, 21 May 2021 01:06:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db50:: with SMTP id f16ls3344036wrj.2.gmail; Fri, 21 May
 2021 01:06:50 -0700 (PDT)
X-Received: by 2002:adf:9d8c:: with SMTP id p12mr8335567wre.310.1621584410098;
        Fri, 21 May 2021 01:06:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621584410; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZlyC6TrHAblQIOHt+mIQ/UhQ9w3yY9Mn9EzgYozNOm84mB/Yb0GWqku7ERMRg42pvo
         +ajT7mPAZt3kA3uzmwdftdU8Ne4oa09ycla10gY9KKc1K+/n0r5VHMlOkxgJZSl5xtFu
         B/hfgXRfIPwUYcDWslrasx0yybhcqmORVavFYddymXnRmNML/bNL/qC5veUbOxNTjx3m
         AZw6J5nPW73MHfV0iCv/Y+HX0lwC92V6Ovr5A4quwNClpuNFxrSFN+l/XxJYJFhkKDBz
         /Zzm+qtcZI5A9SHlRVvJvRWHneHQcRFBolgzaJ2nGAZu24l5M3sT2JsIMIev3ItYuoLa
         9pkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=MW/o0jPzSlwav//El7oeeWEK7aQBEHw4Ui0a2osmz98=;
        b=eHLZLpiYhHubS2e2GuIgF1WYn4IvzlkMKz76/RDDhch5A5McAaPTK7ZhTkl2H0wBX9
         cfcqDU4jmAJ/vgHRqcwnpYJBG6yqSFMTll5wEiBsHrtMsIHJQQlXBqeKwpFOErs2qkC8
         f/Yj4bUkkCscFvuyA9E4KxU4bf1VdOPNzmP5pMsuhHdVvjaZSLGoOmyWrOU0bZA+DVMN
         fVeZBjexFQNuiuSl+D0O5mveMOWRrWSUe2X6GMYD1ppj/09qT0RQkwn/5cbGiY9HtFdm
         CBt+95qcTW5S1rTGy3ED/xRbVSsffFrSKyG4cMgo+aeCFaT891X92mBLataIo2uly4rn
         p3Bg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b="X1Gzy/N6";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.13.75 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130075.outbound.protection.outlook.com. [40.107.13.75])
        by gmr-mx.google.com with ESMTPS id l5si41066wrs.0.2021.05.21.01.06.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:06:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.13.75 as permitted sender) client-ip=40.107.13.75;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD6Y1pPRaaO11w66bCebjUmuY/stziyr32wGG+XkLtxU+kRR2SaZSKLjw6Rrun97sdpbb3a0g36PjriTBHWjwC3YZSZCKwww6uUDQf/KZuF8DviR/EQR8ccKUumQ3DLNKVpyc6ZerQ7n2YTdl8g2IssBBlZkur37nwHLpi7CU0ixMXyT8N2ZixyU+yxN/D3fMjM0MV3x88r679s2zlTNyc1Fvyt30EtoevSECtyF569XARlyuV5HDaCVplXXk8lhcgzmt7bKGG2L6BX6xeyZ1ug+e8oA+ccvKtAn9KNHLnwVS0K8KhSb5Sg5IdpUW/itC9LK3DXNFiG0e0I257NPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MW/o0jPzSlwav//El7oeeWEK7aQBEHw4Ui0a2osmz98=;
 b=e6pF5zMJsmWRrE4Z60sUksq4OZB2bm8InCtr2KeksNVI9VjhGm+yxSSncjI3iXtxhxPNzOhvFllL0SH/OR0mF13bbXGGZqfEGmmdQLjdbSPYf2Pdlm8PHbZgt7+w1OI4fbAea2I6MGya92TKiLiL/0oNXhCZhxvcQe3foW0DkyuOYx5X56TKS9SXY9rq7kqkvwSZiA9TsGmWRtuSR/aN5MBuHZE+xzqR2+UM/fCXAIcibUWHJrxV/GSPqmqzOcSmKEphHKw8Cxdq1qi2l7f0I9V5Se4oCDyg4mIKj+GKscEqaXxESWJzn+mt9uDrseQjkoBDDOm0+K+v/6nAWjS9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4085.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 08:06:49 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:06:49 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [jailhouse-images][PATCH 0/4] Update jailhouse-images to Debian 11
Date: Fri, 21 May 2021 10:06:42 +0200
Message-Id: <20210521080646.488836-1-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: VI1PR0701CA0050.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::12) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by VI1PR0701CA0050.eurprd07.prod.outlook.com (2603:10a6:800:5f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11 via Frontend Transport; Fri, 21 May 2021 08:06:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf4b678b-c72c-4310-35e0-08d91c2f626e
X-MS-TrafficTypeDiagnostic: AM9PR10MB4085:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR10MB40858987E9A40E802901DB70F6299@AM9PR10MB4085.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X+9eT0MghKcutToglIX3AchZU/OWyuFH0lSCT1A1lERmo4MIC6pKt5WpPVOHeBX/nn+mk3AM1HB8HHZjS7EM3lSwZ79YhZUvoeyMdp0tflJVPa/uOkDvFDA0hlLt6CElcfkcKKNIlD3o4heIEaZjT/Bosgxy4Ed6hZIjQ314IRyPn6uJDBxZGT+UA9aN1TyrwMHhdqN+7sbG+XcPXagmvinIJ7n2Oyksqg9/NpyQ5K3edNpgboG8Y7Ar1dkGmJbdci4Ic2fRjSWAaBozeC9J6luG3I3m9h8esnTAKUkI1f68Y/xqi8gGCR5+nqU0WXzhm+j1ZD+hLCKcjr3JB+7mJwYVzHGUdLoe7h9WjRUHk+Ul7kXGbeyZr9hgC2ovNVMyPiX8wNVhzILwwhMjy+HH8HvnkxIeXhqbvmTaDGJSLiSdG2zRLaL+AYszR+TZnhq8UZSgQMmLYX9zZCsu7Oqca6cADA9igeoi+H3GLriMHpyj0QOk7bEAjzytygmyGyImHrgKChXBKSosvKnoLQMDbZ5aaPWRLs0aIbKMCOwByxwnQDA21DxCg/uNX1fZzPcKnlaitxrarOHk7RDgVB/ZwRLZfezUjL88SHSuwu/wS6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(316002)(6486002)(186003)(478600001)(8936002)(107886003)(8676002)(36756003)(16526019)(4743002)(15650500001)(1076003)(2616005)(38100700002)(6666004)(66476007)(66556008)(6916009)(66946007)(2906002)(5660300002)(86362001)(4326008)(6496006)(83380400001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?a41p75NYv1DQGuIz0yuEKD9YY0yo1jwVzqhzypp7GMMvPdE0aWcNZm9l3MwJ?=
 =?us-ascii?Q?OJsTz2Z8dS/Zdon+uxC3ZQ/TMrVyXNexZoleK7HfsGoGc71RJWyABduD3FpA?=
 =?us-ascii?Q?l+wpRsNxHQ3XqrjqZlos8SUqHl1bELKJTqamiZ/LxIasIrfb+DwtQwCdZHFD?=
 =?us-ascii?Q?VQMDY03m6MmzE+sFtwNS8Tw4beOkE+UyAIgG4NkEg9Co2fzrn68Jl8s56HRw?=
 =?us-ascii?Q?/EcAVHeYZPllg5cVmuk2QM2SC3oxpY9cSoJA5exBtuqm/fFphrfjCPe7wMUD?=
 =?us-ascii?Q?7cAJMFZGmM3Hwi8EVRpHVf6XCc+GnQtUlfzHe05vQTbmNb3zXDep0+8mhDR0?=
 =?us-ascii?Q?NmnOOcG5bJOUoR8idH5gYxUXBcBeVsDF8AUKwtK0Ct2bnR/h4a+OuuqkJ2Jk?=
 =?us-ascii?Q?kwd3fv//F2lu+CWmT8cdaa7ZWUh5tPof8xCU7ra1dxFARR5vdKDdSXaiRVfT?=
 =?us-ascii?Q?mBSQmMwOnfdEMJn8yucPhSkJrEc3JUeH0U1KxsnFrKMfYphFfVgzYhXw0sWa?=
 =?us-ascii?Q?64BeUZscEiEpECJ7tlNfeH3KpgQpTjKmhdLn53Lvrf4KXNi/DZNOTyOmQVO5?=
 =?us-ascii?Q?qbwMvETm39flTr9AfDRPvJ2LEwFmmgXwd/kLB41yqwoog6wap92IMc2Ms+ii?=
 =?us-ascii?Q?HnX+BffXzU911AxqyfWWyxG3XXbOvY3sO1+Xgp+SjOZ+bxP+7F2mR1KgJdNK?=
 =?us-ascii?Q?03Xa6yz1HTP3XCvp+GqoR4VYi1U8iJ+mAWMJ2O0hmGu9MbsSjfq4ExF1tTYC?=
 =?us-ascii?Q?/fS/TiIghLg9COvqY/EhnhURVYO7PZqbsJi3JM7aGHMudEIeybYHC3RN/B/B?=
 =?us-ascii?Q?x/hYvHBP6CX5y4obtGvtfUq6urd7GkOiiTgGpTUuxQGoiiw2ZDpzAoCsS2Bs?=
 =?us-ascii?Q?NtsruEyyMC60f+6STJKlR0PM4DEbe9MLgXuQqRK0EuvWAOLoOrc3637xOP9p?=
 =?us-ascii?Q?WFbFCGeoGuo6vW4TV2+tyc8vnFSJjHlF1qKSLjU7pmEYyT8LT++JzSfPAh80?=
 =?us-ascii?Q?dSPLRIGwPq64+tYiGOH/TO/yHQMCKvhVA5f9L++nvDP//WT0tWmcjrFz/A3O?=
 =?us-ascii?Q?IW3hE+vsYcdwv/5coEG+zPlCN13ggiexhExe3BKORbnh/01P+iuUHdWdEC4/?=
 =?us-ascii?Q?AmxqpR89LRyPNNZgfOeKIO63xFfJt4LRjqtOr2LqN8dfQGWrxYT0e5q8st4Q?=
 =?us-ascii?Q?MzIzj7H3Irre0UK8mHcAWzeMa9DdL6xe+k28wTwbHEUEtRW+AoBZZb6RwDb7?=
 =?us-ascii?Q?Bu0AzvSwlMgRgQ8s9EDKPqLsN5OGtaH0SDxNx7ZTc3NAK5v5tQxRCN9iG4lp?=
 =?us-ascii?Q?+OAfGSln88G+ATzZ7citExgnHVg0CWMiOfL5SYeoYqb0gw0KlblNLHXwPOWj?=
 =?us-ascii?Q?hSJRXNhpxbtYz/1xn/Q5Bt7mwmOA?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4b678b-c72c-4310-35e0-08d91c2f626e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:06:49.1345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TH9xdd0slaaz1yzJfHyFBJBSz9wR3S7TZCV6yxfsi+ztysBenD7LrTkp/xltiZpKHddbFDRlm7n35kZ+DbO8oOVZPC/C3e3lvu1zyd4VZFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4085
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b="X1Gzy/N6";       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.13.75 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hi!

With the following series applied all jailhouse ISAR images are updated
to Debian 11. This series depends on the previously sent series for the
jailhouse src repository.

Beside the Debian update the jailhouse recipe is now re-usable for
external recipes. That allows using the jailhouse-images layer as base
layer for other layers.

Qemu 5.2 has introduced a new cpu feature that has to be disabled to get
Jailhouse running inside a KVM guest. Please have a look at the patch
description for furhter details.

Best regards,
Florian

Florian Bezdeka (4):
  jailhouse: Update debianization to be ready for Debian 11
  Update jailhouse-demo distro from Debian 10 to 11
  start-qemu: x86: Add support for qemu 5.2
  jailhouse: Make jailhouse.inc reusable for external recipes

 conf/distro/jailhouse-demo.conf                       | 4 ++--
 recipes-core/non-root-initramfs/files/debian/control  | 2 +-
 recipes-jailhouse/jailhouse/files/debian/compat       | 2 +-
 recipes-jailhouse/jailhouse/files/debian/control.tmpl | 4 ++--
 recipes-jailhouse/jailhouse/files/debian/rules        | 2 +-
 recipes-jailhouse/jailhouse/jailhouse.inc             | 3 ++-
 start-qemu.sh                                         | 9 ++++++++-
 7 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210521080646.488836-1-florian.bezdeka%40siemens.com.
