Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYE5W2PAMGQEJSN3ILY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C06771E6
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:30:41 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id c66-20020a1c3545000000b003d355c13229sf8259197wma.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:30:41 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1674415841; cv=pass;
        d=google.com; s=arc-20160816;
        b=syqMa7RdaasWQCuUuzYQf4Lk6A/C7MUX954YfIYOiZt5vg10nipKpWVgJd9xNTJ/my
         JpjlOgkV9bFFrK2ghP9P1gt32CZb70a3g2vDqOgeBIrtXHH3fgmsWhIsA8QEzO16bkEh
         JOMgJX/Er4e/RRGuflyTOYWfp/nPoETpgaiWCBKabj4cU+qcJQEYA6a/5sRggRfkCIVq
         b3pUPoKUoOvEYZeSgAfwVIzdh8CLRnzoBVzOtJZpDWP2szsrWeWpjmLTXq6ZMptqkDpM
         upBg1QfkQHGEAtpx98vHZZXzpf9IQvfej6i83hmmHffEzKBaRmZwExhbuFQbxo3BV5k9
         i2Tg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:date
         :message-id:sender:dkim-signature;
        bh=eE5RZEXfE1qwEjbQtdD9i9K8g5wkEWZTGGrLeycCkLU=;
        b=TObqPhFzXWaMGeyMXCZMwQSSaQS8Lq0UKg5a+0R0uBAoC8j0nixdBKAxDn8I8jmRhY
         ++HpN/RGXzrsGJbK31P0uuZTuA4WPSN0K9lPsMytgmy1sfOiTFCfdNwY4kiD7aUsuT05
         +ZKwrDJFwzrhBAyokqZGjxdTWBuRXTrDycwhgDy7bLXkkhlfYqk8YW4g6vapGE5h7RHv
         mVMunRVrxVfdCdqw1ln+XK07OwsZJ24qFVKEKf//g5DO38qCvfu4VDb6KDsHv4D971Dm
         P4Tz8ULJcuTPZx1I7ZK3HKkLcT4aq0hwoIQfhqfGVx8Izc/OGNgihbW4kfmlWXzE8JK6
         12uQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="o4gW/QTe";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.53 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eE5RZEXfE1qwEjbQtdD9i9K8g5wkEWZTGGrLeycCkLU=;
        b=O/tMwDOH8DddSx5TBFuKok3DqqQx/vj/hCIMcD8y2iUqZQ7z6mcWACK2huz8vK6X98
         YWnwJrynDSfMqJy/PlwHc4lkMqPWvqWGf3nDE0VEu6nZqikPVGQ3T6x8TyHyo0edeKhh
         pr1MjPg5EMAbPjVmt7K5Q1LzCTOAxNXKVMo5hANyd418s/gG4BgDrZA+kvnaiOol/6Xz
         XteoHrZuuw0Vy6EwIuByYRhos1mwdfp4X5vfcvfTsLqEMP9I8xns35sSk22fWn17q8pd
         Mx++3RRPOZdpWd/8sr42tE9TXrewBnCbF+rCPJj0m2R599TxTY5sVI3MU2yvdu/zyrka
         Tfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eE5RZEXfE1qwEjbQtdD9i9K8g5wkEWZTGGrLeycCkLU=;
        b=qtWvY75e5WNBDnkUQLhKb9Jqea2eIL38gry/EVrf0JKpzh4P8KSpVwq9AK9VK2X4DP
         l4JON3YNHvTs+L0ky/NRCF/CV963v58L2Zq7JOhfZ+ICA5crPWq64SnzA7URlF01psXb
         eg1h12rl5AyJkJWPcBYoO4PPXbr3FKZsKDDTdslhaw3+/0bzqH1xUyyTCdn1dIOXLsoJ
         gqYbOov2EjFewh4FjrezBlmblUoNZwH/Q3XbjwQAVzUnc0R5EcC+9ELG6JHouUJVdEU/
         +lxfIVLnrPko7Gtj6cSt4Iaxxjjp/wMUYE7+2EienJnUdZ1PZilduDIw+wiUFVdn6KVn
         FIHA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krQinWpcbOuJ+ZEAhJcj/UnztkpE5V5bQP/DBM7nC1669tRfXAv
	zzsOKJjdNJMyLW7vl9FRyps=
X-Google-Smtp-Source: AMrXdXvgurSwaS9opNlOqPzmTPPqtpZZzF6ALcZ0Rgl8muExWDnbhO4MatKjuo52lT8CI+hyTy9cjw==
X-Received: by 2002:a05:600c:310a:b0:3da:1135:51a with SMTP id g10-20020a05600c310a00b003da1135051amr1394974wmo.54.1674415840959;
        Sun, 22 Jan 2023 11:30:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:2317:b0:3cf:afd2:ab84 with SMTP id
 23-20020a05600c231700b003cfafd2ab84ls5334525wmo.2.-pod-control-gmail; Sun, 22
 Jan 2023 11:30:39 -0800 (PST)
X-Received: by 2002:a05:600c:54d0:b0:3da:f9c9:cec9 with SMTP id iw16-20020a05600c54d000b003daf9c9cec9mr21347757wmb.1.1674415839536;
        Sun, 22 Jan 2023 11:30:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415839; cv=pass;
        d=google.com; s=arc-20160816;
        b=UiIB7JShqlglJV2oyDQDQ2apaqkCKuhq3CUS4MU+I8Hg6gdeZCNzg3A3ccTNfhsp0U
         aC3JLpzGduyis31lwtpco0HVxu1Dg0eVCAYn6RpZSzT0id6cb7GpiquqZBJtG6vVpXeR
         6k7MQBcQ/dDN9zH2jBMugcKK5+LAdXJI7859ILmr54eQ+z+zpgm/eZPdnsWuZrQO46i7
         Fy4+tDHDuTfewOGF4EYXkf/iYNAL93JuQz1KTokOLFxST1wRWKhACqzmPYKCCUZyCZ7l
         7ZpXFH/rIhL3Ty6UCElJQwUGER8SmJv3XxAIKEXYNU3PCTw1RdzkSjV4XRa6TRMJcG8V
         y6GA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=icEJp4N03zytxv/gqBKkRDJp4Lsda/bwWlM8nDjNplQ=;
        b=ZquZXNmPRoqtar63M21+LDuZr/a8JNkKyh9tkHI8T0aJWMFnYte62uJs9nim4COfVy
         rsA9U1rr+zClW5zj0bQauR4xUVyDmoCdunSQZU7mYvFZjqeXpJGX0jNZ/94Z6eK8Wnyp
         ylluCtGMWkpyfBVwGmb8ONsvpojBdDZNf7Dw6dKP7u+aXqQzstqX8llEometS4We4B4l
         VZL3Yr8nteuu36pRUH3pKsuWARFC6ZBWI9JhdeQeQ68DHn+m7Wjb6onb7d+IFO99paFh
         bSKhBUVbSDinqZdphmU6mGrOKLh8zcCoGAMT575EwSQpBi2UQFOiRtuYNqM71rJ4tpWh
         YiUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="o4gW/QTe";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.53 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2053.outbound.protection.outlook.com. [40.107.8.53])
        by gmr-mx.google.com with ESMTPS id s4-20020a05600c384400b003d9c774d43fsi697751wmr.2.2023.01.22.11.30.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:30:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.53 as permitted sender) client-ip=40.107.8.53;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRibic/zGBOb8yvfp17aAN+w6wPYrTnPzkdqA9tPUanplAHq40+c2mdqMvp3KTth489mCyxnupTOarDyuTSRbJ/CgWKPABVx0yR6IQmDHL+E2vlaU9QLfXIZbV920OE89rE8HpvWOhUdapxyshiq/B0RGiJ75is659/VznTe+ZSkQEXe9z0KjQeeu2EuuOXLI6E1hC9oOjL5HD/+t92BTp48PXO0ogJrooAB/aeDtsrgWcPFjM5zSTiiMxOyFmuwl49zwNwALG0zdgoNjLhpPuJTq6uWA9NnQEbLdYSbSwuGFclIcuyn6rI6qK9VmjZvMK8TqRnPmY9qwmIbS+CVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icEJp4N03zytxv/gqBKkRDJp4Lsda/bwWlM8nDjNplQ=;
 b=hqPQ5VzyC0Xp90j3Nd5XanrOOkBIoF2qvRIF0OjBYqfBuemeS44IuKz5M04nPGXq1xoJtCrKYfkZc51UomXJsKP/KglZGz4G7+WMF/GUkG2ioQyNq1823HX2oN2f4Ecj4/OruoDvpM58dLua+xTiRoJ5HeISNsRCvsjSC2x18K5ZuImh/zGMmyhr85vkM9hyP7XZsusd22uUVyXq6EyCDJ+F4fMucLbz1Fy2T5NJPjnYULzJ9JPQ8tIvlNiiTLoJnebBmdwZYX+ImJBwRvB0wy0xgasaFVg61+oMkb50oXMStjo3Ahb0UWtea4ICNZVVEwWfhM2PrF2Z69NNOHb3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS8PR10MB6724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:562::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.31; Sun, 22 Jan
 2023 19:30:33 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5%7]) with mapi id 15.20.6002.031; Sun, 22 Jan 2023
 19:30:33 +0000
Message-ID: <f58cd6df-6e56-9785-89e1-118ed8846dc0@siemens.com>
Date: Sun, 22 Jan 2023 20:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] README: Add Renesas RZ/G2M to the list of supported
 hardware
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Chris Paterson <chris.paterson2@renesas.com>,
 Prabhakar <prabhakar.csengg@gmail.com>
References: <20230122190913.5196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20230122190913.5196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR2P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::18) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS8PR10MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: d64d361c-72a1-4797-6797-08dafcaf2109
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oNPiLD9L3I6WSRT5tfjKHKb9hHN1Jp6CW4feX55SpnbsKV0rtgKcYMFRsjkCWTIOfXlUloCrWGM/CUiRfPP8/reomMBIRE5IG6RdeQbrfa2R30wb98BcgcLNOO2JSQ5tQUbcIqiLNmQKJmB9KnmC71rK85DyuD7NZ0OHzGOGwtPUFAaa5DoAhAusra+v3XlseikVxTlwfjU59wA9pEHqYDUbvsC/VxJQuLe4Bibei7N2NZ9Hulfp2mmaI+i0FpqpZAXnlZgj0L8kodCE+f04r4Pn0OJCiRvuGMh2UP30qVpLBumUi/XY3QILjvrUlizgd0ahYFPr9Tlw9VNY4d7iBczPmUBAVBa67iYAu7wI2a2DpvGAsXoibM4ABvz7QJGRUAR6BQNUaqPU36VLdWFEhcfOweClUhbMvY50qXX5mjCSbZcQWbHnqK2TS7UhNGD7iETe7P2rcaFzDdeuCXZxAdWrzZRiCRBBwBSRqO2mCL5NNplpp+mqGwg1pmFybvpxxVphx5oPnvw5JyWH3cMR9lOeN+mGwOAO14cZHoUUBDlPS2PIocQw8Ms/ZlWYHiNf/S9pC6snrTLUNvqxgtubxwT7/PMp16iQryhEo/ZiwmNyc9+3JvuCwzW/Wrj3kRdhJwNaY+2qjPsIh2hBM19PjJD5BJBTXywKA8ccUBFHzfngG9+280ddsuQlFqNP7bOT0W5ggK+CQatTvQXlj2F8JRZdRk3FNE297DGuTwNyoxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199015)(316002)(110136005)(54906003)(36756003)(8936002)(5660300002)(26005)(6512007)(186003)(6506007)(4744005)(53546011)(2616005)(86362001)(478600001)(6486002)(44832011)(31696002)(82960400001)(2906002)(38100700002)(41300700001)(31686004)(4326008)(8676002)(66476007)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW1YZDNWQ3RzM3lGUFpsdTJNZ3lBa1FSeFBuNlFjc0NHejdSVXhqVktSSExp?=
 =?utf-8?B?SCsybXY4U3c1amRHRy9xY21hY0RKeWNFQlc0elM5dTlaRW9ZcTZZZzBiK2FW?=
 =?utf-8?B?cEx1bi9wMzN5VUlKTE9yV3N1dXRSTWE5VXEyUUpZdUxzSDl0a2tNRkhIZGht?=
 =?utf-8?B?OXBUKzkyeUhyQ2ZDYVJqNitSQUdsM085MXptMHdnckpBZFFQcTI4TW1kZmVC?=
 =?utf-8?B?anF1T0l3V3MraytMZ0hGUVVCK1JUTFl4WWxlRGUrVVU4WWVnSWlSdnM1eWhk?=
 =?utf-8?B?TDN6aUI4aUc2QkNsZEJrbVNqcldna3BRZ0dBSTRDdjRKbHA4NHhYR3JmK3R0?=
 =?utf-8?B?aEF6SjRoZU1vRXhSSXRNZi9FbUFYMm55N2ZleG15cEVwcklIY3Jtcy9SWmdt?=
 =?utf-8?B?MWt5SHozY0djQWhsTnVqRnBwTEdJMDc0UDg3VXVKMUJNZ09WVSsrRVdydVpL?=
 =?utf-8?B?Y0lpcUNnemE3RUdKZ2UzUnpRVFNXUFVEZC9zdFpTM0x2MGI5S3F0TEtFY0ox?=
 =?utf-8?B?aUJjVWtkM2VEWVpuci9MR3BBVE12T21seFFGcXhQUUNQZHlHVmFMMEIvd2tF?=
 =?utf-8?B?Q2RmZk8zajAwSGZqRjhCZGxKaStpZXkyWGdXM2RkZnU4aUtTVnU5RlJtbnVp?=
 =?utf-8?B?aFBnK21uaStZS2Z5Uy8zRm10TVBjSmR2T0FnQkw3a2ZUNkJnT0JxTVdJK0lQ?=
 =?utf-8?B?ZmY3ZlZXUHFIMC96TkZFTW5BTkFKc0hlRVRhc2x3NSs0YXB5MlA0WWxOSFR0?=
 =?utf-8?B?QXl4d2pJRlZla2QrR2xGUkE5YnhncEY3ZnRMeENad0ErT09LOHp1RE9ZcjR3?=
 =?utf-8?B?TnBFd2dFQ2pNV1ArSWtWSFJxaVZsMm8rVjY2RmRNNE9JYVltb1luWHdIVjR5?=
 =?utf-8?B?Q0FDeXliUm1uZXQ2YWRjSHZ6c2FMQWVsckV1a2d2TDN2dkRFK0NiYWJhZ2dr?=
 =?utf-8?B?UE1nOWJVczl3aXY3K043WTRWRjRSeDg3SjdES0FRU2ZMN3NaVjc5UTdWOU5h?=
 =?utf-8?B?MWh1d2hjb2lqUUMzZUFNdVlXdHd3RHZwbklhUUl1Qklqd3lOSU5uVWowVzBB?=
 =?utf-8?B?TWpUam9tU3FWVjZIU2tid0VlcllOSjBwU0w0a1U1b2ZxUWdGbUM3K1JOVzAr?=
 =?utf-8?B?Ny9pZDhUTVZ6aWxIWVVWUk1zV3VmdTE3V09Dbk9KakJOd1dWelpOZUpJd25G?=
 =?utf-8?B?VlIvQldQOVZSdGR3RXg5WjZ2aXZJZ1ludXYveWI3TzBGR2svaUplREs0YVJY?=
 =?utf-8?B?OE94WHM4NTRsbnArbU9zTVNTaTZWQ1BpcEIrMld5Y2ZwSkdaVE81N3BqRWQ0?=
 =?utf-8?B?ZHplSmUrd1BWNTl6OWdsZndGQnM5d2Y0NTNoVVJoVUJBbDFkSFJCWldyeHc0?=
 =?utf-8?B?N1BqbGxJMVNyS29GbFFJRGZsamxHVXF6MVNLSlFBNS9RMXBSU1JzRDN3aGhM?=
 =?utf-8?B?T1VTNk15YzhQZGx4eFJCNmVUbHJ3K2dOdVEzcnBNNTRpYXdPTHh3aStqUis3?=
 =?utf-8?B?QVFiZkxYaXZGNkNUYVNqNE1QOSswZjZVQWQxR0M2RHNhdmx4bXA2OVpQMkk0?=
 =?utf-8?B?cWk1Z2kxKzAyRGNDa2lIL0syYVVndG1INVFyVE8vOUt0K0FNZkFhSUpHN05H?=
 =?utf-8?B?TTIzdUV6Y05TSHhsdy8wMWFsUjd4dlYrRmp0WWtINDBDMzYxQWF5MEpTaXRT?=
 =?utf-8?B?K3RkWXNLMU1jcXBoSkR3bkVXRWN3dEMvMHBUTkF6ODVjNHMzQ0g0b2pNSThR?=
 =?utf-8?B?UE9tdkczZDJOd3JCUkNFNjd2RERvZTliMmhJMTdaZ01CN0UxaFREMUF2VE04?=
 =?utf-8?B?dkdTb1R2cnFXVG9MbHFBTzdjK0kwTUo3Q3Z6bzRWb0NlL3BTZWpGQkhJWVY3?=
 =?utf-8?B?elQrY1pteXpVTm50MS9CSmdKVExickE3QlJHa2szZm03OHRqZUpNMXJCOGNz?=
 =?utf-8?B?d05SaCtLcHVoU1JXa1N2TjEwa0ZFem1jcFVMODB0M3FKaW1lTXpTcE1uYUFW?=
 =?utf-8?B?TjlXMW93dXFqMnBJTHBBL2hnd2NTRkVNbFhsbWs4VE11cnVUOERZOW11QlFn?=
 =?utf-8?B?UmFxS1djNnA2ckUyVXUvZlNTYktYQjVoZVo3RzlHeERHdmgxem03SDRodW5H?=
 =?utf-8?B?WS96T21mVzJOR0lpcW1mOEM0YmtzaFVOa2F3c3Z4QVkzZytpZDNNR1FOWWI2?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64d361c-72a1-4797-6797-08dafcaf2109
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 19:30:33.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHFB5DCksJ5v5r13J82LJ9CFC49rZBopEKRPznYOkU8lOGBzmGeK1ojLziW7jYMQDQOxVOjucZH70kZyJSa7Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6724
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="o4gW/QTe";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.8.53 as permitted sender)
 smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass (p=NONE sp=NONE
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

On 22.01.23 20:09, Lad Prabhakar wrote:
> Add Renesas RZ/G2M to the list of supported hardware.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  README.md | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/README.md b/README.md
> index dc2c3afa..2ab2a60a 100644
> --- a/README.md
> +++ b/README.md
> @@ -134,6 +134,8 @@ Hardware requirements (preliminary)
>  
>      - NXP MCIMX8M-EVK
>  
> +    - Renesas RZ/G2M (HopeRun HiHope RZ/G2M platform)
> +
>  
>  Software requirements
>  ---------------------

Thanks, applied.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f58cd6df-6e56-9785-89e1-118ed8846dc0%40siemens.com.
