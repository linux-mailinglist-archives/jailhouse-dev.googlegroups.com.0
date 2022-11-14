Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBTMRZCNQMGQEAKARLPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E1B6278EA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Nov 2022 10:22:22 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id i14-20020ac25b4e000000b004b139c2c677sf3049721lfp.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Nov 2022 01:22:22 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1668417742; cv=pass;
        d=google.com; s=arc-20160816;
        b=iAxbT7InSjoOnzdzHjEZTbJANz+EeXRwy9v4m8R+gCNWAOzUftPavczl3Awi44+XK4
         et0Rw+BY0XwDTCJvA8jXipxus1VpiAuXEbRjKvhpaj4/JE/JAYsvFbHTG9cIy/b7eQIK
         Lf8MUy1JG2gS9Ei8NuhguJFCIbs/r9+5DtHdWoZCXt+P3Hx44FpsdsntGub2gW2f+Kny
         TS1V3/5IFIGkKLy+h9DMa251Mq2SO27/pOzWw1XvfOAyAwDeZZyEm0fOQmpeXHH8TGNV
         ooJGcqfka/5KuIajGxlQaJdAWtBs9bQxKOS7iOeYzCFof0fd/72yks07jT15R3xQcmRP
         HQYg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:subject
         :cc:to:from:date:sender:dkim-signature;
        bh=NN9nHrLtF6Es5t+/MvqgE/WZVNth5oQQcNBIc+NCw9g=;
        b=NAYuttUPIY7bMaFZPvtWx1kvlVdLmG9BZyBaRxwvzlYkMbwQFMWRroXenEWFud3aw1
         pRJRf24bEAKvGkj3ETjXcLIkV/Wsy/dAU7AwCleZKMIIMtbhodd+bKjx89aoErIUlDuH
         Xfjjx1jovMLYthed6AZF2xWR5ksVC4u9kQas0CJY+CluAqtLH2oRaYKh45378yAYdmrD
         vRoljY+B2ZFfNIHlHi/4aUjfnlntfhUp0Vsvwb88aPsXmTLvDptxd697VVVkYW7iWdUC
         hD0mH91zwsr1JAxGa+rYqO6lZVo0ghbxRLWklvIslRqRi5YnuaCz3+ThsSx3K90g1zo9
         bs/w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=rRWJPdWy;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.7.80 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding:references
         :in-reply-to:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NN9nHrLtF6Es5t+/MvqgE/WZVNth5oQQcNBIc+NCw9g=;
        b=L10fZMP3lYUw24A/KcHUgp6pgNhKfUcpZ8zdc2iFnMwM5nO47m6dfvB9gobFR0+Oqv
         3j4tZUDUwVzM4XV9/6gZVDExpIsQZ1GWCMXTXPSb46OLSNK0U5S43JBNQXjqC3x+i30B
         VEO+7rpEVPZdDMp/8f9ROU8UFiFf0wma87sNdPgxrz7Uhkio27Ahv8+rx4YdsDy8BXQm
         sonTEVpe3eiTx/ax/PFC92lNZY4z37t/WvjHdDnV6RyM6R9WVUBYaHCCMWsWOfec/yoI
         OCQu+1WTkTXDFrpyApae7+Lha7xxVyTmnsMP8Tn3S7LHIOg1erKEXfGk6SzVZLgNCkfA
         R2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NN9nHrLtF6Es5t+/MvqgE/WZVNth5oQQcNBIc+NCw9g=;
        b=6xYIH87XWGcv2dsv5NmNbO1/4uVk5SYmkiF22OHLDLwqbcaPBFqWKx7uAv0aMbaSSn
         UqYYZ12WSQ6mIqQ6+KFH72ywCzHiGpcqRfB44sqHd9BZ7rBL3Ep1AYDWHqWd/1YFw4Jg
         KqpKdVz/+PEL4NWvc/HzLIaUGmc9sxK56lrsRaol7VWCRB7LoK0wsfpJa7+1ch56QHgL
         kJ7ICE2L9mj2nQ3e0l7u7tNSdWxIlStGOuTe+aFuUXHbQycLzKmQjpE6pP0CY4FTSqsK
         h4upZ2foMc3+ij1wLvZhnGDVf3q7Zl/KPNwBAnNmBo6WoQ9cvkDyojg+3ra8Ic+VpGZD
         juOQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pnkx3MrQHiYFeXKKMKr8I7rxq0An44y+s0oSmLKucvzdae2vdOf
	RaXuudiSI1OcFgxCAFjLV/w=
X-Google-Smtp-Source: AA0mqf7vvfItjsuqvzA4lQycWNIW9izU7VtbodjLJJmD2XFwp/3UAUyQ33HbrzCqsVDi+ZzRzkMjrg==
X-Received: by 2002:a2e:93cd:0:b0:277:4656:2c95 with SMTP id p13-20020a2e93cd000000b0027746562c95mr3597535ljh.440.1668417742056;
        Mon, 14 Nov 2022 01:22:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:36c7:b0:4a2:3951:eac8 with SMTP id
 e7-20020a05651236c700b004a23951eac8ls232308lfs.0.-pod-prod-gmail; Mon, 14 Nov
 2022 01:22:18 -0800 (PST)
X-Received: by 2002:a05:6512:313b:b0:4a2:27f0:46a5 with SMTP id p27-20020a056512313b00b004a227f046a5mr4170094lfd.611.1668417738657;
        Mon, 14 Nov 2022 01:22:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668417738; cv=pass;
        d=google.com; s=arc-20160816;
        b=r3Nt7/UwvejxjT7hRIxGAcbjeHu7mapJSlUKbRzKEt40lofuLp3OuEV50vXBoI55sZ
         MiK6ttEbXYHB6Y3IzynH0O5nl5W8HcH6qIyKU/1dRDMQJQIMiHzDVTAzCYkHtBdDlUKr
         WVmLtEX5c4SYEUhevtIcj5m8rl3dir1ak/e6WRR5+OWrXyFj8tHYOyoqWFay2HObve8K
         zrjtIVBN5gTeQKsgHoX0bNlBRJJu2mRIoc+LEwP5rGhH62vOFmT53tzFtvsq0EnCm/c9
         R0VcqswSeZCSehhcXaTP/KHqJr3iRNy1rvKPVu11Jaan2f1sZ+NxWD53uJaAfSu07mA9
         2UaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=X8a+Gt4hcpk391dui1wfjWCwVwDKmUV4oga1VeuYQNI=;
        b=0N0JwKZwIxFaH0S8wsuKsID7vr1EgBSn0HwhPHVmDuQvXha7cc6aQ/f5GTxyUbsugY
         b5nCrFRLAyGGm7cZidtPDN4ZbFekWOqC0a0TkmK60iIKxHBOqRZ5IF2hqn7cqC7kx55R
         vCdT6kPdHY48oq56LNX4MPX11MUk+BUaNKaJiSJ+K3tBC1m8FEHDrBtzKvVGoGCxeVBk
         EzxtIh/b1Cl3jDd/usOzgXuycj/22H/ZVpLQYnkjhz/rQtrsWVsMZiqgTKRHAor8CBmp
         0otGM4rkumKqWp+eYYlPbmr3TZUM9EzAskbTMDrwzgacnn8JkaMzG/GZ6XR8Q+DcI54V
         PkXw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=rRWJPdWy;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.7.80 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70080.outbound.protection.outlook.com. [40.107.7.80])
        by gmr-mx.google.com with ESMTPS id z10-20020a056512370a00b0048b224551b6si251180lfr.12.2022.11.14.01.22.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Nov 2022 01:22:17 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 40.107.7.80 as permitted sender) client-ip=40.107.7.80;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXD0b1K+zqAaErVoP8lqnc6f4q3TkyeuyX3CwiiClGrnAykk2La8vJNkNRThXKb9wlEJl3dh8cse6qirJvSaC3sEcR4C+bXa5mOKxBLn3P2+jveIjxGRENeAQEpbd6DxsTZKFLrFI+C0d+x5rsYWAOvxDXCImNv6a7ryi240WYzn/7Yd3cMQ8uELs2yjzeUlKOxeeXFTYhlj7Py0w6YyHHE7luh1+tEgDowyQGLhTECw1PJ6MKp2gxmoeYNrwGxkGX4OROtrfSI+U8pZ72dH3I2ywB95dC+gucNeCsyaj5qD25DUPVI8JPuDNLQus3xc7PHgszttCW86DuUl6hvihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8a+Gt4hcpk391dui1wfjWCwVwDKmUV4oga1VeuYQNI=;
 b=BE7O8kRkc76+iVsW2c4uADR0CHE1nXmQdPBwicsXXI8YlGPbntY+to8Yy1KVEioJvdcy8ixIWFVhOMEkvoJgSSL9sm8fstHJU1sg0sZ1cRmb/HYTKqPZpbiUuAlQ7Yrvm9rrKjqTUvUi7u64wsRNvqorja7IqV67rKbLYFbm5RyOEkZbNcPVnuQHg5m9fK//CZqiP542lsodDb+PDan4GHkkRI4Gz25+CZXY8QngxBk6ckBY2Q0VG5+fTdsQKFow3EAjxUFTXH/hx0X/LeOt1B93yoLZJOhQMtvK6zoTE67rHmkYWWzgHzYxLfSfl0K9ZHbJSiXtJkPVWWs4qk6rEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by AM0PR10MB3505.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 09:22:16 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e9f4:4305:f82d:1abb]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e9f4:4305:f82d:1abb%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 09:22:16 +0000
Date: Mon, 14 Nov 2022 10:22:13 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Re: Jailhouse: enter_hypervisor returns -ENOMEM
Message-ID: <20221114102213.2d3223a1@md1za8fc.ad001.siemens.net>
In-Reply-To: <AM0PR05MB601899CAC211F4C81A9757DFA9029@AM0PR05MB6018.eurprd05.prod.outlook.com>
References: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
	<63d52496-ac3e-8dfd-112f-8e723d0af98a@oth-regensburg.de>
	<AM0PR05MB601899CAC211F4C81A9757DFA9029@AM0PR05MB6018.eurprd05.prod.outlook.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5780:EE_|AM0PR10MB3505:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fb454c-ef1c-47f9-bf90-08dac621b8db
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u1K/kejH/LPjx7bb+0rwmgGIfio+JV5q5H/UZQvfyaJGsV1egcG2czYbRY8+c7FGq1buKTVx5FodDZymtWZAzk0uKH//cuQ70/Z+IHRZWQ5KsYjnFnXz76R+0SuoETuxGh1Qjx3CxtJmZsRkTl1gwIzWFIuBEu6Tm9lGczP4r944wKfHxNUzFL2ZRpRyWA2r4D4VxJq/OiwQ+5LtYgfoXIdVo38w0fLRUbqXQkwR5RkYOtAegMXikgQtsf3D6tWicL6jLYVnGdtd1JhwAS7y/1EPotuCrn6u9rmVbhUDHY4tE306cTUFY44TDUlfrTtsGwT43T13CHFLIGhM9zmWdyVJ0EDt+9RJMInoQf2n0nAwyL+NhJSMhz4rgrRDxkGQ4FI3iK83n8ULEqD+XW3Bi/SyfICoBOocY4qQeRmOinv9fX6MfTehoAv2yd+YEKuDOG4mjNzWjDePeDz0hOcStKXwOnldqNnG1k5LESXZbaqL4VZ2fy/1M15aGHGJ5AyFE8RtNNVBGOXPIsBFYGgf4WwBLApiDbkQpCU+hiogZR9Iq6gVJh9rNQvXqfMKYm8L85KEMKLkLyTKPVwRM31VOosl01RuePYq92dt2M8+dmnPnX9jD3Isq8ssZEuizM/ze4LCn1hKdO4QR6G3Fu9XAaQLWZUTW5JuoupR+NpCCapoJWy9SJ9dAVDfAo1TAwG0t46iTsRw7kFrxZUXXZJVpBBiuI9kW3H8eUtBrcjBBap3y3iJucLAJGH2+TcX8Vsn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(8936002)(478600001)(66899015)(6486002)(966005)(53546011)(6666004)(296002)(5660300002)(6916009)(2906002)(54906003)(316002)(45080400002)(86362001)(66946007)(66476007)(66556008)(41300700001)(186003)(1076003)(82960400001)(4326008)(26005)(9686003)(6512007)(8676002)(83380400001)(44832011)(38100700002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0JNVmlEWnp3NDEzSjRjWWJnellkZWpXQnZvMjE1bXFBVUZ2aDNqUDZVSXE5?=
 =?utf-8?B?VmNCSjFEd2d3OWNueDQzL0tDdGJ1M1FSVW5Eb01TSVFmSFNIQzVFZXFsMmsx?=
 =?utf-8?B?TDJLSUtDb1ZvSjhNTjc5RWhoZ3N5YVc1Tmh6bWM2U2hCRXl3T0hpaFZNSUcz?=
 =?utf-8?B?WWpRNk90RDJTRVBrSHlPNnpQWTNQQjQvTXFWdm1ZZUFUVVBuQXpFUVFqczJT?=
 =?utf-8?B?UGlVemwyc1AxT1VNdzUwcnVtWmNQWGtDUmYxcUN3UFJvem9wZDhuQ2pWV3hF?=
 =?utf-8?B?bmY3VndQZjJFc1RIM3hYaFlKZ2NDUHdOdUdzQ2w1WEIrVVV4ZTA0QTRtelBW?=
 =?utf-8?B?NjVMbUt0bTR0VmRubTVzNlE4L1ZXQ1hnUzg3andNR3FhNEJHdnhTMTZwMkU2?=
 =?utf-8?B?TDdDUnljYVZTalAxQVBOY1hkMnNqYURGK3dlNUVRT3hxWVhkNjl1ZDRkN0lQ?=
 =?utf-8?B?LzRLYVh2U3BaUHBHcGE4a2k2d2M3dW1zdGwrRWNjMWlYZkhFbDlWM0EyMys2?=
 =?utf-8?B?MnFJUWRDZnVxWlFXUmVzckhTU1V1Zzk3TitkWXpDNGwyMlB2U1M3TnRDQXBJ?=
 =?utf-8?B?aW8wd1MvWHVocDZVTXNXN0RHWlFBRm0wMmFhT0o1YjYvdGZ5K2JnWXhlY1Vt?=
 =?utf-8?B?Y3owTG5IaWZrYVlveWNBY0owL0ZidWlSUnJ5MXNVRHg5YWhibGsxekVsTWZh?=
 =?utf-8?B?YTVnNTREaXY0QTh5YXFJUnd6aVVaNGFqUlhsRnoxMmM4N2FrN0NyNTJOTWFO?=
 =?utf-8?B?VkdiRUo4aUJObXBVdEMxdG9vbXNXY0JENDlBdGVkRjdjWVU5c3B4cE1DZTlI?=
 =?utf-8?B?Z1QydW1LeDk2WGlWVUZ2V3JpRHZoeEs4aFRITmVTbTNodGkzdlJJR3B3Y3B6?=
 =?utf-8?B?OFJVSFZWVGxQRzRyUWVvMzVDek5qa2Z2ckVndWR5YzM1d2xvd29EdTlHWlla?=
 =?utf-8?B?SktGRS8zbjhaK29hYUJmQzJSSzFzanRLSUVHVGVzSTB5SkdSL3o4aXUvVjFF?=
 =?utf-8?B?Z3pCbzZCMWtvbnFPRUgrcStibkhnNTJRRVpOTUtYWE5CTXcxM1dXSjdweE1L?=
 =?utf-8?B?V1lad0NlcTRuQzVQbTVxL2pBU0ZwVnNscEN3QnZlSDB5S3l1UXRsczNka1d2?=
 =?utf-8?B?b3ZFYkU0MjArajR1MHJKL2FITG0ySG1JTmk1dC93cHBhUnF1QmIrRFRzQTNm?=
 =?utf-8?B?d2dhR1E2R3E2clFZTVZzNzdZYjV0eENQNC90ZWFXKytKVmYwSFAwbG41Umxy?=
 =?utf-8?B?TzRvTVJCMVlwN1MvS3ltbEZCSTVEMUNhU0xsd1h2cXBPcWFIc01vSVd4dnhx?=
 =?utf-8?B?YU9wd1lHS2lJaE4wMmRvSnA1cmFhZk0zYmVDWlJiVGtZZFgydGZUQWNuWm96?=
 =?utf-8?B?SkVja2IvRGZYWW9vaVkrREg5QkF5U3pXcmV5Z3k0S2hMZ2oyVFZrbjN5cTNY?=
 =?utf-8?B?U2Z4Yll5MGFrVTZzVzUwTmxSTlZpdy9UUUFQQ2FvcUFpMnI3SHNmREIyekVI?=
 =?utf-8?B?UlJCdDlPeWJMR0dUN0FWNmdaTGdWQUM2TEhjOXlKMjBUbGRYWDF5NmNEa0R4?=
 =?utf-8?B?ejNMVEphc3NIQnlaS0F5S3ZMVUtZbWZ5YmV6YVM3YjRXeDdnR0gwUStGanFj?=
 =?utf-8?B?dUczakYrS3NBV2xpVHNHZTM3c0k3MzMzeVdScytSN09UdkNPSitNZHpEekdV?=
 =?utf-8?B?N3N6VStER0RzUU5scDhmVzJKclZxWlM3Y1Y1VGpZY2NCdGZKcTEwVkRQRkZt?=
 =?utf-8?B?aitHY0Zpa3M4Rm5FQmRRUHM1UGVmVC95d21JR3FOODhib2h0QUdSWVJKb1VS?=
 =?utf-8?B?azZVZXdUNk44M1BDL081MkppU2Q1b2x1azZZVEF3RDhPSzlqUGdlSmpOWHc5?=
 =?utf-8?B?Nmp4enZRQmkrV1hRKy91Q3RwVEtaRVQ5NFA0VE9lUyt3TDNDQStEVG5aUkRX?=
 =?utf-8?B?eHpRTTRRNjBLK0JqRHl5K043L1h1Z0JXaHVEbmw4REdMNjV6b2p5U3FBQmhF?=
 =?utf-8?B?QzF5Y3lkQzVSaXhTN0xlTlQxblRiWmYxOExxNWpzMjcwbjJFenhyZEc2NE9J?=
 =?utf-8?B?Y0I0RWtlcldiR1hRTkgyVDRiVnk4ZHY1OWF5bGpxa3Z6VXA1bUJ1L2VseGph?=
 =?utf-8?B?MHcxNFFoeFVSR3A4UjZ3eEtwS3ROZTBrSWpiaW9XMlJKUGxFUGZVOTBQZXdr?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fb454c-ef1c-47f9-bf90-08dac621b8db
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 09:22:16.4913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +560Az7/WAU9Dhy5z6pZV7Si9IpHJGVkkJhru4c+O8DO/sQyXRXTFwgfcFOyPlcW0mpab4885tlqOaSodFWLHcPDLEPY4XsYND+yqiMhTUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3505
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=rRWJPdWy;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 henning.schild@siemens.com designates 40.107.7.80 as permitted sender)
 smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

Am Sun, 13 Nov 2022 22:24:45 +0000
schrieb Karim Manaouil <Karim.Manaouil@ed.ac.uk>:

> Hi Ralf,
>=20
> Thanks for the reply!
>=20
> >Did you use jailhouse-config-create? =20
>=20
> I am using `jailhouse config create` to generate the sysconfig.c file.
>=20
> >You can use the --mem-hv option to =20
> increate the memory. Try, for example, 32MiB and see if it works.
>=20
> I tried with 32MiB. It worked. I am not getting -ENOMEM anymore.
> The driver prints "The Jailhouse is opening" on dmesg. However, right
> after that the CPUs get stuck, and I get rcu_sched detected stalls.
> The system is completely irresponsive.
>=20
> I attached a text file containing the full output from dmesg. Here is
> the initial part:

I guess the output of the hypervisor might also be valuable here.
According to its spec that machine should have a serial port, and with
that default config from the generate script you should see logs coming
out of there. With the usual 115200 8n1

Henning

> [  434.792008] The Jailhouse is opening.
> [  455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [  455.793303] rcu:     1-...0: (839 GPs behind)
> idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D1827 [  455.80229=
2]
> rcu:     2-...0: (144 GPs behind) idle=3D812/1/0x4000000000000000
> softirq=3D905/905 fqs=3D1827 [  455.811276] rcu:     3-...0: (144 GPs
> behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 fqs=3D1827 [
> 455.820266] rcu:     4-...0: (1 GPs behind)
> idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D1827 [
> 455.829252] rcu:     5-...0: (144 GPs behind)
> idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D1827 [  455.83823=
8]
> rcu:     6-...0: (144 GPs behind) idle=3D912/1/0x4000000000000000
> softirq=3D777/777 fqs=3D1827 [  455.847218] rcu:     7-...0: (144 GPs
> behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/2410 fqs=3D1827 [
> 455.856404]  (detected by 87, t=3D5253 jiffies, g=3D48537, q=3D364) [
> 455.862170] Sending NMI from CPU 87 to CPUs 1: [  465.776884] Sending
> NMI from CPU 87 to CPUs 2: [  467.182686] watchdog: BUG: soft lockup
> - CPU#0 stuck for 23s! [kworker/0:1:7] [  467.189857] Modules linked
> in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtype
> br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT
> nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp [
> 467.189928]  binfmt_misc configfs efivarfs ip_tables x_tables autofs4
> ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic
> async_raid6_recov async_memcpy async_pq async_xor xor async_tx
> raid6_pq ] [  467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted: G
>          O      5.10.0 #3 [  467.328767] Hardware name: Dell Inc.
> PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [  467.337154]
> Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper] [
> 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0 [
> 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe
> ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01 74 09
> f3 90 <8b> 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d 4c 89 fe 44 7
> [  467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202 [
> 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX:
> 0000000000000001 [  467.385123] RDX: ffff964f1fa31280 RSI:
> 0000000000000000 RDI: 0000000000000001 [  467.393024] RBP:
> 0000000000000000 R08: 0000000000000000 R09: 0000000000000001 [
> 467.400928] R10: 0000000000000002 R11: 0000000000000002 R12:
> 0000000000000000 [  467.408836] R13: 000000000000007f R14:
> ffff962f1f42c9c0 R15: 0000000000000080 [  467.416737] FS:
> 0000000000000000(0000) GS:ffff962f1f400000(0000)
> knlGS:0000000000000000 [  467.425604] CS:  0010 DS: 0000 ES: 0000
> CR0: 0000000080050033 [  467.432127] CR2: 0000000000000000 CR3:
> 00000010987ea000 CR4: 00000000003506f0 [  467.440045] Call Trace: [
> 467.443289]  ? tlbflush_read_file+0x70/0x70 [  467.448266]  ?
> tlbflush_read_file+0x70/0x70 [  467.453242]  on_each_cpu+0x2b/0x60 [
> 467.457437]  __purge_vmap_area_lazy+0x5d/0x680 [  467.462679]  ?
> _cond_resched+0x16/0x40 [  467.467224]  ?
> unmap_kernel_range_noflush+0x2fa/0x380 [  467.473072]
> free_vmap_area_noflush+0xe7/0x100 [  467.478315]
> remove_vm_area+0x96/0xa0 [  467.482770]  __vunmap+0x8d/0x290 [
> 467.486792]  drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [  467.492299]
> drm_client_buffer_vunmap+0x16/0x20 [drm] [  467.498144]
> drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [  467.505118]
> process_one_work+0x1b6/0x350 [  467.509912]  worker_thread+0x53/0x3e0
> [  467.514361]  ? process_one_work+0x350/0x350 [  467.519338]
> kthread+0x11b/0x140 [  467.523342]  ? __kthread_bind_mask+0x60/0x60 [
>  467.528389]  ret_from_fork+0x22/0x30
>=20
> Cheers
> Karim
> ________________________________
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> Sent: 12 November 2022 17:47
> To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>; jan.kiszka@siemens.com
> <jan.kiszka@siemens.com> Cc: jailhouse-dev@googlegroups.com
> <jailhouse-dev@googlegroups.com> Subject: Re: Jailhouse:
> enter_hypervisor returns -ENOMEM
>=20
> This email was sent to you by someone outside the University.
> You should only click on links or attachments if you are certain that
> the email is genuine and the content is safe.
>=20
> On 12/11/2022 18:15, Karim Manaouil wrote:
> > Hi Jan,
> >
> > I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA
> > nodes), running Linux kernel v5.10 (same version used by jailhouse
> > CI with same patches applied).
> >
> > `jailhouse hardware check` return that everything is ok and that
> > "Check passed!".
> >
> > Memory was reserved via `memmap=3D0x5200000$0x3a000000`
> >
> > However, enter_hypervisor() [1] fails when entry() is called on
> > every cpu and return -ENOMEM as error_code. =20
>=20
> Try to reserve more memory. Maybe the default size of 6MiB for HV
> memory is insufficient for 128 CPUs.
>=20
> Did you use jailhouse-config-create? You can use the --mem-hv option
> to increate the memory. Try, for example, 32MiB and see if it works.
>=20
>    Ralf
>=20
> >
> > Do you possibly know where could the issue come from?
> >
> > Best
> > Karim
> >
> > [1]
> > https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6=
e2cbd99f9fc/driver/main.c#L251
> > <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef=
6e2cbd99f9fc/driver/main.c#L251>
> >
> > The University of Edinburgh is a charitable body, registered in
> > Scotland, with registration number SC005336. Is e buidheann
> > carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=
=A0raichte an Alba,
> > =C3=A0ireamh cl=C3=A0raidh SC005336.
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to jailhouse-dev+unsubscribe@googlegroups.com
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> > To view this discussion on the web visit
> > https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61=
DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com
> > <https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE6=
1DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3Dema=
il&utm_source=3Dfooter>.
> > =20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20221114102213.2d3223a1%40md1za8fc.ad001.siemens.net.
