Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBSGN7CBQMGQENXRIRUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76D364FAA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 02:56:41 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id z4-20020a2e8e840000b02900bdfc3b5c07sf6816147ljk.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 17:56:41 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1618880201; cv=pass;
        d=google.com; s=arc-20160816;
        b=srWjlG+UcMTjr1e7BkPqxdsqzZtyFO+xKmXq/4SHgZU+ra3c8MgrCp6CiwoNHwxoi9
         ANO8QWFl1GaeCb6i05bP+DjCEAi6mQQ1DJC+zPWnoCz5hdIMYItPnHht9HlGptnxnj5c
         kS6pLGfFupgpullW9nfwPpX85v1plfx6ufhrC1q+NHAMZjRxZ/TQ61QomhJSC90936AX
         YM77sbK/hoPGWdC+2thnoWfVTZlQs7x0JGvlz2zGlEgiU6mt9P6MC8sY7MkyQS1UVVvH
         efiS4Mo3Yt1Fcd6uc8o9DHHiwRevWHsXkXAlfko6i+X+zYhHxwgLab9gal4Yw5Yum0E7
         z3Bg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=+LE7Y/3T9ZrNACHPm2G4FH3Ruv0sTwg97Grq0WrluK0=;
        b=aFOQrQcBi83ATJp3PzErDBWgrPGspTR92fppEXEQWb+U74imjRrunvRUM/XhIghKVD
         n+wCYOUGTnh8Etv2IfPcuvBOnHfW6lmoJs4XALHNstBA+UDuljKXT4cml3rP+/c2/N5T
         3I1vGqF7fYpxVdynisNfKQZqxxt3qgNbIKCLPH8YARzn4JHiZ7puorS5FNqtzVnr2ixI
         o3qxT2/JzDsMi/z/Gt64au0Yoj8s/1oeHl1VFClDCB4/Z2az6bEcVpxXCv1dZfdcNJGY
         gPftrY8XWPOVcS2CcplSFpowmfjNYzXJWgCS8cNL2X3TWTdoTCIeG42qukXfapcFqgbU
         t82A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=AuLzaJ85;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.51 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+LE7Y/3T9ZrNACHPm2G4FH3Ruv0sTwg97Grq0WrluK0=;
        b=pxDjQwo9UHRGbOcx3o4O1IMLv+ftntN/M/d9czmSVgAVIiMfJds9WjsmXEP6iyIS8O
         VfUhtPggKFltXiuDjIK04iF7aFoNnfzyGvLqTU8BbufuBkgcyQ7XB76qBRAtLuvtYGMU
         jm6SWVSCLybXzwDxC5IYjqPlLL7cVQ41O6X7VaZdBxfjK9CybshlOhvZQwQlxWk5p7Fg
         FfuTCUiFxhMX8KAMMcfcyWMtQIgzRP5N2xSbv2tSaoEWTjFsYuQUGIdGbltGWiRLGuVF
         e7C6TFfotxW1NtykG/lbeGgxAYRHi0KSn/bhRIhqzmQNLjYTfomDRqLLfTuIZjyd7Pqp
         suXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+LE7Y/3T9ZrNACHPm2G4FH3Ruv0sTwg97Grq0WrluK0=;
        b=rQ3qFZmiIoOzE/YTjx4I8k/Qsaoah77PqCBMwmjuRn2VK6+CBDP6PW9wKeZaNDFJrZ
         EtTHEGqUDh5y3vU2WW2Qv+hZs/CdwzeovumzZ9oaMeizW6q5WPE6hT9+JhFV3Dhwv5HE
         1N+lA6pp4s49K6sTs/WBi3P3rL++75z27qEerr4wrhmLwYkOQ6hPv1ZhQ79Exo52tTvL
         oT31P5K1FzN+vPRXznfcrmn2ybotqwe0kFOOpEaGX/4V9cKnEfJyd5p1wKHEivToqkEi
         tR4HAfQXrMAHaqwIAoyUrSlf3jdgWfn/73wTy9q58GYRO7ihiqgX/8g3OTy7PKYsWrx2
         ui+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530k88IjleUZ6vutPZIpTIVcUyvxSQBG2edfUh/wjn54+oXchoEL
	aFDV2RFWu9NX8bcRBs/w+U0=
X-Google-Smtp-Source: ABdhPJz6v0EPPrB0OlkZ0q7YPh5hsqJNrJL8Wd9SDkAvL5hIkml/MKyIS8vw1t0EqM8m1XRVN1cgOA==
X-Received: by 2002:a2e:557:: with SMTP id 84mr13325033ljf.480.1618880201054;
        Mon, 19 Apr 2021 17:56:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c0c:: with SMTP id x12ls680980ljc.0.gmail; Mon, 19 Apr
 2021 17:56:39 -0700 (PDT)
X-Received: by 2002:a2e:87c6:: with SMTP id v6mr13191651ljj.490.1618880199803;
        Mon, 19 Apr 2021 17:56:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618880199; cv=pass;
        d=google.com; s=arc-20160816;
        b=t9OvvBJcVfw9h+9McZO8gQe4/OPTgCj2Oyam3aNog/3v8Le8Hlku3naUwnBXJrh+py
         CtRhu+xWvLCE12+tZLLL5KnKllJPjfckdiVqxhClTuJL+4vtCzrpl3Fr2FrRWzf5oqOT
         NDHWcwg/jLM1QzvuMDIA0OeBPM6trHuZpZjHVaEgpIdoAdEIk/CavfyC37/rEKshbtoL
         6KQMEDn+AW9kOync/R2rYqtj769l4b7IpJxdok4etPMHA/9BLr1tw2bzN741ZHohcfao
         YfiMt0IwnNfqXKmg6eLDMrTUTXmwSxrgp+Y/qnrxp2jEMqxss5uPQDIjRlmovYmboNj7
         ZV9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=OwTlmohzUwlBA+TVFzDdvEp13yk2D+zNkxayyV99IZ8=;
        b=Rb1DzvtrPMrCAG9pm3EHxXbq9xlwambKTlE0PyROm84/ZoyAIy9eoQ6s0tMKLb13Pn
         oFxZiaph9fOVceAtHeIRr37sfEkgbDb1778MVap2ZyCFfhNIXVj8Ev0ZrZGs5GBiugD9
         7tJNszEM3zykocoJxgTEMjb48qpI7DWGpZ/u2kEAjMZloXzBE7e4rhTvPAlhsuJBjTjI
         u6BIlsvjJ2wfCZvB2FXsf3xn5D7lvj82tI0JipKBq+48OVLr15Q8CA8hwprsq02yjLIg
         T/Jk5c/b7CWjsKZD0cXuQWYfuVkhWKE0knOys550gQUQV1C+vTLxIgMjQfiGO9Vm3+e7
         D8mA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=AuLzaJ85;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.51 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00051.outbound.protection.outlook.com. [40.107.0.51])
        by gmr-mx.google.com with ESMTPS id d25si172471lja.2.2021.04.19.17.56.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 17:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.51 as permitted sender) client-ip=40.107.0.51;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kh+ewoWRgBiBj6gUldxwFIty8Fe7avX9v/sOgtm7YIFsbbAY8ijeeBIQqLKdBqMJLttcRaKfsfB78VAozKZJoQfETe8ILxXoBgElBDil6hJs+6SEgwE1mw5/iU3zRsJGLzmvTREbVoMgzn5omwwIwsmDE+zqoteoIEZsl+eZslSjxv+egh5PBnBpP36Ify2ScSZfMwENoxoGBnGm1tMa1ZWBvwzbbtKXEIDr54MCvLk78b39OH0oeS5APBi5x8pywPWKsSIKcGl0EMdS1I3xqTqqWxnhBD4/ZGSBwPIN2wC85bH9wmCwie4vLEQkVF72Et18YNXtJg1awI9YEPRwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwTlmohzUwlBA+TVFzDdvEp13yk2D+zNkxayyV99IZ8=;
 b=VT7hgRN/g1dC9AnlGB7PjC6iqLP3Y0Huv8utCjM+D9fm5D+Srcj7sKB3oATL1zsIF+T6hlaWS4z/PUBQBgj+GV6NdUhgBqk1b64O1hYkQhH38Lud4dteBsZ6dQla437UaBNngl2k+k3BtorlSA3uLzW6lx+wMviKULVBLN1ATjRBQ/5hh7Wcop8YqF7b47u8Vy91KHrXK67wCqHEHUs6ailjdmRa+RYiBOpg2JQmN2dCYhh7VAUqp5eSDOgtohyoMwuMr/uen+QFcFHhw05vw5h7UaMLv1AjvrSyJeMXAeY3ktqJW94ZD3htpss0fNKs2cwpJduEGg+Nce4bRT/K7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8379.eurprd04.prod.outlook.com (2603:10a6:10:241::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 00:56:37 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Tue, 20 Apr 2021
 00:56:37 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Angelo Ruocco
	<angelo.ruocco.90@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Marco Solieri <marco.solieri@unimore.it>
Subject: RE: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
Thread-Topic: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
Thread-Index: AQHXH825UYHf5+045EG8V/hDxrSc3aq7/9xQgAABZQCAAL61YA==
Date: Tue, 20 Apr 2021 00:56:37 +0000
Message-ID: <DB6PR0402MB2760A15B9F7D6B9864B8D67E88489@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <DB6PR0402MB2760F544F58FFF3AB688F19688499@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <9234b1f8-0275-b438-a1f9-9c274dd74c04@siemens.com>
In-Reply-To: <9234b1f8-0275-b438-a1f9-9c274dd74c04@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a4004e7-0bb1-4ebe-60be-08d9039726d5
x-ms-traffictypediagnostic: DB9PR04MB8379:
x-microsoft-antispam-prvs: <DB9PR04MB8379741DC4324F0529F5986688489@DB9PR04MB8379.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ud00+WQdVSp5Prp6C/jnQGn26lSp1mqglnUHb7WAg2Hn6+blNQ3v1uhLSSyau0c2l+iCgRK/HmxSa1hT4KQ2/5Hj7tPgRoW+0aaElCx8ekvQNKZ4zISvzIOtBq980r4psCubJ5K0yT+/JFweBQAvPZqMg+8Ckm6qi+jn0wmtjNRtAXosP0AYJ697gVYD9OTgqiMoLaVzHPf3w2neJUIMrcbI/n+8ijWHvAJOtoMK4VPyo2PeycmR8efBtAcJZY5/gfxlbS5oKo7BIn9SNFOeXTPM8ESoTDBh2bsya3Bm1G6GGGwqSINAlZGiJNVPo5V+9Fn7/mUlwXELzeERPFsTuqrBkHFXfxN8R27zxiRpGqqTalFz6LLMZosVB7KEnOXigs5O0262zvj+M2Ju9uMWCSEKSZtWWMF8aSuixUYJBuBboBLmnZNFnWbTKIhgMeLiqVZmtcG5+wlUyB0WrhvMCjS3HvKoxPUn47eV52a/uyTTxt78o9SAIRDmgBxEGZNWUj2llbN/9G7LD1rTvXruMXO+UOpadBmBk0glW/Ox1ZAyHMoAt9EXGsGTxvFOodZ3kiUP/W/ckaszvts3NAtZWMvmWGFiQBTIkOqU/kVToww=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(966005)(71200400001)(55016002)(66946007)(186003)(26005)(6506007)(83380400001)(52536014)(64756008)(66476007)(9686003)(7696005)(66446008)(5660300002)(53546011)(76116006)(66556008)(2906002)(8936002)(4326008)(316002)(44832011)(110136005)(8676002)(478600001)(33656002)(38100700002)(122000001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?alBoRGVzYzJla2xZNllXK2FhUG9xQUw0ZW1DNmpqb2VUeGNYOTVqS1FrcGlw?=
 =?utf-8?B?dW5FT2x1TUJubVdiSkpZaUFjUUYwVjgyT25YaFRmMVp6TUExb0NUUzBEakNs?=
 =?utf-8?B?U1JpbGxzdGpTMWdmK0xGVFVheWVoZlNGNlJvaWhXMndDYnBOZGQ2RHZ3MXhZ?=
 =?utf-8?B?TkpYbCsrQ1NKemRrZnFJYU94SVV1YW1WeEJRT0ZPNWZ5WHNNWjZLMW5XOFR4?=
 =?utf-8?B?SXN5djN0T0p1dGUvUWg1VnNDK1dXOFl5S1hzRFA4WmJxZWJxUUZFVVU1Nkdr?=
 =?utf-8?B?Q0RCL1k3SzlhdEtFbm94TlRLU085cTM5UXo0VnN2RUpqSnJpOFpFTENtYUk4?=
 =?utf-8?B?cFgwMXhjNU5jSFZNQU94dDQ4Uy9LeElzVnBia3pvc05BZ3JXc21pdmkwZ21Z?=
 =?utf-8?B?OGhuMFpiWHdyR1JmM2xqbXkzNkJabUUySkZPNWNEelVocWpoQjdsYkRxV015?=
 =?utf-8?B?ZzRuSk5maVZOQ2tDK05yQk5raGt2aHFsTnJlLzBRSnlqS0VXbzJLT3B5S0Va?=
 =?utf-8?B?dDd4OGNvK2pnczU4MnE0ZWFUVjR6WFczVTV1aFprekpGNnI3V2VqYUIzV09u?=
 =?utf-8?B?TktpN3kxQ25LSXdGSDBkT2hSbDRyVVpkdnNuTElmQUQ1VVB4em81MDRTTVhh?=
 =?utf-8?B?VmNkMjgxU0wrcWlHYU1XTEdGUVlFa0dmMmV6Uk9FQ1BTRmUxTWZPVzlxdFA4?=
 =?utf-8?B?eVpRaGJ2NTVzVCtrdk9ueWtGZDN3bDIrL3pHUm9CSXhnRnNXS3c2YStPUmd1?=
 =?utf-8?B?OHhyWGltZnUxMHFEN3Q4UUw4aDFjb2pMUnY4M1VaUXEySWw4Um5jbHZXMnJD?=
 =?utf-8?B?Qk8vMVlZY2hYODNYeks5UHM5NG16UVZUWjFUT3VoUFBadThEYUVJd2JPbzd1?=
 =?utf-8?B?ZC9LSEVGNFFyTVcvYkpITW5YcXVwRVMvUStYdHN2RWkrcmJ2VjkrRERocDBI?=
 =?utf-8?B?dmlObW5xVEU2dkNWWWtTeG4yMWg5U2R2ZG1EdURqZHkzYXZyWm5rUnIvaHRi?=
 =?utf-8?B?Vjl4K3pjc2NXUnEvN0JPQmF1WUFjV1l5Ync4SFEzVTh2eFZCOHM5NW9INlVV?=
 =?utf-8?B?eFk3a0FDall4ZUpnRmxBNFpnNGVwbnRaWTJQcWJERVkwdSt2RGFUM3g0VThh?=
 =?utf-8?B?eDhiK3o0UjRWaElBUGVEUHJ2emlGZVFaZ29VQmt0VVJNOGduaW41UzVpRVFO?=
 =?utf-8?B?TTJvd3pHV0l1OEE5WmpZdU5xL05kM01VY0ZJNUJHdDI5THd3MVhCb0VtSTJK?=
 =?utf-8?B?dG9Fek1yNmd1elU3K29ETnBhMGxvWG1pZkJtbHQ5NkRWaTkycFRtc2IvcVNh?=
 =?utf-8?B?UnUzaEkyVFptZHdRQ3dTNWhITFZqTERDcElwOHgxaW9KamlkZ1A0bCtzMEMy?=
 =?utf-8?B?YzRqMHdwc0FFRG1CNHhLeTJ3SlE4T3JvWkFMRWpIWEJMak4wZ1grS2lUTXpS?=
 =?utf-8?B?WUY2dUtGRncwckNodlA3dTk1cXVDLzN3Qi9QUmhPa3k3bnk2MlpDdWpTRkt4?=
 =?utf-8?B?M3lJNzdjN2VjTUF3a0VJNlU5UittMXhQTkNwVzJjWXFOYW1PMjVZMlpSaWZz?=
 =?utf-8?B?MDI0YzkvWlFrSU9HdW5iM09XQWtFTVp2YStlbU5rRW1ONnFYT1Z0eHViRWFy?=
 =?utf-8?B?aTkwZm1nZnIyNkxhTUpNQ1NveHdhM09ncGVPbHk2a3BkaFAxUXpPNFRSb2tJ?=
 =?utf-8?B?RzFBbHZ0NXlNdU9PV3FGa01jT0lHc203dTRtL2tCWTVBNzVlUHlXR1NlczNm?=
 =?utf-8?Q?yimJI3FTq+692FT8R3++zpzpy2ya4YF1lNm9wyL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4004e7-0bb1-4ebe-60be-08d9039726d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 00:56:37.5539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHf/e9rp8yS0d8+ks5wNf6lf2g2AXHRaxazQHTHySLb+lR3u+75vcxwIQ7ocxCrU66GxV8Xt5zv4ZaWRfBChXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8379
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=AuLzaJ85;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.0.51 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
> 
> On 19.04.21 15:28, Peng Fan wrote:
> >> Subject: Arm zero exits and zynqmp ATF SDEI-enabling patch
> >> upstreaming
> >
> > Not sure whether you are aware.
> > FYI: SDEI not work with OP-TEE for now.
> >
> 
> Thanks for the info. None of the targets I played with - so far - had OP-TEE
> included. AT-F bug or a conceptual conflict?

The design of SDEI not take TEE into consideration. SDEI requires secure interrupts
taken into EL3, but op-tee requires non-secure FIQ taken into secure EL1.

Regards,
Peng.

> 
> Jan
> 
> > Regards,
> > Peng.
> >
> >>
> >> Hi Jan, all,
> >>
> >> I have seen that arm-zero-exits has been merged into next.
> >>
> >> My understanding is that right now the only officially supported
> >> boards, meaning supporting both jailhouse and SDEI, are NXP's ones,
> >> with only a experimental patch for the xilinx zynqmp firmware to enable
> SDEI.
> >>
> >> Regarding that patch, I have looked at it, tested it and added the
> >> missing non-secure-boundary check.
> >>
> >> Are you thinking of submitting it upstream? If so, how do you want to
> >> proceed?
> >>
> >> Angelo
> >>
> >> --
> >> You received this message because you are subscribed to the Google
> >> Groups "Jailhouse" group.
> >> To unsubscribe from this group and stop receiving emails from it,
> >> send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> >> To view this discussion on the web visit https://groups
> >> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FCADiTV-03GyURVJ2De-F
> e5r
> >>
> eAcvveWQq7JxAUTh2kES2DSbwcWA%2540mail.gmail.com&amp;data=04%7
> >>
> C01%7Cpeng.fan%40nxp.com%7Ceaba478b1d3941914a6508d8ede4db50%7
> >>
> C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C63752091447529456
> >>
> 7%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> >>
> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=6zMBNnEHb%2B
> >> %2FL3FRMLvw%2BlO4KnOr9ryagUIj0soQB38c%3D&amp;reserved=0.
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760A15B9F7D6B9864B8D67E88489%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
