Return-Path: <jailhouse-dev+bncBC44VTVY2UERBCENUODAMGQEMWSLFMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 790933A83E9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 17:26:00 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id z4-20020adfe5440000b0290114f89c9931sf8744490wrm.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 08:26:00 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623770760; cv=pass;
        d=google.com; s=arc-20160816;
        b=o6+xsM8QEkVqpk3irQ35j3OlYl2Pc4HxMJL2hU2KohNYk07/6Fy7zYAQg889M+N8tp
         RaUU0J8R9seBNU3SOfTnya1MRz6vuswkfKf7ouTUUYGqCffhf9S28Hl4o+kw5KKM9lej
         cRFH97BOZrVxGW9SrfXac+QbjJXKhH9CeLZ2g6jRGo5hnTQ6ibJP43ryXGKGO47LkvXa
         wji6GAWnJD76xAynzsyLJRfwsXb+LJIao5qgw8LNr875iRUP6EPyp+5gm9PwKXGVZmE4
         x28IJtftsEyon5I3jg/NKPWRcW1wGN8hJzq7kWrIBQociwiWOvAiSD5RIxGUyGwZPC6t
         CFfg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=iHoIco5R3/UV2YVB6l3MMORgAJ6p3GB3gxnJUVoOaf0=;
        b=ZbvdZU+nP6gbPQARdrt/Kg9UPpYamnPQanlrLSr/N1WNYpdDIlf8oHzR5FGdN5Avvv
         qmvmFaU+AJvxXB+j5w7869T9rBvGEzrLgmNYuK6EqeV/FfX9GbkQ/0TkOEaaaG3cP4O6
         nG0gmbvbQd+YnJ1Z43X6dXjTtUEtpqKWAg4RdjatiCaYG/gQ2PlKqHxCWvy+q6Yx9rvj
         AMbonmvC4682/9UPfvUpTu89SY7wlrmHNklCJY+/jBOTv7gRPWvD1Owspk6A4ybIXvWN
         sCbcqqw4/B5bw55nL5plhuCOLkwTXpRKj+7j0ue88rhE47+zNr41ptmVq0vsg636ILaM
         ApZA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=mUIxuP6B;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.51 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iHoIco5R3/UV2YVB6l3MMORgAJ6p3GB3gxnJUVoOaf0=;
        b=kQPV/1wOV84jueEa5LLpx5aQHHLptb+C0XjZhipFPIfwaxJkJ+j0w2ZVt6DhePLkMq
         cPVstgiq61kYvRAuce1Tbn99T0gorbbedoJZFU3tTauuFGTdMi4cRC0aq/nHIawNclWb
         DbI8vc00UgWCX8s7p+X7k0WkReQj4zEi7Sxe0uwK8XsQsfkRDTJvEJuyb80QNNHh1iH5
         htpz+Pxv3bderiYCgPHwUPz3k1SiTxXp3Zt+cpImzueo0+/qNku31ReNL6DSxrq6e5GI
         rmgkmbtjH8f/JtIeHLMF/L69KizsVO0wLV4VBAy35Q27X5EjPGa5o7nAbNolforEU+2+
         DS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iHoIco5R3/UV2YVB6l3MMORgAJ6p3GB3gxnJUVoOaf0=;
        b=mYj3+VWyyVJFS2yxix5SHPXFXDbO83/ZVM/A1CLT4RbQ0QmtyWKyg4BvPnlKGNej01
         ri6gnRHo2r7521h7otIm75eTV6hVzIy7BG4js1inHoi6CXSEx9TlYOE1ChxckbLB3h5g
         oVKwDaMKOL1QxXVE0ZwBYNDoaCaf5hp0x7MNZy2gPNBH4I9UvbcpW1SfHs6p3Y+R5yxk
         GTKyTynU8u7tmby2HbNhpTqqKp33ZV9daDBZCOkNOOb6dVMl9FVBZjJYtgvID6JvvMZF
         x3gyBx7UGlSm62AQIviAoJXDjjTaZxGMWNFGDwXaD7VZ7XIzXVsbNJ2DzuTYyTFZw5MS
         KC1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53219McLI7zK/XfwTtMzSXuQ5FpvIbpLZZQOmZoDQIBrdLFJ/OOy
	/a5JNjv4F4p+6K4CYTBqv/I=
X-Google-Smtp-Source: ABdhPJxZtVLeUyrnu4Z+cDWMsp3hnd/HFZW1SNoqdzPyp1a679XKHfNe71GvH+2p7dzD1y6Gy/c36g==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr26155535wrt.269.1623770760224;
        Tue, 15 Jun 2021 08:26:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eac1:: with SMTP id o1ls4291185wrn.2.gmail; Tue, 15 Jun
 2021 08:25:59 -0700 (PDT)
X-Received: by 2002:adf:f2ca:: with SMTP id d10mr25500433wrp.314.1623770759407;
        Tue, 15 Jun 2021 08:25:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623770759; cv=pass;
        d=google.com; s=arc-20160816;
        b=fjJafIc31U2MDMoLxEIBcPzUBx6mpslYYATNoUoB5E9HQq/+8bM+tDdGODyMGpmKGa
         3OvlPqLqRjdWoPbgRFCknsq8zHm73wO/t4iqIWK4ztkL1H351EZUfylWL4Fq+JUhAoFm
         /5Y70r5Br/waorehnoHWcrTs1WyQekuIsvpluc6r1ol7D4oyygJOoGAOHmofDg/Zks76
         dkA2VeGwnjwL9MXJpQpoYKu1lx1GCIOyQBM7uJ7yNvf8BtAzyyCegHr/gkiw7qheNPue
         y37kfRkH7v83ohM+MSA416y0ETwrSYdgIJkujijIG9B6uibWP1AbABvmdvFBlsTTztuB
         Kedw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MMO8tcATpu394AY68H7SrwBxPMa+8crwM9tM0OOHWxk=;
        b=iDTyDKyPIpL/5EzJ506RYr3Y0HDr8MUcqWSaDLU5xQkvNeK0xKc2sl1NFtA21QdD8u
         gpxHffSmF6V+YQPS+8auLe9TbIjCi9Tscdjwa9FTvkD+SK4Avl4Gs0UiR/y7kFUU18ju
         OftR6YZSEJ/oR8zbsGG7BP1qd340k8597vyr0mtxkFJ08x+/Vx2x+1y0htY9r+xT1f4n
         ZQvlmSw6xvuhl9G36nhZRv/omuPY55jc7o4E++mdtT6SO4hxxSHlNhqq6SyTdekjv9hb
         tzNt3tEK1U0ktd8DgN0RKUST7F87Ho3lbMTrqzvZE529IHWLU0UaL4rZYdPPfRvP1EYh
         mo+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=mUIxuP6B;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.51 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80051.outbound.protection.outlook.com. [40.107.8.51])
        by gmr-mx.google.com with ESMTPS id v24si79231wra.1.2021.06.15.08.25.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 08:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.51 as permitted sender) client-ip=40.107.8.51;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOWhPjXgKtyOcgRLyjAziWX4PZ49mMLj1pgUCrXblyIEVyC5+n0K8jk0oQLt+hvXfpDTdYHdr7YAXCUtiEMHK3Ec66QVsBxDhyOavW3lk8ID+wrKj/6EDFBdKA/b5oOWLfifvWD4PerMvtXJ8TgHZmWzy2KBEvl3Z2ctLicTtFOF20fg888hlRmYgy1hVXFlJhN7gdZQbsW8t6/kzMzfxEE7b2CdtCWquHMjmK4kV3MBC8UutJ37vZn4f0cGc+rLZkVpwbXs0r55czg2zW5nP9DP9BYOLrFaZ8WWTZJqHSuJ6a+wlwIiLu5kqPUa2fw6nEH3RB2rwsmnv+eYp660sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMO8tcATpu394AY68H7SrwBxPMa+8crwM9tM0OOHWxk=;
 b=RyBcebqGTZtgm8ZmiKrH+fp6ktTSQ5IdJWHLpiqsPSJaSBk0V3JcPqGJjq/ogtQ8DFKDtZVSQLXzTcHPehEHv1rVQw59WO+b4gLWR8f+HL/qNtfCALKHOxIihQSsI8YByWM/3Irr3Xjeqlch2GG6betFgvqPEM/eodiTRi2JnbNGD1up4SprPYnuDCUjcPSEoI6N3DnbTN9dq87KgzrE2KTi28H6Tes9wwQHa+L150M+lyPCjcAfRy4+V4C0wzDyH5Cl2BP0WuZwBy2klIEl4Kn7FDRoh5XnaWQWG3zvg/GbdtWaMTUa+zAFJhnK+ALLzAaCumyDbYTHMkSig+ydWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 15:25:58 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 15:25:58 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v3 3/4] tools/scripts: Remove python2 specific code
Date: Tue, 15 Jun 2021 17:25:49 +0200
Message-Id: <20210615152550.356561-4-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615152550.356561-1-florian.bezdeka@siemens.com>
References: <20210615152550.356561-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5]
X-ClientProxiedBy: VI1PR08CA0113.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::15) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5) by VI1PR08CA0113.eurprd08.prod.outlook.com (2603:10a6:800:d4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 15:25:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0734f59-1a0d-41b2-f44a-08d93011e038
X-MS-TrafficTypeDiagnostic: AM0PR10MB3699:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB3699BED17DF3FD8CF948FCF8F6309@AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cyPPJTNYw+oOnguUIlQeqyIcn5J3ngwaCyvu94yufJUBR2sD2DzX/b6KsiraMQD6IEJgwXzmJvzZ1XngFZLGk0wQv1Q3X6s/SgSwZ4VxvlC/T47H+8lKKJi/8Rvki7YnuNDBK6AWXkBrqPDwiY3lkb9CIlFnB5ZXupE9GIx3zNHBvyX9J58AUBakdIIKWnfZLPOz2dRh4IASlzZ3/FVhNd4ToKQew7sBH4h+MDd6pAhNRyzCHHs/+VD+oVZEzrmbUOU/pepECDJhzbwHJWDLzxkMbcQb1SOCgi61BfYggIUSiH+RHJeMOJJeKK5/12tz7mcn6XFiz86HIvFFE6UAccUgIDm0UbDcHFOC1uHnmZWdBtdltoxpHKPBvzZEuGgz/Jak9WuVRZeGaUjx6KNGS0imDiQwRNwFEVjM6lM/a/8uQuIoZCnpCNdd4TXBUbpmRRoHTzGv00aWJmHapS1OlJwmjYjZk+JdQKFxuLExNP2ZdyLDndgYTJcm9I+Vv61TThHsyoJb5jEnhicokt61Lk3sRKXyaYm2XMVfB+Cj6uew7tXWyPCR/EfNU5o1ibKxZYvuPnafHv/JvWiTrRos2QJ7/1HuhVH0vm5W+8qwQv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(6486002)(6496006)(83380400001)(54906003)(107886003)(6666004)(186003)(5660300002)(8676002)(316002)(44832011)(16526019)(36756003)(66946007)(66556008)(66476007)(2616005)(4326008)(38100700002)(2906002)(478600001)(8936002)(6916009)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?34PcUeFg+DsyysfINV9BUxul9bu3ckyEd8CLTc2nBQ3+hni4LxH3TY/SG9VW?=
 =?us-ascii?Q?KELE+j2oYXrI91vdR+iohblqN88Eca5PdkdPXhYmuhQQQ4REmM76ajGNNQrP?=
 =?us-ascii?Q?XD5lC9PeOy0R3uJbVtHtrrYOFb8aNIk6bGPJTIy9bd4aqCFvSMi7Cj8zoED5?=
 =?us-ascii?Q?40cnL4Nc+TGqCLDmjHhocyPb7qIgjdFOFzEgmGt6Jc++WsSTLPBX+KXKb9xU?=
 =?us-ascii?Q?BmIbQrgKCVLOjx26tW9nJHd/n/PSfWXfKVbrRz8wsM1BvcX2Ea3G3Y2vd7Q2?=
 =?us-ascii?Q?BOKKazeB+TmO8UiOm+4eULGqZIQJaaACbXTAMx+EmMgC7pkpioGZBwnKsU3Q?=
 =?us-ascii?Q?I8ezWCFpOw/MV8RtDKViQX8MJ3LFC82gwUY37Sj1RlrGM82lfaFacaK/MtZ2?=
 =?us-ascii?Q?gukMwOXdo6GLF8evCyEMBoGoNNEQILuGftYyI3JwS/xV4BgfSlgm4WZ9bQRt?=
 =?us-ascii?Q?Fm4JKhBw1+2AASdwB7ZhRcUi96M7A0rnAwBqQQ4uX5Kcr4SXYhDXB5fBVifX?=
 =?us-ascii?Q?Nyxz2A3lox0ZJN8qZg5HG27iPuP8B/tBQV4ovg6XIIcR1VY9wrKRQYQb+AhA?=
 =?us-ascii?Q?p/sm+OENX9rV8p0N+ngLMEQM6P3KwZ02jAUeJY/zb92rjq82fqHlXAFvkNcD?=
 =?us-ascii?Q?k9DrxdTKdTkieNjwHsyZdWNJmFcuCpqvYMRgiZg/UO5NgRn3+MqzMjrfpH6+?=
 =?us-ascii?Q?8unn2tqKYGUOgg8NiFxoUyUUYiPyFeKZrDth6taWBYlZec7CM9iQIggwyDH4?=
 =?us-ascii?Q?bSrWfROjiQxPNIrkFzCfdG4n9yLUKjB2JUQbgLtTvPhvlITiL7sxLXvgMcQ1?=
 =?us-ascii?Q?rOnMLowcMcf3rP0/dmw+R4pFuxT0a9NNDUDQiNdxdXJmJ/5BY2QuCs/M2Bmm?=
 =?us-ascii?Q?TmiltLqrsjJlxnPjWaidcuVIHbV20OmapG4Ut3pmosjOnGSSuznOudYJXoaA?=
 =?us-ascii?Q?QKW02sf8BSzGOe8Upv0Vw9ABxNh6Hd0OI2gdKtShyfJYuwjDtTIXvr18axcN?=
 =?us-ascii?Q?IC3VYs7RtoCVzgj2S6Eck7CaKGSvixb2C0Kz2pXY8WAp54ZsluiwQcv6+Hk+?=
 =?us-ascii?Q?j25If+TbTFCB7ZCHkf7fRN+oJ2tkpAz0mw7Zg5kjR/G35HNFvdSukZycJifB?=
 =?us-ascii?Q?6N7gjvHUGk1CsosOOvTpexpxfCdPRdW0IxFye1yuVbc3KmN75N4kXI0VQAW1?=
 =?us-ascii?Q?EuAgB/0qTCU9tose1u6OmBggNJ8nHqlFWNOIDx9uuNHSNTrTWyOQ1+7Cnmrh?=
 =?us-ascii?Q?I2aoUDF7/yabGPp2JeCq3ATfR7i4L+EW6+/pTMVi1dus30DthwrHfF7fg/Er?=
 =?us-ascii?Q?Yna5rlViDDSh3Dk0yQqLHBHE2QM7ocCA6PtBCSQbb1JVi6D5yv8k7b3kEH05?=
 =?us-ascii?Q?XxSVrNNoSGkgtCXjjgX7G1B4Rmxx?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0734f59-1a0d-41b2-f44a-08d93011e038
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:25:58.4891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfD6AnaoDYCMdjIzpqFzIBSfB+bKVpc71dI+mbgCSQdpI+eEWI4L/cJbFxixgys6T//AO5S5UdMlUdYUT8J+NIQo3OIOPY9T/Ju9Ohgz1ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3699
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=mUIxuP6B;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.8.51 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

We are now calling python3 via shebang, so no need to care about
python2 anymore.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 pyjailhouse/config_parser.py   |  1 -
 pyjailhouse/extendedenum.py    | 15 +--------------
 scripts/arm64-parsedump.py     |  1 -
 tools/jailhouse-cell-linux     |  1 -
 tools/jailhouse-cell-stats     |  1 -
 tools/jailhouse-config-check   |  1 -
 tools/jailhouse-config-create  |  1 -
 tools/jailhouse-hardware-check |  5 -----
 8 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index cad761a5..7a7f48a3 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -14,7 +14,6 @@
 # information about the system. For more advanced scenarios you will have
 # to change the generated C-code.
 
-from __future__ import print_function
 import struct
 
 from .extendedenum import ExtendedEnum
diff --git a/pyjailhouse/extendedenum.py b/pyjailhouse/extendedenum.py
index f3dd1bb9..bcb959bd 100644
--- a/pyjailhouse/extendedenum.py
+++ b/pyjailhouse/extendedenum.py
@@ -9,25 +9,12 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-# Python 2 and 3 have different ways of handling metaclasses. This decorator
-# is a support layer for both and can be removed once Python 2 is no longer
-# supported.
-def with_metaclass(meta):
-    def decorator(cls):
-        body = vars(cls).copy()
-        body.pop('__dict__', None)
-        body.pop('__weakref__', None)
-        return meta(cls.__name__, cls.__bases__, body)
-    return decorator
-
-
 class ExtendedEnumMeta(type):
     def __getattr__(cls, key):
         return cls(cls._ids[key])
 
 
-@with_metaclass(ExtendedEnumMeta)
-class ExtendedEnum:
+class ExtendedEnum(metaclass=ExtendedEnumMeta):
     def __init__(self, value):
         self.value = value
 
diff --git a/scripts/arm64-parsedump.py b/scripts/arm64-parsedump.py
index c695706f..54f4fd66 100755
--- a/scripts/arm64-parsedump.py
+++ b/scripts/arm64-parsedump.py
@@ -14,7 +14,6 @@
 # the COPYING file in the top-level directory.
 
 
-from __future__ import print_function
 import subprocess
 import sys
 import fileinput
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 6d1743f3..a1650912 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -10,7 +10,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-from __future__ import print_function
 import argparse
 import gzip
 import os
diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
index 4c5289fb..7a634212 100755
--- a/tools/jailhouse-cell-stats
+++ b/tools/jailhouse-cell-stats
@@ -10,7 +10,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-from __future__ import print_function
 import curses
 import datetime
 import os
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 62db24c3..d6ea7079 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -15,7 +15,6 @@
 # information about the system. For more advanced scenarios you will have
 # to change the generated C-code.
 
-from __future__ import print_function
 import argparse
 import os
 import sys
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 2095f4e2..c2cd5952 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -18,7 +18,6 @@
 # information about the system. For more advanced scenarios you will have
 # to change the generated C-code.
 
-from __future__ import print_function
 import sys
 import os
 import math
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index 7a41b48e..fc8ce4f1 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -10,7 +10,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-from __future__ import print_function
 import mmap
 import os
 import struct
@@ -20,10 +19,6 @@ import sys
 sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
 import pyjailhouse.sysfs_parser as sysfs_parser
 
-# just a dummy to make python2 happy
-if sys.version_info[0] < 3:
-    class PermissionError(OSError):
-        pass
 
 check_passed = True
 ran_all = True
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210615152550.356561-4-florian.bezdeka%40siemens.com.
