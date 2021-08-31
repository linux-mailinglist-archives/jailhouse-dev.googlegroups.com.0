Return-Path: <jailhouse-dev+bncBDBIZ3EL3UDRB2GZW6EQMGQEDGBEKEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A43FC443
	for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Aug 2021 10:48:40 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id ch11-20020a0564021bcb00b003c8021b61c4sf543695edb.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Aug 2021 01:48:40 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1630399720; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ya/5ofnT6N02/xkvHXqEld2tRvi5sNV1mDCSQMCatbAo9nR5Ax3+kmOEyb/Y1Q4BRm
         U4bkOfySR5WehJWfSx3cMbkfTxfFMxOb2FLYp/RD7XraDcFD0EkAFfbcR/oUf7SG0tg/
         QpO+K6diLbLgxGxTye2Ryo56AcX8m/rDP9y6JHzg/7DrR6CD9LNVMQ6OsAuH+kZ9Wd3B
         CFogNDHSgQ3HpSdsajK33E9LYIgH99bXEOgfuQ5cHcxaU7ENO/oCEFw+Q1tBmBwhPQqd
         DvzBHp1jWFjn+eCAtHoIMFlbs4HaeyLWQi19GGVZBlYM2l40O6Tbp2DfjjI0hmKRcMl1
         /0SQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=21S4ES9vDebVrvPrYkxvCqXWWOqCj1XWKqOXgTY1Aus=;
        b=Zgq2CbnypBLBbQb127UFXpq9NprddZdQQS2HnZf4VTuWhAYOoMp8mJppjkSloVj1UI
         AfZztup3jHTYR1LPkcBZ/sTYN3adUB4UYIHpdMVEQL3/A46/ccgHrdj4yWOJ7R7NhHXB
         7EGGMKAN44lcV82HcsKPv5ueglh+b90zN5uljTAvrfCABSmyKHBCUSjr7gRcIKLicvzQ
         nN+kVd8XSUpwf0D3OAlwXsF3NPe0jr3mE7761aMB1SXzWVMiJ+ZruID3Vysq9e3RnmrS
         rMrOx380h79CTdWRPmVnmmHn1Go75rme2Bek9dCnjAbfvo/mbZ0sVnjTqdBde8mcB0mb
         DZuA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sFBIOU7U;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.14.55 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=21S4ES9vDebVrvPrYkxvCqXWWOqCj1XWKqOXgTY1Aus=;
        b=egWj7xh9Jtod9s9eSyRECB+B7vtBEbBBkeW8MMHiHv5SjzrS2+d91c75ao9xMnz3Qt
         pSMEd8gueMLVLGBnritDNcFw+4pTw+u91rD2NtW44+6pbKCChLdbryRBL7s0lEF3Wuo6
         6sg16gypGwlX02CjWeAeaOImWICZz/t4hYaRNavpNkY7jr8MG6HsPaHZQMLwEK1YVApc
         v8UOVhkUuUV32aKBdR9uVFZ1Zo7FhDkrYV7pImmAjwLsh0tOPMOdUiuEaNSkxFdhXAsp
         LWh2PB2T1M36pJHyRQUnpx2nEGLefGq8ddSl3cWf1bfXW7lTFENgyPjJngBkN9SljLy9
         ZgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=21S4ES9vDebVrvPrYkxvCqXWWOqCj1XWKqOXgTY1Aus=;
        b=E79tXo5lOec82hkALFIcwPREsyRPe9DIuN9HWgGXiVa/Crj46KGZsTX0qKKAbfyAoV
         S9zeHQuFF2R+Wxr1YDEFaB+NKE5V7X5qmrA65gyutYdXtJuwEmJ400SnntcDfOsfYzOH
         /TAHcnVuM/e+1xyN8DP4ypMLyntzcqzY9FERU/vJ4PrVFZUygUEw5pPGiVmOpwnHqiqR
         IVxQKTRR/P0fSPwUotrFsjd9/lwGLEWbS68tC/WWJed5ue19X0MgIWjqIXZWaK+yOW4f
         EdXStyUmJOMYIL34jKben6FFSgwLbFNWKv7lSzutOl94sL/EimerAQ38OQ46JePwA4sj
         krTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530h1RlR6qBB7W1DQ4vljBVY+b9vcGzgGGr4Ixj+VQB3KB0OUz01
	nO7XbjUQ8phU/b83MvArTz0=
X-Google-Smtp-Source: ABdhPJxJSN1xSWGeErcmTiwdPb3UtDzz4XWeZqdW9qcsR7vF1D1esPcBU0xztE4IeHVfYDbNsoxy0Q==
X-Received: by 2002:a17:906:9747:: with SMTP id o7mr29747538ejy.486.1630399720476;
        Tue, 31 Aug 2021 01:48:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bb62:: with SMTP id y89ls9692590ede.2.gmail; Tue, 31 Aug
 2021 01:48:39 -0700 (PDT)
X-Received: by 2002:a05:6402:17d6:: with SMTP id s22mr28883605edy.185.1630399719363;
        Tue, 31 Aug 2021 01:48:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630399719; cv=pass;
        d=google.com; s=arc-20160816;
        b=DorYoX3LJ0sMUpGhl+cw+h58dOxU+s/tld/za3UB7eRJ679x7/Wl9DJQaNZrWlZqHL
         pU7GmMhdTADLxbaJmXFg5w1hHISJc6VEnxqmO7Cgf0OjsHIxmdh9NXayoC3rmqNESnr7
         8A6fijMmdnhnP4/Dvy1KuaZqaqIicvAb0Q3/7/SkD240QnV7Nxxr9FaBgnDHxfxDLj6G
         O/QMXeFZStqcQICOQdEk9wttvEABdcgBdhpyrrBDhqXdFFhuGotPLRMVoMK9EY2fSE92
         qTAo6NtywsHMB0OeZ09gFvQQL4ndVF34cIgu+pbgN67g7EDoozD8nLP8HlQUWIla4/Lj
         R1IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=eEUU5JDM9qbFxLytMKX/2RIG/11pOmJ5C+LHXMPEuZI=;
        b=YfQQ0LwxCTa1s5ASOzlSG7zds8483/Jk+B3RwvqF7BqCRKuT5ip96Y+ee111tvatUK
         iSpyztabdR+8FT9AbzqGP30+w94DpGvidQzqn8+N2uGQaQlubwp7gs30RI6rnYdIsnPd
         L4l+CPc90Q9EcTT9oz273M6HRG0+kA5gPbc7ygza4Xk1pbLUCgrOVpenTgUoa6PgNcPn
         laeESeJ02e16CBddr6XVZkOEFIQ2f3XyT5WCtAWjaizkTKeWY5vxkTYlOGV/Vk2xJXMH
         CNqiJl9R04hm7BrLKYsxFDP+JeJaEgCHTJ5jZxZPbS06XBO7x84sWQsdOtRc2xq/6vQQ
         AU1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=sFBIOU7U;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.14.55 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140055.outbound.protection.outlook.com. [40.107.14.55])
        by gmr-mx.google.com with ESMTPS id qb19si514209ejc.0.2021.08.31.01.48.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 01:48:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.14.55 as permitted sender) client-ip=40.107.14.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqYh4HPDtczCZBDe8wPYndUy78Zu/QuVc4NkS9STcqkSeb3LaXHNPsT2hj8T1D1gxK5WHXyTPE+ozyHE1kRDriXk//5Y3HgGFQ1J0HmAfkusfTjOzRSqOXenKx/bWzwy7kOatOO0Cqj52NJUp+8CWrg7JViVxFMPTVE5pqBkgB+MLYz2uyI3FryrYm0slfcZTpSx9vJpUKrheypZOqLt4+Pc12xub+uOLpolcC5Rzz1fWbMqFawKM6rjtJLvAlrvpBuWM9oLkgVTtOaLPhNPGecN0B7kRFeByYNnIF/dOxX6YslthqUXckpnq6vH131+zUkCeS8e4sP/SHm7sMh7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEUU5JDM9qbFxLytMKX/2RIG/11pOmJ5C+LHXMPEuZI=;
 b=NTnWUvELDmJzoWt0SWT/7sLPjRxTY8wBrZGqWlWhy437mCU0dTSHLp5yMxtSAhLRxR4D6ZwIFHRHPm6zRs5kkcFp4vSNVIljyBZ3UeOP3xgD4OuXm+NyuxG/iwLYSx9ZEN9MkoTr3EOhnlI8qHqQcnoqgEQ5ceKNaA0DZTD/BxYH6/hugbX/ujxFs5LJq8y+eM1JRXcIZJpPg5mBeaV0XdzXIul60+228/H2SnRc3a8i9aQEtDdBYoyoaWGk1iSZq8ObUHadIH6SwGL/cM5VNjDSXPuzxhvV23Agu+SRLNnRZ8WkLnjocnuFv1OBAQQLm+f6vjZafpoZDsON1FWWKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR0401MB2537.eurprd04.prod.outlook.com (2603:10a6:3:83::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 08:48:37 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 08:48:37 +0000
From: "Z.Q. Hou" <zhiqiang.hou@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Jiafei Pan <jiafei.pan@nxp.com>, Rui Sousa <rui.sousa@nxp.com>
Subject: RE: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Topic: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Index: AQHXmxbhYfr68tdfjkGRS5idFHzolauG+uuAgAAZduCABHlagIAAUF/ggAAZuwCAARBj4IAAMEqAgAAWFqA=
Date: Tue, 31 Aug 2021 08:48:37 +0000
Message-ID: <HE1PR0402MB337106827ECC0CE4ED356C1784CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
References: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
 <2d3cfe41-3c51-34f8-8130-f6b86720d835@siemens.com>
 <HE1PR0402MB337191DE611BA6CC480C104D84CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <dd785b10-ac8d-f483-7483-f8830ed6147f@siemens.com>
 <HE1PR0402MB3371C1CDCCD9EA8CC8938FC684CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <9ecc5d87-c7b4-ce84-6621-f88cf05fbeff@siemens.com>
 <HE1PR0402MB337140548025A20E651BB4AA84CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <4d107c19-ba44-c5db-9452-1552e0b66c93@siemens.com>
In-Reply-To: <4d107c19-ba44-c5db-9452-1552e0b66c93@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b38b5f4f-ab08-41b1-7566-08d96c5c1fa4
x-ms-traffictypediagnostic: HE1PR0401MB2537:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0401MB2537804C89BB2A6B38666D1784CC9@HE1PR0401MB2537.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0XXqiCtCkYL107otHY+GiLs3kZTm4U1EcUdWYIxdLm7Z00cl6ceG2BL+VnnTuaEWGQJQIGFhfVnQpaK3T9ydFMn9cYD2fvDO0ZoMVmv79F1FdMAMtPbbdyeXCOa+faoKBuUWwa5R9+SnF6L3woz1v+i0Xpa1BKTMv5eOgotfWYl4oqTo87WsBkCGPb1ozUmuqhtPS52bYKn1slPoyEtXxIUZicg/OmAZMeH8TtK3/YQaz/AnEMg7YE+vylveEGbiRWPmaGzWAyxeRySAdsimTilzZ8HH0lzt403Lpd+hZZcdpTbq6i83ZfXlB9Y8SJigaEyenw9s0yu7Ul9/jr227AocRBeXfBjSnZBzv9RbQ0Ps18v4PHfNJQqixv/TScWRHdGv2Aog1GWBUefuOE998uuwQCaQuDbfHrEDZpjohoDknJuXyhylSmZ9SBgHMCc1wzEKlqLSApstf9yfgw+JJrHCYCXIcMYG+C1s5b0dvky+t6SQyrH9joLNM8fBQQ1xxHaSyG6bk7hIeVSPJpurEqy0oo4K44C2BvsbYkC4K4c9PwAN9nBQ8RNJ4QjCOdyuKKLeyvwgKpZwDlVF7Q2VxOiOEbyTuJqgCQhMb85NRc5C1/l68QWFvvsMlSeJuOmwZ3ouDTqHiKSz+tgt8sHnUvKmDW4il4eRshZE28DrF6+T6iU6LEv3e4HRsyU33LPU19JURBEeJwSTWrksYjxZ0w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3371.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(84040400005)(52536014)(38070700005)(71200400001)(186003)(9686003)(122000001)(2906002)(38100700002)(33656002)(7696005)(110136005)(83380400001)(26005)(53546011)(8936002)(4326008)(316002)(54906003)(6506007)(55016002)(66476007)(76116006)(66946007)(66446008)(8676002)(86362001)(66556008)(64756008)(5660300002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1BGTXhTdk5wNWNGZXdzOGRyczZFSVZQVWp5TUZQUDhlZmFVaHVNT05CRFFk?=
 =?utf-8?B?dW9DbjhueWFSNXRDZjNPYldhRUNHbHFRd0liUDh5enoyays2YWIzVEVGc0V6?=
 =?utf-8?B?VFBNZlllVFFjMzViUUpjb2pLU3dTaWhidkp5bWxpVXl0a3JhYW0ySXFzdzFD?=
 =?utf-8?B?MlhkQVVhTTRPTk9nNEhGeGdYa25RT0FGbHJ4T2VyV3k2K2t4S2hlbnZzcmZ1?=
 =?utf-8?B?ZVpEbjNkZHZUNzYxSm1tNFNaTzhEK3BUOUJZbjBLZkVoRXNnRHBKMGwyWTFH?=
 =?utf-8?B?WjZjTDNnWXYyenI0VUMvNDRrUHJjN0RSMTB0UmpwM2NmRWpkR2t1R3pkUVpn?=
 =?utf-8?B?QTZob0xKVmczejhmMTlaVzE2ckY4U3NBeDhXZmNDWWkwRG5LQjkwaUQ3dFVh?=
 =?utf-8?B?SHBJcVRZMjdVK25IMFdNKzlrMmZyOWhjRlNhazh4eElnMGZaUzBmWTVkUjhJ?=
 =?utf-8?B?V0VlemdDS2p2V05ncFo3S1B3ZnJNaW00UjUvMWo2WWpINUU5aEdXMWU4NnYr?=
 =?utf-8?B?R2tQSCtKaEZualUzek5rZ1Y5ZjgxMlFaUDNCK01ocGpLTk80b1ZHUWZZb3d6?=
 =?utf-8?B?U1hsOHMvNjdNOTlIbkdzTDFaMnM4L1p6QUZ3ek5XRmU1ZkZuN2l0MzkweWhF?=
 =?utf-8?B?VklWQ1dlSXFCaWpldElJRWpiNmx6UDkvOVNVWkhvRG1zYncyYWdSWTZIK1Jp?=
 =?utf-8?B?aURUSTJwbnV4NjVKaHNhWlFqeTVncjg4cTdjaFJ5eXByQWNwd1M3Yks1UkQv?=
 =?utf-8?B?TXMwVC9wQlpIK0JrQTV3VFI4VFJqeWo2L0RKbTVuUjVVUHR6NXJ1Nm5pdmlv?=
 =?utf-8?B?NkJlcERSRmxFdlNEbVNoVzdZbHJBWmFaeVpHQTVEQzBrZjE3Yy9COEg4T3Nk?=
 =?utf-8?B?N0hacnVRLzBMU1NzUGJyUFI1eGs3cE9GZDhxSms0YTViTTBwMkdhZEEvRWI2?=
 =?utf-8?B?TnhnSE9iM0F1NnR2dmFrdGY4MmdOdnlEZjFYTzFMdEZQbzRnWGVMQ0hHZE5j?=
 =?utf-8?B?am9mL2RpWGpUdng2azBMbXR1Syt3QW9vd25EMk9YR1JvLzVZb1c0RTRsVmdo?=
 =?utf-8?B?QzJReW9DYmp6V1JwNWxla2habE5SVkIycXNOWnV5Y1BVZm9EcXJOenhzaFd3?=
 =?utf-8?B?cHRCQ2xLcU53Rms3WnlwV2hiY1lNRGR5L1p2R3llL1E2OXpxaUEwSnVHbi9X?=
 =?utf-8?B?a2JCRnJhbUFlUlp6eUVIdDBRbHVPbmFSaFNCSW9DTkxzbFcyY1U2R1ZFRUgw?=
 =?utf-8?B?NE96YStOQitHZ2M3OVVHSFFCb1VHVTBBTVJJdUZwdzB2UDBLeHFoaG9GSXN1?=
 =?utf-8?B?aVN5dERidU5GVjNpNWJCUi95bWtDNDVmU00rZENnQW1yV3AxZk5kL2E0NVl4?=
 =?utf-8?B?cTB3ZVJMcTJpMDZRRmViZnN5L2pPRUxTdTY0SUxYRE9ETzNKOGtMU0N2MkdQ?=
 =?utf-8?B?NUdtWDJIcG1PM1RSU2I5R1ZEWWlvdSsrOHFXbXdqZTNrdDlFS2Vqc1lrVGFC?=
 =?utf-8?B?T3d4SHowTjgzRis1SEROVU1jakh5Wjdua2FjUzhGZzkxUDM0L3N0bms3TXQv?=
 =?utf-8?B?QXZnVlErQ0gwUStmNExLUFRqTERPWnJveElIY2hrTDFMbk0xSEt1MWhsVmM0?=
 =?utf-8?B?d3d4QWJESDJWNFliV0pTT2h5aERqWlR2Tk1raGlSNUViUjBHRzNJRGlvV003?=
 =?utf-8?B?QjNFTDN5aTA0MGN3NjRSMFJPb3IvQ0g2VTBsZHFaalZIbk1wa3JLdStNQnhV?=
 =?utf-8?Q?P97GoHvZDTMv8mY4G3/KRQGxCJvy1GKbAi3Qt3E?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38b5f4f-ab08-41b1-7566-08d96c5c1fa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 08:48:37.0979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QWRRWZnWcScIcH+QlrnuGVPJTOBtIVq4ciTdU6waXA/Rprky0OuUPsLi/4pG+wjETj7SX3mRWO2n0NC58puZUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2537
X-Original-Sender: zhiqiang.hou@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=sFBIOU7U;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 zhiqiang.hou@nxp.com designates 40.107.14.55 as permitted sender)
 smtp.mailfrom=zhiqiang.hou@nxp.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=nxp.com
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



> -----Original Message-----
> From: Jan Kiszka <jan.kiszka@siemens.com>
> Sent: 2021=E5=B9=B48=E6=9C=8831=E6=97=A5 15:11
> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addre=
ss
> and size
>=20
> On 31.08.21 08:55, Z.Q. Hou wrote:
> >
> >
> >> -----Original Message-----
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 20:03
> >> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> jailhouse-dev@googlegroups.com
> >> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
> >> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
> >> address and size
> >>
> >> On 30.08.21 12:54, Z.Q. Hou wrote:
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> >>>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 13:43
> >>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> >> jailhouse-dev@googlegroups.com
> >>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
> >>>> address and size
> >>>>
> >>>> On 30.08.21 05:02, Z.Q. Hou wrote:
> >>>>> Hi Jan,
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> >>>>>> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
> >>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> >> jailhouse-dev@googlegroups.com
> >>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to
> >>>>>> access address and size
> >>>>>>
> >>>>>> On 27.08.21 09:51, Zhiqiang Hou wrote:
> >>>>>>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >>>>>>>
> >>>>>>> In function restrict_bitmask_access(), the current access_mask
> >>>>>>> is implicitly assuming that it always access the whole register,
> >>>>>>> but some registers are byte-accessible, the Guest may get/set
> >>>>>>> wrong value when it issue a byte or halfword access to these
> registers.
> >>>>>>
> >>>>>> Can you be more specific in the affected scenarios? At least one
> >>>>>> example would be good.
> >>>>>
> >>>>> Let take GICD_IPRIORITYR as an example, which is a byte-accessible
> >> register.
> >>>>> Thinking the SPI INTID 33 is assigned to an inmate cell, and Guest
> >>>>> wants to set
> >>>> the priority of 33 by byte-accessing.
> >>>>>
> >>>>> Assuming:
> >>>>> GICD_IPRIORITY8 original value: 0x00000000 Guest set value: 0xa0
> >>>>>
> >>>>> Then the current logic like:
> >>>>> The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read back
> >>>>> value is
> >>>> 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00) get
> >>>> 0x00, then finally 0x00 will be written back.
> >>>>>
> >>>>> With this fix, the access_mask will become (0xff00 >> 8) & 0xff =3D
> >>>>> 0xff, so finally
> >>>> the 0xa0 will be written back.
> >>>>>
> >>>>
> >>>> OK, indeed a good point. We missed the byte-accessability of
> >> GICD_IPRIORITYR.
> >>>>
> >>>> But this reveals more: We perform a read-modify-write cycle on
> >>>> behalf of the cell with the cell's idea of access width. That is pot=
entially
> unsafe.
> >>>
> >>> Can you help understand why there is still potential unsafe with
> >>> this fix
> >> patch?
> >>>
> >>
> >> The patch is fine for GICD_IPRIORITYR, so is accepting all accesses
> >> for that register. The problem is with other registers that do not
> >> support byte accesses.
> >
> > Don't worry, according to the programmer guide the Guest code must not
> access those registers with Byte-width; even if there is someone do that =
by
> mistake, it will trigger an exception before the access is trapped to EL2=
.
> >
>=20
> I do worry: We trap the access to EL2 because the memory region is not
> backed by memory in the first stage translation. And then EL2 will issue =
that
> request and panic.
=20
You're correct, I did some experiments, the byte-width access to non-byte-a=
ccessible register is also trapped to EL2.
But what I'm not understanding is the byte-width write access finally trigg=
er a SError (ESR_EL1: 0xbf000002) to the Guest instead of a exception to EL=
2, and the Jailhouse does not crash. Do you know the reason of the result?

Thanks,
Zhiqiang=20

>=20
> Jan
>=20
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/HE1PR0402MB337106827ECC0CE4ED356C1784CC9%40HE1PR0402MB3371.eu=
rprd04.prod.outlook.com.
