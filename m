Return-Path: <jailhouse-dev+bncBC44VTVY2UERBTMF3KCQMGQEF3J6S7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id AC02B397A4A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Jun 2021 20:56:14 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id y2-20020a2e95c20000b02901263b1ff034sf2417570ljh.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Jun 2021 11:56:14 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1622573774; cv=pass;
        d=google.com; s=arc-20160816;
        b=im8k5rtmFM6bCg36R+/lMETiqFt3CGyudvHF/3XsQv/5hsslDd3RS+ZCSJ/RXT33x1
         ecPAJHu6pW4f3CB/797owrosNZKImKh57L7UU10UMoyUN++5Sfr4QufICrDp1NUyqOOM
         MUb1Ek5eWAfd0+rFWIoAkE+cg2p0ciL5tNzn8FORbfzQtX8nXyUWQE0zK1eS7Fe/dWir
         NWfl0b1P9GBzlmpcODjXWy5NzjEsaJ1k+uihRU/sWlxq4eqNZS4/x6n6P90ivHon7k0i
         KyUtiw/54DMfTdO/0iJf7JjUkw1G9AcPNppVn8rKv8VF5rqOUOqx5vtyennyx/A74U02
         LgSw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:in-reply-to:user-agent
         :date:message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=oOw8X0HpEdooX+raKuJSL/UWN4qFfK5v1hRppUxebvw=;
        b=pYFDLpN5Hd2Ln8Cu00I+iiu3uAlRQ/4xTcmo+U+HsflTU4bvWu95eDdBI28Jdc/9wy
         EpYyF5DWN7PKbXSC18bMReIC1qvUGT3P4HazTVg6DLyRP187+7MFa32oJ3t+ffva7EYN
         77lyAHvaCWenLDCI2cExosz6pbw62aSXQjfUQsAnWZVhds4+DwyxqzACDIl+jcgTnpnw
         AwfTLRMeZvSITFUo2OgnxglsMhbkIxHcLQuwC9cC38fahLKpPm7MRtbHy/gVonMXRvUT
         K7DzTvjRyW6H616NcK/Pv7sbW1/MORdKE2nnESQ4NHdbZjWMyKzTbWx98TbyblOWIuV9
         POIg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=FYlK3fqP;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.6.48 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :in-reply-to:content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oOw8X0HpEdooX+raKuJSL/UWN4qFfK5v1hRppUxebvw=;
        b=FkCeh/qR5/m7cn5IicVjKRlTbz6D5CyLFiMzVHIPVESKej+7fvWp6QOSVZ7PP6871j
         RPGioFUi0+BXenXufy1w/mW9rK3xZghV/WC0cKMK0RTwgDJdXTfOdPzSOz21OomDmnmm
         wSp1H9j0QQv2R0s53p/IKoYZTj22vaCEkcCibzkf0WsHM+LmcQYvZFWMFUvUAxpdpJat
         UrBTjiDuJBgHw1AE+i8gTIToJ7dthreeib1AyKSMNNwpZ+SmJq5vyJEe/Z4hEQ9cesSq
         Cset2FSdcUuRzX/ECoqHEKR68ld5jXpePopvRHGKuV/RJPf4J7LBjs/6gima557GcWDf
         9SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:in-reply-to:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oOw8X0HpEdooX+raKuJSL/UWN4qFfK5v1hRppUxebvw=;
        b=sx1OLuEmd++onewSPvbk/jwsPCcXCxOZJRwPUMIDpawbRhkvHiHd1pNaryLc7/24kK
         0WjALqFDycnpg8g14I7QjoK1AFPMco/dbV/pgSs6NnEpvpXYP76ovpmxEyNq09r0TZEn
         JB1+nZvNb6Nj86pGB8yLc0XenZRRWXfLIgVPIAPK1IP8XvS9+cZY+A0dmFmrxrSID/4G
         opBrNJyoc5FlyJLv90CA+t+JB8pSLxnRasAHr9sYADAPij2Pe+CkBGyXlz/T0kh80cNq
         xvaK3XLJIWW1KSCyzXGTxBEULsOfOBMEBNIXll2dbec2WtiFkiV20B338+DfycpmnbRb
         VZSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533iKSt8Anpxz1wOdwS7qKPLOGo8FwOMD5SSkVwviZa8+l/Pcx3k
	JYnLZpvGObgeiLu1y7vI8wk=
X-Google-Smtp-Source: ABdhPJxfssedWj1kl2lfIolWDk7deajoCAeuS5PctQzUEZk41eizgmsSTUedQzNVwTnZ9H6wjZ3aPQ==
X-Received: by 2002:a2e:390a:: with SMTP id g10mr22371133lja.80.1622573774229;
        Tue, 01 Jun 2021 11:56:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9806:: with SMTP id a6ls3419360ljj.10.gmail; Tue, 01 Jun
 2021 11:56:13 -0700 (PDT)
X-Received: by 2002:a2e:9c4a:: with SMTP id t10mr22882964ljj.307.1622573773177;
        Tue, 01 Jun 2021 11:56:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622573773; cv=pass;
        d=google.com; s=arc-20160816;
        b=0WORAyyI06mQ6U2np3F8hLPZ6I1EeKfKadZhU8PNRC6k8+L+n94nP6pWCWIgfKLKr7
         F77UM4EXVFP6P3xI+/z5OmRLjsQxFF5dN7/6UDarmycc4MYTdef1Iexm4zKQtlsAmMC/
         rmlQ906wkzxtkFpGBG5jvTAnyPbHsL/5JEAG4bgI2eExZON15NKqWxtNH5Fo4ATktQWE
         IDXzAVoa3faqrqDVEO6UruFN7mOpnQ4FFXGoj4HkWlR18wJx0Jcz+APaiiP0tYH3gxhF
         lPU/8ckJA7JMTWhMOYJ8P7ATREzM3Ep2T60TIralC8NBWjNLRYY0EBCe+3QgM8rx15J/
         QuoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language:in-reply-to
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=kgy6DL7EPvpuGov9CcX7GROMofD9vpj3WGyz9+246uo=;
        b=kkWBHnlLfQMMCD0QnXJbcsHNB+aEW5ax/vRk3B1uCGwm5gtzj06xtEZXK+KYHf3yd1
         gdFj07FvRDCH+5xToRtmINH3xoeSQA8nLluCdMufuwikBblURCoMNbb6EgMAq1G6atqC
         8W1Kt06qVFLAuSLgq+SiTh6wqKfuYc6xz73OXO69ypYcpKbSk5cwjZoafE1Fi0mIHs1Z
         Q6yjBN2440IMjS36FiCMhm+xGNMhtwtu2sP1ImXa0c+MfW9yTuOZBf2P1GLEHgLqCf26
         Fp0cMEy39fntcFmopQRLr/PfL3T1QXwIbYM9ZELm21xcTVWZnvI5H3GuQKcCyz/tt1Oa
         81Gw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=FYlK3fqP;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.6.48 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60048.outbound.protection.outlook.com. [40.107.6.48])
        by gmr-mx.google.com with ESMTPS id z2si737906lfb.13.2021.06.01.11.56.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 11:56:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.6.48 as permitted sender) client-ip=40.107.6.48;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nscF9JXCCxpJX6r78V3s4ONG7Hh0TDISkh4sjL91db9fd0CxQE7ioy0+YTheJPqO0yuMKVO8bvMsHKUfnHyUpl0Br/xm/udimbs0iaw+F8nbistTJiyIH3592RiBUXsRWmjBRmCkYJ50WxgMkzPydbzCuaP2NkraaDClLJizfWVSS74BL9xkYvj/yye4waOYtutETK8aycN9yFmTjSOOkHgkQxNbFWFMUspssg65IwACHoRVhHPS3aZ5ogzmtGBOysxYKUeu0uTHCNWYgKlJn+2o52SugsaZ/F4w2ObfovtL064z0wCb1LyhMjJGD9zIvqd0wFjNFLzTzDnj6LFomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgy6DL7EPvpuGov9CcX7GROMofD9vpj3WGyz9+246uo=;
 b=mQWn8xXU5zeDbBFqAGec0blHGIO+8bzf81N+Qo/2UIoPU6mwfoKHsAfdpfutENWPY7w4uKFw3dGJRjZ4QAhNIUH9OhtGSwoS7cSlOQpoaBYDyjPr4+0cNFjwAv1EFLv+72VzDgft+M13KZLbCUWggyUfJ3ctOkJ0qHP8FNTThwR7OMeOy+Gsg09NgFurLTA9F4CibhDMNe+KYdZTxT7PR/hd/upiT4Q+4GpVlWUJL1YPB5IfvT9NojCWJ9M0WaPBXsGNu5N9RLi8ErOu1hgwi/Ul8bDHh8SQI0mzTywQMV6TzKamu+ncvQqLTo5OMNxDJDUUAa73W5IWADdfhOm/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2932.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 18:56:11 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4173.027; Tue, 1 Jun 2021
 18:56:11 +0000
Subject: Re: Installation error in Fedora
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Henning Schild <henning.schild@siemens.com>,
 Prashant Kalikotay <prashantkalikotay1995@gmail.com>
Cc: jailhouse-dev@googlegroups.com
References: <CAEoyBwCDWM=+iUXzXtECTpugFprTkMSj-P+goS0R8yOizZTYdg@mail.gmail.com>
 <20210518154123.18b0ba78@md1za8fc.ad001.siemens.net>
 <c70b4564-a830-5e40-a7d2-ced34578027e@siemens.com>
 <eb84ab67-7711-841b-6d7b-99718e1fecd3@oth-regensburg.de>
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Message-ID: <cbfe2115-6595-4a17-f400-86efd51028d1@siemens.com>
Date: Tue, 1 Jun 2021 20:56:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <eb84ab67-7711-841b-6d7b-99718e1fecd3@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: AM5PR0701CA0002.eurprd07.prod.outlook.com
 (2603:10a6:203:51::12) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:810d:82c0:38fc:e180:2248:7590:2b4d] (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by AM5PR0701CA0002.eurprd07.prod.outlook.com (2603:10a6:203:51::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend Transport; Tue, 1 Jun 2021 18:56:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2ef047f-6ba9-4079-b894-08d9252eec60
X-MS-TrafficTypeDiagnostic: AM0PR10MB2932:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB293231CCC72FB6A839403F27F63E9@AM0PR10MB2932.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j16MHdAaFVFhbYHmKatMK1B+AGR5AfeKsOk9CbK1t9//5Ff9AbIdUc3JzY7OYas2GnShTVg5wUEC9j9SESYNIYm3llzBM6Lgfl+xMdyG2WcO5SCpO5P8nqQZff7vgl8awCqI29UEiLWZ86b9xrVxbs+3SY8dfcvl1XV2zjX9nHf0sXczO+c+s14HoEA5TtP65NbhTGgM4uOmwE7DEd39NOZ3xAS4f8rsR1Zf28qqB44rEHGc5A7JdzfUFmnM4B2labvxfU9xmVKDQAwboXyeeu0AMzMujPYgQ9dTVTNCyDKCf5lY3CzjFmC9cxIrli1+zm3i7TtZO5TCQUonCbxNR4JZ7FPyToi+7Ba/6Q0V7VbiqtUDjun3vIj4Eo8UFyaAlW7PRPuXznB2uAKrrWusnmo1RRc3PXZAqvEjXasisMSHq+Y28nj5fK7X6I6AW6N70UtKGPr7cvPap26y3MLF5+QdjmpdcyPu4CtvZ4fW2LbDpujuCggeZgsyFVBWobJfftRUR4ajA3hAuyOHYnKvNEQQcQB4+NtlnUAqv+VTR96audf9DdtZhK4d+X7PUlw43/A+IOH3y6E5le61NXxLRqachy2qB++iuYAOfn+2A0gSm/M5KD3sM7yie3oj3cuxf8JCqZ7dqg9wulZWqt8nLpNj+kSZFSNroNdWVyMfmiCkTVKNkGME0YfuG3AIP9yojn0z+D6lnkU7Ao8Z9utIzyPuMxGaKRmtAoRwEv8LengHP1pKuk83VjqTxQG+E4L/bYFQFr8WfnBtdFlTOr61sAvCDApze6mrAg2FYZMgcAs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(66946007)(31696002)(5660300002)(6666004)(316002)(86362001)(53546011)(6486002)(44832011)(66476007)(66556008)(2616005)(31686004)(38100700002)(4326008)(83380400001)(3480700007)(36756003)(8936002)(2906002)(478600001)(110136005)(8676002)(186003)(966005)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MW91U2NGelcxVmlYcWM1ejh2Y2daSHB2TzEzbFJnSFE3L3YvZlZBMThYWkRK?=
 =?utf-8?B?eWo0ME4wU3JpbkxMek1QRjlQSUlYM1BkTzVuemlOTlE3aTNjcFJpbnQ5RGRP?=
 =?utf-8?B?endSR3Iwemxad1ptY3VDcWtBVktjelh6VkFEczhueUtvc2ZrdWdJejd0TWxs?=
 =?utf-8?B?SW10THhSUVl3bU95S1ZkY3Fmck1vbFd0ajRiRFlFekh0WU05UlZPYmgvUW1i?=
 =?utf-8?B?KzVVWTZlVkVNWE9JYXVqbEhmdkV4enkzbzAzYVZHdmhzSDZPMWw2ZjhqR09r?=
 =?utf-8?B?SXlyK1NHM1lwdVZob2wzKzBYRGsrTzdkblU5amFRMmtUUHFzemEvZ0FMTDBy?=
 =?utf-8?B?N2VWcUcwclpGVkg0T0g5QkY1K3JENkhZamxyVEw5NUF1SFhQZ1BSSjFTd09U?=
 =?utf-8?B?VXliUTZybHQvbTNnZmJRNHdzcjFzL2RvSnJ2NjhoQlRGUlZ1OW5DNkcwdmZP?=
 =?utf-8?B?WVg4ZUxYbEJOVDVRcGNSVjhTZzV3Q29qb0VTclJJM1pPTmlRNmdhL2hxTzVD?=
 =?utf-8?B?ZVVCaCtwdjdZQ080RmRvbjlnR1hUeCsxbWMxTGhGNXhkR3NzUnFMSDJYNCt1?=
 =?utf-8?B?SXlSWVVPYWtrK3lGbnpCZHRGdDE0YkdZUW1yV0lSenVQdWlsVE11RHhCMXBL?=
 =?utf-8?B?VUJKcHRmcDlOYkYvYUNxN0tJTm9WemtRaGFXdDUybTFveVFrS2xRbGNCNUw4?=
 =?utf-8?B?RmZWM1FKSUpEVEl2QTlGSUh3TmxZaWdWRUtmVHJuU3lwU3JVeUE5VkJuMk80?=
 =?utf-8?B?R3pvTUpIMkk0Syt1RTZQd2l1WTRxelFCZ1VMb2c0Q3ZZTml3UG4yb1JkczZa?=
 =?utf-8?B?bnBjSHB3a0lWaUJoSGxvTFlHV0dMRG5hTzJQVzh0dWlHcysyRVJXOU1FeVNz?=
 =?utf-8?B?bVFTNlZyVlNpbHpLRGJESEJDRG1IZmIrYlUzeGx5cXVnT3hPV3pGYklyTjh5?=
 =?utf-8?B?Q2l3aUxqdjdiN1RuaG12dVZPWXNmZTZJM1pWbXI2Yks2bjFOTVYxQ2hvOG9n?=
 =?utf-8?B?U2pEYnhBSjk5WEh2OXYza0c4TUVFRVNHait3Y01kekw0OU1WamRqVjhoUGlx?=
 =?utf-8?B?ZVFpeXJOV3JUVlQ5bEJRL1FoQk5VSE9EQTlERG5sWlFTc1cyZUVpTHV2VW9M?=
 =?utf-8?B?b0R1WnpYZk5hV2ZNdW9lUHF6QWQreDUzYWVwZ04wZnJ0VnRDeUZMSzF0NDVE?=
 =?utf-8?B?S1duVlVyNE9RT253RzVhZWhPVWtpb09COGRybGFTeHVvQlFxdGQrSDFvQ2xm?=
 =?utf-8?B?ZkFnTG9ERzNVQURycUx5T3RHUmhlYnZ6cExsL2tXMmUxNHB2a2xpRHJrRXVK?=
 =?utf-8?B?SE9NZ1lhL0JUQUN1S0xQTU9Fd3d2RFR2VmhUVkI5Q2ZHZUphb2pPVE5zQ1hO?=
 =?utf-8?B?WHdTNVBuS254UmNENnVTWFE5ZWhnVGNqMHNGcVkrb01qZVptcmpSdGhCS0JM?=
 =?utf-8?B?b204K0d0ZTRPTWp6SDhpaWhTWW5LemxVcXVUS0JCYXBDbnZNaCtMeGFHaXpR?=
 =?utf-8?B?dFNtQUo4SjBkNnZXeEJSZG5jc1J4STczYldTTWRwbE14Yi9oRUt5TnhrOXht?=
 =?utf-8?B?K2c4eEd1VDZDRU1rWDZobmlneCs4STNkcERQNW5MMG1IUWFGQ1hYZWZCZVJi?=
 =?utf-8?B?eWxjVG5GN1NUbE1uK1BwZldybmk4SURSN2VNWnJNR1R3Z2Y4MHdsNHBueTl3?=
 =?utf-8?B?RVB5RlBmRkx4ZTVqMUp3VTc1MnJ0aTFqNW1FaDJPcFJkQjlWZFY3Wk1EeDNN?=
 =?utf-8?B?alUzK3J5bmZhL0pBYUExQ25LRGh5QjNPZnZJVWJzZ1U0bXdHWkRJTStCTW11?=
 =?utf-8?B?Q2dDcGxkWWpTMWhqU1NjUjIwbzhoZUpzOUpTb0thcTNJLzFtQnBOSjA4S3B0?=
 =?utf-8?Q?ABCNT8bRmxV7B?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ef047f-6ba9-4079-b894-08d9252eec60
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 18:56:11.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+AThFRyiGibzF/rzITqulfpCwyDoiHT/hwEu19f0uPkIsxfzgIOW4+q7K3XvivyxUf2rxFDjILfpHwOpK6gBXb1njUhWg1zaCKeO2Vz6Cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2932
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=FYlK3fqP;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.6.48 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

On 01.06.21 20:45, Ralf Ramsauer wrote:
> Hi,
>=20
> On 18/05/2021 17:00, Florian Bezdeka wrote:
>>>> /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c: In function
>>>> =E2=80=98vcpu_reset=E2=80=99:
>>>> /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c:429:9: warning:
>>>> =E2=80=98memset=E2=80=99 offset [0, 127] is out of the bounds [0, 0] [=
-Warray-bounds]
>>>>   429 |         memset(&cpu_data->guest_regs, 0,
>>>> sizeof(cpu_data->guest_regs));
>>>>       |
>>>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> This is a warning and treated as error due to -Wall.
>>
>> This warning is GCC 11 specific, the code compiles with GCC 10, but
>> fails with GCC 11.
>>
>> I looked into that a few days ago and considered that as gcc bug. In my
>> eyes the array boundarys are not correctly "detected" by gcc and that
>> might be the reason for the warning. Not sure if it was already reported
>> upstream to the gcc guys.
>=20
> Do you have workaround to suppress this warning? I just hit that warning
> as well=E2=80=A6

I reported [1] to the gcc project some days ago. It has been marked as
duplicate of [2] which is not resolved yet. There are several
workarounds mentioned in [2], maybe volatile does the trick...

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100834
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99578

HTH,
Florian

>=20
> Thanks
>   Ralf
>=20


--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cbfe2115-6595-4a17-f400-86efd51028d1%40siemens.com.
