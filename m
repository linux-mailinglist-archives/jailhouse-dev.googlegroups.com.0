Return-Path: <jailhouse-dev+bncBDGILGE54ELBBU6J2KCQMGQE6IITRYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC239579B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 10:56:52 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id b28-20020a056512061cb02902aeab39c9b6sf3711766lfe.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 01:56:52 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1622451412; cv=pass;
        d=google.com; s=arc-20160816;
        b=tUGteWiEeoc1gpHs44nV3BWvTjk4wWZizSkJlQCdiNy+75527f4vZw7boJw2umNNE9
         R1EEZ2wlu/lImzefgMGh3VP+ShLPvl4yM2QDDGjiA+KNsfs8N2VDyVpEWN2aZ9bF+Bg9
         8KA3jzTzFkrrs3m8QqvI/LiB8j5XtaLNLKY6ahyNx54E1APG2k73eTCui4OjLNWf6KFq
         iC516ry51c0wdcS6t7qF0fOM2dZz78629GX2pkmDlFRQku2mJsfqOcWzOIJpv+aSeNny
         DnXsQzQbrMwf45WT9hKtNP+/mhXKDhlDqpPv+zhICI5LfbpxVL+MtvV4n85m3BOneGFx
         DWjg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=73nlh0dbTomUFIDF6QKha4x6ZDDkP4CIM92yJVRyxRU=;
        b=C00NC3AA/PbMHp6WVx+8UPq8cMxtLntjzndTizDBjGqHWHZASbyD2uhj/S25DWdzBn
         tqbsUOyjXZoYQ41aLoXqDTZeFfeZz/IS419jkyTuCMLgqPFDBW/877wVxCnRykvM4JbB
         Dfw8C0rIZTq2Lx+MFlpF+FogJv2WQwpXun3ug8Tz4ge4p/Ey07eDCyqKo9dPwU9+vq96
         NccysJmHzSk+ruXD2CLHFIU8C2HxAF+6Hec9/PqJ8aTlnxIO3lfhkeZzRZBBMj3BXP86
         wWkLTIKRcRmgishV/r9pe3WpZxNfh0PsrIxE7txroulYdWYEfwQcrji17HJrEc4YC3FE
         X1GA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=TedQnERm;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.20.111 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=73nlh0dbTomUFIDF6QKha4x6ZDDkP4CIM92yJVRyxRU=;
        b=UL2TGGToZauC/SqBx/Z782L0EUb/eg749eEA7FlQoreZjdGN6CMLZyAMj7ZOtLvVEg
         ovWxbe1EBPoqq2SNm96fGwXP0K6qe8/nGn/We9vf+xG29cNlCiaub1V4g/7PwY0lUi+I
         q7xV93E1/zDoArlrBSwyGfEE8pWddqoxRnsRGNPHV1P8v+7JQ6fCc+0CKcKC4GajWlGn
         4aKgF3J9bW2/w7/ePs5ktIypgC2iuXMiu+hIqLmFNbO2GTDODBOnKblVIpq1BaFepzeK
         QBAgI5kKT6+sWJgTLv1kUjBAmvIQGPkE0BvzgRBK77A6MqUAB6dDyD/hcupKFpnF2+mP
         mb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=73nlh0dbTomUFIDF6QKha4x6ZDDkP4CIM92yJVRyxRU=;
        b=QqXaTJ6rEgjSdimxS+NeUPF5TP0JFWgQxPJZOVIqhFgSyzVfzctKShqBQrIUcPq2Ol
         sTs2cJZtME1mc9w7oHM6q5FJUtwFxnLDbC56S/GeLVkLGawdwieENVDWKsTQgTvGc1HE
         OVjezkkDVqZTEbPGxNe4UWnxWmnQcKYR6NHUE0tp3WzOnjwLpkFJMqmQgG9ODS7erfOl
         Cec/qUD8CJvURWh3jVJNEdtsNjyQ3svoBGmgVyc11+ii/5xApqqtDxw2GrnY/UCIWNBZ
         JkfTy2hdPSu/48uvpxT2fKH0ATevVBc8cTByJRdPtlstwRdf+VK21rBvZsaHZtE7YX7v
         VZYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328hRg+PqUmllfe735u2gYrL6iWLlIFiGsoJLJHwj3q97XVqgcV
	7ncYEi0/flnwKHsGDwGUYr0=
X-Google-Smtp-Source: ABdhPJyDQ06ZZ09CxYg1DooiAYN/Z3L/CS32kyCUa9fFZFJpaJHpAC1bOWsaWLqzKoYhiZF28Y5YDg==
X-Received: by 2002:a2e:3506:: with SMTP id z6mr614324ljz.238.1622451412106;
        Mon, 31 May 2021 01:56:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:701a:: with SMTP id h26ls6694284lfc.3.gmail; Mon, 31 May
 2021 01:56:51 -0700 (PDT)
X-Received: by 2002:a19:c102:: with SMTP id r2mr6402778lff.211.1622451411071;
        Mon, 31 May 2021 01:56:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622451411; cv=pass;
        d=google.com; s=arc-20160816;
        b=UGP+K/6C6c6gHAaFVoopTvkp5biZipmSnSn/smrlV7OsWy4Re9N/5KNj9ctqS0L4K5
         Svu99uPpQFN8RVT9W2Z7Fh7z5u7iMpgXRkG2yDy645OZTPyZHWwxu8PotpVcLHtoAGdI
         +pJQKBwmqCP3TXTrfEV6HT5QG4jn8DExjjeP4YDh5QFOkp/kHZ8NjCxltmGKlr8LKFo3
         +VN0vlHoQomyEu99f38+5NkZZJSDNLTweY4S4vJJnkkRIDrI+nig951N389s5CfadwJI
         SYCfz+cvULlpJVqgEmEsfDtMNCsu8y2FqnJwyOgdRXEtOM2xtzWRyE2BYPPZVs3upaYs
         HFcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=XkJIm0UO4QeL0gjRJHb5rorYdrstBgHJ7VGqu18CTsM=;
        b=rRxVXsEUiyCSiwBvG8oRs+P9hNYJdz0ZTzJAeq4mLziPtrCxsJRD7/xCtUGvVnabD6
         kXMwQzHPnKDSsbpgnisVQDOhHFRVrGmTsqJZ4zuRY9zZ/IWDewsAbhM7WLEjRpIOGSmx
         Y7n8XBaAHYy5df0eVWKu4lTPWVR+TLFeOgSJm4GkP4y42kbZvOFwQmIRxQWNbJi+P87o
         MGlPcEUF4wXlOC4sT81ZgD738S46zg6EGvJPw7nU9Q0+MVA7MDldw3hNkAu6+OGq1dMK
         CMuwfGXi0pc3F3wYu3s42B8dONBHGWeFVisAaAcxC5WEof384w9UJJAj6cI/i/lJxCKV
         8WIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=TedQnERm;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.20.111 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2111.outbound.protection.outlook.com. [40.107.20.111])
        by gmr-mx.google.com with ESMTPS id o13si455092ljp.0.2021.05.31.01.56.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 May 2021 01:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.20.111 as permitted sender) client-ip=40.107.20.111;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGgBRFF46ft2WGhb/DOx3oL2BF4Lat9wN0vAMvdAzgTKaT0mXgcfE/BQJO9da56ovzktbqCN7vZmIhLNGBCJNXrvmPIOdDSKWfQ4AY8+YU70qyh8hxKiRZYc9SJ6UR1CfFbZeotHp9cPsDFo/10MokRux89NQV67SXkyTHG7ipfPDdO8Wkc/bpKI+k6Ml8oRCycLJQhzhwgPmozDJNrhDqNmbBqQl4PKQQR7kWKxDbfMBOnqopO95al6QjK3JGBX3ssKQq8X4cdrWkHSuELcG/Fc0CBmvbMfxrjtUdQs+ad87BjGxjr9xBYvJywabdzeH0hVY7xLQt1bFL6eslpCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkJIm0UO4QeL0gjRJHb5rorYdrstBgHJ7VGqu18CTsM=;
 b=BU8r7NrcyKNtAUkAO12nGqSsi6rBgRrMKUt3c6h80rZlXbGItJXTSJ4vCh/lT9z5/eZTL7Bw3jWuhQDEUaU/cvfUs9D5suqAtXEzTQev7zZBVqE0ud8QkjvWYxusdfxvYkrWoEfv2Op/zv7Q+KmIDD4g5TiXfd2rT/9mfWPL9GxZd00696n8I1QGcSHkQUCSb+MOdCHAvtmKQJWmrQ/E6tfILG8kPnBcT9cPlsajSRG/By7ma12vTii4KyjPclTfM4ScFOMNx9Kx8M6Btwy+2TjpyeJq3o4MquRA0t2kZvzYeAhRNCxsYY7jm7+LIlh7Xq7vWdmEiIIZEcWAxnmTXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR0202MB3398.eurprd02.prod.outlook.com (2603:10a6:209:1b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 08:56:48 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151%3]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 08:56:48 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Kannan Sivaraman <kannan@cimware.in>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: Error when building jailhouse on debian - arm64
Thread-Topic: Error when building jailhouse on debian - arm64
Thread-Index: AQHXU4F8bKEtM9fzi0izjtoYzF7hEKr9DdAAgAAnO6CAABcDAIAAAEKg
Date: Mon, 31 May 2021 08:56:47 +0000
Message-ID: <AS8PR02MB6663BD01555BA83E0F4243A6B63F9@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <CALeLWRiLpL3v0c5BDkmNFeObjfqs83MU8L4_4US=BygPkHMnPA@mail.gmail.com>
 <CALeLWRiU3q5Ubd3NZepHK_yeVYkicU7AejgCXpwf8MMdHrue9Q@mail.gmail.com>
 <PA4PR02MB6670AFAD2B49D463C676F1D5B63F9@PA4PR02MB6670.eurprd02.prod.outlook.com>
 <CALeLWRixvLSaFDH1tmwR1On=NZEc3gYhBDvmN7N-npHNmD4vrg@mail.gmail.com>
In-Reply-To: <CALeLWRixvLSaFDH1tmwR1On=NZEc3gYhBDvmN7N-npHNmD4vrg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.65.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbfb7a74-5e58-4ea0-dc36-08d924120649
x-ms-traffictypediagnostic: AM6PR0202MB3398:
x-microsoft-antispam-prvs: <AM6PR0202MB3398A5B9913F33B5677887A5B63F9@AM6PR0202MB3398.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FYAcTcHKArHurVQzGNs1xf/YK8iUjRLqBLrxsNNPM57aH8CSbTImyJ2wnG9zIo2UrWH4VScAkuzzeT4QaRtxf+e0wUjP/wc7bq3F1Yf4e5HpsPFYUwP1kBD2S6ZRuy7h2e7CguiClLvXqFO4Tk9TZAQ+DnvqQ78uAxaiUshANp6azeC7KyxqRAcdRfneKJyg1ASqH78YVCw6ABwu9+Po65oKObVKu3+9CFh3hQpZzf85cs8UJGRMpiYSUCPi2DiwBvn1H04tUmImNcKdc7KKNY3H3kVaXqjxReSoGNqfTOdlNvs1fDN6VpWtWN6WKBD3lSXUTmMK9wkjepTEGe2l4fTOuE51fE7dV9KjCCeqvRhqDaiPaV3qlNbPRBB97RepKeQ3l1VJzr/EMOL1tdcWsKInlcZfu306T68huLWnn2mCxAkLHCZ5hRTM87NItNi9sWwCDSNX7hbZjQ80uxZLuVdJb4h8fe+TmUptB4Vd+j56/drM4K5sSZ+ji2mnCVUexlL+jW7fkUXYhRTZto9JYYDIxmCToBiUO0vm6HOGCtkODlJPlrIvZLZ2er19qX1emrDrggNCqdjjXFlw8KNT1gCIgHpXp+9gl6JDn/P8ZjhnNPmxSJI1Q8uQ5tdX+v7J7fkkjOxA56yrvEPIYCbboccF8NNQuVf1pKqn/86kpvZwSSTni7gdf2YmSSxbJDU1HGwVt2Gu6YUXaZOvW2LUQ7ITdfb8+K6uRXbSBAV6gWU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39850400004)(396003)(4326008)(55016002)(6916009)(8936002)(8676002)(83380400001)(71200400001)(478600001)(966005)(2906002)(44832011)(9686003)(66946007)(76116006)(38100700002)(66556008)(66476007)(122000001)(66446008)(5660300002)(33656002)(316002)(26005)(52536014)(7696005)(186003)(86362001)(64756008)(53546011)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0ZCK3Z1OFR4bk8wODErQkQwRWZOcTdUT05ZN1lDWkkxbWdaaUJMUzlmR0RN?=
 =?utf-8?B?YUJTWkg4dTJWbkhHeGJXUVZ3eWxTc2NoNG5XMlE5cmlaRFZ1emdhYVRqMFVM?=
 =?utf-8?B?aVAwSFF6c3pQMnFqYlE0M2FYcG5BcXhHV0MvT0xFRDM5aVNXWGh0WWVIQ01u?=
 =?utf-8?B?UUZhSVlYV3dmU3NyN2w5aWtZK3Z0dzNPZFA1OG45WGhENk8zUVRxcWFPcFpl?=
 =?utf-8?B?M3lITzJyNnludVBiakYvdDRIU0pqZlI2WmFLeDhFNktjaUVZNDNMS1QvWTlj?=
 =?utf-8?B?RDFXeEtYVERKTDdpaEVOb0dTaWQ4MVg0bkZ4eUdMSTlWNWRnWWd3RlU5aVRV?=
 =?utf-8?B?VHRWWlQ0blozSHV5NW5td05OeFE0MHl6NkZoblRudHBRaWN6YjRzaHh5V3Z3?=
 =?utf-8?B?ZlAxTFQ3ZGxjMndsUEVmOTVTYUhkVGxabTcwK1NJQ2JkOFNiMVpsaURqVHQw?=
 =?utf-8?B?QTdWeTN6VVA1T3dXOFRtTUxOdmxXckpQc2M5dTlhTXR5U2ZVLzhaeWw0TURW?=
 =?utf-8?B?WkVuSlMvbUtZdzkvek9VTFpTMW56Y0d4TTlIazNWLytic0p6aWdOd1B2MXh1?=
 =?utf-8?B?L0h6dmVqVmNzYkxMWDZyNHNXUXEzb2k4M0tZN0c1cjVjdHd5TFRVbUl2bXNx?=
 =?utf-8?B?c2ZKNS9xYjF6ZytEODdzY2drTlZTeVptMjBTY0pzQkxiUENGYUw1SmcxVjU3?=
 =?utf-8?B?R0lBcUs4cHFqMmdjMzJoSHVmRjZXS2hxaGhLeHVGdE1EcWpRdWRCU01rRXNF?=
 =?utf-8?B?dCtzMHBOU2NhdU9YaEQyMEdYVFdHYURUb2s2WnZnZi9kQ3NKSUs3KzhSMGlt?=
 =?utf-8?B?TGZJTld5TDZYN2ZuQlhoRWRnWFdqMkZtQ1FYNDIxVXZwZStabXlHR0RtVXNG?=
 =?utf-8?B?RHpTUUd6ODNOY2hNVnBRMWd1MU9CNVBRSWpkd3J1c3JIU2ZlTU1qV1A2SUEw?=
 =?utf-8?B?aVhXSUxZS1dwTDZOeGhwY1dabHR3dG8rQlNudUJzdll5b3N4MmZJS3d6NjJs?=
 =?utf-8?B?TFNhNThmbms4T3F1TTVoT2gvaXE4dEJtUXRKWjVUZmtLMi9hbTY1UlkrdFlu?=
 =?utf-8?B?RE1lZ1MwVjk2dVNhZjZhbkFIc09wLzl2ank2Z0h1UlNVSngwYUxUbWhad215?=
 =?utf-8?B?RG5wSCtpWDRLK3Z2MkxiUG95NWNVdmNwYk1pNVpwVEp1RzdPZm5YL3M4R2hH?=
 =?utf-8?B?RzBjM1ludE84dnJBRkJwWEo3bllsTDR0Y2xnNStwSVl2WHg0TkZrRDVyOWlI?=
 =?utf-8?B?VW9EZ0pCUnVGU01URTNJZXBiZ2ljdFFYV3N6WWVnUUpaMVpZU1BlVFNFMjk0?=
 =?utf-8?Q?3FHnWlurpI?=
x-ms-exchange-antispam-messagedata-1: aDWoEE0MKQLMx/xWQ5PYkl/D+XiSKlXIjIBSt4mRXbtl3bzCbokTG77A4IJn7/OsBq8x228T8U/WXc1UmzK+sFR5n8hPkO6P+11aPZ0KxMg8RlRMcsa3kpzrorc/dCJ+R+ypx37dIJKOLaADX/KWexhhTDsKGe5T9JssPMww5njFeZ7u7c4ByznzKiAHSNNpmhF+jaSflvMw+tC3pZncpec52c2yw7rAlbytW5vbG6KZKfxJQ+8YBVBi/shY/xYA1PQJi/THMjsDy3wieWlyjDqZFU9pRT/LLRiJyAFiYsYx9bcLNUwIlPVO/GRmsvVjj7itkI12m+RAQsB0VGRqSjQJ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfb7a74-5e58-4ea0-dc36-08d924120649
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 08:56:48.1199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CEC696aRE4myi4AkeP0u7zQQ8GQLYUayROtJ8Xf4GXOKr0K3Ka6gXGMnyVcDKpcgsvhtjMsxQzOehjBIbSKTgM76TkcsHWrzgxy73q7uZklSDX8z+vRnSgNy5R2hrhS3lrp6wTWSCLYjCbgZ2jpUVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3398
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=TedQnERm;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.20.111 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Dear Kannan, 

Please avoid top-posting on the mailing lists, and write your remarks in-line.

>Thanks for the response.  
>
>How do i check for the device tree compiler?  Can I install one? Where to find the DTC.

With some googling, you should be able to get going here. We can best help you
with Jailhouse-specific issues. 

See e.g. the first hit: https://community.arm.com/developer/tools-software/oss-platforms/w/docs/525/device-tree

Best regards, Bram

>
>Regards,
>Kannan
>
>On Mon, May 31, 2021 at 1:00 PM Bram Hooimeijer <mailto:bram.hooimeijer@prodrive-technologies.com> wrote:
>> Hi,
>>    Can anyone help me with this issue.
>>
>> Thanks
>> Kannan
>>
>> On Fri, May 28, 2021 at 10:52 AM Kannan Sivaraman <mailto:mailto:kannan@cimware.in> wrote:
>> Good morning,
>> I get the following error when building on Debian Linux - arm64 platform.
>>
>> Can someone help with this?
>>
>> make[5]: *** No rule to make target '/home/parallels/jh/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb', needed by '__build'.  Stop.
>
>I haven't used the Arm version of Jailhouse a lot, but as far as I know, these
>.dtb files (device tree blobs) are generated from the device tree source files
>(.dts) in the same directory. Do you have the device tree compiler (dtc)
>installed?
>
>Best regards, Bram
>
>> make[4]: *** [/usr/src/linux-headers-4.19.0-14-common/scripts/Makefile.build:549: /home/parallels/jh/jailhouse/configs] Error 2
>> make[3]: *** [/usr/src/linux-headers-4.19.0-14-common/Makefile:1568: _module_/home/parallels/jh/jailhouse] Error 2
>> make[2]: *** [Makefile:146: sub-make] Error 2
>> make[1]: *** [Makefile:8: all] Error 2
>> make: *** [Makefile:40: modules] Error 2
>>
>> thanks,
>> Kannan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663BD01555BA83E0F4243A6B63F9%40AS8PR02MB6663.eurprd02.prod.outlook.com.
