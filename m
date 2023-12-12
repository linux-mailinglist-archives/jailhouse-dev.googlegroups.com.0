Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBL5C4CVQMGQEDTYIKOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id DF70D80E517
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Dec 2023 08:52:17 +0100 (CET)
Received: by mail-oi1-x23c.google.com with SMTP id 5614622812f47-3b9fe44d7dasf4927403b6e.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Dec 2023 23:52:17 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1702367536; cv=pass;
        d=google.com; s=arc-20160816;
        b=CuKJKF0RkMrOu7QDE4A986pkb7Dhngs0MKbBNyiq0U2WaL2jNZ6Hv6+sbngnXIOdoM
         a6j4eX0XSSf3l5dtgPtvoHxEVT/8Dy+r2nG0aJAB9pZdqcPBYty2Q0nVNuZ8H84TVq5d
         727WW+NMTB2b1A++SSBF6p75iJGQu40EEDz5x0doAERvjMs2g8yOmfjkONG3jXZ/xbF6
         T6FeZlMy5RVl/6Hic1dy2DU6BAWb2KXSs1DXguFeJoRNEFzDb/37i/wv93z85TRmV963
         +h2jTiIMhXFHH/IsxOuohFiBFPEnwCJXHQ0sOX1eufDgT9lxlh/dah6x3L2SX50OJjGi
         ZVJQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=3jxvmo0LcpmkLbT2QxBYYC07Tfoue2O9LiklSzkyt3E=;
        fh=6PUPFVmXZNn3WoJd7XXPuOSCgODM5J6nSVDgFF5ZzEw=;
        b=JdUR+VzMx08keMNjWa2NTKJH3fh1lLxtW11Cvpx5vts599yXoJQFozBxoFKbEDGfOL
         nqjTk+xpyC6kq1O4v6q7oHyMVMrkAiu2Rp421D1wPKFlIuNzD9vdXTXb2dWLb0TuUcOr
         MiAqvah7SQmN0UXRpLRIp4YtibzfUkUehj6v3fIGrFolEOV/9kW1lywlZV861/j91QAx
         4mTb4J34+s3N+oV8W/lmFU3oqvb2Kx+fclLmWa7QKOS5EtVaLlVPMmHWg9DOQri75Ldi
         eN+lX4qiiBKEqrhE2DPk8B7WGJ2JD+vHwy1+DckS/3LUym5Tr/GEtjbZVOs2uRuRti4D
         /CXw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=gVn6kDmO;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0e::618 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1702367536; x=1702972336; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3jxvmo0LcpmkLbT2QxBYYC07Tfoue2O9LiklSzkyt3E=;
        b=h8fBOTuUqW4gxEvFaA+Ez56fSF29iiP9xQa/vtOVEx04aAgCbTOL4hxYdeIK0Cp25m
         79VvRbdAa/4nPz36+qbMKDQA/7TYjNHIhOR+YMfEUbCOOpEdd2iG2IMfv4w+oqAgqJ/I
         IiWC8ObuqNU8ulWHwZoMHKmoYQNzXSotaLgmElv2ZH2plt6D2IwVBR048XtOb9RpXI+H
         QoLnstdPdv4VoQsUe3F1AOD76rVJpSBXZKoANr34aLik5CdxcAchEi6EtLGfq7wvG4ZF
         R59fQ03Km6q0lHnGLg0XhYEjNgJaZ/j8PCmCC4HNjNuRxDHB1KlUOrTMbZq9baeoL7It
         xDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367536; x=1702972336;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:x-beenthere
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jxvmo0LcpmkLbT2QxBYYC07Tfoue2O9LiklSzkyt3E=;
        b=J7pyg37/hv4xyM7ckMlgN281G/JoDCPxiG/WbCJqLvQmW+K404LAEZdmdrRk/5Z5Xv
         nqD7S0lHMGT+oSji+weSx6STYdo3qXJZcQxaWTEQl6nQ2oZjRWhh32mXHNKtdr0z8y/G
         pwyzr8tC+rJ6XCDUNqVrXvjrFuOJmxSW5QD3FwJZ4vcEIXw7lvT3WJep9eVAR9vVS0An
         MwgKSee8m1ibVezNtV6VIwuyynTN2rZpqML42iz+sUvEy0hwJBhKRzNoq6Aj38efW0j9
         6RMbofs7WXo62USsTwa5k/8GkhOhaQxOgMwAWeAGt5b+/mo8Q6f8EV/lv69bJFdMKHCH
         TzMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxTOak2Od++USSjcPARtgCf2EJpD9ksNU9LahxobutoiAiUUS95
	JIlJAlrcbVEJP6YzvCMnk4Y=
X-Google-Smtp-Source: AGHT+IHrQzho7Xr2SSPTuzOxpd3XusFU6YXlilGhE/qS1ig2hM1x+BqT6VSD12s3NgfnK/U6kqr+1Q==
X-Received: by 2002:a05:6870:890e:b0:1fb:75a:6d4c with SMTP id i14-20020a056870890e00b001fb075a6d4cmr7557400oao.115.1702367536146;
        Mon, 11 Dec 2023 23:52:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:b90:b0:1fa:4e81:9897 with SMTP id
 lg16-20020a0568700b9000b001fa4e819897ls6859473oab.1.-pod-prod-01-us; Mon, 11
 Dec 2023 23:52:15 -0800 (PST)
X-Received: by 2002:a05:6808:d51:b0:3b8:b063:5046 with SMTP id w17-20020a0568080d5100b003b8b0635046mr6501486oik.71.1702367535379;
        Mon, 11 Dec 2023 23:52:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702367535; cv=pass;
        d=google.com; s=arc-20160816;
        b=tXDcbEqL9fsutckrdpPsUR9OtBjb/tMbE1Akivh6IU8M2klmrtmfhD1vX1Piv+ODZV
         AuLmkj0bsQezafyMV6Uh5epz1Tef+Eyd4+Ednf5fFvWcWwPMqlKGtxBK9IuHz6zr+u0X
         HT8Lx7kCzrdYcgkYaOEjbk+P9VDV+oOQuqjwIDqTxKgPZfWROb70gY5JoixmkwuFxe0r
         EG1jXiYsMpNJkN+RtvX1z4oqHM3rCWrwA5ZOko648Au5SqBYsJ47jZiPJjLsDYSwwU+2
         t6mzJdhN/QwvyEihaHtD4lpFDcyvnYIjiDAJyMkjnu6bl3WISRxpK6SXBpXbvXUfxOVx
         VNbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=4w2XqNibo+C1H63JcUB4r6PgFb8Nf3L+MFsx+QPN0fU=;
        fh=6PUPFVmXZNn3WoJd7XXPuOSCgODM5J6nSVDgFF5ZzEw=;
        b=eQQHv2Q0ZUVXJzq9aYL2lgILkv2Ek+S7upWObw+K6Xozr4tGJm+RwX0m36yD7KGxXI
         5D/7aKZJs2bwZDU/NiEUcMNsVgLrl961VbBuc07yBjCM8OR6SXZEr0EgGw2TQI4H6KIe
         k/gi6nAVilokTegLQExH0ZP9xZuUY13wqatlfNI0wDa9f0HLivAQlg1t3mjbLR3lHZLv
         pBQ73BizItE0HBypRbBodRYUNNuZAbj8RDofcRvETFD4O9bzHmKNKOsLOrQT+KvkmKl4
         tRa9OPDGKZUtNyGFvaR05U/s4fVHqgVOl/7fXWfq77n8iR021lQirRL2KTvZxL6jWZDp
         3Ziw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=gVn6kDmO;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0e::618 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0618.outbound.protection.outlook.com. [2a01:111:f400:fe0e::618])
        by gmr-mx.google.com with ESMTPS id s18-20020a05680810d200b003b9e8957b1asi630540ois.5.2023.12.11.23.52.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Dec 2023 23:52:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0e::618 as permitted sender) client-ip=2a01:111:f400:fe0e::618;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LL5rO8gLjH5PI4TtdS55ruxsP1kLJGN1ZfR/Z0NRpkAl2R9X8MROvFlvWpmEo2L7LL/7rr80NL+1u5T0HKaxg6EPLLKFIGkGoWunTTuUI5Z/eU4f5NeaHwXCBPjJ3y1Ro/1crl/czeIR6IqiD12GFhh8NjZZ8QYE/vg1J1Gx6MoEHm9Tiyvrj0cU6G24d+xJk4BmFQXAJApMFvZ4g8QvSrq26/6dScDRcz7LhKBlGr9ry4gN3H0AJBqzxtTj+sr+CSRu4D6RUGA5lgjSIpjI0gtZs+tJ8bylDTA9n/QUkJLDsn7+yw0osAsi/MvIUDoQyrewV0XJAFbINtGR2ApWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4w2XqNibo+C1H63JcUB4r6PgFb8Nf3L+MFsx+QPN0fU=;
 b=IeUej3EWnn9/fUsi1wJaifTU97+6tpq+u8YhIp7+GzAjg1GdMkFALgzGG+lVBkctHMibjWBy4UIiQ5Zmr40+nr2AJXwfl5dsqSLKtcsElIsDkMbOS9X6zRqyajn22QZbWSE9oy2GIc6uGjHzOwk2Xx9S8JN2KfaxwWdvbJcgWXF4LQNhCLS5DTj7CfrW6F4PhEgGGFZ8/tvqb4HkgqNZVCczYgy6WbQnkjWmplopziG8IGEI7Hlod6LxkB6wtDlU4vusH42YD70DVtb3WhqpZWEElAY5uXHaE6YNDppp0+OP/CXSrV1/VBv42LeVDmqOhV+zn9nToEVsxjR4EY3v1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM8PR04MB7907.eurprd04.prod.outlook.com (2603:10a6:20b:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 07:52:11 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3%7]) with mapi id 15.20.7046.015; Tue, 12 Dec 2023
 07:52:11 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alex Zuepke <alex.zuepke@tum.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, Jan Kiszka <jan.kiszka@siemens.com>
Subject: RE: str wzr, [x1, #16]! triggers EL2 unhandled data abort
Thread-Topic: str wzr, [x1, #16]! triggers EL2 unhandled data abort
Thread-Index: AQHaLM9+zakaMEzIfEymK85zNsSHVbClRY0w
Date: Tue, 12 Dec 2023 07:52:11 +0000
Message-ID: <DU0PR04MB9417F5A4D0C801E59F32E6F2888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <DU0PR04MB9417D1CFA35D02279D40EA6A888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <22a09591-024f-4a02-a18f-793094d81d45@tum.de>
In-Reply-To: <22a09591-024f-4a02-a18f-793094d81d45@tum.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AM8PR04MB7907:EE_
x-ms-office365-filtering-correlation-id: 729c7f50-9118-4436-e6b2-08dbfae73fce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gmkn2UPwLPPdD1vX+fzwirBkLNZU0VncB6vPPqcd4LmmNNItLOVpbIiXGUuUipbNOwdqlMLmAmNI9HLPnJUSdm7bWvEDe9ORiQvLedSUBGfV+WqumM22UsFxs6lYaGXxaGLTnRzsQ4nzbt11QrnFcnGsHA91ih+odRRDcUH6BkyDR0LjieW2wi+ekOL5Ya1ZTDp8EtErbkXeWK24HFNxqBYQQmryCUmC4VMt7K1z7aCCUyt7sn88irhekHxeNdh8WgwYn0TOPQ+34emUkTknP8zxtbsLLPcO7M+7GAMWSGEd6Y2sI7gE8wx4m+x1jJ5slOmIz2UdsCfv1GYEKqis5DNa3rz8DTTUcty1sNZooRjYsYkjHVL7yELpWCfc1qzuX8MIc+x7fbsg38H3zgGYKVWM7Y+Awlw23AQSTX3aGAom/HP1RIOn1i4Z6FrImMejZRqKKNY12gwLqxfyAgUdei3wjjBZQC4WxdHXABRvq2I3vCf0rA25MwJFZwkVhlHZQZ7eCSAjk074ezzRRWSLXmgosz44addE1ZXjiEw+fH2CFlMqPkLf8aDlZUkAXFrfl76C7NoWZi0QfzZpUTs5/6MYvoE0PmLI8JN+R+MOVD96NOD2DnX6fgtcmGJkxFkM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(9686003)(26005)(478600001)(7696005)(6506007)(71200400001)(83380400001)(4744005)(44832011)(5660300002)(41300700001)(2906002)(76116006)(66476007)(66446008)(64756008)(66556008)(110136005)(52536014)(316002)(8936002)(8676002)(66946007)(38100700002)(122000001)(38070700009)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHZtbUhqS1ZNNEZrWW4yUzJFVGNRK3RPN3R4MHJqQUZGYkEzR2dCVS95SThZ?=
 =?utf-8?B?bTZKaC9pdVJoMVhxakpFMXh6Z3FqS25Oa1J5WjBoKzI5ejN6T0FPYXZ1Y2hM?=
 =?utf-8?B?clhUS1F6dWFCUm9SMy9Mck1xVXAvVVpZVithbmJnR2lFNC9CM2szTnkwMy9C?=
 =?utf-8?B?VVBlWGMxOXQ1MGpzQTlWZWV2bTRXSFZaNjFhcFNMMzJSejJYKzJ0THhnNVdJ?=
 =?utf-8?B?Uno5YTRTSVRXdlVWQlZwZjdSNStmNjMyckRjVFB0WWNvbFBYSGduQ3VGcTBV?=
 =?utf-8?B?WjgvZDF3ZnN5SjlNZXBuZjNVeU9ZejZOeXBRVVBMaUVJNkcvRGh3N2lmSjNC?=
 =?utf-8?B?SGRiSnBtK0JwSDZWWlBWY3g0UE9QNE8wZVN5VEhhME9ESW5KUVZsYWlXMXhX?=
 =?utf-8?B?bXloNzFydDZEZ01aUEdxaVFhNmQ1TFpNOE9VY21jeFd1eEMxUTc2VFpzaU9q?=
 =?utf-8?B?djlpS2dBdGxjVG0yVVBTKzlyem4rK2FTd1BwcVpkVVhCb1R6UllSWDh1Q3or?=
 =?utf-8?B?SENpZmQybXZ5UUFUN3lPckJTTWRrbUo3YUVmNjBwNGZvSkVNbkVkelVKZWdL?=
 =?utf-8?B?dytaYmw3ZHVEbG9TU1VoOFdyZFYyZVpBNnc5ejc5RFRncjVBT3FPWWhjb3JP?=
 =?utf-8?B?ZFFXUTNpcjJtRC9VdjZNTzRncERNVXhWcDdlSWx6L2hXWWhmeHJ6Wm9qOXJL?=
 =?utf-8?B?Sll1bFA0blBiVkh4T0JEVWJZMUIycU5xbXIyU3kxQngreHIvc2hub0xKZFVB?=
 =?utf-8?B?MEQ3UENES21kakFoZVJTR3orcUY2L0Q5dlhqWmU2elI5aDNkcjNSSTh6cjFv?=
 =?utf-8?B?WDNCOEMrcll6VG9zc1Joa25SNXVOUTFzRTRtWEJIbU9ySHhIUkR0M1hkMFN2?=
 =?utf-8?B?T3hXUWxHREVqT2k5aTk3VjBQU2xudCttbDVkRHUrUTNRcFBTcTJWZjJHZlZi?=
 =?utf-8?B?OVpwSU1JRUhwRzhnaFo2SGJ3TE9JNHpidjVKUHEzNTdHMWdlTWJzdUloNk45?=
 =?utf-8?B?bGtoamdzV09hK0VqZTI2S3A0elorV0pBUkx0b1drK1VDMlBXZ2dzMG1XcVN1?=
 =?utf-8?B?U1F6UzNQVER0dFJmS3ROVjdwM0xUU0F1Y3lydXZIV2hkSlBRMm1VVlNBRGM2?=
 =?utf-8?B?cTRSRzNGZFdPbmM3YS84NVgvY2lWV0VuSmFVdkN2ajJrNVc5NjNrOUptUTJv?=
 =?utf-8?B?TG1INEtEQkxPWGU0dzlYTjdJMTlScHRLS0J1UGtJVFNpQUxjaVp1WVZHcVRs?=
 =?utf-8?B?anByWFQwMEtDdjhGWVZVOERkTWQrL2N4Q1FLbmtQVzBEL0UzRE9LcUN4VmtI?=
 =?utf-8?B?ZEl2Qk9MSE1yeW15N29GajhsTWNSekJLWjN2aldBeS9OZEhucFlBSXJiRjBM?=
 =?utf-8?B?QkgxNWt0UWQ1dCtlTHNJVms5ZDc0ZkNPcGY5aHRZbTU2clBrbDR3MUJGdVJ0?=
 =?utf-8?B?cnR3YlpSMEwvYUljRGl5ejdpa3hYNmZNQStvc29kZU0yUzZBOGhkR1A5TWZz?=
 =?utf-8?B?TFNZa055bmtMZkN4QXcwbXZ1dnpDM29HZkVrcy9kOEt3aHg2RnFuUWdCZFFM?=
 =?utf-8?B?bGRObXNTRlFQUXU4cUVCU2ZEbXlwcWlsLzQ5bmhmTWlFR2twc2dZMVFlNlYr?=
 =?utf-8?B?SElKUFJOalN4L21TemRJOFRhV1dwdXAvajZUOEJWY0NpWklsUFhvcG1uNU5v?=
 =?utf-8?B?aDFHQ05yRi80cnJsZHFRQ1pBU2pBT2JCc0ZBUXpLMWN2RmpWcVl1dlFNMlpQ?=
 =?utf-8?B?WEJRVW9NekMxSFpmWHhkTzJrUW5KdXp1dVU4RnpzTDF0S0s5aU5nbE9lanhk?=
 =?utf-8?B?c1AzVmpkc3U4U0RtUkdwbG50UnQxU0VtbURTc05oVmFKenZWQ3BLbHhTRGoy?=
 =?utf-8?B?TDVxUHMwSlU3QWlJdUZRYWlGTVdiczBKMDJXczVBUlpubHhtTlE1RnBIdk1a?=
 =?utf-8?B?cVRoNHNiUlJvY0hjN25uZkprQnJ4OFhoOFM5WngzbjMvaVVlQUZ0SWJCQnR0?=
 =?utf-8?B?ajh1MlMxaFJDL1NESHRLcnVWTmVtKzBWUnZndHk2cm91YU11MElOUjU4MGNU?=
 =?utf-8?B?OUVUVk4zNTJnRUZOQ1F2RWhUNmE5eGpiTUFaZ2xXNDM3eEx5UjJSSVlzME5p?=
 =?utf-8?Q?dEIY=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729c7f50-9118-4436-e6b2-08dbfae73fce
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 07:52:11.7783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIBZ79HZ5TEIABJg1L2opW8di15UrdhsjVhu95Th986jUYT0f8X0AX49zXhl8u6yKZcKvO5HgiBFsiLgmEt16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7907
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=gVn6kDmO;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f400:fe0e::618 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

Hi Alex,

> Subject: Re: str wzr, [x1, #16]! triggers EL2 unhandled data abort
> 
> Hi Peng,
> 
> Am 12.12.23 um 03:42 schrieb Peng Fan:
> > Hi All,
> >
> >
> > I am running jailhouse on i.MX9 Cortex-A55, and meet an issue.
> > " str     wzr, [x1, #16]! " this instruction in EL0 triggers unhanlded
> > Data abort in EL2, with ISS is data abort, ISV is 0.
> >
> > I am not sure why this instruction trigger DC with ISV 0.
> > Any ideas are appreciated.
> >
> > Thanks,
> > Peng.
> 
> The Arm architecture cannot provide all information in ISS for instructions
> that also update the base register.

Does ARM architecture TRM note this? Would you please share me the
Chapter?

> 
> You need to change the code sequence to:
>   str     wzr, [x1, #16]
>   add     x1, x1, #16

Hmm, but gcc generates "str wzr, [x1, #16]!" from c code.

This should be common issue I think.

Thanks,
Peng.

> 
> 
> Best regards
> Alex

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DU0PR04MB9417F5A4D0C801E59F32E6F2888EA%40DU0PR04MB9417.eurprd04.prod.outlook.com.
