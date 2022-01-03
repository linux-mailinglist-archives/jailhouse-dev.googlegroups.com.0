Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWMCZOHAMGQEBNNDWDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D4482F68
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jan 2022 10:26:49 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id i5-20020a05640242c500b003f84839a8c3sf22474237edc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jan 2022 01:26:49 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641202009; cv=pass;
        d=google.com; s=arc-20160816;
        b=rf13X17dv5kAS0RzvRy5tLvZl1LpXGOr4CPsJ09awxCGX9CYHd+T27M8wiFQWwncLk
         KXKaV4tTYyvKXYaimMzwXWT/R+XoS+ZCWEby1lR72zbkJOS0aHB+j9vc/+DJEI2oEk0I
         YJI7Z3qsLRPq4YgsncU77hCoCqeCzAxgREVHyKOVrdFYHvpTeMChFm6hJ+SIKuFKEs3z
         l3+MZ2TD1jjRfM6aD+BVKJ87JdVCWFNHKXI0WAXouwGSThja3FEEKxkAxQM8ANmDMDQM
         je0cdjGQ9zVhvo29tnct/6K1qyZKslKDNqiPqym2GE5u/xHJlEr67+jUR9POhwlwoWGy
         5xgg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=VoIXwZjagqioDSSAiQ05bWMg/1N8MWAGcbkyRC1awxE=;
        b=qHw0XZWPOfiXtVRSdHilswmfdlcte9Nqku0ERMT9Skr1YP9wQqHXbIYOcufiade4I5
         ZBpKTD7RpN5/nwddQTud7WZ8MmiZHh33XWhGFRJwsW7XMXwsv5J4e7skCR4z0VwhRqRp
         m2vrCQyKssVMVQEdlOMLwNjMsFinzJ2bBHaTeObYQJTZYeZmCVVi9ann3nzM1qY9LVmU
         8l6OyfvX7sTMnuva2smyZh/NFQcHNkickVktNKfjXd6Tc1buhK2Rj/CBpHHJtpawUrro
         DkNOeJlhuIrXL9PHB6kpWbGeeBuUTez2cbD7JotVN2Fz7stm37IKh2IXFbB09wTH1XK0
         HMsw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=kjsD47US;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::610 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VoIXwZjagqioDSSAiQ05bWMg/1N8MWAGcbkyRC1awxE=;
        b=Pc+PViufus5aMI48S+fZk3L5w9aRNGEEnYENdkZR9WUteXi1UPRgNHaQILQjhioCGe
         Eg2jmg23PTV+r7TPK3Gq/Di0LArdG5oMEoYAw1sMEwwGLepeuW6djGvLBjw+f+IJTOCw
         +CyaT9Bk+gaEhHJrU4rS/ycJEOT5+5Ova9Mv/8hWPZ0aZTq6Nznd3ZVvtshHmbipBSv4
         1U2RGWJXjaDltLSF6lB954zHu3HW8Jtj0bYeNahD23nwazUszvdqbue/umMIV0so2eCp
         1wguO9sctAdkIXJKGhZ3SnnSiYVKA3UkAtbVTeYRf9W147Sy0bX3HnkVmNpRk676B/7R
         Y2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VoIXwZjagqioDSSAiQ05bWMg/1N8MWAGcbkyRC1awxE=;
        b=vY4V+hFROgW60b5nMxvsVajELoGtWz+KeewSEaCYP1WgJMRO1sNMQM1o3AVXBRSHWP
         kzW9lYat4a5LNsLw+N3g+SNqi8Jkbh1RFQHRdhZzNdvLbZrvyGZmZWyeVmZr7K2LXs1F
         obxBa8ohD8oj0YvyWovxUQ0PonBDEHnh1/cVombavbsIRPEAn8UgVyV0c3geNF1o4Pd7
         CTQz2GnxDVv/jx0lY/LVAVNj4AA8Th1qg0kF7bDvK724Q3w7IrtugQ8uylFTjqCViw73
         +pxQamvapfduaV+29JxegegNA0rNWwFWYDAwMhygz/HCdWZ8wQmvv2BVj7gg6LuPhBsM
         L0vg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533vqeHRlPGXJXSvVXi1kL9DMbma7j7b+eDHg/4tHkgke7ANqgWA
	yKzfuRwO2otNS6lS7NCmZXs=
X-Google-Smtp-Source: ABdhPJz0H485hhG+8meQD+XlFBHyJkB8Q1C9lL2yW1UY3BPERoeDf2v8laluFosG1/DDq2PkZgdDLw==
X-Received: by 2002:a05:6402:1941:: with SMTP id f1mr37709159edz.96.1641202009452;
        Mon, 03 Jan 2022 01:26:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4fc8:: with SMTP id i8ls10772091ejw.10.gmail; Mon,
 03 Jan 2022 01:26:48 -0800 (PST)
X-Received: by 2002:a17:906:b003:: with SMTP id v3mr35651048ejy.770.1641202008383;
        Mon, 03 Jan 2022 01:26:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641202008; cv=pass;
        d=google.com; s=arc-20160816;
        b=OlqbhF6jKp89v7tV7uZuXZ8AVFmg/t+514iXWX0g9cxI0X3+E2jmg+LBPqOyE3Hlw7
         aiMBmjK7HLzlYUOYj+E7hFoRuW+2jvnz9iNTtMCyfpcDwQhWfpkAXpeF/oXALtEHw9hT
         LPB8TZpSLKg+Hj81q86rTC6lfqjHSomQ+ojd2Sl7is2YsZPMbNC/0C3yeiq1gJSoaFhc
         86I9xDgIypV1trnA98FmsVYXHtm3bS0HSIyZKAD9GaliVVhQ9+Z6d7YcEgIgQpNDOb43
         xMNoBFQz+4dNkxO+9s55hc8+HZC3HK5UUA9m0LvX6L1Y392W0QWduzb61JEaqvmxODrr
         vb6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mTxGi1P9+ir8FWVnYwobjF3B4Q5jCrSWJFCEreTCPQ8=;
        b=R+4KsEa/85Jmijly6A8DrLRrrA+sXWirg7rm7nfnEDb9r8rHCiLXgDY7u6w5LDLgxg
         7DdoO321fJEPozmjvlFCqbkvzaZD9chEEiCDQXLYeWW5ZqMsu0rUW/FI7lQn62MRkrsf
         8CVPHW6VfXPUuw/42HGOP1lVUoPXTqkwQCnDoendIET2PO4buW53iaiE268TJtk/Mxcp
         aSkhazsY/93/wpCYKlLZY6XQl5XFAB37QdeRhyQvblCArokwb08KpWBusX6Efw4+0Ymg
         Tyj0qR3jSIq6EatuSEmnIYvV48FONCsKQroIMGOF6mxYNBXJs4hwqjqRSfTrOIDvyP9C
         KVxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=kjsD47US;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::610 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20610.outbound.protection.outlook.com. [2a01:111:f400:7e1b::610])
        by gmr-mx.google.com with ESMTPS id bs25si1925855ejb.2.2022.01.03.01.26.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jan 2022 01:26:48 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::610 as permitted sender) client-ip=2a01:111:f400:7e1b::610;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYLK3LSO3xT+5VYnFhbMAw2/5MdNxHXRUoaTxJl58xPEJm9VN/bGJ2ztQh0YuJ0lSgNg5nFyCqyE4oYjJUzOEVB4hu5wzhH7X5vvG2xRarM2TG61AF7g3mJpEXIaWsNZkjyTxWr7kbSj/VQSeRRnO4okkZ+RNqjQumsB7uTYQ4TWrRRmhFDao2r9NZL2QGuxSGlvqbbmZTKhxm77OCqcy/YiIoyPD62mjK5b2SLo7mkKCV5n+zwBDXM1xzdMqGsyd0zdpkmfc7sR74mtODijXHEPUPL7PZCupHxlv34YtuhStSCcwMGjqcdQJFODvWVvM+64X9avCpKmARl7XrnpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTxGi1P9+ir8FWVnYwobjF3B4Q5jCrSWJFCEreTCPQ8=;
 b=TH1tScvwvzu6GxjAzixIxyErkAw35u62wJOjDKJ0NeeaVjZ0xAGRUe5XTO7NDX1WRRtT0vfOjB4DHUhbfDVY43FTovecrY1sEaq/2xmOI3yLAc9tKgplEBzArMrJco0Gw04PMroTyms2Uhi+GeTaqI28BrkqBVTTGgwwSO3bITsy1oHA3t/9w3FZdKFomWZJkvxc0Ic9IP1DJFcPgGhv+9KU+1gtvOA7cTMinSLbLvaWr44CJOngkTgwPW1TbzNnF47Ihv6pRJDZqkKyHTYAA23a0xoFiF34rnw8dZ8qj7Lyw5NmurP1o40f+6qRCIZwdpamy8qC1d42EDvni13leA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0019.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:12::6) by
 PA4PR10MB4526.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:be::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.15; Mon, 3 Jan 2022 09:26:46 +0000
Received: from HE1EUR01FT007.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:12:cafe::ca) by SV0P279CA0019.outlook.office365.com
 (2603:10a6:f10:12::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Mon, 3 Jan 2022 09:26:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 HE1EUR01FT007.mail.protection.outlook.com (10.152.1.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Mon, 3 Jan 2022 09:26:46 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 3 Jan 2022 10:26:45 +0100
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 10:26:45 +0100
Message-ID: <ea7cad3e-2acc-f6af-25e3-da655e0f6cbc@siemens.com>
Date: Mon, 3 Jan 2022 10:26:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
Content-Language: en-US
To: jiajun huang <huangjiajun145041@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAAgAAEf4CAAANwgA==>
 <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAA>
 <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
 <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
 <2be13d89-1023-411b-ba9e-1d10044824e5n@googlegroups.com>
 <f76e76b332af3cef7a46e9048e96d6b50aa50fa0.camel@siemens.com>
 <c7eaa08e-ae92-4c5c-a57c-7ddac379242cn@googlegroups.com>
 <514e2fa3-9e58-5b79-038c-fe4ac21e803e@siemens.com>
 <f25df50a-e947-002b-5528-8d9793318aa6@siemens.com>
 <e3f8d47c-8a22-4abc-8977-e17641a404f9n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <e3f8d47c-8a22-4abc-8977-e17641a404f9n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8c1ac40-2314-445c-3612-08d9ce9b29d8
X-MS-TrafficTypeDiagnostic: PA4PR10MB4526:EE_
X-Microsoft-Antispam-PRVS: <PA4PR10MB45265363C5DC3373C9AF863A95499@PA4PR10MB4526.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlhtSDJHQnVjQ1MvQlBXUUxORkk3N3hTREpBSWJHZ1JSNjZQanVGaVR6U21o?=
 =?utf-8?B?L0x3M0ZtNVRmamlNVVpLMjlxSURXQStvYWVhWm8rYTJjZld6UUVoUStrMURY?=
 =?utf-8?B?eVYycWJZaXYzVUhrZzNsT0lPcGdFMmRNWlowbWpicFhYd3BBcnNrT0VOVmNv?=
 =?utf-8?B?RkZsaDNxeXJsV2dtZk9ocGlhb1dwRHZaRU9vWmw5UlZ2NEdrb1ZVbkh4NEJm?=
 =?utf-8?B?S3dIMnZnUW1qM2lVNGdCNllmWCtoMCtHdW5oUTZndEFGekRVMUVTa0VzQUVP?=
 =?utf-8?B?akc2UEM3ZlRoRFJGaktrdHpFZ09aQllFd3ZQbHZneXplT3FuMXZWbjJLRGZD?=
 =?utf-8?B?YmEzbC9IeGRwVlhMSzFoSHV4cVMyVHZaNDZtTGFjWkQzQzJNTTEyUzY1Z2g2?=
 =?utf-8?B?WUZkcExzVlNCTFlBY1kzdFRSRDRsZ2tCRFpidHdYT21hZXkxNzdZZGZMVnBm?=
 =?utf-8?B?MTlHNm5YdjE3L0x3end2aDY4bU1pQjVZNE05anlTd0RrY2w1c0FkUy8vdjdF?=
 =?utf-8?B?amJRNTBFWTJILzBWOGljeUc0U2pVM0p0SlFLb0t6Qit6cnR2eDVtbEJmM0pP?=
 =?utf-8?B?UTVnb1hEVEVEbjcwblQ4MTV0akxTNzc3bG9CMGxoOXpyWXk3OEx1Z1R4Rzkw?=
 =?utf-8?B?T3JTZXcybktqME5xeDV6MGxpS3FtanJvUExjMzVIOUo3dHZJSjNvSkhmZ3ZN?=
 =?utf-8?B?bVdhaW1CS2kxU09VMGtaOENPME5mU2RaT0NweGw2UzkwVzB3djZEMU9Ic285?=
 =?utf-8?B?TEtUMnJRVS9rejdTTlV1WGF0SWFtYnQvaEhpNkFOa2FtQ1pKQ3l2VFhtM0J6?=
 =?utf-8?B?Ulg4RXlkNktRR0VZaEhaMzhsckY0djRZS3Q1TW9zb09MOXorLzdiTUI1c0xM?=
 =?utf-8?B?SDB6Zkg2Rkh3RmdUMXBKbi9VaUJldC9BSllURDBSTkwyM2FCK1VlODQ2cTRx?=
 =?utf-8?B?Wm9TL3hhY1BGam55dmh2MVY2ZnpFcXEraCtYR29vaTg2ZERkejlmTTNpenBl?=
 =?utf-8?B?T1VXU2Q2cUNaVy96U1FEcXowVVZsMWFPNUJQZGppQ29vTCtXWGdWWkJ2Zk9q?=
 =?utf-8?B?eC9hUVVYdXRPLzhKc256SHlMSGR2c3pnNTgreWM4dHVBT3Z2QmdsWTFlK0Zi?=
 =?utf-8?B?dWxFYUZ6WUlWdGFnclp1U0hmcXR4RU9NYzBKaFF1VmpUT3ZlN1NGeEVEK3E1?=
 =?utf-8?B?U0ZkL0c3aXN4Z042a2dxMjRra1QzKzlnM0dSR2x3RnpkeUpyOVR4OVpMenRD?=
 =?utf-8?B?TjRwYTBScVQzQ1B5UFkzMDhsNW40TVFoRjI3dXBSanByYWp3dz09?=
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(36756003)(47076005)(82310400004)(8676002)(2616005)(6706004)(956004)(44832011)(53546011)(110136005)(70206006)(40460700001)(2906002)(36860700001)(7596003)(7636003)(336012)(31686004)(70586007)(16576012)(8936002)(498600001)(83380400001)(356005)(82960400001)(186003)(31696002)(16526019)(5660300002)(966005)(86362001)(26005)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 09:26:46.6299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c1ac40-2314-445c-3612-08d9ce9b29d8
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT007.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB4526
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=kjsD47US;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1b::610 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 29.12.21 17:13, jiajun huang wrote:
> Hi,
> Unfortunately, after I tried almost all methods, the network still
> cannot be connected. But I can be sure that the ivshmem-net device did
> not receive the interrupt, but the shadow device that also uses the
> ivshmem interface can receive the interrupt normally, and the state
> change of another virtual device is detected.
> I want to know if this is due to the kernel version. Are there any
> kernel branches that you maintain yourself?

Kernels with required patches can be found under
https://github.com/siemens/linux, eg.
https://github.com/siemens/linux/commits/jailhouse-enabling/5.15.
Reference configurations and integrations are available via
https://github.com/siemens/jailhouse-images. In particular, there is a
pre-enablement for Jailhouse inside QEMU/KVM on x86, including ivshmem
support between up to three inmates (root, linux, bare-metal). Using
that to derive your nuttx setup from can be helpful starting point.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ea7cad3e-2acc-f6af-25e3-da655e0f6cbc%40siemens.com.
