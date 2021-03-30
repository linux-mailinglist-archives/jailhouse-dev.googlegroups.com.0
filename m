Return-Path: <jailhouse-dev+bncBAABBK7ZROBQMGQEN3QFGAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE4E34E569
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 12:25:48 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id a29sf3409568ljq.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Mar 2021 03:25:48 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1617099947; cv=pass;
        d=google.com; s=arc-20160816;
        b=ctHh81almd/GOKC5i06e32cyNRQqWfzfU6oQjj0ptOuFGQKRdtzlTHcBASSOY2Bnth
         XDbiuZkG646c9HdiDAjwPOfB2kfcO7xGl4NFSbp3COXqaKq0CUUp7tBb97bj5AQtakk7
         TcUBS6AYu4oypHwwujLQ6ui/HNnHtI+SESA5asvtEapNX9Y/W+oo7Dq1hGHqDDL80Iwa
         eK5N0O+M160nzbHv7Ya+L9DneLrkbanjKJ9EKC7RuE15jcYl5aHWkdJPYDrh15yvQoh5
         oX5/j3x/5Ojs7lkeYYtq+y/rQKWAz+LB/uojKFiVNfPt7q8rpsGnSYF3Fe6rfVHNGmTc
         zE5A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LAAGD5o0HqfLa8F8kMvt2o/AMAO0BGV9ZdQPq+0Tepc=;
        b=HeKUQnwqT1gyeq+PCUeyqRLLRpBWYSHzVEv4s4575W1NuJQcvqvpBQWL1w1ywkXRCD
         vWEa32CFEYFkYMz1k+jTB7U2Ha8df1yTH0oFBOIvCMwboSrpv6pERU8ULJc4B0QxMRlG
         LKt29sIN4cwmMacr1CcU/fg0jAz8VfVyjTDd4Klsugm2yD7HE/DqZx+Ce5VSyK6umOKF
         x4wYM8LwcEOG2b83yW9SeKNC9C42RmjN+0DOd7RagmszZDaw4w9o0Q4CDx3xUpgx/XW/
         n/bcqMXynhu8A+qzsh1rWwnHus2i2xRkd/nlobAffwQ4DlGZIbYZOYjMhRgOSEIS7NXt
         4LyA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=bpor0hCD;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.20.70 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LAAGD5o0HqfLa8F8kMvt2o/AMAO0BGV9ZdQPq+0Tepc=;
        b=TWXizVrGn377qx91Fnp/VihMJZlQtmGzTlmPXeT7D2wNN4bD4DsWUl0TrekxvnOIXO
         1KlbTyeTxwKEd6EwkxpRP9rbLUwNCTwWwuzzIHNlLjPhSzx2gLv+huvMLIspW5XEctoZ
         P2Rr6UxYkxdwM/atVlyuwil5OmihSYfOTl2FprWglaxpmAaLxfI6/Qldexj5gTZizekQ
         hRgPhQlSC95yr8CtOhcvWNuCa02vUhzH+oJb3V1QFEKrzORzYdPeJBbmECOUX8czHt2M
         74mFhdGuZf+bP3fOgZjE2cU2ZjwlZitvF0f6bzCiTLG3zyB6d5LALOYyhmWGGdn3nkoO
         cK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LAAGD5o0HqfLa8F8kMvt2o/AMAO0BGV9ZdQPq+0Tepc=;
        b=FW9gclxx3h6d4lYQ8nlDO7uxSJPAodaOp86qCoae2GjXwq55sHe9kK1rr6M9WDp59r
         fmnnSvhJ+LX2n+OmaqZpfSY2haClaxO19YD4YmmSdQKZsgASYtY4PP+cWVaMfm6F9x06
         XBfe9ia3OlMgvcjFWs3Wj+stKAyeV8ruZqD6HXarehifQ6+qtXoJF7NfbuiA1qf4k0q7
         K7HsWVuQ1oZ2jBp75mmrbzJ0KEDIkH0tIvjHP8tFXDKmuQr3N+/d7cgd0kBjF8O/xBI6
         KDhWD6NO9/aPm3vVC4ThO4w11bwzeaLseUXpA5jgRty4EIOvPFytaUhfvXhtrl0osAKX
         B0/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530DbkuD4kkpRojnipTKm9M2l4zU791D/gjwDFFTnHq94ytEtroh
	N647QPAc44KblMhX1pxpJMk=
X-Google-Smtp-Source: ABdhPJz2RHb/hLSourpCMeR49IIHyl3aMqL8DbLiwcDZh9MkFTw7ZJ6/DqK9WDjPdy13PzNSsXzzWg==
X-Received: by 2002:a2e:9044:: with SMTP id n4mr21194740ljg.202.1617099947684;
        Tue, 30 Mar 2021 03:25:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:58f8:: with SMTP id v24ls6661257lfo.2.gmail; Tue, 30 Mar
 2021 03:25:46 -0700 (PDT)
X-Received: by 2002:ac2:52b6:: with SMTP id r22mr19628887lfm.498.1617099946825;
        Tue, 30 Mar 2021 03:25:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617099946; cv=pass;
        d=google.com; s=arc-20160816;
        b=DpgS/68ANeR9JOiV1waQdwj1jRRvd+sZ2WwiaPo56mkmOCaHM3HgU6NcFYWHWk86w7
         r9ilWPgDTsdRikrHPgQ9krC+0kuqT+y8ejZP8qm5pbKEERXnI+klHaF3qbvJ126cFE7q
         bnsVq05tEXnAiPhelKwpDQivoktWnL1EKSdOhTrLxtsxPhqMcMGjhFGEKwOWm56Q34dg
         8u7oCdt2Gd7kBYQGfYTM4SrBFfQFGnA2zRJk3nOrSVXDCOO1l/KmW+MMr9GoEvNtPU+h
         97pZGYzzWXNquufmNHACIsikxlS3YoJE56rGtjtjkUSAoFFpGhhhevKArH+WKfxyogSg
         33Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H+PaG6x+E3u97mD395+dLFQhg3tpQaJkm5jx5I8UZbA=;
        b=Y+BgdBhOXPQi7NL39WGhjo3H8GoT75EJH1NKtZcVBqOAndq7nK/7RpLBt7CqTOrzfH
         0oAoDCs2p6ZXMA3xjBU7Mi2Z2t7bTsxk7MenTuAovHO0P8X33TBP29glTmTkTQItNCyX
         vllybAxNrqwS3fSAbNSQK9SzAq5+KsGk/02BHD/YKFrCxpeMkUI7kQ+vkZ6hCQ9DmkhG
         /BFnCTiJcDBABY6TaFQpblBy0lg6v/UZnT+yQheAq4VCMZS75+mgIiAQWT+qxXYfcEPk
         FCBu5f41hFZWX3TsibQnpmT+YeJiQledZwho1jhtnCo7uTqnVmy4m+TjRUqupRv88IWC
         XpHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=bpor0hCD;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.20.70 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com. [40.107.20.70])
        by gmr-mx.google.com with ESMTPS id f21si891739ljg.6.2021.03.30.03.25.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Mar 2021 03:25:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.20.70 as permitted sender) client-ip=40.107.20.70;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jB0Awz5AGUwG+uprOX+GKNXSIxOO/MObOZHGrsR4f4Yxn7q2yjUND/ufxZVlSEAOjTEwu0p2JMb9ai6qsPlOg2FfXbqdW/OrISNtyJHllK80llOqG2JQdcITLC1oBRZ0oVFJn8yIg8x2I3ZR27ILkvkgLDV/7BuwM2Poe3w6+jy5UyzlAPLvye6zaFIGuoWsFFcvBYemEPusWArQN2DoJ7PzL0QdyilkD2C8h2xh9AJaU2wMF0bHov9IH1OC9fQCrbGpiJFa34ChZNN4vhXB4SFYh/K7mdG6Us06r/dwwbH4ZNxDNpYL0Z8BPJpyM5hv1sVG/u/le1Wo7z2xkB0HeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+PaG6x+E3u97mD395+dLFQhg3tpQaJkm5jx5I8UZbA=;
 b=iRG630it7vstDxo7YXqhnVTxU3Eo2MP1Gu3EtOe16h9jWTRakNjaj1JedXLP4O3k7lnbVt8SVDUwj+w9hp24sGCYI081zBAsphW+7D5PoZ9l6SdSSAqM4v9bsnbjrI3rr2sVN1437C3pccgdyY2+nN2fgesC1IHW8LylXpt8XmNDFxEwBOgbratcBcJnDxlLDhmWpB0HftvK+IaZOaNj11n7UQiA6w9dGkxk1kOToSz8hOrOgIAB6NxmBq7J0InzBSKVr0zL0sxUJ+7YjmIeYuSGjY83IPKNEWZoL6Fk2DPWTwiR+l2VFbf97oCzhfWn6SNGxE3v4jjbX1UOuxE3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 10:25:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 10:25:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 4/4] arm64: imx8m: correct pci domain
Date: Tue, 30 Mar 2021 18:56:58 +0800
Message-Id: <20210330105658.16676-4-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210330105658.16676-1-peng.fan@oss.nxp.com>
References: <20210330105658.16676-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR04CA0076.apcprd04.prod.outlook.com
 (2603:1096:202:15::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Tue, 30 Mar 2021 10:25:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 544743f3-ab0c-410f-0461-08d8f3662d8f
X-MS-TrafficTypeDiagnostic: DB9PR04MB8377:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8377026BC65615785D52D03DC97D9@DB9PR04MB8377.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TH/TCdJ5WK325OfbyZmVbqVjliK7kYDflvf8Yq0Ndroac+nZTpvZ7kFyrsPpx25aszm4gDWk8eYf24ZaljYd6BJMF1zot63s1VekcOZBdeBfVqn/vTCrhuZduJDva1DLeVTDKLvMIxu/i75+eJlE2pTDFDnba6cSAkiaXzhhIbXyeD3cAv+zBVrAj49fM3MJh9fOo7jPXfDLdU0SDPlEu5s+RFRDZfHIQrVdDebi5j/Rb+VtbN6MBjHBS/9JMRVY8+BOWmGalpkWgLoMXWQ2Csflwats9F/Q2Y/pDKQipHR7TvJR+kXbdxy0KaVfkjhATHftBK8tSEvePreICN63ngbkUr5wL5Nks1TrREGIqnowxjg/l08s7V/jJBsb7g6HxW0jgHoO6YI3KZbjP3ydUY3aafzBk9N/uo07+qCPh50/DkdbjY53JwulrOASOjZxamDgYWu3BpsWTEfSycIkkZY0MyJ6TLKS8T9fN+kmVpE4+OXwjoNzDqjOiNqL/TwKx2UuVzvqrqd9wVWX4vOcIE09IkO8OlQ+jU+KEdH+38moNlj5FxHIsmiM6pDI6abE3qVQmo18qYt+rgG6V8wGVUJ4vxL9p6wx12Kq4XKjHzL5OFh3SYow+myF/Vvd9JcFcVtWXyg2aaOr2sP81aH6PCXxypEmWZf6I80gN20Bcj3LwODfkt8cukzm2Fo0GWpF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(2906002)(956004)(2616005)(4326008)(26005)(186003)(8676002)(52116002)(316002)(16526019)(5660300002)(478600001)(1076003)(6916009)(66476007)(66556008)(66946007)(6486002)(6512007)(38100700001)(8936002)(83380400001)(6666004)(6506007)(86362001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tzTa111pwX3lBrHrBk0xjSYhVA29uo3ZWEpMFptlEU8WFcZFBh1vPb1MXfN7?=
 =?us-ascii?Q?gZqorzUQc4n4k+D+2DflCogI99QAVz5b/Mz+nrcjg7d0SvTfexEohylFHBbq?=
 =?us-ascii?Q?jiGkWp2yHTVLTl6tXIUYYxAcYXcYPJLLMHrcimfaL+7jbZ5cPmP5AfwTqxDP?=
 =?us-ascii?Q?1yGemFSXFkvATpDnjiYvLF19PLS3rLg+hZ0p7oGS/MjdGE2kkwKNO5q6unmu?=
 =?us-ascii?Q?CcqRHMbcYmp3yEDN7/KE22rMfUEYloD/NY7yOyomrROxE5E4FhNTdvXzyb5C?=
 =?us-ascii?Q?ZAw2/UuxxxL2tz+o1QphrPIlRDU8yYZDVLd8/d5QvLoUf1xbm0b1JcF0aXPI?=
 =?us-ascii?Q?sKENhdkWAtjoU6xfxaVQwwkPkHBdVVbNCm/s1Hm2okXD/x2LZxAw2UxE5vJW?=
 =?us-ascii?Q?nmJ3aVZXz/ZxuZ6Hniu9JoBOfKjmZuiAmtkrK9viUE0ZOCMahs1bmxRXxKpD?=
 =?us-ascii?Q?qIfWREGJ/Cmnfvr1jnJraYhA/pz1XFexXGpfW7+IuDRxZzO+JlmiVNux7+MK?=
 =?us-ascii?Q?Pi8rxNZDlfySYqlC7RqMA0/r2pH75ON6dkdvGOnzgahMBT01JgXtn8N9Ka6p?=
 =?us-ascii?Q?Lz2/CXGdViKo0SzB5LrcMRNB/VppOL760voZqouo+mxPed6H+tYuF+pEWaWX?=
 =?us-ascii?Q?aeYKeN8nhO5+/5I3oBu0cqpmHP/wyQdfu6ghKc7IhRMEN52QqRhO35kckC2p?=
 =?us-ascii?Q?VOAe1DR0cgoxXWgPErZP27HxiGtNygmTGr74xp//YThqRx3308XSNj95daGh?=
 =?us-ascii?Q?DOlLdisaVobpbTGOx39WyOZ2SD4vVT0BXpjaAHz3beGJqNQE5r+EC/wQQ+d6?=
 =?us-ascii?Q?ntz82dquR1xLeK6m8UOMQ0XhE7EPkddS72iVygezNUv1YL+PDNEZEuLQrb5S?=
 =?us-ascii?Q?JXD7Zac3tyT5IQFJMXxKa04PrEy499pg1k9pIyLoci5Ey93dvoJIe0jMx1Er?=
 =?us-ascii?Q?bJhh6oONBlpL0K+mAjFiMOf/qWvBv2zFQtqiVksVEBta9ao0pXrAV/u0ZWwU?=
 =?us-ascii?Q?HyXEcLHf3QqXAnNJOwl2RdDY3329u1NWd5a4n+yWNOWNVu4APzGtMl4BeDnL?=
 =?us-ascii?Q?G0z1yHomlU5VI6lb1t2hlLxjIt6ki5yrtS7UH217DWcAB/E0qOX77YV1HGUz?=
 =?us-ascii?Q?tB0noCE2klETw5cIukQ1Bzfnv5sl0MRvkokEmqG9ykXlG/c8zA5dOukAyPG8?=
 =?us-ascii?Q?rOjSJGlxsvJSGCbK8GWjapp7fA+UAcVbGBjnH5yU4gUTY/Ib6JRdHWYUq3Cs?=
 =?us-ascii?Q?kIbWHds1XZJ1dFS1q4A/RnFC93aBao71qJaGknVV/Wg2CqFLAnuSeWRWsSQt?=
 =?us-ascii?Q?LJ+uvP0ea15QIOSOWeWeL4eOLav7EQAdBNF7iIXsawBwCQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544743f3-ab0c-410f-0461-08d8f3662d8f
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 10:25:45.1465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EC64zsfcVswj/VenZtHxU+e+2ZdpNOT54ehIpAlZXDIrb+FjDKazvhcs35N0MGTNSRmWMt34n+JA/+MUw5XSyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=bpor0hCD;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.20.70 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

After linux moved to use linux,pci-domain, we update to
correct pci domain here to use a domain not used by pci hardware.

i.MX8MQ: 2
i.MX8MM: 1
i.MX8MN: 0
i.MX8MP: 2

Working with NXP vendor tree is 5.10.
Upstream tree only has i.MX8MQ pcie, since 5.11.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 configs/arm64/imx8mm-linux-demo.c  |  4 ++--
 configs/arm64/imx8mm.c             |  6 +++---
 configs/arm64/imx8mp-inmate-demo.c |  2 +-
 configs/arm64/imx8mp-linux-demo.c  |  8 ++++----
 configs/arm64/imx8mp.c             | 10 +++++-----
 configs/arm64/imx8mq-linux-demo.c  |  4 ++--
 configs/arm64/imx8mq.c             |  5 +++--
 7 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
index 196740cf..49272607 100644
--- a/configs/arm64/imx8mm-linux-demo.c
+++ b/configs/arm64/imx8mm-linux-demo.c
@@ -145,7 +145,7 @@ struct {
 	.pci_devices = {
 		{ /* IVSHMEM 00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -155,7 +155,7 @@ struct {
 		},
 		{ /* IVSHMEM 00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 5,
diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
index ebc2d294..acb9fd5e 100644
--- a/configs/arm64/imx8mm.c
+++ b/configs/arm64/imx8mm.c
@@ -47,7 +47,7 @@ struct {
 			.pci_mmconfig_base = 0xbb800000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
-			.pci_domain = 0,
+			.pci_domain = 1,
 
 			.arm = {
 				.gic_version = 3,
@@ -181,7 +181,7 @@ struct {
 	.pci_devices = {
 		{ /* IVSHMEM 0000:00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -191,7 +191,7 @@ struct {
 		},
 		{ /* IVSHMEM 0000:00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 5,
diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
index 795c616f..127392df 100644
--- a/configs/arm64/imx8mp-inmate-demo.c
+++ b/configs/arm64/imx8mp-inmate-demo.c
@@ -114,7 +114,7 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
index 1e0a9f1c..22793c2a 100644
--- a/configs/arm64/imx8mp-linux-demo.c
+++ b/configs/arm64/imx8mp-linux-demo.c
@@ -178,7 +178,7 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -189,7 +189,7 @@ struct {
 		},
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 3 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 4,
@@ -200,7 +200,7 @@ struct {
 		},
 		{ /* IVSHMEM 00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 8,
@@ -210,7 +210,7 @@ struct {
 		},
 		{ /* IVSHMEM 00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 13,
diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
index 3f758980..9654a764 100644
--- a/configs/arm64/imx8mp.c
+++ b/configs/arm64/imx8mp.c
@@ -42,7 +42,7 @@ struct {
 			.pci_mmconfig_base = 0xfd700000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
-			.pci_domain = 1,
+			.pci_domain = 2,
 
 			.arm = {
 				.gic_version = 3,
@@ -199,7 +199,7 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -210,7 +210,7 @@ struct {
 		},
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 3 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 4,
@@ -221,7 +221,7 @@ struct {
 		},
 		{ /* IVSHMEM 0000:00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 8,
@@ -231,7 +231,7 @@ struct {
 		},
 		{ /* IVSHMEM 0000:00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 13,
diff --git a/configs/arm64/imx8mq-linux-demo.c b/configs/arm64/imx8mq-linux-demo.c
index 1177f596..03e67a94 100644
--- a/configs/arm64/imx8mq-linux-demo.c
+++ b/configs/arm64/imx8mq-linux-demo.c
@@ -136,7 +136,7 @@ struct {
 	.pci_devices = {
 		{ /* IVSHMEM 00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -146,7 +146,7 @@ struct {
 		},
 		{ /* IVSHMEM 00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 2,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 5,
diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
index 9f9c6071..145a36e4 100644
--- a/configs/arm64/imx8mq.c
+++ b/configs/arm64/imx8mq.c
@@ -42,6 +42,7 @@ struct {
 			.pci_mmconfig_base = 0xbfb00000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
+			.pci_domain = 2,
 
 			.arm = {
 				.gic_version = 3,
@@ -161,7 +162,7 @@ struct {
 	.pci_devices = {
 		{ /* IVSHMEM 0000:00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 2,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -171,7 +172,7 @@ struct {
 		},
 		{ /* IVSHMEM 0000:00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 2,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 5,
-- 
2.30.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210330105658.16676-4-peng.fan%40oss.nxp.com.
