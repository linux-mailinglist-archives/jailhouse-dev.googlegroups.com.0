Return-Path: <jailhouse-dev+bncBC44VTVY2UERBAHHRSHAMGQE5JI5QFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416747D374
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 15:17:37 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id a203-20020a1c7fd4000000b0034574187420sf3075836wmd.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 06:17:37 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1640182657; cv=pass;
        d=google.com; s=arc-20160816;
        b=sJ3Q1+2K/I9wUTPCsQwjk2Zh5I1gU2RUcWSo3i1vX2sXI7iEDceSp4GX8CT/4nydUT
         4UjtwcwcXf9J5S6RVaqNpTz6GXZ3bCEWoKKnKn1DqvR/i/cqYOseT4dLypCrP+Pirxjr
         5i2OWPtaC8qM286UJvbFNDJU/dtDSzpX1Nw1ISCk7UbH2HlFTKQyXvoACXsE0kprBy/7
         wYufdcYfE4xB1oMj5gpkpr8kCutzNVc1fWmeowtqu8ryCWCBnBhH5xR25Uzm0c/718hr
         Dmss9FGnG7R0jSnRSs5T7RrXRyWYSDnQQOg/4l1rGaZn21MflaQZcO6E2APEWnpcbKqt
         kJ4A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=Lw/5iA+1MEgrQm420EvfqUrSZlgX/oquT5cDmod9oQY=;
        b=g466lfJN2Qlqfm3OLEnI3V/CJ2GX9sBuXvP1zvA3USDKQEnMF04haoUHwgzyPqyjon
         ev9duN2ka0NYRB3WQv4LZeQ7i7crP9jfOqzV7sOVxUaAxqYWGqYQZDp+nAP2ea7DwAVY
         O9kdIa62nG0rhBJ0LX5lIYsw92ueCO5Jet5ntqrcNvKCJl0tEeqT8lp2BUT+GmwM80Jn
         jj9ufvYVKb1epQQotn39a/ytBCTd1ub8HGTYDkzCSdxQGIyGenNDkZqtFePcpDis7GiP
         yvJ+CmPCFUIoEofteEH9gOPd+HpARuo/uYTZzb7scbvm9C4v0CTPRB4pVWmFpSqny6Zg
         vE7Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=D4IJE2qu;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.14.42 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:user-agent
         :content-id:content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lw/5iA+1MEgrQm420EvfqUrSZlgX/oquT5cDmod9oQY=;
        b=d0wrl/pPuwcGgaaCaXD4OkvROpNQ+crggveP5ZvOEKTFZAKGqS5jcqsxLA5tkpKaRZ
         uN2fNyYAXk+synhSjn13yRQUXpuIezSurlDgJrShNbM6qhKbQp5sWpw1kNrhpoRpYSkG
         StBmUjgP6cBjcDz3//L0xl+fz+JJGnCoTJxS7JFDaShWttBIPQRujbLuOKdvjkwPMeni
         XbUdY79r7PUs0wXKEUWiHWzmPQZ1oFWqtPZqgfkl1zPNVV+dIbJVCknim5CQRP2xLy+c
         4tBcbQ56UDCqodBKhjXqW3Ebk78qCxqQjNtWWzNvXWGBlCaNcqAEQISZwuKuHLPdXjjN
         +aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:content-id:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lw/5iA+1MEgrQm420EvfqUrSZlgX/oquT5cDmod9oQY=;
        b=FOTaIwPFnr2lWDG2jCOJLBVCh17SbrFKwY+VMKwvZuc4x1zUxtsBDqWahA4RMDVrYK
         YfNa33m/xWDkdj7Eam2jbdOiS3+4UJQhq+q/HsS4DPMgaQC8GFlVU7btcHTLwx0rRvAw
         bj9CTuQQ5/nCK1PTHM81MDJ1fVqSvuoRzqp+sfZJR3jsfHTV6VSEG4CVn0+iohtz4+RK
         BfWgkgl26PR29W9gMZNBjgnw8WArUFPM6/HnPm9bdYsZs8Q7C0XTrEXESmkSptlHxXeP
         jQlPOKe824zRd07ucHuyr0JJb2v97yw8xNOPQJf+pjzoDMCRLt+GEK4nMwITqq7AYrld
         YMtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328ROO38tVAZ8tqf4RohPKIIxL2MWtmz91vLnYXdzBVYspD+RHE
	E/9TSYy5O4LYRrcLmWT6ed4=
X-Google-Smtp-Source: ABdhPJx97lb8n8YUpXK2s3JGrh5p/XFlyCCuqIvaCsx7HKSi8YoM6co5/XliLVp7n4ICTTSIWR5/PA==
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr2292726wrn.690.1640182657037;
        Wed, 22 Dec 2021 06:17:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5082:: with SMTP id a2ls393793wrt.1.gmail; Wed, 22 Dec
 2021 06:17:36 -0800 (PST)
X-Received: by 2002:adf:97c2:: with SMTP id t2mr2279936wrb.577.1640182656260;
        Wed, 22 Dec 2021 06:17:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1640182656; cv=pass;
        d=google.com; s=arc-20160816;
        b=KnQndTeOXFWs4UH2In27Vey65l76JzyRe8RFfvdJnUhBgdZyaZmNHHM+tk5353/tYy
         Z1lHTnyQxFG7+xsdcAJavxURWJw9YQ/DQ08LHOEDEKaWyVaEwOnRg341PZZIKsFxj4Qf
         StJkIT6f4RB4M3IS7MZr4Y3tsCHpE8Ys5w49U89+9dbT8uxilzeCsanDA1xnzwb0CUnx
         r9tIPOE6qflcwIsXaomYfetdRCGm1MzfDy6oqFAIrS2anVbG7ZxzW0eIyDys/Pvjw7/d
         F1LGKQ6BWgCpKknYd+9KxqAQNOuIejwE3I0ubBV7FS+uxmIVGgP48nRKTY7hBRPFJsG0
         Ozlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:user-agent
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=xdNJ1lLFs8uFXWM2+AD8oTy8FY1ancD04waWaL3FN/U=;
        b=F/bUfv0Aa20KuJCpkrTrYG9YozcU9GOWGOrmLYzJTYAvGqmeURBknW0PM1guPcAgln
         EjfC9EJj+a3+ovyEzTkgDIXSBhmtBZRCts3d2tGEsyzFxaDhMuLD3yTA4whSDP8uMtHp
         uXPCwUatqrvAND4f+iQvPDir8r9c6RIEH4CFVzoxVnlIOGEDaXb1PIusq2/51BVp6Tj8
         2iQYTk0Zr5rcBfa2qXB4lQOI6VTgnJpi9iOyVXqqy9lptYnpPzrAJ1WxmIssMWrnrGxb
         HvOr4zun6YnI325ipEqBSXoBH3JSn79M3Va+3FqVlo0RGWxldPtdhZPOD1vcq393h5bh
         UXww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=D4IJE2qu;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.14.42 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140042.outbound.protection.outlook.com. [40.107.14.42])
        by gmr-mx.google.com with ESMTPS id ay11si290158wmb.0.2021.12.22.06.17.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Dec 2021 06:17:36 -0800 (PST)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.14.42 as permitted sender) client-ip=40.107.14.42;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8R/sGIkdwjcpKrODesRoEDdz4jOcACftebK0D8BUPZP5gN/88MDYLVaroWWhKFlCx4sCU1dxRkI0aUUCjrRgTP4vPkQsIA+IUtbs7NDHk78kX5PVZ7CXTKsTKHWrxx6rLVI8XL+tUNd96JC7maxAJpd6vHpPtZyqTkrWH5rR86eqNM9QkptckAM+Tdkpnq61BSzEweTam7KSw6kGRCX5wxL+dYYiki4e6v4bkgrdZoHvEZ4yt5BQVQCqmw3bYVvZXnuEFfNY5GSMp2c/VNqcUe77tyEgXOauvRriaRaXd2HmJbeP62hIq0zwyrks3EZPaXY7mH7JR3fPksa1Dlmyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdNJ1lLFs8uFXWM2+AD8oTy8FY1ancD04waWaL3FN/U=;
 b=Imw3XvR0vNUfRV5qTHDMvl7xBjrYLOmypAQV5NddrZCyrmPh/ZY/is0dUzFb/Kba+PQzNMYjh3XSipDvteJUzaAVLXetP00KX4ITo6PHLwzleiMVb15Cbh1SfYAs9WsIdOxQLNmrC2HbkKXWJH77Tlm6QJGNE3ETho2TlBE/VKMmupy5paZ7avLJBc5jhOZA6P9NnIt5ahE/Wah3oNB+ZVPrCj/hvVHZiVrtolvluKLLLUcX4ATvw+MQtOnJepg227os5J4xx7/uHkEov31rfH3rGNLe3b8YMrrpqO2CFbraElrz/0MTTKFHTbcP7Oyqpvj3bYbJ1LnCxrp3NQhC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:158::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 14:17:35 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0%4]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 14:17:34 +0000
From: "Bezdeka, Florian" <florian.bezdeka@siemens.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"huangjiajun145041@gmail.com" <huangjiajun145041@gmail.com>
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
Thread-Topic: FATAL: Unhandled VM-Exit, reason 2
Thread-Index: AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAA
Date: Wed, 22 Dec 2021 14:17:34 +0000
Message-ID: <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
References: <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
In-Reply-To: <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 834309d7-aae2-4e39-a062-08d9c555ccb8
x-ms-traffictypediagnostic: AM0PR10MB2977:EE_
x-microsoft-antispam-prvs: <AM0PR10MB2977424113EEB3460896C877F67D9@AM0PR10MB2977.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ap/a3QgxUVTUrr5nFEaSgcG/x8Vahc0X8BzX1SjFBoI6kSmAhbd42/Iur22QVhENeRDhV8uKk/Mmd+Q2DXgbmPoo9dAOwsIfnASehP2xwgmEE83cbuf+g20R4HdZh7CYJNI9zstoffD0anMXR6FOcWIh0BVSsCpHDrbd0o5kkcPPc17ZSKcMrfca0uq0JnfJsHrarqFoH7qEMnmt0M2iwGX7Hak3zn/EKoOAxAJ27sa0nKHirmR7vPnZopplB2A1rxuIUuTnmcp5MnIrRUJzHQ7d+HINCeHqaRu7wzjy9XnKyVjBxmYWPneVtxFbnk7DRP+z4e3N3VPqdRs/ufOM4lVjVFwk4CuKKfbLpy7iXuFebW+MzYvOjvFyr29PG2LbcAUusf/naeAH4CBm8X/RsEVet4wb+hk50D56RKvOmcbFS/0qp49y4OsAxgWS9S3keQx3y0ICacyH2nugEEu9gj4DJhHRCHDvVoKCRgsqiN1Jdf8RWKXrSc7jGr8w0P3O4TLb1r0YkDRA+fLwvwaVgycTarK9qg/QGIOnh0uUcGtszgaaOa96OY+7Y4XqYE2COlTf2nlmbuZ/CI/NPPEpokmCyOH5svwYP66lUPrj45l0Db5lsoUsm157BBjEJOdV1TkfD/aALX7CiErjrdOYoN4LF9UKEnrun7JYDon0L+geUs3f+xF4FF15TjlkvOfgXgrEzJvu1TkpZbI5cLRkCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(6512007)(38070700005)(66946007)(82960400001)(4001150100001)(186003)(86362001)(71200400001)(110136005)(91956017)(64756008)(66556008)(6506007)(2906002)(66476007)(8676002)(122000001)(36756003)(2616005)(83380400001)(38100700002)(316002)(5660300002)(6486002)(8936002)(508600001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDhMbW45WDh1UXhXWVZsSE9ZNG9ZbEpMdXFCQ0N1UmNIVXRORDJOaFpQNHpY?=
 =?utf-8?B?UVp5MkZwLytWWG1xTm5VemN5NERvRHZDZTd3emhDTGt5NGJlTlRTSkJ0ckEw?=
 =?utf-8?B?TW1HTmJ0V1k4ZU5jU0VBNitnYTc4UU1teXJaQUFJc1lBT0NhMUpXNXRraG5l?=
 =?utf-8?B?QUtTWmJsV3dPRk96cC9KS0dhcVFQZnh5RitOcktjQ1F3RXZSbFBHMDdIc0RZ?=
 =?utf-8?B?dEhHejBkOTE1N2lKbjNCZ3hlQS9POENkWU5CQmk4NXdid0NjeXJOM2orOVlj?=
 =?utf-8?B?dGtnTG12cS9XU3JIWTdUVktoR2g4Y0d1Rzg4U1FaT0poTkppTU9CckRFQ0Fz?=
 =?utf-8?B?T29iVW9PNm9NZGhRcnBsMVhuTkZCc1p3QzE2Ym1yblR2UExPbGx1WFNMcDJO?=
 =?utf-8?B?aVNpeTRFMXNtbEM2Vzg1c1J2c1NCUTZxQlNpVjJWYVBtZGVwQnNjUWF0REM0?=
 =?utf-8?B?azRFOXlKMW5vZGcwNWdyWVBTTUVTbjRBMll5Rkt0Y2g4Ujk5WnRDQlJsSUFF?=
 =?utf-8?B?bnVpNDljWnRHMWZrOFc1OHBRRVdsdlg5N2RzOTVKbDV6MFBvcVpvT3J6azRH?=
 =?utf-8?B?T0VDRmtYS1NwaENYZTJrb1grRE43N2NHcHNVR3ZyZHBXTWNManBVOVdrK0Vt?=
 =?utf-8?B?T29HeFpFTzJidWNNY3dreEtoazh0TC9QZlBlY1BwN0d1ZlRtUnMwdXI5dzdB?=
 =?utf-8?B?ZVAzNVd5NTllRjNyQlRYaUYyWDhzRWlHejAwNUEyb0xwRThvZWdlUzhkSWxu?=
 =?utf-8?B?emhET2dUb3R3aDgwdFl0Y0dpVWtpb2tYakVBaXpBVkh2RjRQS01IRCtUMmlQ?=
 =?utf-8?B?enV2UWEvNE8wUGh3dGd6SW53UDJVVmhLcUM5KzJ4RnpyN0lFRHdUeUdrdmRV?=
 =?utf-8?B?UHZNbEVEdnR1YisvTHJxckE3T1Uyc1loMW9HWHNVZWl1RENnTnJSanhnUFFj?=
 =?utf-8?B?NWxJcnVDaFU2QS9Vb0EydkVTZU15YWlIL0ZvWndaQ1h1ejVVTmxFVjhFRXAv?=
 =?utf-8?B?b3I2WjYvRjhOQmQrUDJPeVRCQVdoS1p2UDBFOGdiNGFKVVYvRUZyYjdhcUdt?=
 =?utf-8?B?S0djU2ZTM0hKRHlqSHR5RllzVUNRZllrYUt2N09oeEZtaXo4L2hxSS9XdXho?=
 =?utf-8?B?QUZlN1FDZGVmeTBDRTJUcEJObXU5RkdpUlZmYi9qUVczOVZtQ3p3OFphK0x2?=
 =?utf-8?B?dFRlNUJjeU00UGFpeEtkek5HSWtnV0xxb1B0K2xuYktZSVZ4SWlWMXJtdTB4?=
 =?utf-8?B?MUoxNENGb1NTU2dsRWZDVEdBSVhMRXZYY2pCMkZuaktGdVB4bVlzMlBRTE96?=
 =?utf-8?B?aGpXMmJxVjg5STNENnkzbkdIVFRQVzhGd0k4R29BRHFoMEpHOUFPODZzYmt6?=
 =?utf-8?B?S3VmZVRlTk9NR0RNM1RpeHh6NUtSenJBVDM3S0xUazVITXVXU1FRckdIQi9y?=
 =?utf-8?B?Q1FMTEJaZ1R1N2xNMXVtcXVkZUJjRC9SMUlGeVhaUmYyTkphZGt2cnNkUWhw?=
 =?utf-8?B?YnVBWFhjcTRWVkNCZlVMT0xBTmJVK0t0dEM2ODNiVldveFBxaTF0QnJVUEEx?=
 =?utf-8?B?RlZuaHZ5UE85d25KNVB6VDF6cGtpNE05bHg3WVdmWUxUeHVndWloaFBxMFFx?=
 =?utf-8?B?ZEtiQ1VxOHpYbVdCVjJMRjQ3TnFzUUd2YWt1MmpGc1Y3OGN2dU0yMWpNZzBI?=
 =?utf-8?B?dXptY3FjQzJ5L003ekFwRUp2MDdvNlYwc2g3Qm5BZEJmVnNYbjJwZUdrc1Vs?=
 =?utf-8?B?VUo0VmM2QTdHQWZmTEZ6OFA2U3FZM3N2RHZiVi96NzZRVXc4NkJTWWxnMTdR?=
 =?utf-8?B?UTNtWDlTakVWNTFqMlJRUldUMkRjTk9JMUJwSVQyaWMxUkRQTWN3VklOZDZC?=
 =?utf-8?B?YzFFSWY1NWt2YmxhdWY2WDJqR29TQnpuc1B3RjdVN1RaZEVFSEVNY0xsY2J2?=
 =?utf-8?B?RXlZRHlneFdUSTIwaGZGaWt6M3gxaTE5dkljdlBrZ201ZEZib04ya01PS0dz?=
 =?utf-8?B?TGdlVmpHOGJkd0pvK21PYXZ6M3Z0N2R1ekFyZ2VabHdvUmt3c3l2TmZra2F4?=
 =?utf-8?B?UURSQUJSMTZGeERmRWV0b0R1dURteUR0S3BhY1ZHMWlBTmZ6Tmh4REM2Sk1W?=
 =?utf-8?B?R0ZsM0xRenNQZEJkR1VKVitkUEc2L3BvdjNnRFZQMURjeVZZVnJ0RHUvRVJ0?=
 =?utf-8?B?WUt0dTYrSW15VWYrVjVwQ2I5Mkd4UTN0aWdrUUhraHloVGlYYjNDL3B1R1ZD?=
 =?utf-8?B?QzZFa28zNnJNSXZvNEFDTDV2bnVvSGd0WDFLMHplR3c4TGxrUE9ZYzN3MTBZ?=
 =?utf-8?B?eHdCS1hlSU44VldzQjlGdkY2dkVxOGU5aWhYR2ZMekpRWkFFaXl5bis4ZHlq?=
 =?utf-8?Q?y887MX8ip0ySuNTw=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <9B627E7A3DF0C74BA68BC93F2B8DBEE0@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 834309d7-aae2-4e39-a062-08d9c555ccb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 14:17:34.6554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WPvP8VfWqsbYwclrqb9rWSAnfjQ8FT6B0AtkHmSMXKHaAapppOQ3z+0X8sv7iE2MsFxZbHayu7XBikzdosE7KcHUAqh4VkJcEL7aOY37Www=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2977
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=D4IJE2qu;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 florian.bezdeka@siemens.com designates 40.107.14.42 as permitted sender)
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

On Wed, 2021-12-22 at 05:39 -0800, jiajun huang wrote:
> Dear Jailhouse community=EF=BC=8C
> This bug occurred when I tried to start nuttx on a none-root cell on
> the server. I added two ivshmem devices for nuttx. Below is my
> configuration file. I am not sure if there is a problem with the mmio
> area in the configuration file. What is the communication area? In
> addition, if jailhouse runs in QEMU, can two virtual machines
> communicate with each other through ivshmem-net?
>=20
> Below is my root-cell , nuttx configuration and log output from the
> port.

Have you validated your cell configurations with the jailhouse config
checker? I did not look into your configuration in detail, but nearly
all of your inmate memory blocks are tagged with
"JAILHOUSE_MEM_ROOTSHARED" which seems uncommon.

I would start step by step. So start from a configuration where you
know that both cells are booting up. Add virtual NICs afterwards and
make sure that IRQs are delivered to ivshmem devices.

Are you able to follow the boot log of your inmate? Hopefully you will
see the reason for the VM exit there.

HTH,
Florian

>=20
> Best regards,
>=20
> Jiajun Huang
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel%40siemens.com.
