Return-Path: <jailhouse-dev+bncBC44VTVY2UERBW4L7KHAMGQEDUGRWEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1039.google.com (mail-pj1-x1039.google.com [IPv6:2607:f8b0:4864:20::1039])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1548BF22
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 08:40:13 +0100 (CET)
Received: by mail-pj1-x1039.google.com with SMTP id x14-20020a17090a8a8e00b001b3b14c53afsf2158578pjn.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 23:40:13 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641973212; cv=pass;
        d=google.com; s=arc-20160816;
        b=rRO7PSG4e2zCVa4gI7b4vheTN3ZIIaDFJsUQclCuDZiuBe30/aFY7bBN+yR4decdVa
         f0AmE+ogL0obrdun+9VIO5pX5NE5s1CdMvX42RGtWSd90eVsSu6y4/ReCmSrBqCGCzaV
         oHsu7ll4B4Xn+NC58vxHIYEyaI0S2uKpeWwqki+tVH0ijHQPxgMIMAG1JM0CyOLD74uG
         rmcTlLRCyHxxK936SoLW+akeOerVujWO0sDilYYxq5MBCsgFaNbeqP8/FNTBxUw2z12b
         zUlrdO7GCruFpRx6NQYEhNQNBxpmaGuiGsbOQFG8kowgWtx+8tpzBaecdBZ6FFnhvgTM
         b0Tw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=ggC3pQFB5Isun2aiKmxySlIkvm8XcREmePL7UTIRvO8=;
        b=RlTZDwHzUmuybOkWiaGYee5u7BCs66EgMLCfj5wtlKuUKOzPCiTgFjMu11n5hhr2Dt
         X3GXFk0CJ2Bni/mw97isoyQpkNJH6QOJ67+WVeuK5Je2xaqIiw/aqG7J+Pkh1/XNQnlA
         D/C86aeSIc5BMQhNF6DthU5PZdXFr5lyAymgezNBlW/4d15cEm/eM+A7eY0x2erNCflL
         3Kvk7UHWcAEjlPHQiVg3+CgS7cW6BIjDappGmjdPv5Qsk8igZKjS6mUtUzzrkZ9Q2ao+
         9O89aXt/R4Uk4aMP/gzt77LHmMasc6D0dvTGi9QDDuneqRskcA++o+rE2uxWNM5t7WNV
         vohA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="GXg/pSzV";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.63 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:user-agent
         :content-id:content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ggC3pQFB5Isun2aiKmxySlIkvm8XcREmePL7UTIRvO8=;
        b=qcgFEkwD6QZ0bV9MZ6sXApPQpzknfh876kvHevXBhRE06Toi4JVt1vjDbib5D0K9iZ
         qL1/dTzN9dLl0+9V07iwUhzpEXogTdg2miVK2eDSe+bkwvNCezCwHNHILWK28POktXey
         zaA8Rt3W9FXeM4HenDCZSsqT1uNYrYpOlMIq9OeBncHbj1WZOwheXJVbhZHsAFrUdqdx
         Hq8WeU9QmZw0AObELT3g4ne7CYlA+OjRM8C16gq7mg1apPUVUUWM/42HVFinoUez8MwJ
         oxYXSMkJ+ORo8DaojUmhwPQykBbf91Ou6rChbxB/JZeKaEpgT/XiRz0G/3kY+ty+cb/X
         svFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:content-id:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ggC3pQFB5Isun2aiKmxySlIkvm8XcREmePL7UTIRvO8=;
        b=LUmidH70xb+uOYR4gyqMVyBZgmepHK7WLv5xeNlDwj+geENpDzRoQ3hpOdDJP5tf77
         40/QM/4MTG0sSAyFslr5L2ENlVH/HIQmy7AjKUbZhzydUsS2SGtBD04/VhjstmxUOSvW
         6INKJzmIIjff6PXBEr5r99tB0nnsN/h0Eulfk1pio20pF/bA1tH1ikgn4z6RmE6REn4A
         5It0xAtLqX1VwJHJ4thCBMTLnVArrQKk0yV21to4aOYJ2BEC9oGeVdV55JOeSRq1XoiH
         ETyOil/o56qiF884HitjQvbvPYxa/PJVT6/xg0FiyqwWwPVwdPoZfw4+n+mMESeCl1Vx
         pw9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533NOCDxJfkOZn+8QWPd7Pyy4+UDApYYXpJfvsOQBh96oi5f8eir
	ITFYq4xS7oaqYb5WD1o1hbc=
X-Google-Smtp-Source: ABdhPJz720jVXwqVUdwD9pVgZRb76348ACmw1ggCLk1G/CWCNC9TWWbch1+8EKTHgSj5HKx2HtoT3A==
X-Received: by 2002:a63:7c50:: with SMTP id l16mr7443064pgn.95.1641973211895;
        Tue, 11 Jan 2022 23:40:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:3595:: with SMTP id mm21ls3041449pjb.1.gmail; Tue,
 11 Jan 2022 23:40:11 -0800 (PST)
X-Received: by 2002:a17:902:a50a:b0:149:7aa8:37f6 with SMTP id s10-20020a170902a50a00b001497aa837f6mr8034571plq.91.1641973211197;
        Tue, 11 Jan 2022 23:40:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641973211; cv=pass;
        d=google.com; s=arc-20160816;
        b=noYKggg9XynJIjiCXFt8ffx/mCg3v9kRm6/4zk8ndjvpkqZ7h0sun4yGikt66ARjEO
         BpkqEsSx10Omhvd6K0cNUIRM0qaHk97GOpofcrFBPtx9Goy4fQsANg+3J9xa69eIeW+i
         9hlUhIv4ylmJDneVDPo7j04mQZDTThD3GovevJe6hiHK1wShxkXX+RjYU3cCFOLR2cB3
         i+W6sDqvaaywvIRZX16myOlpY7BvDv6iw7OSXm0tak3gTfaI8OkPCIUP7MVJzuaQtMMd
         NuN3RfrGdyGD3BR1L5Ge72ePcLnOq/2PQAYIWo8puT5HvwJkq5mxUFwG17RKG7ZxbXUo
         3Ylg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:user-agent
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=eYwf4H9G5219AEP3zfuqBXEzc8Bn3uIx593o7kRQyQw=;
        b=C23hElQHB4ots1Rxv2OsOimRep1JhIq1Iij/Ve8vQirO0cTPbGV9XuvHN84soQPQ5V
         lDSWRcllJEuTT0SG7cMwIv1Zsi9DB1HcI157EtzwXsVK/9ArcQC7yrV9HUT7UWAaNq7d
         nvO3Dc36E5RiqBRlJBw9hTvx79/HhTUyJzcqo0hqS9fBp3lPzJrTP9j/T5UtZuWfg4Us
         dW4K6PAmF1ioUZH0RiV36IzuuzK/MhHjmjYymbdaOZ6jO/IzCdp4YLfB4EBK8EkfmKX7
         Z4ZkIqMJqeXRJvES2MhYmKOxb/1RQkXZsvUxCP2JyBesGdDvQqjMJBadt78rl0GIiPYU
         OxKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="GXg/pSzV";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.63 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com. [40.107.20.63])
        by gmr-mx.google.com with ESMTPS id y3si503319plk.4.2022.01.11.23.40.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jan 2022 23:40:11 -0800 (PST)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.63 as permitted sender) client-ip=40.107.20.63;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX9dWjQGtNXb3FehIX3vz2/va9c9tykE+yzm2UjbWlZo4KvLm6q7hlpk8Xh+JubxVg9is6HlBp8m/alZvDekW2U8heM4f97Hw1Y5kN7ihIRDVnvKIF/mgvClQoxZe5ZPBgMN77pyZ/bJESRILTuwBr9iAmGDxYAN7BY8kWa5r53LF0ABFQ1qP6RVUrNLyLmRTFmLJTa0w0GUATKtARcNTh2F6eiT5DiA9QhS8yZBsMGNmZW2ycDeTwKiJDHtJ7NKvlv3523TOszTevxB3iswXjY0VnrbejjRpYss9ZxdY1mhrUxFp5gFFSOGleSnCHJlTZDXX8SAxEqTrOTzKJRjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYwf4H9G5219AEP3zfuqBXEzc8Bn3uIx593o7kRQyQw=;
 b=Vhg7z/UrlhUlXZ6BvoPEmDf/1K8CL5VvLNxPiawK9o6YxzyokF05e+q2B4yWKNQNh//y8N1wsOCsqrmH3J52K1VyuvDg800ofvBkzKrAhaupG0F5esLRfLYOzegYvmroTBmK/gdY5hKnOMiOQFGZk9MiPAmEzXxjqf2XreS7oU0HaBFWR1nx0lm54GllJkvWteROtBvphNtq73M7aIfj7SN0tXLIeFKulAt+b2ZL8niDWd5h1uBPudIalV6vwJ5DJuXQ/ucdZo/b3vrsDXG3HvFxNsUhUqbMGTUohqZo88KbDfPtYCyOebqpeoJzkNd0Unk7febjIVI+pKpZTE2M5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by DB8PR10MB3450.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 12 Jan
 2022 07:40:08 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0%4]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 07:40:08 +0000
From: "Bezdeka, Florian" <florian.bezdeka@siemens.com>
To: "peng.fan@nxp.com" <peng.fan@nxp.com>, "peng.fan@oss.nxp.com"
	<peng.fan@oss.nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, "jan.kiszka@siemens.com"
	<jan.kiszka@siemens.com>
Subject: Re: [PATCH] hypervisor: arm/arm64: fix build error
Thread-Topic: [PATCH] hypervisor: arm/arm64: fix build error
Thread-Index: AQHYB3wePvj9LTLhpECyf9AqjfG8Baxe7sEAgAAB/YCAAA+GgA==
Date: Wed, 12 Jan 2022 07:40:08 +0000
Message-ID: <115f149b84fcce90236cde99c1e3f2f11ec86307.camel@siemens.com>
References: <20220112065619.19432-1-peng.fan@oss.nxp.com>
	 <fc104832-1a03-5d06-f12f-dd34bdb2fe60@siemens.com>
	 <DU0PR04MB94175FA39632BC0AFEA908B088529@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94175FA39632BC0AFEA908B088529@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7eab106-daf6-44c9-1538-08d9d59ec21b
x-ms-traffictypediagnostic: DB8PR10MB3450:EE_
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-microsoft-antispam-prvs: <DB8PR10MB345012A3D28EAA17B742BB1EF6529@DB8PR10MB3450.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hkJ8MMlbnRyEOZ27U7TslKh7l1uDRVND1z/lLECCp8Z3L7fYNiwv/UPgjzu0YKl/nBAA0t0Ba2eYBPfbjsvFvLVgf69hovSZJ5QncIDKO0Uzh9u3bnwG0OIS+7fsh9DePyxKOFfTMBKz72OLWYxaNaqbgSHIm+w9oO6qtf7n1cZ8tMZYShhkBFtnA4H8Ab5Elt2RReaU9g/Q44FnOktHjh5oJKzRsE9vJw+6wYNZReelnj3rGMfmi0nSyr5YWQyw6VHa7wdnhSpoFceo8gO03PBPCnOR7OTOTJnNiqJBrb0vHKDDRju3dRmwtBj/GxGWzpL73vXQ26cH57caXsFHx+D6yg3qgDrALCu+uyNkJPkMIb/7XO19gRxc3GDnN81jCZdurckasuE3nFi/Qgr81Vkb4e6HvU2UrR3MNojCANaMqZyQ93uKZpRC9Lr7iIvEVzJFG+99Ub6vgGOUwp0L8COfTYpi+Hb7MlaXFmRwfH/D7LpqgiOt2OcLib+bzA7pJEM6nMr6U3pBWGOyOsS/2jgGsDk6z2y/fRJVDDigzNcw5qynTjEYrtcMkzGNJ2HePbtFPTjBX7eWu6AYecbioT5xFCRwzKb7/3jStPuT0odaV+3gjfvi0XoCDIBQwphNo6bcbD4IeksA2laEL6S4Mf+05JrMTgz4sgK1hDqsnP8VrhzqQh0F60qg5yA0G/+DB1P0G6w7+xhpozsmkqLNTVkKB2Ja5KPmVyEGROK5A7cI85uft0dT18gYNX8eJOKkZpZBbGtiLPlUl7C3NR67HHwhMt+lHMaNrUWyWceWazM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(6506007)(6636002)(8676002)(6512007)(186003)(6486002)(508600001)(8936002)(966005)(122000001)(38100700002)(66946007)(76116006)(110136005)(91956017)(64756008)(66446008)(66476007)(66556008)(5660300002)(2616005)(2906002)(38070700005)(316002)(86362001)(83380400001)(82960400001)(71200400001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEc5bDdSTWk3WXduM0lsSGxobzVNQ29LbEFWTENybXZrV3NpK1Y4M1d4aGFD?=
 =?utf-8?B?U3Y4dDlOcVJhdnVab0hNZDErY3o3TW5pUzcwWW9aY1pHZTNJSmFrVjZVN1NE?=
 =?utf-8?B?NFdiN2RIT3V0OUl2VTgzM0EzVHVyZE85NjVoN01pazhnRkVJRndhOFlhM2JK?=
 =?utf-8?B?WEppeXM2QzV5NTdYdUYxaEJVVjdYVGZmTmZXTWdSc3pVODcrQkljQjdXeVpB?=
 =?utf-8?B?YUlmOW9PR2FVV0NoZ3c3Y0JWZVBxdldjTWlCZEp6WDlScGlYTDF6SmlxbytD?=
 =?utf-8?B?M3VZbERYeEdVWDdFZ2xva1JnTGRYS28zL3NNYnBnTjY5QS9hS2VNYXRjRTRo?=
 =?utf-8?B?TThQU01SNTlhWWlJN2VMNEdKeTJSU0RDREhKK0VxOThsVmhta2tRSjdWR3dp?=
 =?utf-8?B?emFsbUNIVk9JQzdsL3F5NFpuMjFWZnNGYlVyNTZoSjMzUHNTUlRXNEgrck16?=
 =?utf-8?B?VWhGODVSOWNodDY3bGYrUi9zcnBwU0FQakVXcUtxN3BPS201U3UvVEZwUkF0?=
 =?utf-8?B?Y2NPN3pOMERqb2g3N21kUlJGZ001NUdDaEg0bkFHSDNqM1JtK0VpZVVZT2dF?=
 =?utf-8?B?SFFPbHRRVHZKbmNkTXhUalFSaUxsU1FkREZxYVg3QjVMZnZSMXJjV2daY0tt?=
 =?utf-8?B?Z3Mvb1hPYkFCOHdRaHhpYXdDL2tLQUJVeU1SdmZjNWdLT3ArYUsxem5LUlU2?=
 =?utf-8?B?R2FLM05leHhZOTlveTN4UTBTOE1OS3hnaytsK1ltOWM2SzZEa1lHRFJLZHlY?=
 =?utf-8?B?cGdEM1lGKzZOU1JNTk1uV1RKUnczZzdTZkY1TnNtVkdTVG9xcUVBTVBYaEs1?=
 =?utf-8?B?NzBUQkYwS3R1cXNuQTdoVlg0b0dBWTBGSm9HaWRUYUZzTFZ6djVHUlk1ZUZ0?=
 =?utf-8?B?SDRHYkQyditwU0REcnhVYXQxNGVoWkluNFgwYkVEWDBmSkNxNEFrWndGMVgy?=
 =?utf-8?B?QVYzeXh1NTVIUndyeWZHQmdiSUVGQVJKeTFCajdQSzlzTnA3Ykw4Y25JZWtT?=
 =?utf-8?B?R1pRbGNCaks1Z0NBZERvWHpZY2xiT1Y4d1crdGxpZ1JCSW9lMHhDQlhQSUs4?=
 =?utf-8?B?MFh2TjQ5Tlk2M2RCajBnSEd6djFzbGtvRHBSb2Yzak44RTFDeVl4Q21UYndE?=
 =?utf-8?B?bS9LbVN6UmVnRVhmYlltSVVMS3FZR3FzcmFQTVlJTkNDYzhKV2UzSFV5N3pD?=
 =?utf-8?B?U0FMWGxjcWg4VmsrNW0zSmpKYWdQSmkyTWhCVzQ0VFZ2cVMxYmk4TFJybSt3?=
 =?utf-8?B?Y1FHL1MzT1hvRFUwdUx2YU5XWks1UlJZbTE0V1JkdDdBL1labmE2RjZqYkl6?=
 =?utf-8?B?K1RMUjM1NEkwT3RiRjZTNkxidjBrd1I1WVBhOTE0OHFXVlk3OTd1R2d5ek1H?=
 =?utf-8?B?OWFnZlA5Z0hNRm1iNUZTOTc0SFNKRkdiMkl6RDhwYXlxVnA1OXBYMVZET1Bv?=
 =?utf-8?B?K2EzY01ncVpVOVlPd3htOG9vNS9xdFJpcDVXZ3VKclVwZmhGeE5hOXhXQmdJ?=
 =?utf-8?B?V0UvaU4ySDdUZTF1NlpaWnNUYzJNN281RHI1SUNjSEZpd0tYd3IzM1dMc3lQ?=
 =?utf-8?B?d1d6aGZoQmxCOXdFaWlDdFQzeDlaakpBdkJ3Zlg4YlRDL1NnM2tZMDRyMENG?=
 =?utf-8?B?NW1QVmhoNFJDb0wyUVhONHllYkpPTjNTV2wyZmZPblg3UlFkTHkzQnE4dklu?=
 =?utf-8?B?M0FDNDBTMEI4RmhNU3V1MGlPc0wvR0xvVzlMRVFCWWVZeTBwN2hzZGNjWEpt?=
 =?utf-8?B?TDFYMXZycmw3cEdyalVnS2FXam5NR094dG5KNFduV2YwQzdYMC82NTRLd1FJ?=
 =?utf-8?B?VVJTOVNUYjVoNzhGVFloV2FkbHRpeGhsOEpxOWRJZFQxOTl6cDI0Q2loN2I4?=
 =?utf-8?B?WWRWcFJtV2RzWmN6dGNsZDkyeHFicDNjUkdvVklnaXc1bnJ4OGI3WTd3ckl5?=
 =?utf-8?B?QmZWZndYTkwxVVhqeDdUejdqT3ZCSmo3TnR1ellWN1BRaDIyQ29ERG1ENXB1?=
 =?utf-8?B?SkZlWW1uMnAwNUUxZXEyWFNsY2svSkN1WklmZEc4MEo1YlVzTHF6Q0VGVnhX?=
 =?utf-8?B?YVJ5T09lNlcyR3ZJR2xYNzUzamNTdC9TTHE3b0svaGEzRll1Tm5qVVhLbW16?=
 =?utf-8?B?Ym0vNXVqckVNakR3V2psZ3g5MWU2V3EzWFRweSs2UHFVVzlKaTVDd1lrVEtK?=
 =?utf-8?B?UUJveFY5andMcGFvNldOTVI2RExUdEVBdkVTdWtYK3lETFVXZmdteGJCK3Jw?=
 =?utf-8?B?ckQ5NUpLclZIRWFkU1RuRjh4aXdSeFNJOEc0TWMyeHVRTmg1V3dDdlNoTTBV?=
 =?utf-8?B?ODFFRjFiaWxwb3A5dkgwcDNVaS90VmVtclNHMWg2SGdCNm5CRVNEcVRDdW1K?=
 =?utf-8?Q?2TXRDjJ2mhDzfgTU=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <B35158C10CF81449AB97F4332CC44775@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c7eab106-daf6-44c9-1538-08d9d59ec21b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 07:40:08.6802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jkXHkX4sJEJfX9DjjJuyUD/qo/njcXNS2440HLrbx3uvfTlncTmd3+G2UAxnuoUxkY/x9SY5YU6fJbEMAU79LXmAGdgOOlLRCnFxLwrRJeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3450
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="GXg/pSzV";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 florian.bezdeka@siemens.com designates 40.107.20.63 as permitted sender)
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

On Wed, 2022-01-12 at 06:44 +0000, Peng Fan wrote:
> > Subject: Re: [PATCH] hypervisor: arm/arm64: fix build error
> >=20
> > On 12.01.22 07:56, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >=20
> > > With gcc 5.15, met the following error
> >=20
> > Which gcc version (surely not "5.15") from which distro? I've tried
> > with
> > manually adding -Werror=3Darray-bounds to the build and using gcc-
> > 10.3.1, but
> > this message didn't trigger.
>=20
> I use NXP linux 5.15-honister, gcc version 11.2.0.
>=20
> >=20
> > >=20
> > > hypervisor/arch/arm64/control.c:33:9:
> > > error: =E2=80=98memset=E2=80=99 offset [0, 255] is out of the bounds =
[0, 0]
> > [-Werror=3Darray-bounds]
> > > =C2=A0=C2=A0=C2=A0=C2=A033 |         memset(&this_cpu_data()->guest_r=
egs, 0,
> > > sizeof(union
> > registers));
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ~~
> > > cc1: all warnings being treated as errors
> > >=20
> > > Fix this by use a volatile pointer to keep GCC from determining
> > > its
> > > value
> > >=20
> >=20
> > Do we something wrong here, or did the kernel, e.g., had to work
> > around such
> > issues as well? The workaround looks a bit odd.
>=20
> It is gcc try to determining the array value, but I am not sure why
> it not.
> This patch is to let gcc not determine the array value to avoid
> build break.

This sounds like [1], another gcc 11.x issue with kernel / Jailhouse
sources. I had the same problem for x86 some time ago. Not sure if
there are kernel workarounds for that.

The bug was marked as duplicate of [2], which is the kernel issue.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100834
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99578

>=20
> Regards,
> Peng.
>=20
> >=20
> > Jan
> >=20
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > > =C2=A0=C2=A0hypervisor/arch/arm/control.c   | 3 ++-
> > > =C2=A0=C2=A0hypervisor/arch/arm64/control.c | 3 ++-
> > > =C2=A0=C2=A02 files changed, 4 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/hypervisor/arch/arm/control.c
> > > b/hypervisor/arch/arm/control.c index 46125e1a..c9c93982 100644
> > > --- a/hypervisor/arch/arm/control.c
> > > +++ b/hypervisor/arch/arm/control.c
> > > @@ -23,9 +23,10 @@
> > > =C2=A0=C2=A0void arm_cpu_reset(unsigned long pc, bool aarch32)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	u32 sctlr;
> > > +	union registers * volatile guest_regs =3D
> > > +&this_cpu_data()->guest_regs;
> > >=20
> > > =C2=A0=C2=A0	/* Wipe all banked and usr regs */
> > > -	memset(&this_cpu_data()->guest_regs, 0, sizeof(union
> > > registers));
> > > +	memset(guest_regs, 0, sizeof(union registers));
> > >=20
> > > =C2=A0=C2=A0	arm_write_banked_reg(SP_usr, 0);
> > > =C2=A0=C2=A0	arm_write_banked_reg(SP_svc, 0);
> > > diff --git a/hypervisor/arch/arm64/control.c
> > > b/hypervisor/arch/arm64/control.c index 5b41b393..2c33c5f7 100644
> > > --- a/hypervisor/arch/arm64/control.c
> > > +++ b/hypervisor/arch/arm64/control.c
> > > @@ -22,6 +22,7 @@ void arm_cpu_reset(unsigned long pc, bool
> > > aarch32)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	u64 hcr_el2;
> > > =C2=A0=C2=A0	u64 fpexc32_el2;
> > > +	union registers * volatile guest_regs =3D
> > > +&this_cpu_data()->guest_regs;
> > >=20
> > > =C2=A0=C2=A0	/* put the cpu in a reset state */
> > > =C2=A0=C2=A0	/* AARCH64_TODO: handle big endian support */ @@ -30,7
> > > +31,7
> > @@
> > > void arm_cpu_reset(unsigned long pc, bool aarch32)
> > > =C2=A0=C2=A0	arm_write_sysreg(PMCR_EL0, 0);
> > >=20
> > > =C2=A0=C2=A0	/* wipe any other state to avoid leaking information
> > > accross cells */
> > > -	memset(&this_cpu_data()->guest_regs, 0, sizeof(union
> > > registers));
> > > +	memset(guest_regs, 0, sizeof(union registers));
> > >=20
> > > =C2=A0=C2=A0	/* AARCH64_TODO: wipe floating point registers */
> > >=20
> >=20
> > --
> > Siemens AG, Technology
> > Competence Center Embedded Linux
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/115f149b84fcce90236cde99c1e3f2f11ec86307.camel%40siemens.com.
