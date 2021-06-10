Return-Path: <jailhouse-dev+bncBDGILGE54ELBBLMCRGDAMGQEPSZQLWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 697273A3127
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 18:43:25 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id k11-20020adfe3cb0000b0290115c29d165csf1227103wrm.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 09:43:25 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623343405; cv=pass;
        d=google.com; s=arc-20160816;
        b=tWNTOHW5t1JsH24tEMrwxBBBdhbh65qUpWItFXIWV2rExWTPcwuz99osI/4SEHq3EA
         zTwTwTTlu1lYadMrbEN+kYfjVmz8QTmPFMc+xSuoQTnJXiyVXse1H2c6juNXW4a54LvK
         6bnuKbf+zJ9sNO60UPIggaiOyo3qkq5nnI7ZHldY2kUKP4XiQ4UYARlGsgvsfjVmiiaX
         ZtRedR1FDV+CfOVoPi63s4t1mRUUI6Zksji6QJY4EhERZfPM7BWahCIAlIvNARpbJRLQ
         rbrwk4WAYjzCmcOBcCViz8ersj8ap1Kt3n6tG43XmrwDEX83FAHPn4ZwB7/eGRhGDzW8
         BXTg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=HZd7UolyFygdzzt3ZHiOZAuiKO+TYeQU1WRh4PdG2OE=;
        b=Sc2Vdq2sdGboTrAvCy5aFiQ4lA2dFzpFNZQ5H6dCOVOc2OElTlTGuKjK3ATJewq3Uq
         vfpYVce9rV+wJPQ4FgQtrM9AedG0FHhqnQSWNWmFUybJUpndp8eMUSQBV5Lg6wymP4uU
         MKS3YPHCjCHUdQqSWNYnSbcDRwMZl9ZwI/XCuB2J0X9cyaKt1+675r6V5Bt06+s0xjPk
         bLc/N2hCYA4+Yz50jbWff9t6gC7fpePa1U7eqr+mX5UThe6itAbkuFgHydaDtsFlhD+N
         I/1aGT2y1c7Hx7HuGAUDRgxvxnAdGtM7SjFoLbW9JKtktzsFFr6r9jlFAVdUjMYssqNY
         ZxzA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=KmB8mYE9;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.106 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HZd7UolyFygdzzt3ZHiOZAuiKO+TYeQU1WRh4PdG2OE=;
        b=ETfxTj7nyN9PwaXQ8UCaPkeZguZU03NGoyNyfnTh88w9ciGObrHfYu+JcwHOakwjEd
         or4SiXzF7MceQMyCB+EYE556b5fuwfK4yi8XZgsgVc86b806xx7uKwRaXgdSCBRpXfUU
         yhaRwlL3Eqzpv7fsBLCkoA3XIR7yEEP3noDSsO+MTt0Mi39kf9mKuMdF8zDmiV+bSeh0
         kUlwq8gTShkdcpA8XXTVbtieER6xelKE+XlBVdEH4MpuAZNpiBtLv7VT9Ir1s8YVhWKh
         w+fIEFPqw42Dp0e5Gfp7gToswqIlp4BAnjaNqrCSjuZ4RbQrv+Ycpe/JX+zlpZD5nd0T
         p7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HZd7UolyFygdzzt3ZHiOZAuiKO+TYeQU1WRh4PdG2OE=;
        b=SxwHjGdNVo4j/RQf4NffJEDTLe/FTUaTJte9OwynNDVXSYVSoFZyIlwT9noLw9WXOw
         L8PzntE8sYC4MTQUMxKSQ3PtbgojNLyBU+bk7FfwQ9LamhYpXfBmuizPlIvhKpcxBycN
         /c2cK6uw69T+lB/5qSAE+tfbYhjFQxp17gyxgXNNUINsrYhIfuVO3EDS7+hCMRikukrh
         hLSEZdawxPDx5JjJuFut/vO7YjYDkmqwhmu+Tz2+SK97ckMNSaawOY6WR1jUp1FwD63K
         CdiogquffhGsWu05xyr/WpylQk6x8SIaCLAHfOl/EjimfTk9GDpZZ6A1aFloAeu6Z821
         b6mQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530FDuS2o1FebPuFxazwvdrQZ0zTdVlKLZgopyMQmnYmcSDF7J8r
	/VLNHt5t6gu3JZ8CwN17VPo=
X-Google-Smtp-Source: ABdhPJyPlSIVlbY4ym8BvyarvJATRgpEIuJxXCUIxPNFapWxArZZU8F4UnKIhcwLOJ7tcnfVTgZLSw==
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr6768262wrs.308.1623343405215;
        Thu, 10 Jun 2021 09:43:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eac1:: with SMTP id o1ls2010371wrn.2.gmail; Thu, 10 Jun
 2021 09:43:24 -0700 (PDT)
X-Received: by 2002:adf:c38a:: with SMTP id p10mr6477679wrf.138.1623343404393;
        Thu, 10 Jun 2021 09:43:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623343404; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q6Zr0w3CHxK1a4P1ibzdEnk2QRvm3rhZMXHO7iHpR/4gz4HyLBouQwdYUhBw5zVciJ
         Si3Xf8xVSjqay1Njk1mKTRCS0VWgYSVJfjmUQM6kJDN4V4G0LUVOSQGzU/Nrlhua5v7d
         YDVU06An515+xL3jO2Sl1Pfe5SG/qRhbAhp30IKEXDL3Tr8hznx6wEEHtFf+blufeJwW
         1ysPLOhg1RltvFfVJJNKLpyCUEJjWnAoc2W7FXzgtUnEQL20J8eBk4sR12Sexxn2Y38m
         29i0TvwmWf6TbOSEjXcuQX+LjohCFOKAjpSIsp5Yzn77LR7shCLpQei04S9zIkfvqQJC
         V6vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=WbWiT6E17xzrmY038pPxnkiAlHQ0ffd8ScuyTgBDmWc=;
        b=IDmpjMr4dy5iQUEQxvlMikOkLy53Qj9u1oOg9t8MMrwTznOT/kzQRRDQ/eznE1UHhc
         OpZBIujQLVaGFe8PUN4HEPBiBMOJmGg5dzIdthAbNsVMhglNibbS1+6+6q0tenYJ60bw
         5WCuU4/wWpcM8aFWBn4BFU2fzdPqfHv4Y7C53JnpKx18YW1AO6rT4ZczUzSwJWeKjAYt
         jQTfSHu3m8XasWx+wP8h7Ak009yB2eZVK5vGqDMVvcPyGYRz8S4pwdl8z79ZFe4ZZuM9
         XF0QFdex+X7vCHpzSdH1+9PRSjH2GqmgqZMqvOzxL/LUraJuyUuop8PMmvSZOE0eIBNj
         IYmA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=KmB8mYE9;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.106 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60106.outbound.protection.outlook.com. [40.107.6.106])
        by gmr-mx.google.com with ESMTPS id h7si517727wml.3.2021.06.10.09.43.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 09:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.106 as permitted sender) client-ip=40.107.6.106;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAWM4UQDJkhUiXH5BKfO//xeldrLu147R3BzrFh72myMegcbjOxYaR2n7FrqR2DF3/oqs5VlBwqXQFkRzXgq+gd4cRp6B40NlUQ6VLkB7ENaKEK9jKlF4Z9s7CsrmOkq+i35l+FcYe+zykia5CcwFzjFVTuveIeXLoiF6iYsc32arDjHFOXs2L1tmMrcygQ8FbJq7Gt65sI+KP8748rgpLnEC25p8QbbYd+o/TnI6bEzF3hIjjyLw7Br4cAo/+MDKW8o/0v2VjI0zoCj2YvMbWjGVCmhKtmCYeNI+qGc5eyDe/11lGn2y/8dld7hxuP7uwlF4O2yU9WZUMHn2AxVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbWiT6E17xzrmY038pPxnkiAlHQ0ffd8ScuyTgBDmWc=;
 b=gn72LBeG2CYOv6ygOLJuFGYlzzt5eo1YsYpD+NXtVKZrF/ClLzD5vzHn/SGL0DvuHAcORz4nYd+NXc3HCoDU0QakpBCgrt1AOGmDtwdnWsrTUGTPfbPlWcyzwtum3bK2LEDPslxdbtdUZKJbA/IXqIWRoxV0wvGtDofK7uKFPkuBLoZfxG1+R0fHHb+eoRMw2oPBy35kUQfuSisRNctVPKOXHzfrNPrj8Y9C9kc39P1jzpUVdR+wJf3oKTQEiyWtryrHIk7Op+VgJ6vK2eR/rkqRfir6vmBMCoetJnEDDueFl5q5kxEXZ9Z2UKl32FIeSJ6eY1MBcwCpS07nPhohRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AS8PR02MB7368.eurprd02.prod.outlook.com (2603:10a6:20b:3b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 16:43:23 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 16:43:22 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 1/1] inmates/lib: Set cell-state to shutdown in stop()
Thread-Topic: [PATCH 1/1] inmates/lib: Set cell-state to shutdown in stop()
Thread-Index: AddeD63ehohA24KrRpu3L3HRhVf/CAABPlyAAACfw3A=
Date: Thu, 10 Jun 2021 16:43:22 +0000
Message-ID: <AS8PR02MB66636AC2A9ACB84FB97589FFB6359@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <AS8PR02MB666395F0E1F80DF99676D9B7B6359@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <4173b69d-f0db-e651-db90-9a654fd3fde0@oth-regensburg.de>
In-Reply-To: <4173b69d-f0db-e651-db90-9a654fd3fde0@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.65.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac506cb8-1efa-481a-868c-08d92c2edc83
x-ms-traffictypediagnostic: AS8PR02MB7368:
x-microsoft-antispam-prvs: <AS8PR02MB7368F9C87EE896FF01240A13B6359@AS8PR02MB7368.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:241;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PRskAksbBBg6nc7HR8vKcHmw6MnEEyc1VeFDf1syW/4ssnuedC+WKqFYyxHLHu8oBxkNr6U+rqO8WGkhaQibYxTXk5Mhw1ksTNu6J8ytJMssverAGG2LLtbgPxtdb6Fx6mTk32zggT/rCVdOGqS4WyVtHPLBL4ymbNNaRkPKCZp4dYRQiw+MAm+jLfHyyD0dFSr0i/v6bJeseZFm8hG4p9uk8AC2pEwx6TBOLM6wlj2qPBctS8SHAsjTL2+SwcmxJGXgpYQ5eJUY1yqBM98acSxrj2TM7kKDhJPSxLJf4Jz6ooJFGRWGVZblvFWZ5OhmUvw0Z3MbLlTlMyx3KJ4zk68B6f5dtuIOlR1afVkDcEIJma8V2mhWop3qjdCH2nUAnnU/e52r2sDXa3W1WWGezItd3A6pArnIcvq5DVylQZUZMKukxpdLym0UxMbFqH/VTbVpxe29yYJqeYOuMMDVn6kHQ8RtvSNaXOKBx3tZmiqXA6BQr1GQhqwedf12dJKXEmS6wt1pib3Mbr1FKBP/RtCJPAhK6v2p3U3e4sinvvsRiAaMLhuPI3TWxKqh5D1+QfZx4mG4kV2cRCf+zfhs6HJTrSKXuYNTpN32EJ0VqL8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(110136005)(316002)(53546011)(33656002)(83380400001)(71200400001)(6506007)(7696005)(2906002)(26005)(478600001)(186003)(8676002)(8936002)(66556008)(44832011)(66946007)(76116006)(122000001)(66476007)(52536014)(66446008)(5660300002)(38100700002)(55016002)(9686003)(86362001)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmRUMXVaZEVQK2V6TjJNSTVqQ1pXK3hjVjV1MUZlVEVXN0VweUtUdWIxWG04?=
 =?utf-8?B?ZDdNdzg2Wk9ObUlrT2JFMjVQMUFJWnhueFVXQlRiaVJGbXI0cU9xaldnL1ZR?=
 =?utf-8?B?R2luN29lR3lGcDRtMkZBUUVaWXFWdE9nU3BZVlVEZ3ZHQXVQeTM1SXVSNXl0?=
 =?utf-8?B?K2VWbTh3WVVUY3JVUGhJSTVOdGhpZlEwWXFlRkxqR3o5dTFTY2VlbnhCQ2hS?=
 =?utf-8?B?ZGRUZXY4dUZNbXNyQUpTUSt0UlpxcG12R2Y0NjJNV3FkcmEwaVZkcG00Wk1D?=
 =?utf-8?B?QWd4STkzUTlHVU1DRFl2VVZlSXNQZ0VaeEVuZHFPWVpvaFpjODVLMTdNaElQ?=
 =?utf-8?B?S1FsM0x4S1B5bld4OVBEOGhnUXdTMmJrb0lCNFJ5aGh3OE8vSFRLNUp6QW45?=
 =?utf-8?B?Q0tOMHhtdXRwdHJRRWg2SGV3WnpCRzBLK25qdnVWbTJZVVRPTm5JWlhPV1dO?=
 =?utf-8?B?aHJoR2V3QUNPU1lhN045VW8yTWRtL0h4M2V2YVgzWnNkZGFremtWZGNhd09s?=
 =?utf-8?B?SXl0dkwwL1FMNURHRkRhSU1jbjNUK3hzVFdVQk8xM0M3S090SzZGOG1MVFEz?=
 =?utf-8?B?TDFYUVp0UnN3K1E2N0drNFFsUzl3ZFpGdkpSNHY3cHkrQy9Kb2VUYllSNGR5?=
 =?utf-8?B?amlJWTlkODBOYnhBdldON3pqeldvRnNqdFRScEpqdldGNzVXWGxlTjJ3YTN4?=
 =?utf-8?B?MlErS2p1RTVrdWorcHNtUENDTC9CS29KYnp4V2QvWUR0bkN4U25wbCtMSG9Z?=
 =?utf-8?B?ZlFpcnorZHEwMXB1UmRLM3RMbzBqUFduUDRGcTNBcE1pd1h5MGJ3cWJkK1Yr?=
 =?utf-8?B?NDRjcE9QVklYRS9DMEdKK0pOUWpmYTBzeEZiQ1dPYUFScFprbzhmRitNSWxW?=
 =?utf-8?B?L1dQNkFGb2w1NUUxeitCalREZWEwNTBNQ0xSSmhXeGNQMUp6RHptUUliU0tU?=
 =?utf-8?B?dmlkc0V5aE5NbkZva0d0WkltR0txV1ZhNjRIZGc1Q3BaR00zU01kMEJCUlV1?=
 =?utf-8?B?WVVwNzFKWlBrZUVVdTBkdFZYcTdPV0NCYjRwZ21Gd3NjUlZXRlFLTnR2QWJG?=
 =?utf-8?B?R3lxZkNqMlBHM21JU08vVm9ITDIyT2twUnh3WXhIanBVbzZoalF6amtsMXA1?=
 =?utf-8?B?M3Zha0pwZ29iWXA4TjlMeWJhYUhRcnZFUVJheW9XNHlOUFpxZGF5WFowanNW?=
 =?utf-8?B?ZVdxeEdvZnMvSFdHVTdVSzFCci9VZ3U0TEd2ZDV5VFpSQnRQb2tFb2NYRldh?=
 =?utf-8?B?OFpoeXh5TC9ieEkzZG94TmQ5cHRSaVgxaGxmOTBkUFhUamFjKzVWbHNXV1Qx?=
 =?utf-8?B?Qy9MVjVPRVNwb2NtbWtJTHdyMGUzYWRzSUUyTWk4R0k0SWVkVHFRWjJzNDVr?=
 =?utf-8?B?VGloYnFaZklrd2dzVGdyV1ZHYnBhSE1QcjArTDRrbW5LTm9VYzFzbFBxa3Y2?=
 =?utf-8?B?d3VzekNxd3pDc3cwbkxYWkpQQnZxdDJaclAyR3pmcU5wa2wrNXFGRWhndThG?=
 =?utf-8?B?VnR5VWlkZGgrMDhKMlpmOWNSNzgzVlBzS2ZHMWFUZkVXcHFURXhtVjV6YWFW?=
 =?utf-8?B?cXpWWVB1RitJUURPVklFVE1jMUZwemYyNlE4OGQ1cThINy9SSGd4RlkrT3Bu?=
 =?utf-8?B?Qmpaa3gyMFZocS9sdytzalB0SzlGVitIeDI5akxXZmtDZFNSZm1DeiswWCto?=
 =?utf-8?B?bmtaTjZYMjN2SENlalBpRWErODltQ1UwRTVVOUs5ZkFnc25JWlZGSUxscVVG?=
 =?utf-8?Q?cfck20plx7lL+2xbufddHoT1rsSDdY+wwe3DcCS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac506cb8-1efa-481a-868c-08d92c2edc83
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 16:43:22.7897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J7E5JnQWhfHJFkfFjATA7p9co51WMzw+Z+E8xgBolrxtzbYq7e8qehfA/KeCCIadnzD8OYLmcvwOvWM6QJzoZREcp+wl02C0DpdgPgPaWUIC+cOgNnczANSmCMEZo1SZcWKardwW+CfM8Th9zlB+ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7368
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=KmB8mYE9;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.6.106 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Hi Ralf, 

Thanks for the quick reply.

> -----Original Message-----
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> Sent: donderdag 10 juni 2021 18:21
> To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>;
> jailhouse-dev@googlegroups.com
> Subject: Re: [PATCH 1/1] inmates/lib: Set cell-state to shutdown in stop()
> 
> [EXTERNAL]
> 
> 
> On 10/06/2021 17:56, Bram Hooimeijer wrote:
> > From 6d0539fdcc4734cd0ae54df4b89df5a2664ac83f Mon Sep 17 00:00:00
> 2001
> > From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> > Date: Thu, 10 Jun 2021 17:27:57 +0200
> > Subject: [PATCH 1/1] inmates/lib: Set cell-state to shutdown in stop()
> >
> > Ensures that calls to stop(), defined in the inmate library, set the
> > cell-state to shutdown.
> >
> > This prevents the cell to be locked but unable to respond due to being
> > stuck in the halt() loop. It also ensures that returning in
> > inmate_main() shuts down the cell.
> >
> > Signed-off-by: Bram Hooimeijer
> > <bram.hooimeijer@prodrive-technologies.com>
> > ---
> >  inmates/lib/include/inmate_common.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/inmates/lib/include/inmate_common.h
> > b/inmates/lib/include/inmate_common.h
> > index 1c20a0af..250531ea 100644
> > --- a/inmates/lib/include/inmate_common.h
> > +++ b/inmates/lib/include/inmate_common.h
> > @@ -92,6 +92,9 @@ typedef enum { true = 1, false = 0 } bool;
> >
> >  static inline void __attribute__((noreturn)) stop(void)  {
> > +     if(comm_region){
> 
> I think you don't have to check that. Generally, you can disable the
> communication region. But have a look at inmates/lib/setup.c: If you're using
> libinmate, the communication region must be present.

Good point, you'd always use the library completely. 
> 
> > +             comm_region->cell_state = JAILHOUSE_CELL_SHUT_DOWN;
> > +     }
> >       disable_irqs();
> 
> I'd do it right after disable_irqs().

I should have caught that one. 
Thanks for the feedback :).

Bram

> 
> Thanks
>   Ralf
> 
> >       halt();
> >  }
> >

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB66636AC2A9ACB84FB97589FFB6359%40AS8PR02MB6663.eurprd02.prod.outlook.com.
