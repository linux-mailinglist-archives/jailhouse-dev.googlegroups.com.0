Return-Path: <jailhouse-dev+bncBAABBJPZROBQMGQEXUUBWIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A934E566
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 12:25:42 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id o17sf8524202ljc.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 03:25:42 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1617099942; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y611TWRDu97Z7+YsJeOl8ZwpO8N5+uQAYNk94XxZ9bz96Ei3czM6kTnkYxh2Y3mCK8
         w0hVbGguORCuutgpNtYEG0XhU9o/kVoCX47goknUfvVK30w9MiF5XtFtXVoM2vcaJlt3
         VquhrGqPHEAhAw7T5A2tMCxfMdUKoPDO6jwuhPpG0yXHUWTft1sAVJLx3c+MC5YK9aHT
         yvB1JzMOAz17TgSTjmeQBnWQuN1/1hb7KvGdhn1AcFPdx8WiDSEOzBnj9M5NCvNkrYdE
         I93nLZxegz6xs/pCiV6wn31Ycqz38+y3H9VU7ODNhRAhPwm9OKo/2N1ymLPh2qFD6hFu
         JOJg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=BqOkNo6w0D5TR3EPSpAJ4rlXKDsqyvVgy1ImQ81xPkw=;
        b=PdpFgEzVMxrQDhmPmGybv4OivgyJiXHM5GdLH5beH4n1tLlMEepJD039Y0YkgSCJIC
         w6VZltMX4pgfSLu+gE/xUBzaFJuA/YP8L+v/yrVzc7SGrBM6y7Z66uFUusTS9deZ+rHh
         UtN4cdvJloCpRr84DpaWNp5bSVY/ufdeKG9JKfRaj2405iVHT4IS9yDyflLcBmt0giIc
         laXT/kGehlY++iylX42E/sf68CTpdICu86yy9zbB1rv0q8hBF3CyQbTMguyHLzyCciqA
         2VQWEwitRspYsDOnwDW5NygI04gh1WiaYwI5B26YMVRYBDw6ah5Hhvc3q/ncTmef/G2h
         3kGw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=jmFaKvus;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.20.42 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BqOkNo6w0D5TR3EPSpAJ4rlXKDsqyvVgy1ImQ81xPkw=;
        b=Wf4GnPc64PiisTBNeAjyaKNXUJDBMCOCMHS/iNdRNSw8oGvpW4NFn8ynkHtVjt1vIN
         s/gMnMg8mBAjjVOGNLhGj7h21AP+f4TajphlXzPONfmB3b3y9gSzVqgtj5JysnL+GJuO
         IybZ+zE0myOX9TrputBvtilNF6+xvOYHs+8TRX98ePvHfVMOCWNlTBFnSngVGyWGsxN+
         nZZrHsYEWKuEwb0kKouHckVclGCtpycVW+1t08OGG+OMnqUrps68Mvi98y0jXixveMvb
         80+kCaKatE4j9Bfn70zjnD9M2sQyOKsY6BHwoSxglr6fBAZ4v+r/wz2K6/Rxj+8Wa2vJ
         uV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BqOkNo6w0D5TR3EPSpAJ4rlXKDsqyvVgy1ImQ81xPkw=;
        b=kiLND7DQH0tuCerA7AURZK9lA0DZ1uy89BLR6YCSXt+r239iVcPgrTN7afQ9GHjohO
         +W1q1UkofL/fXlbgmeeahB44xwpj0cEUYqjThSnIvey6xCLNqrmqtufMmnHb3+bCgrO0
         tNUOQ0iA3jJjIygqeO1N83N67rw95uhkELOAa+upXVd31gWAfESlO2r9m+XA2sBsaL4P
         7qew07FRBppJRrtkEW6cSldFpag7y78f0NmTFE1Om1oOWypvJpTbwAX9cmUXvZkbOlgc
         Gnj5N7WCoTXKhc8IRek6wyk4QuwS4bAr4v7XyOPypFrk0nSi+OIRRRJl98J0zW08sf/O
         KSmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531xn2hDaV9k1LoSYZuTlFGaBifAzD5aYjd9klnqzWEgAXkVs9Pn
	PkWAsSZ87sgxUQ0jPAHNTvY=
X-Google-Smtp-Source: ABdhPJxCw+2JtsKgMn7Y4DQvYsaQvqUfdOYnaUnGAEkjnetWMgP6szR+zqm3HQIjed6YlOfy35hk6w==
X-Received: by 2002:ac2:5a5b:: with SMTP id r27mr18646076lfn.255.1617099941986;
        Tue, 30 Mar 2021 03:25:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a409:: with SMTP id p9ls3772320ljn.0.gmail; Tue, 30 Mar
 2021 03:25:41 -0700 (PDT)
X-Received: by 2002:a2e:2c0d:: with SMTP id s13mr20154485ljs.105.1617099941091;
        Tue, 30 Mar 2021 03:25:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617099941; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z5GGL1yknNk7u3RdlWiFt/7111KZKrbTqnIjCHB7APp2kREUYFtHgsTn/t53y0Fs3o
         F4NeYSpohZium66bhtookHnR8yCrvVLwL2NsDgoqbucg03fHoGRIgDRWNgfI54erra+o
         Erybg4/vggV9b8UEYtbFKi4izbEVbt1+Mf+TzCqx8lntEjs+bXqxVqKsZnYHUxY/0DUG
         f9+dIcl2m0ANK7VGIpoN+AuUiMw4NEO/0F+z0XZ//gLJDjvGeWSSUL5KUN5zT2/gzdSo
         IYFvYsH+Hvg0gzyZllfjZMNJgpUh8MR5AFmNorgvjt1NXf7NnSuuXcSwm41ScSSBT/Ek
         dFug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=6mukbS2j7J2CJ7Zz9JdEMGPfsD6+t7h30ItQbePOTF8=;
        b=usk+pzDsq1WbUaFdV4pu79ae6awBD5WfXseRF5pnzY/O+cnNkuvapKX0/IWpmq6i9U
         PYmVSH254Ov/Jj87N6WIEFQqWV/VaddcCE9Ljq490BwjW5wzYYWkgCOhOncqboAog28g
         KafpdDdjDvwQ6uBALKLazPzI4kP7aRDdPmKAcy0zbJ+kmyAYkulIPqdh+/rfH3LmYNJ6
         /XyvgLBDNCei903KWVSuqj9Tw+D2NLJI/Dwd542EzRJ29hF+uyv1w/Eh7tlSqtLmswgn
         sOpOv7urWPoHm1SFxynSd/kOtfozHDq6W9f0DuKCSsHcrKDlIlnRpYHUGyv2ylFCXbXi
         j7rw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=jmFaKvus;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.20.42 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com. [40.107.20.42])
        by gmr-mx.google.com with ESMTPS id z2si737479ljm.0.2021.03.30.03.25.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Mar 2021 03:25:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.20.42 as permitted sender) client-ip=40.107.20.42;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeTmrGZJ0owodr5ofdWWTezSJSpvPA+m+c0mMU/XcuJHA7PrfGZyjLAXowxXiOmLvW0Y+DeGJ7b1GzHVh0NyUVfS9TZ1iHUyHx5fBG2k0Fyh7owh0vxrSKsh2e3vNZT89mrb+EFBGaCDXV8ZHUXJtaZSmfeI1lPq9um57ttuXLOIynf7VWDXGOvFF0VpJ/4oMymFXb7J+LT/USsvz1LjI2BNZpyqAhzFV8n2TjHICFLWVmQI86mQezbxnNtlY569FLKlNGh7YTLz5GbHjJY2iVdgYnLDFV3xpbVGZTyFkIaJZmnenkGmzW+YBJokN9DLfL7b5itGoctmLfFy5l28/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mukbS2j7J2CJ7Zz9JdEMGPfsD6+t7h30ItQbePOTF8=;
 b=FiLP+28pCvP4BzdXDjxDoU6k1k6+k2AhkekcBar24PyBbNGkSZYbOns4n1Ly9eeCchf5/7ZLnD3OKcS0uxRDnFyGG+aZBPmqjhO6ZlKKDeywcTQvk5QRR0RXJ/l4VQwyMEwxzrVfaK/9jC1ahfsvBTzLJohnKI+nwXhSSO6GmELOSA26ntIFonU1uS89NteA89l3SsW9Bxnu2JITLkWdekJ03dimLodRMgQGPI+6oVJ5CV8Fk+JvCaP0aMDfpFtUy1rPQwj8Vf0iQKVUlo6H1Hcr12yGzGdeJbXn+wbdBUuGFGHHjQsW7WyNk7m0rVTRNmTeW3tkVsy/FcLOtYZG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 10:25:38 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 10:25:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 1/4] Check UART UCR1_UARTEN bit before writing data
Date: Tue, 30 Mar 2021 18:56:55 +0800
Message-Id: <20210330105658.16676-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR04CA0076.apcprd04.prod.outlook.com
 (2603:1096:202:15::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Tue, 30 Mar 2021 10:25:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c50e96af-1562-4ba3-52dd-08d8f36629b1
X-MS-TrafficTypeDiagnostic: DB9PR04MB8377:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8377E9BDFE8C269416D7EDA2C97D9@DB9PR04MB8377.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cb1O0MeG4/Y6r9JjmHEeoE8FCnJzBzThfDi9IXbP7SmC9JHcrJQWlaUCXqrTDC85PxJQzNyxSN9Q5WMbsNJxl6uYNIbnEtXdAKzGNywHrZqCCQRaBD9XHmNyZmuAH+vYK/CzZMKLyeZqAFs3OQ2hnLgHidRXMCgsbyNK8/VTBab+UqOTQi/YKciyW62bL1LXuc0XbY2vf/IIxr5aK0FdAo0YXNop7qPcKFSUtGyI3uZoZTPxFic16RWbz1YHR2TfvUYbXYfr4+rBIjTDgYyRgWq48YsdWU3D2xVXwxCE0wzSDiZZWl9Zl8gmN9pPI0ny0e8ecc+IOosFNWoZ2/hcWtKp1YwoYL1shpoqKnjrMJJ5LXZIr6Ns4DoZR1yG++u1k3tUlUJNozZuAKPHKe5X/K5/SciCieNFpafY74XmzwyQCESoRrc48nSYT9lIn3MXYV8dkxOuZ5r2qEvme3Rvx98VFuhb/buHxXd62xpUB0iWTXFst+1GWIb4LswB49pAIFG7BRdw21W9qfI6qhvL8I2Z9SnD+U+C4CPhuBLEkgoBJ6E06yV3L/3Pa/oOIfZM8SmR/xxocDmR72OSLbgo9IqkoNwCGlsW5iDgywh2GIUd6A2rb0bo0ERdvbpU7gRhvocirr10VPaAjQz6gQwjCT560v8a2GXCtpO7MggOhkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(2906002)(956004)(2616005)(4326008)(26005)(186003)(8676002)(52116002)(316002)(16526019)(5660300002)(478600001)(1076003)(6916009)(66476007)(66556008)(66946007)(6486002)(6512007)(38100700001)(8936002)(83380400001)(6666004)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?j4O9HHLBh1k7dfD/9JbSueL65HV9Q8amzDOE5R6rwU0Xy82HqU1MZPQ4Ufe/?=
 =?us-ascii?Q?+R7vtvF52aJg6lEh0DGMNp0Q4VF3TQVJPstFbaVXielT3esHz9EWwUCTLxY0?=
 =?us-ascii?Q?myxrThgP2uOx1bCxdJa4p8o8UiZwFWjst9fz9cgLdVjKiHkUGWINyt8fXtYz?=
 =?us-ascii?Q?bsfGahQncdUUBM35ps1A0yVc3iFTG2U9lgrq6U20cgjEMA+Ht9JjbU5TDP7A?=
 =?us-ascii?Q?bCBSAwPkoc5s9PA0dkcG/KNevcegahRVNF27FFqpokZaKni0uBtHs3BiijBu?=
 =?us-ascii?Q?p1NELlQuvm8fixO6E6W44D1YtpqYEUVrTvgRNgI2e2CW6HxGoV56EXiFE459?=
 =?us-ascii?Q?49XPWpFQpJOvFX5/ET4pdveyXABJ5Yet3y/yagZ55sMDFIIPEuK4te1a+Lsr?=
 =?us-ascii?Q?TkVIiGOrJZDFCnuY7OjVqMgFNYaYzco62kXdS9zpYiQVZIwRcmiSrsP/uiIs?=
 =?us-ascii?Q?d+JghmdlADOsCcsVnAv7Mi+7KqP41nq9Ms8djRG6cdDPhZwUg1ul19e9C+5S?=
 =?us-ascii?Q?S8hK8/WATWVHdOl3PJLDoanWNIflamJLeIwKNn72xdZqz/0AniShQIdyFtw7?=
 =?us-ascii?Q?SSZnDx6hx877kjU9gHpVKatOzwsSQ7R4pjxAdJ6KLSLJt4yC2NagUB26zrIu?=
 =?us-ascii?Q?r2wnSde+WiTg53NCBkfkLbttDv0TE1fZNKvkBQIOdpSsE26axXCil5wnzSYw?=
 =?us-ascii?Q?DWKRZCfUbntaVSYsSInxu3hjglZC05yRP1Zc+CJQbQ92IV30JyhJJepcvGQZ?=
 =?us-ascii?Q?S/0gTBBo8vPUxeIVL9tEuL9JajUn/jShkFPddyqIfYTbNFqgIE4Pt3i4IU3h?=
 =?us-ascii?Q?AX6MmKAjTnoePSdzo1SJg2ALugAEAiF6dbjMzh77++sRmEKQ2V9qljmbuSxb?=
 =?us-ascii?Q?qjTAeswLgt+KRX17csQc5LrX3X9hfeHQZKWqnax+l+W715p2KmvPixNdbH18?=
 =?us-ascii?Q?jQ+5XpUElvGJlWtkVEJ/HNicYBREvFZSm4ZpxIiZRn3bcsNC8cBfWN+NZNQA?=
 =?us-ascii?Q?9kdna5w8Enw3XRnh7KEtGkX8w8Hvn/yremVE/hFPYJacuwOJ7cB/0dEc1MIE?=
 =?us-ascii?Q?u1Fgr4iEhDNszRQvwPkJLwXNBhBon9hgrlZ194he8nO+9OeLSYJjYyNjOBjU?=
 =?us-ascii?Q?YDLFxBo8lZG97zBZn/XHdp9/bNeSMbMD9krihoZ2PhRLKwnhL44y1k9zci8X?=
 =?us-ascii?Q?GtkO1pdoPOD/ZoqUAIiC1AM2b7wBcrG9tI20SMjXdcObB0yPDSppyy9WwZMf?=
 =?us-ascii?Q?OlAKBOIKchEEKhBXg1elE78WdqviK3o4qbrF+yMdqcsFLy6QgI9/IFi2FZaU?=
 =?us-ascii?Q?2602ZhphyqlSz+fDQouSCA2YriYz6uKOBjHkpFmdt4k6RQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50e96af-1562-4ba3-52dd-08d8f36629b1
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 10:25:38.7294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzWtStI4XXEoCsPU92jCYCx9M1UbxV246CFFwcVPsVOyd1SHD0GFafugZjgFjJlAiwGrFtARM/l8ih/1slEWmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=jmFaKvus;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.20.42 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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
disable, jailhouse write to uart will trigger hardware exceptions.

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
 hypervisor/arch/arm-common/uart-imx.c | 9 +++++++++
 inmates/lib/arm-common/uart-imx.c     | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/hypervisor/arch/arm-common/uart-imx.c b/hypervisor/arch/arm-common/uart-imx.c
index 849f8fca..b6fc27ee 100644
--- a/hypervisor/arch/arm-common/uart-imx.c
+++ b/hypervisor/arch/arm-common/uart-imx.c
@@ -15,6 +15,8 @@
 
 #define UTS			0xb4
 #define UTXD			0x40
+#define UCR1			0x80
+#define UCR1_UARTEN		(1<<0)
 #define UTS_TXEMPTY		(1 << 6)
 
 static void uart_init(struct uart_chip *chip)
@@ -29,6 +31,13 @@ static bool uart_is_busy(struct uart_chip *chip)
 
 static void uart_write_char(struct uart_chip *chip, char c)
 {
+	/*
+	 * When Jailhouse sharing the same uart with root cell linux,
+	 * the uart maybe disabled by linux, so add a check to avoid
+	 * hardware exceptions
+	 */
+	if (!(mmio_read32(chip->virt_base + UCR1) & UCR1_UARTEN))
+		return;
 	mmio_write32(chip->virt_base + UTXD, c);
 }
 
diff --git a/inmates/lib/arm-common/uart-imx.c b/inmates/lib/arm-common/uart-imx.c
index 984dc218..8df165f0 100644
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
+	if (!(mmio_read32(chip->base + UCR1) & UCR1_UARTEN))
+		return;
 	mmio_write32(chip->base + UTXD, c);
 }
 
-- 
2.30.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210330105658.16676-1-peng.fan%40oss.nxp.com.
