Return-Path: <jailhouse-dev+bncBC44VTVY2UERBKHURSHAMGQEFUKMSZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 002A147D3E1
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 15:46:01 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id b35-20020a0565120ba300b0042604bb4857sf1312468lfv.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 06:46:01 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1640184361; cv=pass;
        d=google.com; s=arc-20160816;
        b=iGQRXME28n827A3acCAZzM3bK8LusxcM77h1YGUUeVCSBCt0OZ2COhNUIweu5TG0sq
         N9dNtMG/U1nC7SFW6Rah5UDOjUKpvAAaFYPgFxnHz7mCCTvS2ckEthiMXjqgCvjP6Xc4
         5yiu0dgDetz+TlgpT6KjY2b+aVG0V203JbPnBVVaMOltEGddY1V2m7MeS3IOfXT0Dej8
         hNy1rLwtoWQiCIWrQ865HgSqqsLhfwhy62O+CVO30xmi1a0SwwKE2l7xNf8lLZr/BKtZ
         j3YoTmdxo/lv5EmzHY1CpEdPjlRJsRaaXEhJDI1P9htSHOYsZYnzDiR93G8HykReAADL
         te9g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=sGgvZY1pu/NcY59arcaSq1HsBhM4jm5zhlf7d7kyWd0=;
        b=PcnbH66E8sU9B+MUht+2ttY3xtswxXj4CSjuj5vTSvzM1/0r8rxllzH3JpjlDKqOc5
         TKpmP3EAaDvzfi8V/Cr16If/3fV6+C79uuePCtqlQOEhumqMkGHl+1244fuLpWzrxkp6
         eFrAIfMi2+DyK7aC+RccFk8oene7A14KS1xtcjQwilF++zpGen11E0DgQbeLeoVdgJ3M
         drcABECb5JhJUX4nA2/Rj9VdOV2LmyWgpmYHQjHUT8YbzNRoFIlpGqd/1CXD6KCCcmPw
         Lm+Fa81++dWxqtJAMGIXzKYFV8xMbeoC76ZfjhPK9gee+6RnwmfvlweihXXmlyPIOoP4
         PEmQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=TS2euq9C;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.2.57 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:user-agent
         :content-id:content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sGgvZY1pu/NcY59arcaSq1HsBhM4jm5zhlf7d7kyWd0=;
        b=MfoS+70QNki0aQrEe8Ulsh7jVP3/vpFkMIXr9paF8Erks16gprxdtC8XrYpuPG8rm1
         LbaW53VkyvcO5fkSmoR+RlJp1Yj2h6XGSvlhXp+AG5XRaChNOwRzVBgpzE8LhkYfmTq4
         WQQ7V+gJ8SGbEvWWHXGO+LWjfALq627ci/XBwKLFPipS2A+VtJpNipmZ6eA7OL/bxcV7
         NE5dQM+DyWNlUYoGsIiCZaXNGEFqg1jYrRKr8oY1gDiZMKNiMhLPOmK6ScvcCYpMJYYq
         JWAT2+vHyIBng5M691TbXih1N7b1dkLLhuc7+M/bGDG7v5Jw5EJsgVmvGhvHKR8N3/PU
         MWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:content-id:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sGgvZY1pu/NcY59arcaSq1HsBhM4jm5zhlf7d7kyWd0=;
        b=zWogGkaZxgBLPEiThxp2zTUOHJ6/Vfz6Dj2HRxso0RhFhKs0pjwjKAXl1SMaKfjXm0
         y6ELuBUhBQIJInh5GMrpql6xlpy2Qvt5hhBw3XtVuZgS7tis/UJrE4gQ6gZdHy5Kk9gf
         IO6+AReC5aFYfjU8H07Cez3C0x0+/FhGgPEbKHAZFFoj6LRdeRN5p8c6cVYRobK9Ut0R
         02uO7j0tLdFCyk1uSLOimidMSpttKeVPkmE3cq+VEnAVYXYIHZGKskpbDfdv9sBEk/oj
         UORb9rvTkGyQeZmXo9xC0VfXJ1i3D+m3QyIgPhWJA7Lvu/9awAwYv+v6nFZtfPolzVky
         j8cw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5324Bcc05XduAgl/8jqmLLJIWwGP/3yvAsGZnumvjEnM7u0deOuT
	vM6f3K+e/4LLWSN4ukCjtlo=
X-Google-Smtp-Source: ABdhPJxpIh36oc8l6zT8+fM7oIT6cT20mpoGCiFm7IMP2UROIpDOWYYJkcHEPDd0/rb8V42TrcFKig==
X-Received: by 2002:ac2:4e07:: with SMTP id e7mr2550594lfr.632.1640184361320;
        Wed, 22 Dec 2021 06:46:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc11:: with SMTP id b17ls116021ljf.7.gmail; Wed, 22 Dec
 2021 06:46:00 -0800 (PST)
X-Received: by 2002:a2e:a5c4:: with SMTP id n4mr2380193ljp.146.1640184360228;
        Wed, 22 Dec 2021 06:46:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1640184360; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ko6r1qHCOdsJ9wb1SFa/hUgzCX2JNHmKvl/se6OWj9dscTuF+FLbYu8ltZ8gIeejjj
         lARByjRDK0mq/66K3phFDZhnbchJGrEcbZ9EngCMeI7vlomNsRy9DlaZMblA1SpP/Yrz
         asXstN28L6N2kn2maytjaZ65YcU/xZVsKAN3EGdwagVXZMYHEQx/K6qUccKbEUTxJonE
         cg8X+zYd/N7txVUZuYqfX9t3Ui92aN7u6SZtluSpXTfeW/fc0N+YGcnT2LKloQrKq3zJ
         tmnWny/vUpGDgN187bn5o99N3Ht+rc6nVhI9PLLN1y7FzYPcnSHVRK9iYiM0GCen3CEa
         Ds/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:user-agent
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=OXiIJ5H338pgIIgz6es5PKRxQeI8+GKYj3mjpnBevis=;
        b=VvgHqoUv1spY6ti8y5PTrCwQnrlHsuXRro6XxCTUL7l9T7SQklGWEUS909eFWrLEjF
         e/mcxtrMznqWkEguOgcEXXecov1ygvqRduV/n8dhpE/eSXWg74QCG/XGHoYoZRh+ibro
         tXWpkl2NL3mFSkIjD326kmpicdYukDnTCCzhI/lYDnMGyqRsj3Qr0VrnF03RtFkfHGcK
         64kFbPwakIfqhKntVUnMakJX93rIDAwCapuSTsc/ZmUVQupP0AowlHPuwO1LSMPf+rhP
         ti9BKxSiIJXXoeYI80Dm0KgzQnmzRvtZsLg2Itl8TfyPESi7DMRpFDKoW6NJs6okWAAV
         IFCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=TS2euq9C;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.2.57 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20057.outbound.protection.outlook.com. [40.107.2.57])
        by gmr-mx.google.com with ESMTPS id b7si125623lfv.5.2021.12.22.06.46.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Dec 2021 06:46:00 -0800 (PST)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.2.57 as permitted sender) client-ip=40.107.2.57;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QufZrLLx73SZWNB/6Zx/XGeq3eIrq2iS17wQX+klwVA52LBmF7YEAa7CCHLorrJFoBMC7MXsBuyLe42cNWfvulaiBTgpVlO2/KZJ1qF4hJLcz/E2ind+G/NLEnK+J7O4XpbReQ/o/H/RkgniC2Abpq3nz5ct23I/BEQ9ZbzEe/6n4PYXh2+DHvbAYRruQVb1VssDuhWEHNij80dETtrWowD0KCHxS5eiH7AdNHZsXNCc3h16J/afTppk0Wz99ptCY21BoA90AZMTbIFlVD0uA4d4Si6ZcxesdQ+7P2zx6QP1KcmMDhVyAvaoyxuugvqkxwXkN8yRCQH60HO2fmMooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXiIJ5H338pgIIgz6es5PKRxQeI8+GKYj3mjpnBevis=;
 b=oQtgtEtpu82JgbHhY+fODiPsrj+F3XJ9UBHzCQg53MBXAGLSMX6P9SqPMQW2S78LiGi968SYg+5uzFDJLnfygVVSnAMpbxPP+i0k6XpBYaOoKoIytnNqdLoyeSukD1hxjSsQRNR51nl4C86ucAlMCv2tDZ3HTBL+AgGvIxM6/Tgyss1THRy+agVZZuF9tl1c8EpDo+ttyJaxOESNkqXVyGu8Z051uTHVcTJxbOiZH+lnBShqy7dDDfUYOFacf0ykWObpQhUzMeSyq+yzyHyGRBED73zadepK5IIKhHh+YuLrBkNt50T63z1sCo3pfF2t/uwL3TcDRO8g+EV2MV/Ykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 14:45:58 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0%4]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 14:45:58 +0000
From: "Bezdeka, Florian" <florian.bezdeka@siemens.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"huangjiajun145041@gmail.com" <huangjiajun145041@gmail.com>
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
Thread-Topic: FATAL: Unhandled VM-Exit, reason 2
Thread-Index: AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAAgAAEf4CAAANwgA==
Date: Wed, 22 Dec 2021 14:45:57 +0000
Message-ID: <f76e76b332af3cef7a46e9048e96d6b50aa50fa0.camel@siemens.com>
References: <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAA>
	 <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
	 <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
	 <2be13d89-1023-411b-ba9e-1d10044824e5n@googlegroups.com>
In-Reply-To: <2be13d89-1023-411b-ba9e-1d10044824e5n@googlegroups.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c2d9efe-d33c-4c62-7e52-08d9c559c405
x-ms-traffictypediagnostic: AM9PR10MB4039:EE_
x-microsoft-antispam-prvs: <AM9PR10MB403985813ACEAAE1CC2A8D48F67D9@AM9PR10MB4039.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RNxM2IC1xY9ACHwbcppFM7/zbksmOcGVgirrPR24r/c/8TA+fnIAwhP56tQdzIj86MTEvKhQfh2zjUE2xF22sDWC1ohASFqfk8VjVASg9EbyblqYHmr+GBWqeAMPOV+ZBLiKW+M+RM0/IqzzRGGKXo1V519clNn6iKfVDww2XeJLIZiJr52wTvgCDdwv0GAj9S7UJ6wG4Df/VGh8IvO+eAtbVOOnWdW9z52FGqhkI5I/CUV1qC6UFnPe3Z/khXUK8DxtkwaflzqgcjK8sq6wLi3oVh3575tgx3x52iyTRsB3QswJuq/IH5pOdWUZcZw/KLg0Hp+rJiNMR87XoPCxzHjgtHJ0mF0MU9+SbNm6mfFnIOnSzvjouhX4LlIl6W2fahhLIOLk7D5eriRd+geiLYWSxr2CxYnWujNet8GV0BrvObB21bHU+SAUHMiadS7iLcIaEjlf8/ssKFFwE8pYVcsmwM6t80hDyKBW4EQ2W7Obo+xmUWWjTbVr/k2kilByBQczsubmSgFNQpFQJS1iGDLzFt6ulSoMuodtsDUOmOyK1MxiZ3gM7istfEuK4i+5ykgZ+vGa6GturVjUqkoY3bROe2Z05tmwc/s24dsxLWV7K3oavD1NHHiISNPcBztZm0TG8UMd2B74oc8RYoTCGXLoBgXW6PaNBJ0ELzDEw628V3Sv74rIi7dNsLWqQ22mkHQMEBfULoM9wjV/lKnNg9Rb+AG9H/5tLzHV8onJULSN2d6WaNoh5+XgNDxh1PHFc1GzLRLjgEofJCpE6wfKp12RJPQixL4aljUfMjCmXFEakh4NGGU16dhWwITGi74yld1ONWOiQ2g4egO9VwKm6A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(316002)(66946007)(64756008)(6506007)(38070700005)(66476007)(76116006)(6512007)(66556008)(91956017)(82960400001)(122000001)(8936002)(71200400001)(966005)(83380400001)(508600001)(6486002)(8676002)(186003)(4001150100001)(38100700002)(36756003)(2616005)(5660300002)(110136005)(86362001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkJyUnREakk1VGZUSmY3K0IyNlV3SXhYb2JtU0RnYzVkVmNYMUZKNXRrVTYv?=
 =?utf-8?B?NUUrYmQ2UzIwaHg2Uy8vTnRveEJkUk4wSFR2UFZWQmI3Ym0rNml2MjVmOUhq?=
 =?utf-8?B?R0M0NHhyU3phUjRVNHlJUXFMUVlOR2RPRnhFNU9XSmtTbWhnTE5qOWVFNnF4?=
 =?utf-8?B?dGVwWDUyM29kQVJ1ak9QcHF3S2YzT0w0eVlPTDk1Yk15dlBiMUVKcW8rSFdC?=
 =?utf-8?B?emVLQVM2Mzl5YUppVW1Wbm8rZFJ4eWp6aU9CajUvQmJmRy9YYjRrck1sMnIy?=
 =?utf-8?B?dmtubmUzSHo2ZWRSaHA5Q0d2em16R29Wb242Tk9WTm5FK0d0SlkwMk1VTUdz?=
 =?utf-8?B?MmhmZzBGUGdJeVpVK09pVElZcWplM3JXN1dQemZKS0crLyt0YjlWZFJPZzRR?=
 =?utf-8?B?b3A4SGVnWlpRSjlnTEpPdnFWVmw5SmtKcFlYUWdGemN0TmNnd0dkZXl5bE1Q?=
 =?utf-8?B?OWV3eWtiejZ3b25LK1pFWHM1VFYxRnRGQSttaktldVNyRUh2aEJlYnNpU0Fp?=
 =?utf-8?B?UnFPZFJSRC9vUHpMUDFEWUFlTnJQUHAxVEZ4M0w0eE9mSVJVQUxJaDFCTEYz?=
 =?utf-8?B?TnZOd0U1amRXdi9uSTZmWnVlMlRwTDBrdENWbEZLVjI2aTRiSzFhZ1R0R3FH?=
 =?utf-8?B?Mkp1OGZzdHdqUHA3N3l1a3pDdGsvdjRDemQ2bzNTN0pCM2dFaVNGMlJFRTIr?=
 =?utf-8?B?ZFJVUkswcStZcFFyNW16UDRDQ3hxNzN4UERjSUdaTC9xbFNSd0VBVFRlSy9J?=
 =?utf-8?B?VkoyVERwN1lyQkJHbGt0UjZJZS9sbTJaRHNjTXlCSEgyY1JDcllMZXJEcUE1?=
 =?utf-8?B?N1NxVFlTaUg3NVl6Y3EyVVk2QTZrNUFtMDJSaVg0c2lkS1NTUk9kTW91NWw5?=
 =?utf-8?B?UkVxeDRiYm1wSUU5anJMemc0TGdRWTlZTnB0TlBaaG5td1Q5bFl6TnpMYk5N?=
 =?utf-8?B?SGduUUtIZ1BsYjVjU0F2RUc2bzR6UHZRUFIyUnV5TlhUcjladUtweVU1bkNn?=
 =?utf-8?B?c2ZiaGdGNHZlcGZFWHlWeUhNUFNHa0dKS2tzZ1cwRTB4cUZpcGxqUmJMbFRI?=
 =?utf-8?B?YVRGYzhFOFdQRlFHM1JtY2NWbXVQZXZ2RUp2RjJZeFhLMUphRkZrRHgxNnZS?=
 =?utf-8?B?WVlZd0hIb1dKblg1RjQ5cHIwR0N5cElXWU9vVi9TQk4rOGliZGJHOWNjcDAz?=
 =?utf-8?B?dTdvUi9ZaVNPQi8xaDNjSGpIQ2NKWEV2UTFjYTliLzRFV245MjRYZ2dmOVpU?=
 =?utf-8?B?ajFUUkZnb1JicTRNWVpSY01RZGEvSGZPL0RiSjhES3NWVjlvdDdPQWtLQnBY?=
 =?utf-8?B?TGRPMW5IS2QvTFRlSzY0REtyRE1MVStEa1J2alFsSVE3aHlBOHpMSUJPU0to?=
 =?utf-8?B?Y3MzNUNBV0tOYzQvNElzWkJFOEJta1dLcTB6c0pocWdwekptcDRIWWZ6WEF1?=
 =?utf-8?B?Q1BNN2pPOGtJZDNjakVjS3hxODl5UDdlSWk3Slg3VFl3blk4RjdHMVNSQis3?=
 =?utf-8?B?dTk4b1plSWl3YnFSTDlmNEhOTzZTeUw3azdJeGVWMDZ2UFRNSGdtVnRWbEZh?=
 =?utf-8?B?cjRGYzJOVXY5WW9NWXRvNGR0VHJKZ09IWmtOS01xcFpOcy9sVzhWczlETFcz?=
 =?utf-8?B?dGcvcTl0SUF1NFlHLzN5MVhzWXhUYWh0Uy95RDZUVTZyekI0NUpRUGpVSzVT?=
 =?utf-8?B?UkpHenZFaEJhRVpjcVkxTVFkRkpwZ3JDQm9tN3ZBUldaTEdBRmF2NVBXUmtv?=
 =?utf-8?B?L2kzMVY2NTR3MDdEeWE0dGJzMHp0QlRqVmlMMElIUlJiUW0wVVZvd1ptSWhC?=
 =?utf-8?B?M29QVUtxZzNDcUpqc1JKZjJoSGZIOWRXeFBtWUZyaTJTb2EzWkRRSEl3UEth?=
 =?utf-8?B?KzdiM0ZtRnJ0TWRFeVJra3lLVHY4K3lwa040d2p1dHJZYy96STZYdS9NcUdm?=
 =?utf-8?B?VFVjd2Z6R3dzVWFlSG1YS3dGVVNjMkQvYmN3N3VzZDF5SFVQeU1yWEtGRHoz?=
 =?utf-8?B?VmovVTl2SCt3R3REeU5NcG5kVUIxWmNEayt2M0J3bmR2elZOVk1WUWN0cnZq?=
 =?utf-8?B?bkF5V1YzMjJXTm8xUzVUYXh0RHlWdnB1OU53Wnh3eldOYTNxYnNHK3FEM0Z1?=
 =?utf-8?B?UWxQMkJTQzhKMnV5RndTRWNGRFR4NExuSExFTG5KekFTR2JyOEdaRmw5TXp6?=
 =?utf-8?B?emZxWVBWdzBsMDlsSUJMRXVnUXVzZlhFUUFKRDU2b245S01aMWkweGJXTGgz?=
 =?utf-8?B?K0RUTmQ5WW14aVVtWEVTT1QxMmIwVTU4ek5ORWN4TjR1bncyZGZWOWxNQUVJ?=
 =?utf-8?B?aGYyb0p3R1BnMTNiaThacHNWaDYvbnJYbjRmRFd1bngyUWFDSVAzKzlDZmdp?=
 =?utf-8?Q?gwWfqMzG6Ip1tO/w=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <43CDD527B9D8104F97EAB0BC9875D1BD@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2d9efe-d33c-4c62-7e52-08d9c559c405
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 14:45:58.0153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VVo0ykk3xt5zIOU+mFyVuarYEOeeChOKQGJreNeKfP8OhC+J9BKaf8gna5wbOIvInDxiQrhNhPpFDgo0o000b56DCkh82scHJJP/IJi92cg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4039
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=TS2euq9C;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 florian.bezdeka@siemens.com designates 40.107.2.57 as permitted sender)
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

On Wed, 2021-12-22 at 06:33 -0800, jiajun huang wrote:
> Hi,
> I will try as you suggest.
> Currently I try to run this open source project
> https://github.com/fixstars/cRTOS/blob/master/Installation.md. I used
> to follow the guidelines of this project to successfully run
> linux+nuttx on QEMU, but I found that the ivshmem-net device on qemu
> does not seem to work. I suspect it is because the mmio area created
> by jailhouse for ivshmem-net devices is not registered in QEMU. So I
> decided to try to run this project on the server. I want to know if
> the ivshmem device is supported by QEMU?
>=20

There are examples with ivshmem on qemu, if you get the memory mapping
right it will work. Normally you can't re-use the same hypervisor
configuration on real hardware. The IOAPIC/iommu setup is normally
different.=20

Root-Cell:
https://github.com/siemens/jailhouse/blob/master/configs/x86/qemu-x86.c

Inmate/Linux:
https://github.com/siemens/jailhouse/blob/master/configs/x86/linux-x86-demo=
.c

>=20
> =E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 U=
TC+8 22:17:37<Bezdeka, Florian> =E5=86=99=E9=81=93=EF=BC=9A
> > On Wed, 2021-12-22 at 05:39 -0800, jiajun huang wrote:
> > > Dear Jailhouse community=EF=BC=8C
> > > This bug occurred when I tried to start nuttx on a none-root cell
> > > on
> > > the server. I added two ivshmem devices for nuttx. Below is my
> > > configuration file. I am not sure if there is a problem with the
> > > mmio
> > > area in the configuration file. What is the communication area?
> > > In
> > > addition, if jailhouse runs in QEMU, can two virtual machines
> > > communicate with each other through ivshmem-net?
> > >=20
> > > Below is my root-cell , nuttx configuration and log output from
> > > the
> > > port.
> >=20
> > Have you validated your cell configurations with the jailhouse
> > config
> > checker? I did not look into your configuration in detail, but
> > nearly
> > all of your inmate memory blocks are tagged with
> > "JAILHOUSE_MEM_ROOTSHARED" which seems uncommon.
> >=20
> > I would start step by step. So start from a configuration where you
> > know that both cells are booting up. Add virtual NICs afterwards
> > and
> > make sure that IRQs are delivered to ivshmem devices.
> >=20
> > Are you able to follow the boot log of your inmate? Hopefully you
> > will
> > see the reason for the VM exit there.
> >=20
> > HTH,
> > Florian
> >=20
> > >=20
> > > Best regards,
> > >=20
> > > Jiajun Huang
> > >=20
> >=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f76e76b332af3cef7a46e9048e96d6b50aa50fa0.camel%40siemens.com.
