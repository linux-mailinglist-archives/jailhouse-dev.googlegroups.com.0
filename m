Return-Path: <jailhouse-dev+bncBC44VTVY2UERB25CQ6HAMGQEHLERYLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id D096F47C070
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Dec 2021 14:06:53 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id j26-20020adfb31a000000b001a2356afd4fsf4654907wrd.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Dec 2021 05:06:52 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1640092011; cv=pass;
        d=google.com; s=arc-20160816;
        b=fI/GeHxt7RDDZdmRxjK7T/zdkQ5CTT6LxSPhVNIAR9szKw9q8a0cqse6FZgy85LX0A
         ssU31ePIubA1JDt3YhKrkvthlydI3wpkZ3oiRGPtkbBVh4+PzaBz2FuLA+VMmAO8L8bv
         P3JFr+OQrtA9vx5q/EYAij4tLuMwVRpOF8BT9cFN4aOiuXYz3K166+tdtQpo2KKdSK1b
         3vHuZeAM5/VbGRZXkt0N9MNZF2jJslNIydOECz7K2hJBfypfHcKtx5OhEPDmNFBjMNmD
         ElhAMbMj3YQVHEOtCSLmaKLVj8OiMEVoJKW4rDlq3HgAH8/R7ptvrKHAUrYg7/r0PVyM
         xbPQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=xFGQdPF/Cb0GLUtpoKGsipVhCez7NCzsrlORTsF74g4=;
        b=opeSA5KkUpTp2dQcBd+3yPrvIggwbxpIKyNM25/LzfHPGBvS6UfSHB8KuHCzuh1iGy
         zyOmvrxeefOkCd3vnHOrh6aK8gNYDUZYqMPdn4vcWQsJgkqC1xLnasVaYMBSVeRLLdEN
         hzzm++ZcDNXHPsIezjs+AeungUtMaiuqssnOgoEQ5MZUM1NZ24R2Gn8rGt56upMVgBpP
         OBg+FHwPrjBu8tbSeCwXcjqxKzQ/gbD5E1kb6JXMHWiMTHz/bRVkaDHBwfti1wC52pIt
         KPNNx68HspQx9gQEfiNRb1oxcL8coN2qEsAE/G7Fd2KZZokapXMZZjwoBrtOSp0/yuLB
         KQUA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=rrLqqx4Y;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.7.44 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:user-agent
         :content-id:content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xFGQdPF/Cb0GLUtpoKGsipVhCez7NCzsrlORTsF74g4=;
        b=VkE8NdA0210aHQwORzcg3qTODwHspVU957ZyuP5fuhjap8y3AKbbyw7oECgY62Ry+M
         jZEO7jueAy8bTuX2E4RzXNcEw1LEiIdv90/Zih3YEe4d2M6C7fEktB+UDG7bZR9KNhy3
         OoVYYdypJZTbrn1d6FDTUqLxiHLIt+Jq18vddZvZXWcIl0QT+eu2LiI6jaOVqPhcafsf
         mM6At9AMgBCEiXEbefdt+NwHjQIi/RxLsVsHiRobemPM2tp/6jRMkKUkk9pbM9LUoRza
         i9PvQLLWssyDHuWo3AgSDEa9Uw4JzG/VoizDLApkmaYPluctk4EMnksMdtkg9qB69yCZ
         NnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:content-id:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xFGQdPF/Cb0GLUtpoKGsipVhCez7NCzsrlORTsF74g4=;
        b=IHRBm3fC/MEk7BtnBIO34nedqjVBMATbPRwDgBURwQc7L3m9LFm8HAUn9w/jPJvBzv
         Q83762WSDX2KRBywAmJgqP6Slmb3UfGQa1LR0gvuif6kJssmL7xiO78An9sdTseXvaUB
         qKsUKP9wjVb4TiPp66sH95/26zdDnGaRlUSM+MCYfJ/Wemw4GTiHNjX2dCg2YMwMnMK8
         a9gqoLUjzMHpPZTrIFWO42P6DUmksyjML4GVzesW6gTUQDGRLCyIS/CaXrNnuquAOYur
         PViG7meNAbbTufNqy32/4YKs7799ExqdG7ODOhyBS/wN+n7CpyBV3Nyg9I3z31hODUEZ
         E+UQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532d3VMaEO4dVEIlpddkc0HQbv95CcX5eLg3J39ikwciPr7I27o2
	XYHZscGGcekEFO+/1ZKZ6Gk=
X-Google-Smtp-Source: ABdhPJz286IlEdt3Wx+y+GnAcJebGwT66kp5jEYWD0igc+wOuGGV31fByrNS2cLA9nof1oq1E4ZCZg==
X-Received: by 2002:a05:600c:a0a:: with SMTP id z10mr2667546wmp.126.1640092011610;
        Tue, 21 Dec 2021 05:06:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a4cc:: with SMTP id h12ls4088765wrb.2.gmail; Tue, 21 Dec
 2021 05:06:50 -0800 (PST)
X-Received: by 2002:a5d:4450:: with SMTP id x16mr2534280wrr.95.1640092010742;
        Tue, 21 Dec 2021 05:06:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1640092010; cv=pass;
        d=google.com; s=arc-20160816;
        b=IkTyh4rw1jg1ps1k6mmHJcscEjyxa/6bt7FoAWtblvdMdRIWJlyGMRQKhPcNrls8Kv
         CT9BVqDmC/++RcOXnciVm6eUJZTfuBl1Aourfutr9dK1iqafV3LLZgnJUU1ICRIGmHO8
         e0jCwZ7lpvamYGMp/n9uNLUyvM2ySiV7P6/luYaMarHe274Kjh3XMbCV8JytzSZEQb1V
         ltaOlEk+MIVfNZemkggcHwji/NcdRF3m3PhhHoAWMu7EN9XpqJlbfICImVwUxCKwi7eu
         +zQq/WEEMBFS4rESUFKQBKLvmR1gtDFMLXiZZ83kBT7ghOHjraCTe/QQtJStbQFPJ6ld
         aY5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:user-agent
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=dyK1MQFqjT8Z3NVIlsbm2xbRA8D1+YZ1UjHRqERqYxE=;
        b=uWtnLR0bpJkqGyngVvU3nEmKRGIhmupFsvLOd7Za3+qCTLKzs3ya0ab4229X6C9hSU
         x+tJPkaPoIZrm8yBXEtqBnUk71HNEOxmoFSKp6774BjDBLuFgEsL9Qx1MDVhtdybJ2D4
         s9RfCY7UAOGscA673FfBcmughbLBtVTawh3J9W0NhpzodX/gPmoTGPlpMzSQP8ky+UV5
         Yl5EGbbzjo+W+stUZZQSjXxLJMnwR5WewXY0MVPmd+dvueyCutTQ/vT6X955B8P1xSeX
         8r4YbomDrl+4FlFQB0K905rSTsmoj0wGCTIAsGKdNCH450ELeXMIv1+dZnuoOC2eZKec
         zJLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=rrLqqx4Y;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.7.44 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70044.outbound.protection.outlook.com. [40.107.7.44])
        by gmr-mx.google.com with ESMTPS id d15si880963wrw.2.2021.12.21.05.06.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Dec 2021 05:06:50 -0800 (PST)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.7.44 as permitted sender) client-ip=40.107.7.44;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9RLoIZzbmXp6ELI9w1mIN0FyjRiEu3KIQKzsIUb4oEkf1iJO0k2QP3fvCZbJm4xb4GB74IsbChpKwWZpaG9BYf25TrwhH+hbkSuIlhW8X9wTHeR5TmxWAkOdFFxjJ8R8bDa+lh5x7mGU/wBgb3iGJxDwE3e3ygmi6hlUmuNXP3k3BbkoV1yb5YJJDnwGlUhX4ZJ/ZVWTc19Q4FeHhl1QdiM03BdbACaJHcBdLzAV4ZVBAYd8ErtEjoLCsdtcUxRkFm9MJW7vjrc3bOJ6fyj966WTlEHYhY/WA/7yT1HWnXMRun68kpNiwa2IHcBEYarcqdhK4va9UObT5CA6iAx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyK1MQFqjT8Z3NVIlsbm2xbRA8D1+YZ1UjHRqERqYxE=;
 b=bEwWgZeVZGmlBLgSYk3OD0QKLz1/2JLL6bsspsAmBp5OniUapZO3EikVpZZnAyE2L8pedkiZUrzc4tS1fqZbQXrcGrQGXhcINKPharCdlFqJ9sT2/EkWB0cobA2cqMBzf8kmNgznaFB3r3BdnHUjh3zWT2CzLF4ujOyU+L+DY4GjAt/iHHndknv1qfrrZv4/zAJU+KOhcnidB9izbn91t4gguaIT4D91Y5xtSFOWfEir1t2U0Jbn8C6phqSmpErj3yIM16Gg8qM2h2e9GTY5aBOgkEk6557ySla35Nm6G0AKo9s2FW2+LfaQHiJtiWKz4jC7QBi0KVIEKXSVyH59AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM8PR10MB4801.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:360::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Tue, 21 Dec
 2021 13:06:49 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 13:06:49 +0000
From: "Bezdeka, Florian" <florian.bezdeka@siemens.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"huangjiajun145041@gmail.com" <huangjiajun145041@gmail.com>
Subject: Re: FATAL: unsupported instruction (0x83 0x00 0x00 0x00) (0xf3 0x00
 0x00 0x00)
Thread-Topic: FATAL: unsupported instruction (0x83 0x00 0x00 0x00) (0xf3 0x00
 0x00 0x00)
Thread-Index: AQHX9mhQ8Gt16vfZR06c8GatMbXE16w85I6AgAAF2gA=
Date: Tue, 21 Dec 2021 13:06:49 +0000
Message-ID: <659e288e0ecaf6a4c364cbd4f3a30148a3a6150d.camel@siemens.com>
References: <de30fff2-ed9d-4a83-8229-6cfd9a2ac99an@googlegroups.com>
	 <993a2675-8e94-4153-afb6-2324877408f8n@googlegroups.com>
In-Reply-To: <993a2675-8e94-4153-afb6-2324877408f8n@googlegroups.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a75acea5-4cf8-47dd-c855-08d9c482c001
x-ms-traffictypediagnostic: AM8PR10MB4801:EE_
x-microsoft-antispam-prvs: <AM8PR10MB4801701267439034E47889DEF67C9@AM8PR10MB4801.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:390;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8e4nnXW3fHFtcTMbwIjHXu7AZRyscl+kZDAt6VNcDRF6hexxsA43HPkmx7gpzAUoyt4+3vk+dxRReDF/q7X2G3A6TfjbBia8KNpP4llo+gyAUYq8IdSQLSk5TG+m4XcQpqhqAt0O1CGnVoMwmd+m4FdUtqHDvuCLavVFSmCkv8Oiny2GZBIPwU6v0Rx9/IbrN2VXHLSMp8GU6cUugPcxW0F51Khr9wZ7b/TDOo5tB5jx5YwtMw1UGdLjqcdRA1ZSLYWDXPLaddwjbqJC9uz/beXPq6cKhJQIvQTRrk7dOUJuyaQG/Syl185UaEMCyXSGqTDKSyUDVCBIiBL68OMFAAgVsSLsnkL+uDcaL8HlrtALbqQI7NSqYcv8pXnzGw83woA+qybtvjP8WANqKoFUAoBrQ0kchUTr8lwoVOQwaZlzAgL657bqfW0NkdnbaySuW0xZGmQrzVRE6Yci7995zVdqhpbwYjXZ9JaLPAW0p2ghRNJWjqNIKDKv99q0+gh79U9buDZZG2pIf0X97kWzecLgKfP4VWStafTksYLTJcxULd5BGsJPj65DuKcO1WvE9K84KnW/rxjz+gjvOhmV9O0LmK3ocVJCmuxasywdv3jgAYQhX685U3kDrZ2FHigLl9tg3rkmQOKlNBUmrzDlNDWaFqSv5XC5DB/EMMiA89IR3+kp+EvzhippTaGX4i+r29Un9y0Ckysx4aLbRJjp6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(6486002)(4001150100001)(186003)(122000001)(8676002)(91956017)(36756003)(5660300002)(86362001)(110136005)(6512007)(316002)(2906002)(66946007)(66446008)(66476007)(76116006)(82960400001)(8936002)(508600001)(71200400001)(38100700002)(38070700005)(64756008)(66556008)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjR1VG5CcHNFQTdGY1krZ3d1MVJKY1lOV0hmelA3SW5XWUx0d212Wm9RZ2V3?=
 =?utf-8?B?NUw0Z0gyOUx5UVhIUGZmU2xSVFpNUmc3dGFlMGEwc1dEMUVHYmhyZG5kdSs4?=
 =?utf-8?B?V3hScXFYYUN4UHRjeTA0djZtMGwwQTBxUGVBSm4rSWUvR0ptd0xua0RCbUU4?=
 =?utf-8?B?SGRmTGdwTVdnZG9Gem53NlQ3OEd4WktxbmwxZHkybWFUQlhmbWdubTBienpx?=
 =?utf-8?B?N0xQaEZPU0FPOUVYOHFvZjAwZ1hKeDBOK2kvcUg2TmhHQS9SdHRwTWx2cDU4?=
 =?utf-8?B?aHNmTHkxaTMvOXF5WGVaS0V6VnZFbVo4ai9wbkVtSEw5S3ZpeEVkc2hDVTdR?=
 =?utf-8?B?UHd0enovaXNuY0I1TlQvcmNYejVGRFJyRGtNVDNYaEZ6djVhU2JwRDB2RjEz?=
 =?utf-8?B?ZUtWa3lGRVY0OWJFOXZDdStrMnZ5bWprQUNuOXcrUEpGZ0M3ZTMxT3V3a1Ry?=
 =?utf-8?B?cUovVE1rVlBtbE9IczZ1RFdWbVJNdEhDcHhzWXZPZlJQZG9OemVQbTZPNWVO?=
 =?utf-8?B?Tis1cmUxSWpCMnBwTUJNa2ZuZWx6Y1graHNHbW9qVlUyZ2I2RWRrdjYvZnZm?=
 =?utf-8?B?NEN3bmkxZHJrYlRmeWlRa0hFOC9IZ3VTbkNHN3Q3dU1XclpZcHRyWkpJYkVr?=
 =?utf-8?B?bGhmN0VaOFpzdkxvMWlWNlFjRXFVaE9lYkk3UUNON0tldWJjMUl4QzU5Und6?=
 =?utf-8?B?MHlhMVVtRW1SQ3ZQd0NoQnVuZEpMeU5wcjV2L1dzNjFHUzJ1ZXQzRlpGU1U4?=
 =?utf-8?B?RWpRWC8xL2dFdW82YXo5SmJvNlVwUVRBTHI3anFYV0xHVWM5S2FLeXNyV2Nj?=
 =?utf-8?B?Zm5wMlNPWStOdGpXRVVqbEJyampJTGhpa2ZQdXZMZUFOdTBZYThvamhyMXFC?=
 =?utf-8?B?aWVSdVdJd1hMNWY4M0lXVDlxdGFGRHZ5YkJJWEJhL0prSVBBT1J6YWR2emp4?=
 =?utf-8?B?NmZKYnhJZXlSTGtrRDVncGN6WCtDNE95eDBhK3B0QjZkdDNGZy9qdnBlaGJ4?=
 =?utf-8?B?bmt1UkoxS25JQUwrMkxLWmovYUNQakRUK1NXSTRsL0JXamszcXd5dkJLcWFz?=
 =?utf-8?B?dCt1b0NXc1ZML2lyVjBROXJHSmdqY2ZOSUx6bzdCdTZMMSsxNXdwc0VxUlpI?=
 =?utf-8?B?NjJaTlNQTTZzdjIrZERTK2R3T1hiOHVYck9DZnVkcW51N21TZ0M0ajNYcTcy?=
 =?utf-8?B?dCsxZmo2NkRQQU9nTm9tV21kcUxFekI1N3ZtaUNWdEJ1NTRxN0tiOGZVa3Vq?=
 =?utf-8?B?MkNLeERvN212UWhkQjlaMmozT0dnbWN5MGM1c0tuVm05UlYrSWhyT3BGZ0th?=
 =?utf-8?B?SzdYUHBCWW1CaFR2OG95Tk1iZVk0NlB6UTlHaHZOMXJlWHltbERHSkpmYTE4?=
 =?utf-8?B?Y2JvcFp3Smd4amVJM0JTVmtkOFVndE9oSHdoYUFXazlOeGcxR0o4M2ZRanZK?=
 =?utf-8?B?ZVVyNTRkR3VKcGN3ZmY1alc2U1AremMxbk9WQVllalFQV2dGbmlYVWkyTXpL?=
 =?utf-8?B?YmtyMlorZ2tucmhrM1lDNzg2Vk95d0RKWThjNGU1aytTK2ZHZndEZzZUMXN6?=
 =?utf-8?B?a2R4YjNpNXFoYlJyOUk3VVZPbSsrb3ViclJpTWV6SzBFTUpLd0RzeVlpdnBj?=
 =?utf-8?B?TlVpaFEzZDhrVWNQbGY5ZCtiSy8yOWJYdzNaN1hYc040YkRrNk03Y29qYjJO?=
 =?utf-8?B?NzBGdStvVElPWTlCUFN4RjFMbE1yZ3N0UjRnc0lVVHV4QmQzVEZMNWEvZXRr?=
 =?utf-8?B?Z01FN1F0U1RHVVB3aldlanU4ZWFxT2U5cGhuWGd0K0xJY0lzQ21NNktuY3BW?=
 =?utf-8?B?VlRkMHYyK0EzZFdOUWhLeEl1SkIzck85b05vRUIwSHdneVNuVnVjSnRZZDl1?=
 =?utf-8?B?VWhtREZWOUlxd1R5R2FZdzR2d3gzTUhFRVhuVzJnQzNFckRWdWV2SEVRVmIy?=
 =?utf-8?B?YXAybWlscnNFVmZuTHBmRXhiWjlsL1dPWUlLQkpwQnY2ZUZiQjZiNHdUb0c0?=
 =?utf-8?B?NEtscXVsT2JGVnQydDlXVkh3QVRoaVNjVllNb0NJR0QrQzA4QktlV01DY0NQ?=
 =?utf-8?B?Nkd4MzJoZGd0YW5Rd1FTeHY0V2hkWEhFVW5HTG1aMDkvenlNRThZREUybTVT?=
 =?utf-8?B?UEQ3cnlPdTJKcXNlWUhCMlhSaFRqQ01nQTJCMEh1VVZvem5adU5wd0h5ajJx?=
 =?utf-8?B?dTA4MkwrWllOSG1HTXkwNE5RUFlBMG1VVm1EK01xMCswZzRBVk1VbExvSnNV?=
 =?utf-8?B?eFVOZkJHUjdkWkhuUk9oMFZlSVBlekNNQXRaMzF1aGQ1b2F5SEZTVjQ2SVBP?=
 =?utf-8?B?alF0TW1nSDBYaEUyVUlkYWdvbEUrVVlWQnJURWgzWFpQWEo5ZWVFZnViZkE0?=
 =?utf-8?Q?ml5Rk2sKl8O8SFzw=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <83C0B9307DC4364A8B64F4CE8319778D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a75acea5-4cf8-47dd-c855-08d9c482c001
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 13:06:49.4833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AkJrSCsesOsfOw8a/4EqWS4xG1QpxT/dm5hvy4StTKLhFNkjXXk8pAYyZAcJhn3ySpw+xyjxMRS7GCT/LXbpP11z8Ex01umxpd5MXdeMKUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4801
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=rrLqqx4Y;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 florian.bezdeka@siemens.com designates 40.107.7.44 as permitted sender)
 smtp.mailfrom=florian.bezdeka@siemens.com;       dmarc=pass (p=NONE sp=NONE
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

On Tue, 2021-12-21 at 04:45 -0800, jiajun huang wrote:
>=20
> Initializing Jailhouse hypervisor v0.12 (294-g6af5edf-dirty) on CPU 5
> Code location: 0xfffffffff0000050
> Using x2APIC
> Page pool usage after early setup: mem 134/32207, remap 0/131072
> Initializing processors:
> =C2=A0CPU 5... (APIC ID 34) OK
> =C2=A0CPU 1... (APIC ID 2) OK
> =C2=A0CPU 3... (APIC ID 6) OK
> =C2=A0CPU 0... (APIC ID 0) OK
> =C2=A0CPU 6... (APIC ID 36) OK
> =C2=A0CPU 2... (APIC ID 4) OK
> =C2=A0CPU 7... (APIC ID 38) OK
> =C2=A0CPU 4... (APIC ID 32) OK
> Initializing unit: VT-d
> DMAR unit @0xfbffe000/0x1000
> DMAR unit @0xdfffc000/0x1000
> Reserving 24 interrupt(s) for device 00:1f.7 at index 0
> Reserving 24 interrupt(s) for device 00:05.4 at index 24
> Reserving 24 interrupt(s) for device 80:05.4 at index 48
> Initializing unit: IOAPIC
> Initializing unit: Cache Allocation Technology
> Initializing unit: PCI
> Adding PCI device 00:00.0 to cell "RootCell"
> Adding virtual PCI device 00:17.0 to cell "RootCell"
> Adding virtual PCI device 00:18.0 to cell "RootCell"
> Adding PCI device 00:01.0 to cell "RootCell"
> Reserving 2 interrupt(s) for device 00:01.0 at index 72
> Adding PCI device 00:01.1 to cell "RootCell"
> Reserving 2 interrupt(s) for device 00:01.1 at index 74
> Adding PCI device 00:03.0 to cell "RootCell"
> Reserving 2 interrupt(s) for device 00:03.0 at index 76
> Adding PCI device 00:03.2 to cell "RootCell"
> Reserving 2 interrupt(s) for device 00:03.2 at index 78
> Adding PCI device 00:05.0 to cell "RootCell"
> Adding PCI device 00:05.2 to cell "RootCell"
> Adding PCI device 00:05.4 to cell "RootCell"
> Adding PCI device 00:11.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:11.0 at index 80
> Adding PCI device 00:1a.0 to cell "RootCell"
> Adding PCI device 00:1c.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1c.0 at index 81
> Adding PCI device 00:1c.1 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1c.1 at index 82
> Adding PCI device 00:1c.3 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1c.3 at index 83
> Adding PCI device 00:1d.0 to cell "RootCell"
> Adding PCI device 00:1e.0 to cell "RootCell"
> Adding PCI device 00:1f.0 to cell "RootCell"
> Adding PCI device 00:1f.2 to cell "RootCell"
> Reserving 1 interrupt(s) for device 00:1f.2 at index 84
> Adding PCI device 00:1f.3 to cell "RootCell"
> Adding PCI device 06:00.0 to cell "RootCell"
> Reserving 5 interrupt(s) for device 06:00.0 at index 85
> Adding PCI device 07:00.0 to cell "RootCell"
> Reserving 5 interrupt(s) for device 07:00.0 at index 90
> Adding PCI device 08:00.0 to cell "RootCell"
> Reserving 1 interrupt(s) for device 08:00.0 at index 95
> Adding PCI device 09:00.0 to cell "RootCell"
> Adding PCI device 7f:08.0 to cell "RootCell"
> Adding PCI device 7f:09.0 to cell "RootCell"
> Adding PCI device 7f:0a.0 to cell "RootCell"
> Adding PCI device 7f:0a.1 to cell "RootCell"
> Adding PCI device 7f:0a.2 to cell "RootCell"
> Adding PCI device 7f:0a.3 to cell "RootCell"
> Adding PCI device 7f:0b.0 to cell "RootCell"
> Adding PCI device 7f:0b.3 to cell "RootCell"
> Adding PCI device 7f:0c.0 to cell "RootCell"
> Adding PCI device 7f:0c.1 to cell "RootCell"
> Adding PCI device 7f:0d.0 to cell "RootCell"
> Adding PCI device 7f:0d.1 to cell "RootCell"
> Adding PCI device 7f:0e.0 to cell "RootCell"
> Adding PCI device 7f:0e.1 to cell "RootCell"
> Adding PCI device 7f:0f.0 to cell "RootCell"
> Adding PCI device 7f:0f.1 to cell "RootCell"
> Adding PCI device 7f:0f.2 to cell "RootCell"
> Adding PCI device 7f:0f.3 to cell "RootCell"
> Adding PCI device 7f:0f.4 to cell "RootCell"
> Adding PCI device 7f:0f.5 to cell "RootCell"
> Adding PCI device 7f:10.0 to cell "RootCell"
> Adding PCI device 7f:10.1 to cell "RootCell"
> Adding PCI device 7f:10.2 to cell "RootCell"
> Adding PCI device 7f:10.3 to cell "RootCell"
> Adding PCI device 7f:10.4 to cell "RootCell"
> Adding PCI device 7f:10.5 to cell "RootCell"
> Adding PCI device 7f:10.6 to cell "RootCell"
> Adding PCI device 7f:10.7 to cell "RootCell"
> Adding PCI device 7f:13.0 to cell "RootCell"
> Adding PCI device 7f:13.1 to cell "RootCell"
> Adding PCI device 7f:13.4 to cell "RootCell"
> Adding PCI device 7f:13.5 to cell "RootCell"
> Adding PCI device 7f:16.0 to cell "RootCell"
> Adding PCI device 7f:16.1 to cell "RootCell"
> Adding PCI device 7f:16.2 to cell "RootCell"
> Adding PCI device 80:03.0 to cell "RootCell"
> Reserving 2 interrupt(s) for device 80:03.0 at index 96
> Adding PCI device 80:03.2 to cell "RootCell"
> Reserving 2 interrupt(s) for device 80:03.2 at index 98
> Adding PCI device 80:05.0 to cell "RootCell"
> Adding PCI device 80:05.2 to cell "RootCell"
> Adding PCI device 80:05.4 to cell "RootCell"
> Adding PCI device ff:08.0 to cell "RootCell"
> Adding PCI device ff:09.0 to cell "RootCell"
> Adding PCI device ff:0a.0 to cell "RootCell"
> Adding PCI device ff:0a.1 to cell "RootCell"
> Adding PCI device ff:0a.2 to cell "RootCell"
> Adding PCI device ff:0a.3 to cell "RootCell"
> Adding PCI device ff:0b.0 to cell "RootCell"
> Adding PCI device ff:0b.3 to cell "RootCell"
> Adding PCI device ff:0c.0 to cell "RootCell"
> Adding PCI device ff:0c.1 to cell "RootCell"
> Adding PCI device ff:0d.0 to cell "RootCell"
> Adding PCI device ff:0d.1 to cell "RootCell"
> Adding PCI device ff:0e.0 to cell "RootCell"
> Adding PCI device ff:0e.1 to cell "RootCell"
> Adding PCI device ff:0f.0 to cell "RootCell"
> Adding PCI device ff:0f.1 to cell "RootCell"
> Adding PCI device ff:0f.2 to cell "RootCell"
> Adding PCI device ff:0f.3 to cell "RootCell"
> Adding PCI device ff:0f.4 to cell "RootCell"
> Adding PCI device ff:0f.5 to cell "RootCell"
> Adding PCI device ff:10.0 to cell "RootCell"
> Adding PCI device ff:10.1 to cell "RootCell"
> Adding PCI device ff:10.2 to cell "RootCell"
> Adding PCI device ff:10.3 to cell "RootCell"
> Adding PCI device ff:10.4 to cell "RootCell"
> Adding PCI device ff:10.5 to cell "RootCell"
> Adding PCI device ff:10.6 to cell "RootCell"
> Adding PCI device ff:10.7 to cell "RootCell"
> Adding PCI device ff:13.0 to cell "RootCell"
> Adding PCI device ff:13.1 to cell "RootCell"
> Adding PCI device ff:13.4 to cell "RootCell"
> Adding PCI device ff:13.5 to cell "RootCell"
> Adding PCI device ff:16.0 to cell "RootCell"
> Adding PCI device ff:16.1 to cell "RootCell"
> Adding PCI device ff:16.2 to cell "RootCell"
> Page pool usage after late setup: mem 469/32207, remap 65549/131072
> Activating hypervisor
> FATAL: unsupported instruction (0x83 0x00 0x00 0x00)
> FATAL: Invalid MMIO/RAM read, addr: 0x00000000538c1020 size: 0
  ^^
   +- First problem

> RIP: 0xffffffff91ac0aff RSP: 0xffffa70e496c3af0 FLAGS: 10286
> RAX: 0xffff8e13d38c1018 RBX: 0x00000000538c1018 RCX:
> 0x0000000000000000
> RDX: 0x0000000000000001 RSI: 0x0000000000000040 RDI:
> 0xffff8e13d38c1018
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x000000105704a002 CR4:
> 0x00000000001626e0
> EFER: 0x0000000000000d01
> Parking CPU 7 (Cell: "RootCell")
> FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)
> FATAL: Invalid MMIO/RAM write, addr: 0x000000006b7b4800 size: 0
  ^^
   +- Second problem

Are those memory regions related to your IVSHMEM devices? If so make
sure that the root cell is allowed to read/write them.

Normally those regions are located inside the hypervisor memory area
(memmap=3D on JH kernel cmdline) and mapped into both communication
partner cells using JAILHOUSE_SHMEM_NET_REGIONS() inside the
.mem_regions field of cell configurations.

HTH,
Florian

> RIP: 0xffffffff91c76ed6 RSP: 0xffffa70e4662f910 FLAGS: 10246
> RAX: 0xffff8e13eb7b4800 RBX: 0x0000000000000106 RCX:
> 0x0000000000000008
> RDX: 0x0000000000000008 RSI: 0xffff8e1bda209740 RDI:
> 0xffff8e13eb7b4800
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x00000008b7e0a001 CR4:
> 0x00000000001626e0
> EFER: 0x0000000000000d01
> Parking CPU 1 (Cell: "RootCell")
>=20
>=20
> =E5=9C=A82021=E5=B9=B412=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C U=
TC+8 20:43:08<jiajun huang> =E5=86=99=E9=81=93=EF=BC=9A
> > Hi everyone,
> > When I tried to add two ivshmem PCI devices to the root cell, a
> > "FATAL: unsupported instruction" bug occurred. This bug is caused
> > by x86_mmio_parse. How can I fix this bug? Below is my root-cell
> > configuration and log output from the port.
> >=20
> > thanks=EF=BC=8C
> > =C2=A0Jiajun

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/659e288e0ecaf6a4c364cbd4f3a30148a3a6150d.camel%40siemens.com.
