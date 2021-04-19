Return-Path: <jailhouse-dev+bncBDGILGE54ELBBSPJ6WBQMGQE2PAJYOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id A3373364160
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:17:13 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id t14-20020adff04e0000b0290103307c23e1sf8967215wro.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 05:17:13 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1618834633; cv=pass;
        d=google.com; s=arc-20160816;
        b=n6rTjPM6NCvdDi9xinsU8ngoiw54KUp9+/K9He20+N2mnTOY/KwuHykyectHAiqBaM
         EapkcXerDNOeSvT/6yBh+pQGuxre2Dwy/rZrGvh96JHhCQA2QK5vqJwvNxBkrMa7hzsx
         N1hUP8bIeHhtL95QktXcb6JV7ypNve4hyFQohXjh9m2wVoKaQxNr7G93gVl+sa5P8qsO
         vfQ+yd0o6ZckCeCZIK9Rb/F9gFX9lZXEo6VgmT7hTTuYUFxHaeAckEWJLWbRjSLBjGp1
         XWxanPAmRfj4cEvnRtq2FO6N0iBSEB7jqTGpstDDXQd+mxdjyyVjVjStz8zn9riWKxz7
         tqzw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=bG53kRGRrSHQjNzTw/HLty+kvOuu3m3Ns1htEHyLydQ=;
        b=m9mdZZG5Txy3d9xK1HhADfrEjl6cqa8Bx3kRnfaif2arNWaXNzSz5aO5FefAQTbwXd
         OLpzzPqLs8D2V7QaEAirC59leq29RDcRjD6+hCrI+vfddrRRHPDnrLRSrjev8E2CPwZc
         /3KNh9AAQeiJAnQc0NGlQ0qdRe2Kow+k5pSIuVrNIViQFmJF/flFDHA4lHVS/QzRyVBe
         3jxdxZR+5O+XMXxDUNe7vsm6CLlu4R2mOuaeQeH67V4/d9E8bPF5wpHfL1aiwzicucms
         pFvYM+UjLImgZI9JebgVjQMqo+m6d2hGr7uV3vvCQaUsQ5WHk92FyymLX7TgnLQJFe01
         ZoPA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=fnz99VN2;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.105 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bG53kRGRrSHQjNzTw/HLty+kvOuu3m3Ns1htEHyLydQ=;
        b=I8hzhLieqDnuDOmDVgULdWyTTv9ghJleWlbrZmgCIVlwsvVndZWIn+fx+qot3nt34g
         2tNspNf7fhU/KaOhaudpAD75DZKiQs/2tmzs/ggGy0uSyvVvyL4F7ufHFqWafhZlCwwz
         7X/lLJxa6AT5uikCT80gocOrdOwLXfj1mEQIVJwXOYYM/fr/2imHbbQU+iXyvxjdj2yg
         w+kUgxOz7WUFCS0dDifg55SzDQw8h8IuXp9QE5EeGNdORMaW4aHVEGGbpkgUAq24oqAn
         hw3SZrPzpOZQFRLzqgg1MIMX5ihd0nl5fUF+kIG0s/S1kXq0763wIwmcNNrMBjCd59LA
         /Yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bG53kRGRrSHQjNzTw/HLty+kvOuu3m3Ns1htEHyLydQ=;
        b=V4c1uj44GmsL7vsRJ2t2F0LDalJ4L8/eOdjOjoeC3nJlZyIVA4uTI7bolJbwFGkXlM
         Xh3BcA7bYgkbBKgdx73cVWP6DVLkaIwEqY0+KkPhwyehGcU9siX0vqYV8KoEnVWE+Zzk
         FEpy3Hyj7K73v1hugNiunli/kAdFWOKhfHjvOxEH7mnr0CS4xHunfbqaiG1Kpcvz8njw
         eSXoCDJ27PlEr0d7jBDTBpt/cOmf7b9IBRGx48fU/Mzb1VwOhz+AsXdEVx6h8E76lDkJ
         8IhU3TqsPhg7d1m37n3OY6+vHAHwr82ivLBZ0twKNOlCLFVibp4rv1aJkuSlpbQHVmsl
         mIrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532BW46iWlLa5/JfNl5ECr8MB/P9m5r5wDw8U9JaiqjmA6Tjl9kW
	yslR8alUH06tfy43wM8yjD0=
X-Google-Smtp-Source: ABdhPJxSdzeseTTZaTR5Hpgjk9tIyIelLhQmoghyO/srjDLhVSc/JHaZWVm8WASO7ZnuaAFZW5eZhg==
X-Received: by 2002:adf:f948:: with SMTP id q8mr14284959wrr.296.1618834633400;
        Mon, 19 Apr 2021 05:17:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fb47:: with SMTP id c7ls7523968wrs.0.gmail; Mon, 19 Apr
 2021 05:17:12 -0700 (PDT)
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr13976476wrs.67.1618834632748;
        Mon, 19 Apr 2021 05:17:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618834632; cv=pass;
        d=google.com; s=arc-20160816;
        b=RjWeqwCGNRY8rsemetOBdwQuISJlsy6LB0wUO2yLt5HYoQpVGSv/bceFpuAWTyjbQp
         1qq6PvdOlLlGvhKruLP+m6bwb9FOFsmHBlZUKEr6yjeu4u1yengv0QWczASMj+KDUMq2
         OjfBfD3Xd6PWh9ZTJKU4ixo5lOScjeMmbOWRflUNg6w62FQUee0lQWtkJ6M5ksqnOtKS
         eObhYRFcnKRHeoOmtSq9iDMoyIbu6vwuqOzofx1tg9jHZUwMwqJ8g4PCtA5aVyt3Uq5/
         aVeLN1KlOgcBb4WYzcNeyqQn+/f7nfkcXG8hn90FaLabj1Qd+giJo6jw97Rxhjaq3Fmy
         78CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=Cst539FsKuz1iO9oe3lQraAIRww83ErsqnSuY0XWbXE=;
        b=YTbnMFp9hRn4z1T+VcRjnZDhNZm0/4Aa/pOo4PXuMfo8vEPL1W9IaEYANpj9wlVuNp
         GLN0WnUiVWqZcA3NTfVEMI8IOvi3/Gf+RhFP/nMN2K8J3HbQfqs7kbBZE1o7Ac1kGeik
         1YC2ZVyi+mr9qg6RRuU2ude1Qwo70kOIpWaFoFnWhbzvcRJUXzjcRkf4vYpotDqHDsyg
         FoVNb8BiPB1380aBGASU3oMkkX9jhPJ4VRGDVTasw84bdvLDWSEutQeftCAblrAJy/Er
         Z/aqi3A26GOhjz6U1bc8k31VAb4snUwvB2bK/y7bDpzTS6QVY15OG9kRkheABf6qs79S
         KKxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=fnz99VN2;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.105 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2105.outbound.protection.outlook.com. [40.107.21.105])
        by gmr-mx.google.com with ESMTPS id s8si1183024wrn.5.2021.04.19.05.17.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 05:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.105 as permitted sender) client-ip=40.107.21.105;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoZkzeu2YzE7hxtKHnsmAhAM+FdYX4meeH0FeQQcTdkaoj4+YX0xh9b9HvAd11IVtI5wUg/v2JOLg40JjKBdCpNBqjZnw2tIdeJHkxKqQRexygi+vF3mHrshE8q3Uih87I9oaiE3CoFBbiSma6SOw5CILTfzXYAUAegBIREbV14X26Ez6xYMQWXxlO91YiOJmpx8tAwppWKOE2iJOcaLb0jdtl61fzfes8aOB1lLqPb16kTmfMyDkfbJpeMdiXU3h4aLqbwVUsW+uVCuynht+pf4lt7MTSy8xfR8YjwZOq2hzhZDw0ZiqxO9TvBsLDwg/rOvEm7G57UkMOwJV6983A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cst539FsKuz1iO9oe3lQraAIRww83ErsqnSuY0XWbXE=;
 b=TpITabz5OdlylygXYJwT7awZ9CtOlzmNsPV7b/Kk5i6JoV+vNAuv7pcaM4fhGLTNM6EVGtewJDmM00+hwdxk7CBVpGgEZS/qf7S4OWUj2cnHxTTkI0QJPIg0HtT7lzutTRqpKHBZxk6syFhVOtpc/ywgLRads8ACssIVm0XxwE8MRGjHaD2oamwjbHmBVP/qM3a0AoLf14KTG3ERQ7a2jBRk1WP5LiHWIiOrE/ZYBWy5SCdPG/j3CzDIKsMuKCnRauYLdzKOkaxfZoml3Ug8Agfx+hTs8L2F1X2ATckqfnAM1ZnM+Cr/7rnIwvpKqoPihq1x8r39x9fus7NM7WcaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AS8PR02MB6968.eurprd02.prod.outlook.com (2603:10a6:20b:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 12:17:12 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151%3]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 12:17:12 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 1/1] x86/mem.c: Fix allocation bug
Thread-Topic: [PATCH 1/1] x86/mem.c: Fix allocation bug
Thread-Index: Adc1FaPJ8g7YWRLmT/i09VAO3wxJ3g==
Date: Mon, 19 Apr 2021 12:17:11 +0000
Message-ID: <AS8PR02MB6663B55522C63851C338E6A8B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4884db8a-d96c-4772-79f9-08d9032d0f9d
x-ms-traffictypediagnostic: AS8PR02MB6968:
x-microsoft-antispam-prvs: <AS8PR02MB6968E0F202C893AF90824FB5B6499@AS8PR02MB6968.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hQBoDSXRhLXb4BsKsXX0aerkpEP5eBOGVDlJmoK/9KM0D0bUHSkVPctvMm3TClFjEHBF4UP4Exs4LD3mQ1eUdoeXk2wpbrT7xIK+jtTxpv/mDA2EdnYDvqectAHKk0dcztZ3znPvvabkFtG2ih5UJhwOMtd4taN1Vo5mzylJkER+6ZSe9JJI2R+4iWNGDf6yQYTEunbkdi/aWZSMUChSSVr3XfuxEaYiCTtz+8T8LqPn5eiwd2PihsMTIniMwpuE0UIKx/mjMcS5IVw4VHWfdVg34Gz5+DzmuzJFmhJ2zARKGcNh74jFZ2kyrRFRzL7HkozCeyzOsu3XaCgKt4jEpozqSkWm2dVHfXy4yNvAYXfdyrslt1nVURQJ+gMVv+UK6UBAeYbokSy3J5BbLAh7CyqnyxHaY9HTiL4jp1jNqGDy2f1u7DtYuzVo2NNs25qexyZ7ECyVtLDjXbadOHJidDXnXkVBOD23ESuXfZ7igAdJclW3dJ5IFqTi+buKeZzg5I+qKtdmNRsP6eGO5X3Tg1x6XfjzuUfPJV5gA30RAp1NtaEJ8M3wuTViFvc1Q/o3QKe56R7nJWMpaXIR8mF9dBt0Y2a/PnWYivcksjstghA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(55016002)(6506007)(4326008)(86362001)(38100700002)(316002)(66946007)(71200400001)(52536014)(2906002)(76116006)(7696005)(66476007)(33656002)(44832011)(5660300002)(66556008)(9686003)(8676002)(8936002)(122000001)(186003)(66446008)(64756008)(6916009)(26005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qpN3mG94dyOs6oobbTtZoRNx6SszErpeVefBBvs+0gNAMph4mr/r+UiJ8N9B?=
 =?us-ascii?Q?AteoYQZWk+QPKJBMoSmntzhW1vIiZefEqtEEhC/ZIImZCRuAw1TcYM8J5fn3?=
 =?us-ascii?Q?TgXU3m00t2OCZZ8Zm775z4Oqlw1NAavxa3udrQ51/XEoWoHzMX/7GVEK3Xb6?=
 =?us-ascii?Q?O2/0a7N9AWDe7tlEfAshgzT4uy2AaidfJR1b38qB9s1rkBJQ+PGHPBYm9eRZ?=
 =?us-ascii?Q?Q+efZqhpawQL3om7a2SQK9C/5LDPRI8dLVJoGBuvtWaM/3Cda11kShRspj5r?=
 =?us-ascii?Q?fk9T4vdN+r3NZK1BIgR66Yu7x+lnFpWpxNkXf+mH0QNvBgwJ0juYdLWYcOX+?=
 =?us-ascii?Q?hrpA/mB7D8KALiUFYZb9nlInLr4hleXEO6GVRzsqP4TMWdul6J2iWC3AL2K8?=
 =?us-ascii?Q?x0nR+XAD6sxBumnFklnzV1HdQH4oGfepQB7ED/1OI+RQELu0Q86dwCzteCuh?=
 =?us-ascii?Q?Rl+RkAh/OOUWFSxnYHZWgK1TMXM/5AeaJVye6VCJpRAh/UJr3TdoTtMz3Ktj?=
 =?us-ascii?Q?P0EBtvN80WN40ZDTYCTvNS0fxGGOKhvwwiza0zGhLoviuAP/xcvOoHw0Q4Cj?=
 =?us-ascii?Q?+qVrur0LPrMr3q+1UAssp6REC0nNSnEoKzahq/DhpLNavVns2u/jPZELTn5a?=
 =?us-ascii?Q?V+Ha8fhjbWLsfa/MbGNuTRjUjKcM1UY7YBuK4noxD4EBDnAZqERkMZ9ITyvK?=
 =?us-ascii?Q?7GE5V+MBt/xQkPRQWi3c/hF4GnyMgSSbe74+hrjyhnPRlBK6BHwVNQXAgyYk?=
 =?us-ascii?Q?Y0ElHZ0DXpQkj7I8ROc63b1bSkC4ZkXeGiunT6Hl00fPoAjRu0phnnpI4I4p?=
 =?us-ascii?Q?4DHGFatPkrXWNZHfzAGm+Nwrl4pHeWTYd35gBq6HJXrq7eCXHo89ANlb1h16?=
 =?us-ascii?Q?tQHsSMTE0nDgEzKDd7rYtmPgWwT+yYoDzZcOPyHA4EIuL9fiX96Fi9M2IO48?=
 =?us-ascii?Q?OLvxXaCnET6Fqn7VfAFGUfvdLOaon6MbRE9rKjDXKgozDMxWE2PvvHYWkZAV?=
 =?us-ascii?Q?Ej8phTN81wYfctwXIDyO5JddvYIzr+pRpf+50fbghpVrbaw7nc3URcq2Y5Z1?=
 =?us-ascii?Q?y7DZAUQAvvwG4Wql+GpX5cqw3+WisH+7QK8PxrFyE1R7JJ9yWQgThS5lsiuK?=
 =?us-ascii?Q?VfYl73FkypJr9Jj82iCmCUlBr+n9k8LarDjiVMWeWErkogrbpP5KG/kTkARu?=
 =?us-ascii?Q?9sY7JY9aguXyQF8WH18841e/sTM+zeoM0f24CXSC/ON8XVmtQ90grJHlRVfu?=
 =?us-ascii?Q?ppv8dDtEjrhysdye37CUii5IDD5jzA13kTgFHGKEeF9oPVZU05n581/sqZg/?=
 =?us-ascii?Q?BdE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4884db8a-d96c-4772-79f9-08d9032d0f9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 12:17:11.9637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X9DYi70ptRZdpW2KxWLQ9rIoC206ApmpP1sjLUdWSDrC3zzcZm8RkPQknRQamSzatMkBsCqvAsh8NCt/Gthfh27d9Tv8zqfUsM/zhD/U/S6sq63MKRvMYsMlJQ6/pUvQ9Ocgu7WkQnOZmLRcgkWroQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6968
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=fnz99VN2;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.21.105 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

When creating a new page table, the table should be filled with zeroes
to prevent decoding invalid entries as valid in the future. Given that
in the inmate memory space no assumptions can be made on the contents of
unallocated heapspace, zeroing needs to be done explicitly.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 inmates/lib/x86/mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
index 7e1c8b83..45424ea1 100644
--- a/inmates/lib/x86/mem.c
+++ b/inmates/lib/x86/mem.c
@@ -58,6 +58,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
 		} else {
 			pt = alloc(PAGE_SIZE, PAGE_SIZE);
+			memset(pt, 0, PAGE_SIZE);
 			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
 		}
 
@@ -66,6 +67,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
 		} else {
 			pt = alloc(PAGE_SIZE, PAGE_SIZE);
+			memset(pt, 0, PAGE_SIZE);
 			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
 		}
 
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663B55522C63851C338E6A8B6499%40AS8PR02MB6663.eurprd02.prod.outlook.com.
